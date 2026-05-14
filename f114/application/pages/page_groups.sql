prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 114
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>7839066192597083
,p_default_application_id=>114
,p_default_id_offset=>0
,p_default_owner=>'WKSP_XXIROICDASH'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(46859478615921277)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/
