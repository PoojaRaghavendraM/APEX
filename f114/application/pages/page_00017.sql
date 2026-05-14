prompt --application/pages/page_00017
begin
--   Manifest
--     PAGE: 00017
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
 p_id=>17
,p_name=>'Data Conversion Error Dashboard'
,p_alias=>'DATA-CONVERSION-ERROR-DASHBOARD'
,p_step_title=>'Data Conversion Error Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.apex-rds-item {',
'    font-size: var(--ut-tabs-item-font-size,.975rem);',
'}',
'',
'.a-RDS-link {',
'    color: #333333;',
'}',
'',
'.apex-rds {',
'    justify-content: center;',
'}',
'',
'.a-GV-cell a {',
'  text-decoration: underline;',
'}',
'.t-Body-contentInner {',
'    background: rgba(204,204,204,0.2);',
'}',
'.a-CardView-items {',
'    background-color: rgba(204,204,204,0.2);',
'}',
'',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2173533957601313)
,p_plug_name=>'Import'
,p_title=>'Import'
,p_region_name=>'Import'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    f.INSTANCE_ID,',
'    f.RUN_ID,',
'    NVL(f.SRC_FILE_NAME, ''-'') AS FILE_NAME,',
'    f.SRC_FILE_ROW_COUNT,',
'    f.IMPORT_FAIL_ROW_COUNT,',
'    l.CREATION_DATE',
'FROM IR_INTERFACE_FILE_LOG f',
'JOIN IR_INTERFACE_LOG l',
'  ON l.INSTANCE_ID = f.INSTANCE_ID',
'WHERE l.MODULE_ID = :P17_MODULE_ID',
'  AND l.INTEGRATION_NAME  = :P17_INTEGRATION_NAME',
'  AND l.CREATION_DATE >= TO_DATE(:P17_FROM_DATE, ''DD/MM/YYYY'')',
'  AND l.CREATION_DATE <= TO_DATE(:P17_TO_DATE, ''DD/MM/YYYY'')',
'  AND NVL(f.IMPORT_FAIL_ROW_COUNT, 0) > 0;'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P17_FROM_DATE,P17_TO_DATE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Import'
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
 p_id=>wwv_flow_imp.id(2830194206523211)
,p_name=>'RUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RUN_ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Run ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:15:P15_FROM_DATE,P15_TO_DATE,P15_INSTANCE_ID,P15_MODULE_ID,P15_RUN_ID:&P17_FROM_DATE.,&P17_TO_DATE.,&INSTANCE_ID.,&P17_MODULE_ID.,&RUN_ID.'
,p_link_text=>'&RUN_ID.'
,p_link_attributes=>'&INSTANCE_ID.'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(2903593746987187)
,p_name=>'ROW SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'N')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(72065759344982210)
,p_name=>'INSTANCE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INSTANCE_ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Instance ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(72065853307982211)
,p_name=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILE_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'File Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>255
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(72065981083982212)
,p_name=>'SRC_FILE_ROW_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SRC_FILE_ROW_COUNT'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Source File Row Count'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(72066091560982213)
,p_name=>'IMPORT_FAIL_ROW_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMPORT_FAIL_ROW_COUNT'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Import Fail Row Count'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(72173657082884009)
,p_name=>'CREATION_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATION_DATE'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Creation Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(2828156961523191)
,p_internal_uid=>59566620242764114
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(2835291150524938)
,p_interactive_grid_id=>wwv_flow_imp.id(2828156961523191)
,p_static_id=>'595738'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(2835525856524939)
,p_report_id=>wwv_flow_imp.id(2835291150524938)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(2866312447524981)
,p_view_id=>wwv_flow_imp.id(2835525856524939)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(2830194206523211)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(72116776818795005)
,p_view_id=>wwv_flow_imp.id(2835525856524939)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(72065759344982210)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(72117625209795006)
,p_view_id=>wwv_flow_imp.id(2835525856524939)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(72065853307982211)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(72118570535795007)
,p_view_id=>wwv_flow_imp.id(2835525856524939)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(72065981083982212)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(72119429517795009)
,p_view_id=>wwv_flow_imp.id(2835525856524939)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(72066091560982213)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(72298140226084207)
,p_view_id=>wwv_flow_imp.id(2835525856524939)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(72173657082884009)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(56134139150378943)
,p_plug_name=>'Region Selector'
,p_region_template_options=>'#DEFAULT#:margin-bottom-lg'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>50
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'NO')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(56134302691378945)
,p_plug_name=>'Validation & Transformation'
,p_title=>'Validation & Transformation'
,p_region_name=>'Validation'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    f.INSTANCE_ID,',
'    f.RUN_ID,',
'    NVL(f.SRC_FILE_NAME, ''-'') AS FILE_NAME,',
'    f.SRC_FILE_ROW_COUNT,',
'    f.VAL_FAILED_ROW_COUNT,',
'    f.TF_FAILED_ROW_COUNT,',
'    l.CREATION_DATE',
'FROM IR_INTERFACE_FILE_LOG f',
'JOIN IR_INTERFACE_LOG l',
'  ON l.INSTANCE_ID = f.INSTANCE_ID',
'WHERE l.MODULE_ID = :P17_MODULE_ID',
'  AND l.INTEGRATION_NAME  = :P17_INTEGRATION_NAME',
'  AND l.CREATION_DATE >= TO_DATE(:P17_FROM_DATE, ''DD/MM/YYYY'')',
'  AND l.CREATION_DATE <= TO_DATE(:P17_TO_DATE, ''DD/MM/YYYY'')',
'  AND (',
'        NVL(f.VAL_FAILED_ROW_COUNT, 0) > 0',
'     OR NVL(f.TF_FAILED_ROW_COUNT,  0) > 0',
'      );',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P17_FROM_DATE,P17_TO_DATE,P17_MODULE_ID,P17_INTEGRATION_NAME'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Validation & Transformation'
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
 p_id=>wwv_flow_imp.id(6166414356889)
,p_name=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILE_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'File Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>255
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6527620356892)
,p_name=>'ROW SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'N')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8902742356916)
,p_name=>'RUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RUN_ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Run ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12:P12_FROM_DATE,P12_TO_DATE,P12_INSTANCE_ID,P12_RUN_ID:&P17_FROM_DATE.,&P17_TO_DATE.,&INSTANCE_ID.,&RUN_ID.'
,p_link_text=>'&RUN_ID.'
,p_link_attributes=>'&INSTANCE_ID.'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(56466522291945801)
,p_name=>'INSTANCE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INSTANCE_ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Instance ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(72065263654982205)
,p_name=>'SRC_FILE_ROW_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SRC_FILE_ROW_COUNT'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Source File Row Count'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(72065347068982206)
,p_name=>'VAL_FAILED_ROW_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VAL_FAILED_ROW_COUNT'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Validation Failed Row Count'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(72065476674982207)
,p_name=>'TF_FAILED_ROW_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TF_FAILED_ROW_COUNT'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Transformation Failed Row Count'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(72173753193884010)
,p_name=>'CREATION_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATION_DATE'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Creation Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(56134814958378950)
,p_internal_uid=>56134814958378950
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(56472496211949454)
,p_interactive_grid_id=>wwv_flow_imp.id(56134814958378950)
,p_static_id=>'564725'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(56472697474949455)
,p_report_id=>wwv_flow_imp.id(56472496211949454)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(50338243848562)
,p_view_id=>wwv_flow_imp.id(56472697474949455)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6166414356889)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(88635111598064)
,p_view_id=>wwv_flow_imp.id(56472697474949455)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(8902742356916)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56473125383949458)
,p_view_id=>wwv_flow_imp.id(56472697474949455)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(56466522291945801)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(72079006635044133)
,p_view_id=>wwv_flow_imp.id(56472697474949455)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(72065263654982205)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(72079921381044134)
,p_view_id=>wwv_flow_imp.id(56472697474949455)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(72065347068982206)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(72080825245044135)
,p_view_id=>wwv_flow_imp.id(56472697474949455)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(72065476674982207)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(72300012070086670)
,p_view_id=>wwv_flow_imp.id(56472697474949455)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(72173753193884010)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(56134724994378949)
,p_plug_name=>'Load'
,p_region_name=>'Load'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    f.INSTANCE_ID,',
'    f.RUN_ID,',
'    NVL(f.SRC_FILE_NAME, ''-'') AS FILE_NAME,',
'    f.SRC_FILE_ROW_COUNT,',
'    f.LOAD_FAIL_ROW_COUNT,',
'    f.START_DATE',
'FROM IR_INTERFACE_FILE_LOG f',
'JOIN IR_INTERFACE_LOG l',
'  ON l.INSTANCE_ID = f.INSTANCE_ID',
'WHERE l.MODULE_ID = :P17_MODULE_ID',
'  AND l.INTEGRATION_NAME  = :P17_INTEGRATION_NAME',
'  AND l.CREATION_DATE >= TO_DATE(:P17_FROM_DATE, ''DD/MM/YYYY'')',
'  AND l.CREATION_DATE <= TO_DATE(:P17_TO_DATE, ''DD/MM/YYYY'')',
'  AND NVL(f.LOAD_FAIL_ROW_COUNT, 0) > 0;'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P17_FROM_DATE,P17_TO_DATE'
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
 p_id=>wwv_flow_imp.id(1914539510345315)
,p_name=>'INSTANCE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INSTANCE_ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Instance ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1914708065345316)
,p_name=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILE_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'File Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>255
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1915111574345320)
,p_name=>'RUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RUN_ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Run ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:18:P18_FROM_DATE,P18_TO_DATE,P18_INSTANCE_ID,P18_RUN_ID:&P17_FROM_DATE.,&P17_TO_DATE.,&INSTANCE_ID.,&RUN_ID.'
,p_link_text=>'&RUN_ID.'
,p_link_attributes=>'&INSTANCE_ID.'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(2903829570987189)
,p_name=>'ROW SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'N')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(60271199265016418)
,p_name=>'SRC_FILE_ROW_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SRC_FILE_ROW_COUNT'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Source File Row Count'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(60271393817016420)
,p_name=>'START_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'START_DATE'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_format_mask=>'DD-MM-YYYY'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(60271693317016423)
,p_name=>'LOAD_FAIL_ROW_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOAD_FAIL_ROW_COUNT'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Load Fail Row Count'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(1914510563345314)
,p_internal_uid=>58652973844586237
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(2163570581592951)
,p_interactive_grid_id=>wwv_flow_imp.id(1914510563345314)
,p_static_id=>'589021'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(2163817306592951)
,p_report_id=>wwv_flow_imp.id(2163570581592951)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21735188140018)
,p_view_id=>wwv_flow_imp.id(2163817306592951)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(60271693317016423)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(2164306172592953)
,p_view_id=>wwv_flow_imp.id(2163817306592951)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(1914539510345315)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(2165166407592954)
,p_view_id=>wwv_flow_imp.id(2163817306592951)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(1914708065345316)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(2168741670592958)
,p_view_id=>wwv_flow_imp.id(2163817306592951)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(1915111574345320)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(60702873043212281)
,p_view_id=>wwv_flow_imp.id(2163817306592951)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(60271199265016418)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(60704697900212284)
,p_view_id=>wwv_flow_imp.id(2163817306592951)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(60271393817016420)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2170956199601288)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(56134724994378949)
,p_button_name=>'Download_load'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft:t-Button--gapBottom'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download '
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
,p_grid_new_row=>'Y'
,p_required_patch=>wwv_flow_imp.id(46853242791921216)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2902810007987179)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(2173533957601313)
,p_button_name=>'Download_Imp_Gl'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft:t-Button--gapBottom'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
,p_grid_new_row=>'Y'
,p_required_patch=>wwv_flow_imp.id(46853242791921216)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6881466356896)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(56134302691378945)
,p_button_name=>'Download_Val_Trans'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft:t-Button--gapBottom'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download '
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
,p_grid_new_row=>'Y'
,p_required_patch=>wwv_flow_imp.id(46853242791921216)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6785506356895)
,p_name=>'P17_SELECTED_ROW'
,p_item_sequence=>120
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1910913074345278)
,p_name=>'P17_FROM_DATE'
,p_item_sequence=>20
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1911022364345279)
,p_name=>'P17_TO_DATE'
,p_item_sequence=>30
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2170896555601287)
,p_name=>'P_B_SELECTED_ROW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(56134724994378949)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2171670912601295)
,p_name=>'P17_MODULE_ID'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2902683942987178)
,p_name=>'P_GL_I_ROW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(2173533957601313)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60269408868016401)
,p_name=>'P17_ACTIVE_TAB'
,p_item_sequence=>110
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(72065159350982204)
,p_name=>'P17_INTEGRATION_NAME'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6582143356893)
,p_name=>'Capture Selected Row IDs (VT)'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(56134302691378945)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6697059356894)
,p_event_id=>wwv_flow_imp.id(6582143356893)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_SELECTED_ROW'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var model = this.data.model;',
'var selected = this.data.selectedRecords;',
'var ids = [];',
'',
'if (selected.length > 0) {',
'',
'    for (let i = 0; i < selected.length; i++) {',
'        ids.push("''" + model.getValue(selected[i], "RUN_ID") + "''");',
'    }',
'',
'} else {',
'',
'    model.forEach(function(record) {',
'        if (record !== null) {',
'            ids.push("''" + model.getValue(record, "RUN_ID") + "''");',
'        }',
'    });',
'',
'}',
'',
'$s("P17_SELECTED_ROW", ids.join(","));'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(60271455395016421)
,p_name=>'Capture Selected Row IDs (L)'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(56134724994378949)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(60271500085016422)
,p_event_id=>wwv_flow_imp.id(60271455395016421)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_SELECTED_ROW'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var model = this.data.model;',
'var selected = this.data.selectedRecords;',
'var ids = [];',
'',
'if (selected.length > 0) {',
'',
'    for (let i = 0; i < selected.length; i++) {',
'        ids.push("''" + model.getValue(selected[i], "RUN_ID") + "''");',
'    }',
'',
'} else {',
'',
'    model.forEach(function(record) {',
'        if (record !== null) {',
'            ids.push("''" + model.getValue(record, "RUN_ID") + "''");',
'        }',
'    });',
'',
'}',
'',
'$s("P17_SELECTED_ROW", ids.join(","));'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6970152356897)
,p_name=>'Val & Trans Download'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6881466356896)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117099356898)
,p_event_id=>wwv_flow_imp.id(6970152356897)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DOWNLOAD'
,p_attribute_01=>'Y'
,p_attribute_02=>'Val_&_Trans_Errors.xlsx'
,p_attribute_04=>'select IR_EXPORT_ERRORS_PKG.VAL_TRANS_ERRORS(:P17_SELECTED_ROW),''Val_&_Trans_Errors.xlsx'' from dual'
,p_attribute_06=>'P17_SELECTED_ROW'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2171126092601289)
,p_name=>'Load Download'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(2170956199601288)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2171178419601290)
,p_event_id=>wwv_flow_imp.id(2171126092601289)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DOWNLOAD'
,p_attribute_01=>'Y'
,p_attribute_02=>'Load_Errors.xlsx'
,p_attribute_04=>'select IR_EXPORT_ERRORS_PKG.LOAD_ERRORS(:P17_SELECTED_ROW),''Load_Error.xlsx'' from dual'
,p_attribute_06=>'P17_SELECTED_ROW'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2902875903987180)
,p_name=>'GL Imp Download'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(2902810007987179)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2902975341987181)
,p_event_id=>wwv_flow_imp.id(2902875903987180)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DOWNLOAD'
,p_attribute_01=>'N'
,p_attribute_03=>'ATTACHMENT'
,p_attribute_05=>'select IR_EXPORT_ERRORS_PKG.IMPORT_ERRORS(:P_GL_I_ROW,:P17_MODULE_ID),''Interface_Error.xlsx'' from dual'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(60269501451016402)
,p_name=>'Open Active Tab'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(60269668462016403)
,p_event_id=>wwv_flow_imp.id(60269501451016402)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function () {',
'    var tab = $v("P17_ACTIVE_TAB");',
'    console.log("Active tab: " + tab);',
'',
'    if (tab) {',
'        var $tabLink = $(".a-RDS-link[href=''#" + tab + "'']");',
'        if ($tabLink.length) {',
'            $tabLink[0].click();',
'        }',
'    }',
'}, 200);'))
);
wwv_flow_imp.component_end;
end;
/
