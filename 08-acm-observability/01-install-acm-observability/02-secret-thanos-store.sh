NS=open-cluster-management-observability

BUCKET_NAME=$(oc -n $ns get cm thanos-bc -o jsonpath='{.data.BUCKET_NAME}')
BUCKET_HOST=$(oc -n $ns get cm thanos-bc -o jsonpath='{.data.BUCKET_HOST}')
BUCKET_PORT=$(oc -n $ns get cm thanos-bc -o jsonpath='{.data.BUCKET_PORT}')
AWS_ACCESS_KEY_ID=$(oc -n $ns get secret thanos-bc -o jsonpath='{.data.AWS_ACCESS_KEY_ID}' | base64 -d)
AWS_SECRET_ACCESS_KEY=$(oc -n $ns get secret thanos-bc -o jsonpath='{.data.AWS_SECRET_ACCESS_KEY}' | base64 -d)

cat <<EOF | oc apply -f-

apiVersion: v1
kind: Secret
metadata:
  name: thanos-object-storage
  namespace: open-cluster-management-observability
type: Opaque
stringData:
  thanos.yaml: |
    type: s3
    config:
      bucket: ${BUCKET_NAME}
      endpoint: ${BUCKET_HOST}:${BUCKET_PORT}
      insecure: true
      access_key: ${AWS_ACCESS_KEY_ID}
      secret_key: ${AWS_SECRET_ACCESS_KEY}

EOF