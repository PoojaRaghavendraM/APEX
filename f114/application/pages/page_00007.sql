prompt --application/pages/page_00007
begin
--   Manifest
--     PAGE: 00007
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
 p_id=>7
,p_name=>'Integration Analytics'
,p_alias=>'INTEGRATION-ANALYTICS'
,p_step_title=>'Integration Analytics'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-GV-cell a {',
'  text-decoration: underline;',
'}',
'.t-Body-contentInner {',
'    background: rgba(204,204,204,0.2);',
'}',
'.a-CardView-items {',
'    background-color: rgba(204,204,204,0.2);',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1783613998999605)
,p_plug_name=>'Module Level Cards'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>30
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p style="font-size: 30px; font-weight: 600;">&P7_MODULE_NAME. - Integration Analytics</p>',
'<p style="font-size: 16px;"><span id = ''display''></span></p>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(443698588690329)
,p_plug_name=>'Filter'
,p_parent_plug_id=>wwv_flow_imp.id(1783613998999605)
,p_region_css_classes=>'filter-bar'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.filter-bar {',
'  border-radius: 4px; ',
'  padding: 0px 14px;',
'}',
'.apex-item-group--popup-lov .apex-item-popup-lov:not(.apex-item-has-icon){',
'    height: 40px;',
'    border-radius: 8px 0 0 8px;',
'    border: 1px solid #cccccc;',
'}',
'.apex-item-datepicker {',
'    height: 40px;',
'    padding: 8px 12px;',
'    border-radius: 8px;',
'    border: 1px solid #cccccc;',
'    font-size: 14px;',
'}',
'.t-Form-itemWrapper .a-Button {',
'    padding: 8px 12px;',
'    border-radius: 0 8px 8px 0;',
'    border: 1px solid #cccccc;',
'    font-size: 14px;',
'}',
'/* .t-Button--gapTop {',
'    margin-block-start: 2rem!important;',
'    border-radius: 8px;',
'    background-color: #333333;',
'    color: #ffffff;',
'}',
'.t-Button-label {',
'    color: #ffffff;',
'}',
'.t-Button--hot {',
'    width: 250px;',
'    height: 40px;',
'    margin-left: 50px;',
'} */',
'</style>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1783806491999607)
,p_plug_name=>'Cards'
,p_parent_plug_id=>wwv_flow_imp.id(1783613998999605)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:margin-top-sm'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    interface_log.TOTAL_ROWS,',
'    interface_log.TOTAL_SUCCESS_ROWS,',
'    interface_log.TOTAL_FAILED_ROWS,',
'    ',
'    (CASE WHEN FLOOR(interface_file_log.AVG_RUNTIME_SEC / 3600) > 0 ',
'          THEN FLOOR(interface_file_log.AVG_RUNTIME_SEC / 3600) || ''h '' ',
'          ELSE '''' END) ||',
'    (CASE WHEN FLOOR(MOD(interface_file_log.AVG_RUNTIME_SEC, 3600) / 60) > 0 ',
'          THEN FLOOR(MOD(interface_file_log.AVG_RUNTIME_SEC, 3600) / 60) || ''m '' ',
'          ELSE '''' END) ||',
'    FLOOR(MOD(interface_file_log.AVG_RUNTIME_SEC, 60)) || ''s'' AS AVG_RUNTIME,',
'',
'    CASE ',
'        WHEN TO_DATE(:P7_START_DATE, ''dd/mm/yyyy'') = TRUNC(SYSDATE - 1) AND TO_DATE(:P7_END_DATE, ''dd/mm/yyyy'') = TRUNC(SYSDATE) THEN',
'            CASE',
'                WHEN yesterday_counts.TOTAL_ROWS = 0 THEN ''0% from yesterday''',
'                WHEN today_counts.TOTAL_ROWS = yesterday_counts.TOTAL_ROWS THEN ''0% from yesterday''',
'                WHEN today_counts.TOTAL_ROWS > yesterday_counts.TOTAL_ROWS THEN ',
'                    ''+'' || ROUND(((today_counts.TOTAL_ROWS - yesterday_counts.TOTAL_ROWS) / yesterday_counts.TOTAL_ROWS) * 100, 2) || ''% from yesterday''',
'                ELSE',
'                    ''-'' || ROUND(((yesterday_counts.TOTAL_ROWS - today_counts.TOTAL_ROWS) / yesterday_counts.TOTAL_ROWS) * 100, 2) || ''% from yesterday''',
'            END',
'        ELSE',
'            ''--''',
'    END AS TOTAL_ROWS_PCT,',
'',
'    CASE WHEN interface_log.TOTAL_SUCCESS_ROWS = 0 THEN ''0% success rate'' ',
'         ELSE ROUND((interface_log.TOTAL_SUCCESS_ROWS / interface_log.TOTAL_ROWS) * 100, 2) || ''% success rate'' END AS SUCCESS_RATE,',
'',
'    CASE ',
'        WHEN TO_DATE(:P7_START_DATE, ''dd/mm/yyyy'') = TRUNC(SYSDATE - 1)',
'         AND TO_DATE(:P7_END_DATE, ''dd/mm/yyyy'') = TRUNC(SYSDATE) THEN',
'            CASE ',
'                WHEN yesterday_runtime.AVG_RUNTIME_SEC IS NULL THEN ''~0s from yesterday'' ',
'                ',
'                WHEN today_runtime.AVG_RUNTIME_SEC > yesterday_runtime.AVG_RUNTIME_SEC THEN',
'                    ''~'' ||',
'                    CASE ',
'                        WHEN FLOOR((today_runtime.AVG_RUNTIME_SEC - yesterday_runtime.AVG_RUNTIME_SEC)/60) > 0 ',
'                        THEN FLOOR((today_runtime.AVG_RUNTIME_SEC - yesterday_runtime.AVG_RUNTIME_SEC)/60) || ''m '' ',
'                        ELSE '''' ',
'                    END ||',
unistr('                    FLOOR(MOD((today_runtime.AVG_RUNTIME_SEC - yesterday_runtime.AVG_RUNTIME_SEC),60)) || ''s \2191 from yesterday'''),
'                ',
'                WHEN today_runtime.AVG_RUNTIME_SEC < yesterday_runtime.AVG_RUNTIME_SEC THEN',
'                    ''~'' ||',
'                    CASE ',
'                        WHEN FLOOR((yesterday_runtime.AVG_RUNTIME_SEC - today_runtime.AVG_RUNTIME_SEC)/60) > 0 ',
'                        THEN FLOOR((yesterday_runtime.AVG_RUNTIME_SEC - today_runtime.AVG_RUNTIME_SEC)/60) || ''m '' ',
'                        ELSE '''' ',
'                    END ||',
unistr('                    FLOOR(MOD((yesterday_runtime.AVG_RUNTIME_SEC - today_runtime.AVG_RUNTIME_SEC),60)) || ''s \2193 from yesterday'''),
'                ',
'                ELSE ''~0s from yesterday''',
'            END',
'        ELSE',
'            ''--''',
'    END AS AVG_RUNTIME_PCT',
'',
'FROM',
'    (',
'        SELECT',
'            COUNT(*) AS TOTAL_ROWS,',
'            COUNT(CASE WHEN UPPER(STATUS) = ''SUCCESS'' THEN 1 END) AS TOTAL_SUCCESS_ROWS,',
'            COUNT(CASE WHEN UPPER(STATUS) = ''FAIL'' THEN 1 END) AS TOTAL_FAILED_ROWS',
'        FROM IR_INTERFACE_LOG',
'        WHERE MODULE_ID = :P7_MODULE_ID',
'          AND CREATION_DATE BETWEEN ',
'                TO_DATE(:P7_START_DATE, ''dd/mm/yyyy'') ',
'                AND TO_DATE(:P7_END_DATE, ''dd/mm/yyyy'')',
'          AND ( :P7_INTEGRATION IS NULL OR INTEGRATION_NAME = :P7_INTEGRATION )',
'    ) interface_log',
'CROSS JOIN',
'    (',
'         -- Avg runtime for the user-specified date range',
'        SELECT ',
'            ROUND(AVG(',
'                EXTRACT(DAY FROM (END_DATE - START_DATE)) * 86400 +',
'                EXTRACT(HOUR FROM (END_DATE - START_DATE)) * 3600 +',
'                EXTRACT(MINUTE FROM (END_DATE - START_DATE)) * 60+',
'                EXTRACT(SECOND FROM (END_DATE - START_DATE))',
'            ), 2) AS AVG_RUNTIME_SEC',
'        FROM IR_INTERFACE_FILE_LOG f',
'        WHERE f.INSTANCE_ID IN (',
'            SELECT INSTANCE_ID',
'            FROM IR_INTERFACE_LOG',
'            WHERE MODULE_ID = :P7_MODULE_ID',
'              AND CREATION_DATE BETWEEN ',
'                    TO_DATE(:P7_START_DATE, ''dd/mm/yyyy'') ',
'                    AND TO_DATE(:P7_END_DATE, ''dd/mm/yyyy'')',
'              AND ( :P7_INTEGRATION IS NULL OR INTEGRATION_NAME = :P7_INTEGRATION )',
'        )',
'          AND f.START_DATE IS NOT NULL',
'          AND f.END_DATE IS NOT NULL',
'    ) interface_file_log',
'CROSS JOIN',
'    (',
'        -- Today counts',
'        SELECT',
'            COUNT(*) AS TOTAL_ROWS',
'        FROM IR_INTERFACE_LOG',
'        WHERE MODULE_ID = :P7_MODULE_ID',
'          AND TRUNC(CREATION_DATE) = TRUNC(SYSDATE)',
'          AND ( :P7_INTEGRATION IS NULL OR INTEGRATION_NAME = :P7_INTEGRATION )',
'    ) today_counts',
'CROSS JOIN',
'    (',
'        -- Yesterday counts',
'        SELECT',
'            COUNT(*) AS TOTAL_ROWS',
'        FROM IR_INTERFACE_LOG',
'        WHERE MODULE_ID = :P7_MODULE_ID',
'          AND TRUNC(CREATION_DATE) = TRUNC(SYSDATE - 2)',
'          AND ( :P7_INTEGRATION IS NULL OR INTEGRATION_NAME = :P7_INTEGRATION )',
'    ) yesterday_counts',
'CROSS JOIN',
'    (',
'        -- Today avg runtime (seconds)',
'        SELECT ',
'            ROUND(AVG(',
'                EXTRACT(DAY FROM (END_DATE - START_DATE)) * 86400 +',
'                EXTRACT(HOUR FROM (END_DATE - START_DATE)) * 3600 +',
'                EXTRACT(MINUTE FROM (END_DATE - START_DATE)) * 60 +',
'                EXTRACT(SECOND FROM (END_DATE - START_DATE))',
'            ), 2) AS AVG_RUNTIME_SEC',
'        FROM IR_INTERFACE_FILE_LOG f',
'        WHERE f.INSTANCE_ID IN (',
'            SELECT INSTANCE_ID',
'            FROM IR_INTERFACE_LOG',
'            WHERE MODULE_ID = :P7_MODULE_ID',
'              AND TRUNC(CREATION_DATE) = TRUNC(SYSDATE)',
'              AND ( :P7_INTEGRATION IS NULL OR INTEGRATION_NAME = :P7_INTEGRATION )',
'        )',
'          AND f.START_DATE IS NOT NULL',
'          AND f.END_DATE IS NOT NULL',
'    ) today_runtime',
'CROSS JOIN',
'    (',
'        -- Yesterday avg runtime (seconds)',
'        SELECT ',
'            ROUND(AVG(',
'                EXTRACT(DAY FROM (END_DATE - START_DATE)) * 86400 +',
'                EXTRACT(HOUR FROM (END_DATE - START_DATE)) * 3600 +',
'                EXTRACT(MINUTE FROM (END_DATE - START_DATE)) * 60 +',
'                EXTRACT(SECOND FROM (END_DATE - START_DATE))',
'            ), 2) AS AVG_RUNTIME_SEC',
'        FROM IR_INTERFACE_FILE_LOG f',
'        WHERE f.INSTANCE_ID IN (',
'            SELECT INSTANCE_ID',
'            FROM IR_INTERFACE_LOG',
'            WHERE MODULE_ID = :P7_MODULE_ID',
'              AND TRUNC(CREATION_DATE) = TRUNC(SYSDATE - 2)',
'              AND ( :P7_INTEGRATION IS NULL OR INTEGRATION_NAME = :P7_INTEGRATION )',
'        )',
'          AND f.START_DATE IS NOT NULL',
'          AND f.END_DATE IS NOT NULL',
'    ) yesterday_runtime;',
'',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P7_START_DATE,P7_END_DATE,P7_MODULE_ID,P7_INTEGRATION'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(1783894188999608)
,p_region_id=>wwv_flow_imp.id(1783806491999607)
,p_layout_type=>'ROW'
,p_title_adv_formatting=>false
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.dashboard-cards {',
'  display: flex;',
'  gap: 26px; /*spacing between cards */',
'  overflow-x: auto;',
'}',
'',
'.card {',
'  position: relative;',
'  background-color: rgba(204, 204, 204, 0.5);',
'  border-radius: 12px;',
'  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);',
'  padding: 16px 20px;',
'  width: 330px;',
'  display: flex;',
'  flex-direction: column;',
'  justify-content: space-between;',
'  flex-shrink: 0;',
'}',
'',
'.card-header {',
'  display: flex;',
'  justify-content: space-between;',
'  align-items: flex-start;',
'}',
'',
'.card-icon {',
'  background-color: #333333;',
'  color: white;',
'  border-radius: 8px;',
'  padding: 10px;',
'  font-size: 20px;',
'  display: flex;',
'  align-items: center;',
'  justify-content: center;',
'  width: 40px;',
'  height: 40px;',
'}',
'',
'.card-info {',
'  text-align: right;',
'  padding-bottom: 20px;',
'}',
'',
'.card-info h3 {',
'  margin: 0;',
'  font-size: 22px;',
'  font-weight: bold;',
'}',
'',
'.card-info p {',
'  margin: 0;',
'  font-size: 14px;',
'}',
'',
'.card-sub {',
'  position: absolute;',
'  bottom: 10px;',
'  left: 20px;',
'  font-size: 13px;',
'}',
'',
'</style>',
'',
'  <div class="dashboard-cards">',
'',
'    <div class="card">',
'        <div class="card-header">',
'            <div class="card-icon">',
'                <span class="fa fa-play-circle-o"></span>',
'            </div>',
'            <div class="card-info">',
'                <h3>&TOTAL_ROWS.</h3>',
'                <p>Total Runs</p>',
'            </div>',
'        </div>',
'            <span class="card-sub">&TOTAL_ROWS_PCT.</span>',
'    </div>',
'',
'    <div class="card">',
'        <div class="card-header">',
'            <div class="card-icon">',
'                <span class="fa fa-check-circle-o"></span>',
'            </div>',
'            <div class="card-info">',
'                <h3>&TOTAL_SUCCESS_ROWS.</h3>',
'                <p>Successful</p>',
'            </div>',
'        </div>',
'  <div class="card-sub">&SUCCESS_RATE.</div>',
'</div>',
'',
'',
'    <div class="card">',
'    <div class="card-header">',
'        <div class="card-icon">',
'                <span class="fa fa-times-circle-o"></span>',
'            </div>',
'        <div class="card-info">',
'          <h3>&TOTAL_FAILED_ROWS.</h3>',
'          <p>Failed</p>',
'        </div>',
'      </div>',
'      <div class="card-right">',
'        <span class="card-sub">Requires attention</span>',
'      </div>',
'    </div>',
'',
'     <div class="card">',
'    <div class="card-header">',
'        <div class="card-icon">',
'                <span class="fa fa-clock-o"></span>',
'            </div>',
'        <div class="card-info">',
'          <h3>&AVG_RUNTIME.</h3>',
'          <p>Avg Runtime</p>',
'        </div>',
'      </div>',
'      <div class="card-right">',
'        <span class="card-sub">&AVG_RUNTIME_PCT.</span>',
'      </div>',
'    </div>',
'',
'</div>',
''))
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1784263506999612)
,p_plug_name=>'Integration Details'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc:margin-top-md'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    l.INTEGRATION_NAME,',
'    COUNT(*) AS NO_OF_FILE_RECEIVED,',
'    SUM(NVL(f.SRC_FILE_ROW_COUNT,0)) AS SRC_FILE_ROW_COUNT,',
'    SUM(NVL(f.INTERFACE_LOAD_ROW_COUNT,0)) AS INTERFACE_LOAD_ROW_COUNT,',
'    SUM(NVL(f.VAL_FAILED_ROW_COUNT, 0)) AS VAL_FAILED_ROW_COUNT,',
'    SUM(NVL(f.TF_FAILED_ROW_COUNT, 0)) AS TF_FAILED_ROW_COUNT,',
'    SUM(NVL(f.IMPORT_FAIL_ROW_COUNT, 0)) AS IMPORT_FAIL_ROW_COUNT,',
'    SUM(NVL(f.LOAD_FAIL_ROW_COUNT, 0)) AS LOAD_FAIL_ROW_COUNT,',
'    SUM(NVL(f.VAL_FAILED_ROW_COUNT, 0) + NVL(f.TF_FAILED_ROW_COUNT, 0) + ',
'     NVL(f.IMPORT_FAIL_ROW_COUNT, 0) + NVL(f.LOAD_FAIL_ROW_COUNT, 0)) AS TOTAL_FAILED_RECORDS',
'FROM IR_INTERFACE_LOG l',
'JOIN IR_INTERFACE_FILE_LOG f ',
'    ON l.INSTANCE_ID = f.INSTANCE_ID',
'WHERE l.MODULE_ID = :P7_MODULE_ID',
'  AND l.CREATION_DATE BETWEEN ',
'                    TO_DATE(:P7_START_DATE, ''dd/mm/yyyy'') ',
'                    AND TO_DATE(:P7_END_DATE, ''dd/mm/yyyy'')',
'  AND ( :P7_INTEGRATION IS NULL OR l.INTEGRATION_NAME = :P7_INTEGRATION )',
'GROUP BY ',
'    l.INTEGRATION_NAME;',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P7_MODULE_ID,P7_INTEGRATION,P7_START_DATE,P7_END_DATE'
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
 p_id=>wwv_flow_imp.id(1786626976999635)
,p_name=>'INTEGRATION_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INTEGRATION_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Integration Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:16:P16_INTEGRATION_NAME,P16_MODULE_ID,P16_MODULE_NAME,P16_START_DATE,P16_END_DATE:&INTEGRATION_NAME.,&P7_MODULE_ID.,&P7_MODULE_NAME.,&P7_START_DATE.,&P7_END_DATE.'
,p_link_text=>'&INTEGRATION_NAME.'
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
 p_id=>wwv_flow_imp.id(53466389684447045)
,p_name=>'NO_OF_FILE_RECEIVED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NO_OF_FILE_RECEIVED'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No Of File Received'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_imp.id(53466777704447049)
,p_name=>'SRC_FILE_ROW_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SRC_FILE_ROW_COUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total No Of Records'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(53466863847447050)
,p_name=>'INTERFACE_LOAD_ROW_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INTERFACE_LOAD_ROW_COUNT'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Success Records'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(54122653083164101)
,p_name=>'TOTAL_FAILED_RECORDS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL_FAILED_RECORDS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Failed Records'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::P2_LOAD_FAIL_ROW_COUNT,P2_IMPORT_FAIL_ROW_COUNT,P2_TF_FAILED_ROW_COUNT,P2_VAL_FAILED_ROW_COUNT:&LOAD_FAIL_ROW_COUNT.,&IMPORT_FAIL_ROW_COUNT.,&TF_FAILED_ROW_COUNT.,&VAL_FAILED_ROW_COUNT.'
,p_link_text=>'&TOTAL_FAILED_RECORDS.'
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
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(55494969457619808)
,p_name=>'VAL_FAILED_ROW_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VAL_FAILED_ROW_COUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(55495070341619809)
,p_name=>'TF_FAILED_ROW_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TF_FAILED_ROW_COUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(60270981780016416)
,p_name=>'IMPORT_FAIL_ROW_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMPORT_FAIL_ROW_COUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(60271027309016417)
,p_name=>'LOAD_FAIL_ROW_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOAD_FAIL_ROW_COUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(1784364655999613)
,p_internal_uid=>53462712120447009
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
 p_id=>wwv_flow_imp.id(1845481890913323)
,p_interactive_grid_id=>wwv_flow_imp.id(1784364655999613)
,p_static_id=>'535239'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(1845751418913323)
,p_report_id=>wwv_flow_imp.id(1845481890913323)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1865751236924789)
,p_view_id=>wwv_flow_imp.id(1845751418913323)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(1786626976999635)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(54103637073622003)
,p_view_id=>wwv_flow_imp.id(1845751418913323)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(53466389684447045)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(54128276629168581)
,p_view_id=>wwv_flow_imp.id(1845751418913323)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(53466777704447049)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(54129151970168582)
,p_view_id=>wwv_flow_imp.id(1845751418913323)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(53466863847447050)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(54130073399168583)
,p_view_id=>wwv_flow_imp.id(1845751418913323)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(54122653083164101)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(55504711042668450)
,p_view_id=>wwv_flow_imp.id(1845751418913323)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(55494969457619808)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(55505649507668451)
,p_view_id=>wwv_flow_imp.id(1845751418913323)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(55495070341619809)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(60693284718930264)
,p_view_id=>wwv_flow_imp.id(1845751418913323)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(60270981780016416)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(60694138460930266)
,p_view_id=>wwv_flow_imp.id(1845751418913323)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(60271027309016417)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(143772503512893)
,p_name=>'P7_DESCRIPTION'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(575621786733489)
,p_name=>'P7_INTEGRATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(443698588690329)
,p_prompt=>'<label style="font-weight: 500;font-size: 14px;">Integration</label>'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'    l.INTEGRATION_NAME',
'FROM IR_INTERFACE_LOG l',
'WHERE l.MODULE_ID = :P7_MODULE_ID;',
''))
,p_cSize=>45
,p_colspan=>3
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(575899165736242)
,p_name=>'P7_START_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(443698588690329)
,p_item_default=>'to_date(SYSDATE-1,''DD-MM-YYYY'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<label style="font-weight: 500;font-size: 13.5px;">Start Date</label>'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>35
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(576221401740194)
,p_name=>'P7_END_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(443698588690329)
,p_item_default=>'to_date(SYSDATE,''DD-MM-YYYY'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<label style="font-weight: 500;font-size: 13.5px;">End Date</label>'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>35
,p_begin_on_new_line=>'N'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1784126953999610)
,p_name=>'P7_MODULE_NAME'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53465906225447041)
,p_name=>'P7_MODULE_ID'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(443790912690330)
,p_name=>'Refresh Regions'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_INTEGRATION,P7_START_DATE,P7_END_DATE'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(143306610512888)
,p_event_id=>wwv_flow_imp.id(443790912690330)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DESCRIPTION'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var startDateStr = apex.item(''P7_START_DATE'').getValue(),',
'    endDateStr = apex.item(''P7_END_DATE'').getValue(),',
'    format = d => (''0'' + d.getDate()).slice(-2) + ''-'' + (''0'' + (d.getMonth() + 1)).slice(-2) + ''-'' + d.getFullYear(),',
'    todayStr = format(new Date()),',
'    yesterdayStr = format(new Date(new Date().setDate(new Date().getDate() - 1)));',
'',
'if (startDateStr === yesterdayStr && endDateStr === todayStr) {',
'    apex.item(''P7_DESCRIPTION'').setValue(''Detailed view of all integration runs in the last 24 hours'');',
'    $("#display").text($v("P7_DESCRIPTION"));',
'} else {',
'    apex.item(''P7_DESCRIPTION'').setValue(',
'        ''Detailed view of all integration runs from '' + startDateStr + '' to '' + endDateStr',
'    );',
'    $("#display").text($v("P7_DESCRIPTION"));',
'}',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(144712583512902)
,p_event_id=>wwv_flow_imp.id(443790912690330)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1783613998999605)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(145425224512909)
,p_event_id=>wwv_flow_imp.id(443790912690330)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1783806491999607)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(443926533690331)
,p_event_id=>wwv_flow_imp.id(443790912690330)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1784263506999612)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(144155081512897)
,p_name=>'Set Title Desc'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(143694325512892)
,p_event_id=>wwv_flow_imp.id(144155081512897)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DESCRIPTION'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P7_DESCRIPTION'').setValue(''Detailed view of all integration runs in the last 24 hours'');',
'$("#display").text($v("P7_DESCRIPTION"));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(143559477512891)
,p_event_id=>wwv_flow_imp.id(144155081512897)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1784263506999612)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
