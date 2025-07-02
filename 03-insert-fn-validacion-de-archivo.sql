INSERT INTO `dev_config_zone.process_params` (
    process_name,
    process_fn_name, 
    params, 
    arquetype_name,
    active
) VALUES (
    'process-{{nombre_proceso}}',
    'fn-validacion-de-archivo-gcs',
    JSON '''
    [
        {"path_name": "origin-files/{{buckets_file_name_1}}", "periodicidad": "{{periodicidad}}"},
        {"path_name": "origin-files/{{buckets_file_name_2}}", "periodicidad": "{{periodicidad}}"},
    ]
    ''',
    'workflow-arquetipo-request-to-api',
    TRUE
);
----
SELECT
    process_name,
    process_fn_name, 
    params, 
    arquetype_name,
    active
FROM dev_config_zone.process_params
WHERE process_name = 'process-{{nombre_proceso}}'
AND process_fn_name = 'fn-validacion-de-archivo-gcs'
AND arquetype_name = 'workflow-arquetipo-request-to-api';