prompt --application/shared_components/security/authentications/sso
begin
--   Manifest
--     AUTHENTICATION: SSO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>7839066192597083
,p_default_application_id=>114
,p_default_id_offset=>0
,p_default_owner=>'WKSP_XXIROICDASH'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(47483599806080074)
,p_name=>'SSO'
,p_scheme_type=>'NATIVE_SOCIAL'
,p_attribute_01=>wwv_flow_imp.id(42448820552623435)
,p_attribute_02=>'OPENID_CONNECT'
,p_attribute_03=>'https://idcs-f1c5e40f79ee4f09b1a68e235177ed1b.identity.oraclecloud.com/.well-known/openid-configuration'
,p_attribute_07=>'profile'
,p_attribute_09=>'sub'
,p_attribute_11=>'N'
,p_attribute_13=>'Y'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_switch_in_session_yn=>'Y'
,p_version_scn=>39544642519636
);
wwv_flow_imp.component_end;
end;
/
