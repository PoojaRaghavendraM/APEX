prompt --application/shared_components/logic/application_settings
begin
--   Manifest
--     APPLICATION SETTINGS: 114
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>7839066192597083
,p_default_application_id=>114
,p_default_id_offset=>0
,p_default_owner=>'WKSP_XXIROICDASH'
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(66213339015888110)
,p_name=>'ORACLE_FUSION_BASE_URL'
,p_value=>'https://fa-euth-dev37-saasfademo1.ds-fa.oraclepdemos.com'
,p_is_required=>'Y'
,p_valid_values=>'https://fa-euth-dev37-saasfademo1.ds-fa.oraclepdemos.com'
,p_on_upgrade_keep_value=>true
,p_version_scn=>39583778760460
);
wwv_flow_imp.component_end;
end;
/
