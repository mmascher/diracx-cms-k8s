{{/*
Expand the name of the release (all objects use this as prefix).
*/}}
{{- define "diracx-cms.name" -}}
{{- .Values.global.releaseName | default .Release.Name }}
{{- end }}

{{/*
MySQL service hostname.
Uses bundled service when mysql.enabled, otherwise external host:port.
*/}}
{{- define "diracx-cms.mysqlHost" -}}
{{- if .Values.mysql.enabled -}}
{{ include "diracx-cms.name" . }}-mysql
{{- else -}}
{{ required "external.mysql.host is required when mysql.enabled=false" .Values.external.mysql.host }}:{{ .Values.external.mysql.port | default 3306 }}
{{- end }}
{{- end }}

{{/*
OpenSearch service hostname.
*/}}
{{- define "diracx-cms.osHost" -}}
{{- if .Values.opensearch.enabled -}}
opensearch-cluster-master:9200
{{- else -}}
{{ required "external.opensearch.host is required when opensearch.enabled=false" .Values.external.opensearch.host }}:{{ .Values.external.opensearch.port | default 9200 }}
{{- end }}
{{- end }}

{{/*
MinIO endpoint URL.
*/}}
{{- define "diracx-cms.minioEndpoint" -}}
{{- if .Values.minio.enabled -}}

http://diracx-cms-minio:9000

{{- else -}}
{{ required "external.minio.endpointUrl is required when minio.enabled=false" .Values.external.minio.endpointUrl }}
{{- end }}
{{- end }}

{{/*
DiracX public base URL (used for auth redirects and token issuer).
*/}}
{{- define "diracx-cms.publicUrl" -}}
https://{{ .Values.global.hostname }}
{{- end }}

{{- define "diracx-cms.authUrl" -}}
{{- if (index .Values.dex.staticClients 0).public -}}
http://{{ .Values.global.hostname }}:32002
{{- else -}}
https://{{ .Values.global.hostname }}
{{- end }}
{{- end }}

{{/*
Dex issuer URL.
*/}}
{{- define "diracx-cms.dexIssuer" -}}
http://{{ .Values.global.hostname }}:{{ .Values.dex.nodePort }}
{{- end }}

{{/*
Common labels applied to every object.
*/}}
{{- define "diracx-cms.labels" -}}
app.kubernetes.io/managed-by: Helm
app.kubernetes.io/instance: {{ include "diracx-cms.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

{{/*
Job spec boilerplate.
*/}}
{{- define "diracx-cms.jobSpec" -}}
activeDeadlineSeconds: {{ .Values.jobs.activeDeadlineSeconds }}
backoffLimit: {{ .Values.jobs.backoffLimit }}
completions: 1
parallelism: 1
ttlSecondsAfterFinished: {{ .Values.jobs.ttlSecondsAfterFinished }}
{{- end }}



{{/*
Create the name of the service account to use
*/}}
{{- define "diracx.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "diracx.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "diracx.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "diracx.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "diracx.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "diracx.labels" -}}
helm.sh/chart: {{ include "diracx.chart" . }}
{{ include "diracx.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "diracx.selectorLabels" -}}
app.kubernetes.io/name: {{ include "diracx.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- define "diracxWeb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "diracx.name" . }}-web
app.kubernetes.io/instance: {{ .Release.Name }}-web
{{- end }}
{{- define "diracxCli.selectorLabels" -}}
app.kubernetes.io/name: {{ include "diracx.name" . }}-cli
app.kubernetes.io/instance: {{ .Release.Name }}-cli
{{- end }}
{{- define "diracxTaskRedis.selectorLabels" -}}
app.kubernetes.io/name: {{ include "diracx.name" . }}-task-redis
app.kubernetes.io/instance: {{ .Release.Name }}-task-redis
{{- end }}

{{- define "diracx.taskRedisName" -}}
{{- printf "%s-task-redis" (include "diracx.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "diracx.taskWorkerName" -}}
{{- $root := .root -}}
{{- $size := .size -}}
{{- printf "%s-task-worker-%s" (include "diracx.fullname" $root) $size | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "diracxTaskWorker.selectorLabels" -}}
{{- $root := .root -}}
{{- $size := .size -}}
app.kubernetes.io/name: {{ include "diracx.name" $root }}-task-worker-{{ $size }}
app.kubernetes.io/instance: {{ $root.Release.Name }}-task-worker-{{ $size }}
{{- end }}

{{- define "diracx.taskSchedulerName" -}}
{{- printf "%s-task-scheduler" (include "diracx.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "diracxTaskScheduler.selectorLabels" -}}
app.kubernetes.io/name: {{ include "diracx.name" . }}-task-scheduler
app.kubernetes.io/instance: {{ .Release.Name }}-task-scheduler
{{- end }}


{{/*
Return the fullname template for the initSecrets job.
*/}}
{{- define "initSecrets.fullname" -}}
{{- printf "%s-init-secrets" .Release.Name -}}
{{- end -}}

{{/*
Return the name template for shared-secrets job.
*/}}
{{- define "initSecrets.name" -}}
{{- $sharedSecretValues := index .Values "initSecrets" -}}
{{- default "init-secrets" $sharedSecretValues.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified job name for initSecrets.
Due to the job only being allowed to run once, we add the chart revision so helm
upgrades don't cause errors trying to create the already ran job.
Due to the helm delete not cleaning up these jobs, we add a random value to
reduce collisions.
*/}}
{{- define "initSecrets.jobname" -}}
{{- $name := include "initSecrets.fullname" . | trunc 55 | trimSuffix "-" -}}
{{- $rand := randAlphaNum 3 | lower }}
{{- printf "%s-%d-%s" $name .Release.Revision $rand | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the service account to use for initSecrets job
*/}}
{{- define "initSecrets.serviceAccountName" -}}
{{- $initSecretsValues := index .Values "initSecrets" -}}
{{- if $initSecretsValues.serviceAccount.create -}}
    {{ default (include "initSecrets.fullname" .) $initSecretsValues.serviceAccount.name }}
{{- else -}}
    {{ coalesce $initSecretsValues.serviceAccount.name .Values.global.serviceAccount.name "default" }}
{{- end -}}
{{- end -}}
