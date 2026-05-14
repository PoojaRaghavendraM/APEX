prompt --application/shared_components/security/authentications/custom_authentication
begin
--   Manifest
--     AUTHENTICATION: Custom Authentication
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
 p_id=>wwv_flow_imp.id(50520486113963922)
,p_name=>'Custom Authentication'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_03=>'Custom_Authentication'
,p_attribute_05=>'N'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION Custom_Authentication (',
'    p_username IN VARCHAR2,',
'    p_password IN VARCHAR2',
') RETURN BOOLEAN IS',
'    l_user NUMBER;',
'BEGIN',
'    SELECT COUNT(*)',
'      INTO l_user',
'      FROM XXAPEX_USERS',
'     WHERE UPPER(v_user_name) = UPPER(p_username);',
'',
'    IF l_user > 0 THEN',
'        RETURN TRUE;',
'    ELSE',
'        RETURN FALSE;',
'    END IF;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        RETURN FALSE; ',
'END Custom_Authentication;'))
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_switch_in_session_yn=>'Y'
,p_version_scn=>39549229011841
);
wwv_flow_imp.component_end;
end;
/
