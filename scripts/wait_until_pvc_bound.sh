#!/bin/bash

echo 'This script waits until required PVCs for CP4BA is Bound'
echo 'Sleeping 2m...'
sleep 2m
NAMESPACE="$1"
SLEEP_TIME="15s"
LIMIT=100
PVC1="cp4a-shared-log-pvc"
PVC2= "operator-shared-pvc"


# Check if pods are ready 

if ! ISPRESENT=$(oc get pvc $PVC1 -n $NAMESPACE |  awk '{print $2}' | tail -1); then
  echo 'PVC is not present'
  exit 1
fi

while true; do
  if ! STATUS=$(oc get pvc $PVC1 -n $NAMESPACE |  awk '{print $2}' | tail -1); then
    echo 'Error getting pvc READY  '
  else
    echo "STATUS OF $PVC1 IS $STATUS"
    
    if [ "$STATUS"=="Bound" ]; then
      break;
    fi
  fi
  
  echo "Sleeping $SLEEP_TIME..."
  sleep $SLEEP_TIME
  
  (( i++ ))
  if [ "$i" -eq "$LIMIT" ]; then
    echo "Timed out."
    exit 1
  fi
done

echo "=== $PVC1 is ready ==="

