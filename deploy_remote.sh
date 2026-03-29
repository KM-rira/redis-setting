#!/usr/bin/env bash
set -euo pipefail

: "${SSH_KEY_PATH:?}"
: "${TARGET_INSTANCE:?}"
: "${TARGET_INFRA_DIR:?}"

ssh -i "${SSH_KEY_PATH}" -t "${TARGET_INSTANCE}" \
  "cd ${TARGET_INFRA_DIR} && bash ./prd_compose_deploy.sh"
