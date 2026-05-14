prompt --application/shared_components/ai_config/ai_configuration
begin
--   Manifest
--     AI CONFIG: AI Configuration
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>7839066192597083
,p_default_application_id=>114
,p_default_id_offset=>0
,p_default_owner=>'WKSP_XXIROICDASH'
);
wwv_flow_imp_shared.create_ai_config(
 p_id=>wwv_flow_imp.id(57682367684593832)
,p_name=>'AI Configuration'
,p_static_id=>'ai_configuration'
,p_remote_server_id=>wwv_flow_imp.id(57678307703942856)
,p_system_prompt=>wwv_flow_string.join(wwv_flow_t_varchar2(
'You are an AI assistant for an Integration Reconciliation Dashboard. ',
'',
'When a user asks a question, follow these rules:',
'',
'1. Compute metrics dynamically from raw data:',
'',
'    - Total Runs / Success rate / Failed rate / Average Runtime:',
'        total_runs / instances =  count of unique INSTANCE_ID after applying the filters: Date range, Integration, Ledger (if provided)',
'        success_rate = count of unique INSTANCE_ID where STATUS=SUCCESS (total success / total runs * 100)',
'        failed_rate = count of unique INSTANCE_ID where STATUS=FAIL',
'        When calculating average runtime:',
'            - compute runtime = END_DATE - START_DATE ',
'            - Convert the result into hours, minutes, seconds. ',
'            Ignore records where START_DATE and END_DATE is null.',
'',
'2. Filter data based on user query:',
'    - By module, integration, date range, and ledger',
'',
'3. Answer questions in natural language:',
'    - Show clear bullet points if multiple metrics',
'    - If metrics cannot be calculated (e.g., no data)',
'',
'4. Do not ask for missing context:',
'    - Default to today if date not provided',
'    - Default to all modules or integrations if not specified',
'',
'5. For error - type questions, only use the relevant column:',
'    - Validation Error -> use VAL_FAILED_ROW_COUNT',
'    - Transformation Error -> use TF_FAILED_ROW_COUNT ',
'    - Import Error -> use IMPORT_FAIL_ROW_COUNT',
'    - Load Error -> use LOAD_FAIL_ROW_COUNT'))
,p_welcome_message=>'Hi! I''m your AI Assistant. How can I help you today?'
,p_version_scn=>39575474317604
);
wwv_flow_imp_shared.create_ai_config_rag_source(
 p_id=>wwv_flow_imp.id(57682980499636280)
,p_name=>'Interface and File Log'
,p_description=>'interface run and file processing details'
,p_rag_type=>'DATA_SOURCE'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 	',
'    l.INSTANCE_ID,',
'	l.INT_ID,',
'	l.INTEGRATION_NAME,',
'    l.SOURCE,',
'    l.TARGET,',
'    l.PATTERN,',
'    l.NO_OF_FILE_RECEIVED,',
'    l.TOTAL_FILE_PROCESSED,',
'    l.TOTAL_FILE_FAILED,',
'	l.STATUS,',
'	l.CREATION_DATE as log_creation_date, ',
'	l.MODULE_ID,',
'	f.RUN_ID,',
'	f.SRC_FILE_NAME,',
'	f.SRC_FILE_ROW_COUNT,',
'	f.VAL_FAILED_ROW_COUNT,',
'	f.TF_FAILED_ROW_COUNT,',
'	f.IMPORT_FAIL_ROW_COUNT,',
'	f.LOAD_FAIL_ROW_COUNT,',
'	f.START_DATE,',
'	f.END_DATE,',
'    f.LEDGER_NAME,',
'	RL.CATEGORY,',
'    RL.ERROR_TYPE,',
'    RL.OBJECT_NAME,',
'    RL.VALUE,',
'    RL.ERROR_MESSAGE,',
'    RL.CREATION_DATE as rejection_log_creation_date',
'FROM IR_INTERFACE_LOG l',
'LEFT JOIN IR_INTERFACE_FILE_LOG f ',
'    ON l.INSTANCE_ID = f.INSTANCE_ID',
'LEFT JOIN IR_VIEW_REJECTION_LOG RL',
'	ON RL.RUN_ID = f.RUN_ID'))
);
wwv_flow_imp_shared.create_ai_config_rag_source(
 p_id=>wwv_flow_imp.id(58670170548237642)
,p_name=>'User and Role Master'
,p_description=>'users, roles, and user-role assignments details'
,p_rag_type=>'DATA_SOURCE'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    U.USER_ID,',
'    U.USER_NAME,',
'    U.USER_EMAIL,',
'    U.STATUS AS USER_STATUS,',
'    R.ROLE_ID,',
'    R.ROLE_NAME,',
'    R.STATUS AS ROLE_STATUS,',
'	M.MODULE_NAME,',
'	M.MODULE_ID,',
'	M.MODULE_ABBREV',
'FROM IR_USERS U',
'LEFT JOIN IR_USER_ROLES UR ',
'       ON U.USER_ID = UR.USER_ID',
'LEFT JOIN IR_ROLE_MASTER R ',
'       ON UR.ROLE_ID = R.ROLE_ID',
'LEFT JOIN IR_MODULES M',
'	   ON M.ROLE_REQUIRED = R.ROLE_ID;'))
);
wwv_flow_imp.component_end;
end;
/
