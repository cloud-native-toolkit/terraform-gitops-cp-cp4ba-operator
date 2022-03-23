#!/usr/bin/env bash
echo "**** Executing create-yaml.sh  ****"
NAME="$1"
CHART_DIR="$2"
NAMESPACE="$3"
DEST_DIR="$4"
#VALUES_FILE="$4"

mkdir -p "${DEST_DIR}"

## Add logic here to put the yaml resource content in DEST_DIR

cp -R "${CHART_DIR}"/* "${DEST_DIR}"

echo "**** Copied ${CHART_DIR} to   ${DEST_DIR}  ****"

#if [[ -n "${VALUES_CONTENT}" ]]; then
#  echo "${VALUES_CONTENT}" > "${DEST_DIR}/values.yaml}"
#fi

find "${DEST_DIR}" -name "*"