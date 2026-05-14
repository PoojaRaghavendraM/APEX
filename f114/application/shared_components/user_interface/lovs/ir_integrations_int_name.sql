prompt --application/shared_components/user_interface/lovs/ir_integrations_int_name
begin
--   Manifest
--     IR_INTEGRATIONS.INT_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>7839066192597083
,p_default_application_id=>114
,p_default_id_offset=>0
,p_default_owner=>'WKSP_XXIROICDASH'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(55685990233685994)
,p_lov_name=>'IR_INTEGRATIONS.INT_NAME'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'IR_INTEGRATIONS'
,p_return_column_name=>'INT_ID'
,p_display_column_name=>'INT_NAME'
,p_default_sort_column_name=>'INT_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>39551140339376
);
wwv_flow_imp.component_end;
end;
/
