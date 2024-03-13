from django.contrib import admin
from . import models

@admin.register(models.Ambulatorio)
class AmbulatorioAdmin(admin.ModelAdmin):
    list_display = ['nome', 'numleitos', 'andar']

@admin.register(models.Atende)
class AtendeAdmin(admin.ModelAdmin):
    pass


class MedicoConvenioInline(admin.StackedInline):
    model = models.Atende
    extra = 1


@admin.register(models.Medico)
class MedicoAdmin(admin.ModelAdmin):
    list_display = ['crm', 'nome', 'telefone', 'salario', 'ambulatorio']
    inlines = [MedicoConvenioInline,]


@admin.register(models.Convenio)
class ConvenioAdmin(admin.ModelAdmin):
    list_display = ['codconv', 'nome']


@admin.register(models.Consulta)
class ConsultaAdmin(admin.ModelAdmin):
    list_display = ['data', 'medico', 'paciente']
