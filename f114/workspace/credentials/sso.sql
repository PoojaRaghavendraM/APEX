prompt --workspace/credentials/sso
begin
--   Manifest
--     CREDENTIAL: SSO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>7839066192597083
,p_default_application_id=>114
,p_default_id_offset=>0
,p_default_owner=>'WKSP_XXIROICDASH'
);
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(42448820552623435)
,p_name=>'SSO'
,p_static_id=>'sso'
,p_authentication_type=>'BASIC'
,p_prompt_on_install=>true
);
wwv_flow_imp.component_end;
end;
/
