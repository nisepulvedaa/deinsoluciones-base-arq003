INSERT INTO `dev_config_zone.process_params` (
    process_name,
    process_fn_name,
    params,
    arquetype_name,
    active
) VALUES (
    'process-{{nombre_proceso}}',
    'fn-insert-data',
    JSON '''
    [
        {"buckets_path_name": "{{buckets_path_name}}","buckets_file_name": "{{buckets_file_name_1}}","zone_name": "ORIGIN"},
        {"buckets_path_name": "{{buckets_path_name}}","buckets_file_name": "{{buckets_file_name_2}}","zone_name": "ORIGIN"}
    ]
    ''',
    'workflow-arquetipo-request-to-api',
    TRUE
);