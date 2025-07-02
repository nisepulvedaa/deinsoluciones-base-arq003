curl -X POST https://us-east4-deinsoluciones-serverless.cloudfunctions.net/fn-insert-data \
  -H "Authorization: bearer $(gcloud auth print-identity-token)" \
  -H "Content-Type: application/json" \
  -d '{
  "process_name": "process-indicadores-economicos-2",
  "process_fn_name": "fn-insert-data",
  "arquetype_name": "workflow-arquetipo-request-to-api"
}'


curl -X POST https://us-east4-deinsoluciones-serverless.cloudfunctions.net/fn-request-to-api \
  -H "Authorization: bearer $(gcloud auth print-identity-token)" \
  -H "Content-Type: application/json" \
  -d '{
  "process_name": "process-indicadores-economicos-2",
  "process_fn_name": "fn-request-to-api",
  "arquetype_name": "workflow-arquetipo-request-to-api"
}'






curl -X POST https://us-east4-deinsoluciones-serverless.cloudfunctions.net/fn-validacion-de-archivo-gcs \
  -H "Authorization: bearer $(gcloud auth print-identity-token)" \
  -H "Content-Type: application/json" \
  -d '{
  "process_name": "process-indicadores-economicos-2",
  "process_fn_name": "fn-validacion-de-archivo-gcs",
  "arquetype_name": "workflow-arquetipo-request-to-api"
}'


curl -X POST https://us-east4-deinsoluciones-serverless.cloudfunctions.net/fn-send-email \
  -H "Authorization: bearer $(gcloud auth print-identity-token)" \
  -H "Content-Type: application/json" \
  -d '{
  "process_name": "process-indicadores-economicos-2",
  "zone_name": "ORIGIN",
  "estado": "OK"
}'

curl -X POST https://us-east4-deinsoluciones-serverless.cloudfunctions.net/fn-send-email \
  -H "Authorization: bearer $(gcloud auth print-identity-token)" \
  -H "Content-Type: application/json" \
  -d '{
  "process_name": "process-indicadores-economicos-2",
  "zone_name": "ORIGIN",
  "estado": "ERROR"
}'

