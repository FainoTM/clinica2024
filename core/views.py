from collections import defaultdict
from io import BytesIO

from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404
from django.template.loader import get_template
from django.views import View
from django.views.generic import TemplateView, ListView
from xhtml2pdf import pisa

from core.models import Paciente, Convenio, Consulta, Medico, Possui


class HomeTemplateView(TemplateView):
    template_name = "index.html"


class PacientesListView(ListView):
    template_name = "relatorios/pacientes.html"
    model = Paciente
    context_object_name = 'pacientes'


class RelatPdfPacientes(View):

    def get(self, request):
        pacientes = Paciente.objects.all()
        data = {
            'pacientes': pacientes,
        }
        template = get_template("relatorios/pdfpacientes.html")
        html = template.render(data)
        result = BytesIO()
        try:
            pdf = pisa.pisaDocument(BytesIO(html.encode('UTF-8')), result)
            return HttpResponse(result.getvalue(),
                                content_type='application/pdf')
        except Exception as e:
            print(e)
            return None


class RelatPdfporConvenio(View):

    def get(self, request):
        convenios = Convenio.objects.values_list('nome', 'codconv',  flat=False).distinct()
        pacientes_por_convenio = {}

        for convenio in convenios:
            pacientes = Paciente.objects.filter(possui__convenio_id=convenio[1])
            pacientes_por_convenio[convenio] = pacientes

        data = {
            'pacientes_por_convenio': pacientes_por_convenio,
            'convenios': convenios[0],
        }
        template = get_template("relatorios/pdfpacienteporconv.html")
        html = template.render(data)
        result = BytesIO()
        try:
            pdf = pisa.pisaDocument(BytesIO(html.encode('UTF-8')), result)
            return HttpResponse(result.getvalue(), content_type='application/pdf')
        except Exception as e:
            print(e)
            return None


class RelatPdfConsultasPorEspecialidadeEMes(View):

    def get(self, request):
        especialidades = Medico.objects.values_list('especialidade', flat=True).distinct()
        relatorio = {}

        for especialidade in especialidades:
            medicos_especialidade = Medico.objects.filter(especialidade=especialidade)
            consultas_especialidade = Consulta.objects.filter(medico__in=medicos_especialidade)
            consultas_por_mes = {}

            for consulta in consultas_especialidade:
                mes_ano = consulta.data.strftime("%B %Y")
                consultas_por_mes[mes_ano] = consultas_por_mes.get(mes_ano, 0) + 1

            relatorio[especialidade] = consultas_por_mes

        for especialidade, consultas_por_mes in relatorio.items():
            relatorio[especialidade] = dict(sorted(consultas_por_mes.items(), key=lambda x: x[0]))

        data = {
            'relatorio': relatorio,
        }
        template = get_template("relatorios/pdfconsulta.html")
        html = template.render(data)
        result = BytesIO()
        try:
            pdf = pisa.pisaDocument(BytesIO(html.encode('UTF-8')), result)
            return HttpResponse(result.getvalue(), content_type='application/pdf')
        except Exception as e:
            print(e)
            return None


class RelatPdfPacientesPorEspecialidadeEAno(View):

    def get(self, request):
        especialidades = Medico.objects.values_list('especialidade', flat=True).distinct()
        relatorio = {}

        for especialidade in especialidades:
            medicos_especialidade = Medico.objects.filter(especialidade=especialidade)
            consultas_especialidade = Consulta.objects.filter(medico__in=medicos_especialidade)
            paciente_por_ano= {}

            for consulta in consultas_especialidade:
                ano = consulta.data.strftime("%Y")
                paciente_por_ano[ano] = paciente_por_ano.get(ano, 0) + 1

            relatorio[especialidade] = paciente_por_ano

        data = {
            'relatorio': relatorio,
        }
        template = get_template("relatorios/pdfpacienteporano.html")
        html = template.render(data)
        result = BytesIO()
        try:
            pdf = pisa.pisaDocument(BytesIO(html.encode('UTF-8')), result)
            return HttpResponse(result.getvalue(), content_type='application/pdf')
        except Exception as e:
            print(e)
            return None