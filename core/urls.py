from django.urls import path

from core import views

urlpatterns = [
    path('', views.HomeTemplateView.as_view(), name='home'),
    path('relatorios/pacientes', views.PacientesListView.as_view(),
         name='relat_pacientes'),
    path('relatorios/pdfpacientes', views.RelatPdfPacientes.as_view(),
         name='pdf_pacientes'),
    path('relatorios/pdfpacienteporconv/', views.RelatPdfporConvenio.as_view(),
         name='pdf_pro_conv'),
    path('relatorios/pdfconsulta/', views.RelatPdfConsultasPorEspecialidadeEMes.as_view(), name='pdf_consulta'),
    path('relatorios/pdfpacienteporano/', views.RelatPdfPacientesPorEspecialidadeEAno.as_view(), name='pdf_pac_por_ano'),
]