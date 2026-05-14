prompt --workspace/remote_servers/oci_gen_ai
begin
--   Manifest
--     REMOTE SERVER: OCI Gen AI
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>7839066192597083
,p_default_application_id=>114
,p_default_id_offset=>0
,p_default_owner=>'WKSP_XXIROICDASH'
);
wwv_imp_workspace.create_remote_server(
 p_id=>wwv_flow_imp.id(57678307703942856)
,p_name=>'OCI Gen AI'
,p_static_id=>'oci_gen_ai'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('oci_gen_ai'),'https://inference.generativeai.ap-hyderabad-1.oci.oraclecloud.com')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('oci_gen_ai'),'')
,p_server_type=>'GENERATIVE_AI'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('oci_gen_ai'),'')
,p_credential_id=>wwv_flow_imp.id(57678009961942856)
,p_remote_sql_default_schema=>nvl(wwv_flow_application_install.get_remote_server_default_db('oci_gen_ai'),'')
,p_mysql_sql_modes=>nvl(wwv_flow_application_install.get_remote_server_sql_mode('oci_gen_ai'),'')
,p_prompt_on_install=>true
,p_ai_provider_type=>'OCI_GENAI'
,p_ai_is_builder_service=>true
,p_ai_model_name=>nvl(wwv_flow_application_install.get_remote_server_ai_model('oci_gen_ai'),'')
,p_ai_http_headers=>nvl(wwv_flow_application_install.get_remote_server_ai_headers('oci_gen_ai'),'')
,p_ai_attributes=>nvl(wwv_flow_application_install.get_remote_server_ai_attrs('oci_gen_ai'),'{'||wwv_flow.LF||
'  "compartmentId" : "ocid1.tenancy.oc1..aaaaaaaasqduxc6ypqhclu6ez6bnk72qs6fcgsykbtlosufzn42xqclqwhia",'||wwv_flow.LF||
'  "servingMode" :'||wwv_flow.LF||
'  {'||wwv_flow.LF||
'    "modelId" : "cohere.command-a-03-2025",'||wwv_flow.LF||
'    "servingType" : "ON_DEMAND"'||wwv_flow.LF||
'  }'||wwv_flow.LF||
'}')
);
wwv_flow_imp.component_end;
end;
/
