SELECT *
--DELETE
FROM `deinsoluciones-serverless.dev_config_zone.process_params`
WHERE arquetype_name = "workflow-arquetipo-request-to-api"



INSERT INTO `dev_config_zone.process_params` (
    process_name,
    process_fn_name,
    params,
    arquetype_name,
    active
) VALUES (
    'process-indicadores-economicos',
    'fn-request-to-api',
    JSON '''
    [
        {"url": "https://mindicador.cl/api/uf/2025","filename": "valor-uf-2025.parquet","vars": "codigo;nombre;serie.fecha;serie.valor"},
        {"url": "https://mindicador.cl/api/euro/2025","filename": "valor-euro-2025.parquet","vars": "codigo;nombre;serie.fecha;serie.valor"}
    ]
    ''',
    'workflow-arquetipo-request-to-api',
    TRUE
);


INSERT INTO `dev_config_zone.process_params` (
    process_name,
    process_fn_name, 
    params, 
    arquetype_name,
    active
) VALUES (
    'process-indicadores-economicos',
    'fn-validacion-de-archivo-gcs',
    JSON '''
    [
        {"path_name": "origin-files/valor-uf-2025.parquet", "periodicidad": "mensual"},
        {"path_name": "origin-files/valor-euro-2025.parquet", "periodicidad": "mensual"}
    ]
    ''',
    'workflow-arquetipo-request-to-api',
    TRUE
);


INSERT INTO `dev_config_zone.process_email` (
    process_name, 
    params, 
    zone_name,
    estatus
) VALUES (
    'process-indicadores-economicos',
    JSON '''
    [
        {
        "email_to_0": "ni.sepulvedaa@gmail.com",
        "email_subj_err": "Resultado Ejecución Proceso: process-indicadores-economicos [ERROR]", 
        "email_subj_ok": "Resultado Ejecución Proceso: process-indicadores-economicos [OK]", 
        "email_body_err": "Proces : process-indicadores-economicos de Arquetipo: workflow-arquetipo-request-to-api Ejecutado Con Errores!", 
        "email_body_ok": "Proces : process-indicadores-economicos de Arquetipo: workflow-arquetipo-request-to-api Ejecutado Ok!"
        }
    ]
    ''',
    'ORIGIN',
    1
);