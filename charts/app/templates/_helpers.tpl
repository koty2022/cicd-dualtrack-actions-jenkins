{{- define "dualtrack-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "dualtrack-app.fullname" -}}
{{- include "dualtrack-app.name" . -}}
{{- end -}}

{{- define "dualtrack-app.labels" -}}
app.kubernetes.io/name: {{ include "dualtrack-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
