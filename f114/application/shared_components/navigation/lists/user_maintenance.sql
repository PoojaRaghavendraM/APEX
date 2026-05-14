prompt --application/shared_components/navigation/lists/user_maintenance
begin
--   Manifest
--     LIST: User Maintenance
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>7839066192597083
,p_default_application_id=>114
,p_default_id_offset=>0
,p_default_owner=>'WKSP_XXIROICDASH'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(24546601193625)
,p_name=>'User Maintenance'
,p_list_status=>'PUBLIC'
,p_version_scn=>39544827759486
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(24739330193625)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'User Accounts'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
