#!/usr/bin/env bash

NAME="$1"
DEST_DIR="$2"
STORAGECLASS="$3"


mkdir -p "${DEST_DIR}"

cat > "${DEST_DIR}/pvc_operator.yaml" << EOL

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: operator-shared-pvc
  labels:
    app.kubernetes.io/instance: ibm-dba
    app.kubernetes.io/managed-by: ibm-dba
    app.kubernetes.io/name: ibm-dba
    release: 21.0.3
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: '${STORAGECLASS}'
  resources:
    requests:
      storage: 1Gi
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: cp4a-shared-log-pvc
  labels:
    app.kubernetes.io/instance: ibm-dba
    app.kubernetes.io/managed-by: ibm-dba
    app.kubernetes.io/name: ibm-dba
    release: 21.0.3
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: '${STORAGECLASS}'
  resources:
    requests:
      storage: 100Gi
EOL

PARMLENGTH=$(echo "${PARMS}" | jq '. | length')

if [[ ${PARMLENGTH} != 0 ]]; then

cat >> ${DEST_DIR}/pvc_operator.yaml << EOL
parameters: $(echo "${PARMS}" | jq -c 'from_entries')
EOL
fi 