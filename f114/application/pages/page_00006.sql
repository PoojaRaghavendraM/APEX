prompt --application/pages/page_00006
begin
--   Manifest
--     PAGE: 00006
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>7839066192597083
,p_default_application_id=>114
,p_default_id_offset=>0
,p_default_owner=>'WKSP_XXIROICDASH'
);
wwv_flow_imp_page.create_page(
 p_id=>6
,p_name=>'User Accounts'
,p_alias=>'USER-ACCOUNTS'
,p_step_title=>'User Accounts'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-GV-cell a {',
'  text-decoration: underline;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(40699732624473)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(46853852865921219)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41438510624474)
,p_plug_name=>'User Accounts'
,p_region_name=>'User_Accounts'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    u.USER_ID,',
'    u.USER_NAME,',
'    u.USER_EMAIL,',
'    CASE ',
'        WHEN COUNT(r.ROLE_NAME) > 2 THEN',
'            SUBSTR(',
'                LISTAGG(r.ROLE_NAME, '','') WITHIN GROUP (ORDER BY r.ROLE_NAME),',
'                1,',
'                INSTR(LISTAGG(r.ROLE_NAME, '','') WITHIN GROUP (ORDER BY r.ROLE_NAME), '','', 1, 2) - 1',
'            ) || '' [+'' || (COUNT(r.ROLE_NAME) - 2) || '']''',
'        ELSE',
'            REPLACE(LISTAGG(r.ROLE_NAME, '','') WITHIN GROUP (ORDER BY r.ROLE_NAME), '','', '', '')',
'    END AS Role,',
'    u.STATUS',
'from IR_USERS u',
'left join IR_USER_ROLES ur ON u.USER_ID = ur.USER_ID',
'left join IR_ROLE_MASTER r ON ur.ROLE_ID = r.ROLE_ID',
'GROUP BY ',
'    u.USER_ID,',
'    u.USER_NAME,',
'    u.USER_EMAIL,',
'    u.STATUS;'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15679815604068)
,p_name=>'ROLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Role'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(50888949619103042)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(66107971988543213)
,p_name=>'USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(66108060562543214)
,p_name=>'USER_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::P9_USER_ID:&USER_ID.'
,p_link_text=>'&USER_NAME.'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(66108114047543215)
,p_name=>'USER_EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Email'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>16000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(66108250709543216)
,p_name=>'STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>16000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(313181516230406)
,p_internal_uid=>50886288834103015
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:PDF:XLSX'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(104050779918570418)
,p_interactive_grid_id=>wwv_flow_imp.id(313181516230406)
,p_static_id=>'516778'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>25
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(104051021845570418)
,p_report_id=>wwv_flow_imp.id(104050779918570418)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(299655801275593)
,p_view_id=>wwv_flow_imp.id(104051021845570418)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(15679815604068)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(66155225466285433)
,p_view_id=>wwv_flow_imp.id(104051021845570418)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(66107971988543213)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(66156116427285436)
,p_view_id=>wwv_flow_imp.id(104051021845570418)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(66108060562543214)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(66157039329285438)
,p_view_id=>wwv_flow_imp.id(104051021845570418)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(66108114047543215)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(66157916542285439)
,p_view_id=>wwv_flow_imp.id(104051021845570418)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(66108250709543216)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(50888371217103036)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(41438510624474)
,p_button_name=>'DOWNLOAD_TEMPLATE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft:t-Button--gapBottom'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Template'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'#APP_FILES#IR User Acounts.xlsx'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(50888218651103035)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(41438510624474)
,p_button_name=>'IMPORT_FILE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Import'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-upload'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(91483626100872)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(41438510624474)
,p_button_name=>'ADD_USER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft:t-Button--gapBottom'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add User'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-user-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17359706604085)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(41438510624474)
,p_button_name=>'ASSIGN_ROLES'
,p_button_static_id=>'ASSIGN_ROLES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Assign Roles'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-user-wrench'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(16389481604075)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(41438510624474)
,p_button_name=>'REMOVE_ROLES'
,p_button_static_id=>'REMOVE_ROLES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Remove Roles'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-user-x'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(1180376210410405)
,p_branch_name=>'Assign Roles'
,p_branch_action=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:P5_MULTI_N_ID,P5_ARBITRARY_VALUE:&P6_MULTI_N_ID.,&P6_ARBITRARY_VALUE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(17359706604085)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(1181748344410418)
,p_branch_name=>'Remove Roles'
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:10:P10_MULTI_N_ID,P10_ARBITRARY_VALUE:&P6_MULTI_N_ID.,&P6_ARBITRARY_VALUE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(16389481604075)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17193348604083)
,p_name=>'P6_MULTI_N_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(41438510624474)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1180512158410406)
,p_name=>'P6_ARBITRARY_VALUE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(41438510624474)
,p_item_default=>'A:B:C'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(51660548063843307)
,p_name=>'Refresh Region'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(41438510624474)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(51660693026843308)
,p_event_id=>wwv_flow_imp.id(51660548063843307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(41438510624474)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17117113604082)
,p_name=>'Assign Roles'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17016458604081)
,p_event_id=>wwv_flow_imp.id(17117113604082)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Hide the button initially',
'$("#ASSIGN_ROLES").hide();',
'$("#REMOVE_ROLES").hide();',
'',
'',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(16581833604077)
,p_name=>'Show Assign Roles'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6_MULTI_N_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16528308604076)
,p_event_id=>wwv_flow_imp.id(16581833604077)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var selectedRecords = apex.region("User_Accounts").widget().interactiveGrid("getSelectedRecords");',
'',
'if (selectedRecords.length > 0) {',
'    $("#ASSIGN_ROLES").show();',
'    $("#REMOVE_ROLES").show();',
'} else {',
'    $("#ASSIGN_ROLES").hide();',
'    $("#REMOVE_ROLES").hide();',
'}',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14062168604052)
,p_name=>'Setup Page Item'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(41438510624474)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13989803604051)
,p_event_id=>wwv_flow_imp.id(14062168604052)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var i_multi_id = [];',
'var model = this.data.model;',
'',
'for(var i = 0; i < this.data.selectedRecords.length; i++) {',
'    i_multi_id.push(model.getValue(this.data.selectedRecords[i], "USER_ID"));',
'}',
'',
'var finalValue = i_multi_id.join('':'');',
'console.log(finalValue);',
'apex.item("P6_MULTI_N_ID").setValue(finalValue);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13870094604050)
,p_event_id=>wwv_flow_imp.id(14062168604052)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_MULTI_N_ID'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(50889096265103043)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(41438510624474)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'User Acounts - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>50889096265103043
);
wwv_flow_imp.component_end;
end;
/
