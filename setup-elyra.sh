#!/bin/bash
set -x

replace_invalid_characters (){
  python -c 'import sys;print(sys.argv[1].translate ({ord(c): "-" for c in "!@#$%^&*()[]{};:,/<>?\|`~=_+"}))' "$1"
}

# Assumptions are existing kubeflow installation is in the kubeflow namespace
DEFAULT_RUNTIME_FILE=$(jupyter --data-dir)/metadata/runtimes/my_kfp.json

COS_BUCKET=$(replace_invalid_characters "$COS_BUCKET")
export COS_BUCKET=${COS_BUCKET:-default}

# If Kubeflow credentials are not supplied, use default Kubeflow installation credentials
KF_USERNAME="${KF_USERNAME:=user@example.com}"
KF_PASSWORD="${KF_PASSWORD:=12341234}"
KF_DEPLOYMENT_NAMESPACE=$(env | grep ^JUPYTER_IMAGE= -m1 | cut -d'/' -f2)
AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID:=minio}"
AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY:=minio123}"

if [[ ! -f "$DEFAULT_RUNTIME_FILE" ]]; then
  elyra-metadata install runtimes --schema_name=kfp \
                                  --name=my_kfp \
                                  --display_name=Default \
                                  --user_namespace="$KF_DEPLOYMENT_NAMESPACE" \
                                  --auth_type=DEX_STATIC_PASSWORDS \
                                  --api_endpoint=http://ml-pipeline."$KF_DEPLOYMENT_NAMESPACE"/pipeline \
                                  --api_username="$KF_USERNAME" \
                                  --api_password="$KF_PASSWORD" \
                                  --cos_endpoint=http://minio-service."$KF_DEPLOYMENT_NAMESPACE":9000 \
                                  --cos_auth_type=USER_CREDENTIALS \
                                  --cos_username="$AWS_ACCESS_KEY_ID" \
                                  --cos_password="$AWS_SECRET_ACCESS_KEY" \
                                  --cos_bucket="$COS_BUCKET" \
                                  --engine=Tekton
fi
