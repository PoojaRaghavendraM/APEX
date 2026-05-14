prompt --application/shared_components/data_loads/user_accounts
begin
--   Manifest
--     DATA LOAD: User Accounts
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>7839066192597083
,p_default_application_id=>114
,p_default_id_offset=>0
,p_default_owner=>'WKSP_XXIROICDASH'
);
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(51304963687436320)
,p_name=>'User Accounts'
,p_format=>'XLSX'
,p_encoding=>'utf-8'
,p_default_xlsx_sheet_name=>'sheet1.xml'
,p_has_header_row=>true
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(51305265560436345)
,p_data_profile_id=>wwv_flow_imp.id(51304963687436320)
,p_name=>'USER_NAME'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>true
,p_selector_type=>'NAME'
,p_selector=>'USER'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(51305535778436346)
,p_data_profile_id=>wwv_flow_imp.id(51304963687436320)
,p_name=>'USER_EMAIL'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>true
,p_selector_type=>'NAME'
,p_selector=>'EMAIL'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(51306157670436346)
,p_data_profile_id=>wwv_flow_imp.id(51304963687436320)
,p_name=>'STATUS'
,p_sequence=>4
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>true
,p_selector_type=>'NAME'
,p_selector=>'STATUS'
);
wwv_flow_imp_shared.create_load_table(
 p_id=>wwv_flow_imp.id(51306385199436346)
,p_name=>'User Accounts'
,p_static_id=>'user_accounts'
,p_target_type=>'TABLE'
,p_table_name=>'IR_USERS'
,p_data_profile_id=>wwv_flow_imp.id(51304963687436320)
,p_loading_method=>'APPEND'
,p_commit_interval=>200
,p_error_handling=>'ABORT'
,p_skip_validation=>'N'
,p_version_scn=>39565748308218
);
wwv_flow_imp.component_end;
end;
/
