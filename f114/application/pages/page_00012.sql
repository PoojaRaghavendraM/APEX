prompt --application/pages/page_00012
begin
--   Manifest
--     PAGE: 00012
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
 p_id=>12
,p_name=>'Val & Trans Error Modal'
,p_alias=>'VAL-TRANS-ERROR-MODAL'
,p_page_mode=>'MODAL'
,p_step_title=>'Validation & Transformation Error'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-search-field{',
'    height: 32px !important;',
'    padding: 2px 8px !important;',
'    font-size: 12px;',
'}',
'.a-IG-controlsCheckbox:checked+.a-IG-controlsCheckboxLabel, .a-IRR-controlsCheckbox:checked+.a-IRR-controlsCheckboxLabel, .u-selector.is-selected {',
'    --a-checkbox-background-color: rgba(255,255,255,0.4);',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'800'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9215249356919)
,p_plug_name=>'Val_&_Trans_Error_Details'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    RUN_ID,',
'    ERROR_TYPE,',
'    FAILED_OBJECT,',
'    FAILED_VALUE,',
'    ERROR_REASON,',
'    CREATION_DATE,',
'    INSTANCE_ID',
'FROM IR_VAL_TF_LOG',
'WHERE ERROR_TYPE IS NOT NULL',
'  AND CREATION_DATE >= TO_DATE(:P12_FROM_DATE, ''DD/MM/YYYY'')',
'  AND CREATION_DATE < TO_DATE(:P12_TO_DATE, ''DD/MM/YYYY'') + 1',
'  AND INSTANCE_ID = :P12_INSTANCE_ID',
'  AND RUN_ID=:P12_RUN_ID'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P12_FROM_DATE,P12_TO_DATE,P12_INSTANCE_ID'
,p_prn_content_disposition=>'ATTACHMENT'
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
 p_id=>wwv_flow_imp.id(60269977525016406)
,p_name=>'RUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RUN_ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Run ID'
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
 p_id=>wwv_flow_imp.id(60270030665016407)
,p_name=>'ERROR_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ERROR_TYPE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Error Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(60270167101016408)
,p_name=>'FAILED_OBJECT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FAILED_OBJECT'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Failed Object'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(60270209656016409)
,p_name=>'FAILED_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FAILED_VALUE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Failed Value'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(60270354406016410)
,p_name=>'ERROR_REASON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ERROR_REASON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Error Reason'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(60270447289016411)
,p_name=>'CREATION_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATION_DATE'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(72065582483982208)
,p_name=>'INSTANCE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INSTANCE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(60269843740016405)
,p_internal_uid=>60269843740016405
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
 p_id=>wwv_flow_imp.id(60325132355353849)
,p_interactive_grid_id=>wwv_flow_imp.id(60269843740016405)
,p_static_id=>'603252'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(60325314723353849)
,p_report_id=>wwv_flow_imp.id(60325132355353849)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(60325801304353852)
,p_view_id=>wwv_flow_imp.id(60325314723353849)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(60269977525016406)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105.525
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(60326776245353854)
,p_view_id=>wwv_flow_imp.id(60325314723353849)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(60270030665016407)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(60327654256353855)
,p_view_id=>wwv_flow_imp.id(60325314723353849)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(60270167101016408)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(60328559812353856)
,p_view_id=>wwv_flow_imp.id(60325314723353849)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(60270209656016409)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(60329427950353857)
,p_view_id=>wwv_flow_imp.id(60325314723353849)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(60270354406016410)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>173.537
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(60330328357353858)
,p_view_id=>wwv_flow_imp.id(60325314723353849)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(60270447289016411)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(72086006761279403)
,p_view_id=>wwv_flow_imp.id(60325314723353849)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(72065582483982208)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(60270786879016414)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9215249356919)
,p_button_name=>'REPROCESS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft:t-Button--gapBottom'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reprocess'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1911051782345280)
,p_name=>'P12_FROM_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9215249356919)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1911219008345281)
,p_name=>'P12_TO_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9215249356919)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1911327064345282)
,p_name=>'P12_INSTANCE_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9215249356919)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(70864158718408006)
,p_name=>'P12_RUN_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9215249356919)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
