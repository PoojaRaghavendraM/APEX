prompt --application/shared_components/security/authorizations/user_role_ap
begin
--   Manifest
--     SECURITY SCHEME: User-Role AP
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>7839066192597083
,p_default_application_id=>114
,p_default_id_offset=>0
,p_default_owner=>'WKSP_XXIROICDASH'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(47485195071090044)
,p_name=>'User-Role AP'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from (',
'	select ',
'		u.V_USER_EMAIL,',
'        r.V_ROLE_NAME',
'	from XXAPEX_USERS u',
'	left join XXAPEX_USER_ROLES ur ON u.N_USER_ID = ur.N_USER_ID',
'	left join XXAPEX_ROLE_MASTER r ON ur.N_ROLE_ID = r.N_ROLE_ID',
'	GROUP BY ',
'		u.V_USER_EMAIL,',
'        r.V_ROLE_NAME)',
'where ',
'    V_USER_EMAIL = :APP_USER',
'    and V_ROLE_NAME = ''AP SPECIALIST'';'))
,p_version_scn=>39546706747434
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
