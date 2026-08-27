#!/usr/bin/env bash
set -x
set -euo pipefail
IFS=$'\n\t'

namespace={{ .Release.Namespace }}
release={{ .Release.Name }}

pushd $(mktemp -d)

# Args pattern, length
function gen_random(){
  head -c 4096 /dev/urandom | LC_CTYPE=C tr -cd $1 | head -c $2
}

# Args: secretname, args
function generate_secret_if_needed(){
  local secret_args=( "${@:2}")
  local secret_name=$1

  if ! $(kubectl --namespace=$namespace get secret $secret_name > /dev/null 2>&1); then
    kubectl --namespace=$namespace create secret generic $secret_name ${secret_args[@]}
  else
    echo "secret \"$secret_name\" already exists."

    for arg in "${secret_args[@]}"; do
      local from=$(echo -n ${arg} | cut -d '=' -f1)

      if [ -z "${from##*literal*}" ]; then
        local key=$(echo -n ${arg} | cut -d '=' -f2)
        local desiredValue=$(echo -n ${arg} | cut -d '=' -f3-)
        local flags=(
          "--namespace=$namespace"
          "--allow-missing-template-keys=false"
        )

        if ! $(kubectl "${flags[@]}" get secret $secret_name -ojsonpath="{.data.${key}}" > /dev/null 2>&1); then
          echo "key \"${key}\" does not exist. patching it in."

          if [ "${desiredValue}" != "" ]; then
            desiredValue=$(echo -n "${desiredValue}" | base64 -w 0)
          fi

          kubectl --namespace=$namespace patch secret ${secret_name} -p "{\"data\":{\"$key\":\"${desiredValue}\"}}"
        fi
      fi
    done
  fi
}

# Generate the token state key (to safely pass information between authorize/device requests)
#generate_secret_if_needed diracx-dynamic-secrets --from-literal=DIRACX_SERVICE_AUTH_STATE_KEY=$(head -c 32 /dev/urandom | base64)

{{- if .Values.rabbitmq.enabled }}
# Generate the secrets for rabbitmq
generate_secret_if_needed {{ .Values.rabbitmq.auth.existingPasswordSecret }} --from-literal=rabbitmq-password=$(gen_random 'a-zA-Z0-9' 32)
generate_secret_if_needed {{ .Values.rabbitmq.auth.existingErlangSecret }} --from-literal=rabbitmq-erlang-cookie=$(gen_random 'a-zA-Z0-9' 32)
{{- end }}



{{- if .Values.taskWorkers.enabled }}
# Generate the Redis URL secret for the task broker
{{- if .Values.redisTasks.enabled }}
generate_secret_if_needed diracx-task-redis-url \
  --from-literal=DIRACX_TASKS_REDIS_URL="redis://{{ include "diracx.taskRedisName" . }}:{{ .Values.redisTasks.port }}"
{{- else if .Values.diracx.tasks.redis_url }}
generate_secret_if_needed diracx-task-redis-url \
  --from-literal=DIRACX_TASKS_REDIS_URL="{{ .Values.diracx.tasks.redis_url }}"
{{- else }}
{{ fail "diracx.tasks.redis_url must be set when redisTasks.enabled is false and taskWorkers.enabled is true" }}
{{- end }}
{{- end }}
