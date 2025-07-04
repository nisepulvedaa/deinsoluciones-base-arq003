INSERT INTO `dev_config_zone.process_params` (
    process_name,
    process_fn_name,
    params,
    arquetype_name,
    active
) VALUES (
    'process-{{nombre_proceso}}',
    'fn-request-to-api',
    JSON '''
    [
        {"url": "{{url_api}}","filename": "{{buckets_file_name_1}}","vars": "{{vars_1}}"},
        {"url": "{{url_api}}","filename": "{{buckets_file_name_2}}","vars": "{{vars_1}}"}
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
AND process_fn_name = 'fn-request-to-api'
AND arquetype_name = 'workflow-arquetipo-request-to-api';