prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Reconciliation Dashboard'
,p_alias=>'RECONCILIATION-DASHBOARD'
,p_step_title=>'&P16_INTEGRATION_NAME.'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.error_distribution_chart {',
'    background-color: rgba(204,204,204);',
'}',
'.t-Region-headerItems--buttons, .t-Region-headerItems--title {',
'    align-items: start;',
'    display: flex;',
'    flex-basis: auto;',
'    padding-inline-end: var(--ut-region-header-padding-x,16.5rem);',
'     margin-block-start: -0.8rem;',
'    margin-block-end: -1rem;',
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
 p_id=>wwv_flow_imp.id(55659774835685976)
,p_plug_name=>'Reconciliation Dashboard'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>50
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display: flex; align-items: center; gap: 15px; margin-bottom: 10px;">',
'  <h2 style="margin: 0; font-size: 30px; font-weight: 600;">',
'    &P16_INTEGRATION_NAME.',
'  </h2>',
'  <!-- <button ',
'    id="last24hr_btn"',
'    class="t-Button t-Button--primary t-Button--small" ',
'    style="background-color: rgba(204,204,204,0.3); ',
'            color: rgba(153,153,153); ',
'            font-family: EYInterstate; ',
'            font-size: 12px; ',
'            font-style: normal; ',
'            font-weight: 600; ',
'            border-radius: 20px;',
'            cursor: default;',
'            pointer-events: none;',
'            border: 1px solid rgba(204,204,204);"',
'  >Last 24 Hours</button> -->',
'</div>',
'',
'<p style="font-size: 16px;">Comprehensive view of all execution details and outcomes</p>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(187955568068731)
,p_plug_name=>'<h3>Error Distribution</h3>'
,p_parent_plug_id=>wwv_flow_imp.id(55659774835685976)
,p_region_css_classes=>'error_distribution_chart'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(187870018068730)
,p_region_id=>wwv_flow_imp.id(187955568068731)
,p_chart_type=>'pie'
,p_height=>'245'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_legend_font_size=>'12'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (options) {',
'  options.dataFilter = function (data) {',
'    var colors = ["#ffe600", "#333333", "#ffffff", "#999999"];',
'    if (data && Array.isArray(data.series)) {',
'      data.series.forEach(function (s, idx) {',
'        if (s && idx < colors.length) {',
'          s.color = colors[idx];',
'        }',
'      });',
'    }',
'    return data;',
'  };',
'  return options;',
'}'))
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(187793052068729)
,p_chart_id=>wwv_flow_imp.id(187870018068730)
,p_seq=>10
,p_name=>'Pie Chart'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH SUMS AS (',
'  SELECT',
'    SUM(NVL(F.VAL_FAILED_ROW_COUNT, 0))  AS VAL_FAILED_ROW_COUNT,',
'    SUM(NVL(F.TF_FAILED_ROW_COUNT, 0))   AS TF_FAILED_ROW_COUNT,',
'    SUM(NVL(F.IMPORT_FAIL_ROW_COUNT, 0)) AS IMPORT_FAIL_ROW_COUNT,',
'    SUM(NVL(F.LOAD_FAIL_ROW_COUNT, 0))   AS LOAD_FAIL_ROW_COUNT',
'  FROM IR_INTERFACE_LOG L',
'  JOIN IR_INTERFACE_FILE_LOG F',
'    ON F.INSTANCE_ID = L.INSTANCE_ID',
'  WHERE L.MODULE_ID        = :P16_MODULE_ID',
'    AND L.INTEGRATION_NAME = :P16_INTEGRATION_NAME',
'    AND ( :P16_SOURCE IS NULL OR F.SOURCE = :P16_SOURCE )',
'    AND (',
'          (:P16_MODULE_ID IN (1, 3) AND F.BUSINESS_UNIT = :P16_BUSINESS_UNIT)',
'       OR (:P16_MODULE_ID = 2      AND F.LEDGER_NAME   = :P16_LEDGER)',
'        )',
'    AND L.CREATION_DATE >= TO_DATE(:P16_START_DATE, ''DD/MM/YYYY'')',
'    AND L.CREATION_DATE <=  TO_DATE(:P16_END_DATE,   ''DD/MM/YYYY'')',
')',
'SELECT FAILURE_TYPE, FAILED_COUNT',
'FROM SUMS',
'UNPIVOT (',
'  FAILED_COUNT FOR FAILURE_TYPE IN (',
'    VAL_FAILED_ROW_COUNT  AS ''Validation'',',
'    TF_FAILED_ROW_COUNT   AS ''Transformation'',',
'    IMPORT_FAIL_ROW_COUNT AS ''Import'',',
'    LOAD_FAIL_ROW_COUNT   AS ''Load''',
'  )',
')',
'WHERE FAILED_COUNT > 0',
';'))
,p_ajax_items_to_submit=>'P16_SOURCE,P16_MODULE_ID,P16_START_DATE,P16_END_DATE,P16_INTEGRATION_NAME,P16_LEDGER,P16_BUSINESS_UNIT'
,p_items_value_column_name=>'FAILED_COUNT'
,p_items_label_column_name=>'FAILURE_TYPE'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'VALUE'
,p_items_label_css_classes=>'failedChart'
,p_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:CR,17:P17_FROM_DATE,P17_TO_DATE,P17_MODULE_ID,P17_ACTIVE_TAB,P17_INTEGRATION_NAME:&P16_START_DATE.,&P16_END_DATE.,&P16_MODULE_ID.,&FAILURE_TYPE.,&P16_INTEGRATION_NAME.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(188548040068736)
,p_plug_name=>'Import Summary'
,p_parent_plug_id=>wwv_flow_imp.id(55659774835685976)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:margin-top-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>'Select 1 from dual;'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(188406604068735)
,p_region_id=>wwv_flow_imp.id(188548040068736)
,p_layout_type=>'FLOAT'
,p_title_adv_formatting=>false
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.summary-card-body {',
'    display: flex;',
'    flex-direction: column;',
'    padding: 15px 20px; ',
'    overflow-x: auto;',
'    width: 670px;',
'}',
'.summary-metric-container {',
'    padding: 10px 0;',
'}',
'h3 {',
'    margin-top: 5px;',
'}',
'.summary-label {',
'    font-size: 14px;',
'    font-weight: 400;',
'    margin: 0 0 2px 0;',
'}',
'.summary-value-row {',
'    display: flex;',
'    align-items: center;',
'    justify-content: space-between;',
'}',
'.summary-value {',
'    font-size: 25px;',
'    font-weight: 600; ',
'}',
'.metric-separator {',
'    border-top: 1.5px dashed #999999;',
'    margin: 10px 0; ',
'}',
'.summary-icon-box {',
'    width: 40px;',
'    height: 40px;',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    border-radius: 50%; ',
'    background-color: #333333;',
'    color: white;',
'    font-size: 20px;',
'}',
'</style>',
'',
'<h3>&P7_MODULE_NAME. - Import Summary</h3>',
'',
'<div class="summary-card-body">',
'    <div class="summary-metric-container">',
'        <p class="summary-label">&P16_TITLE.</p>',
'        <div class="summary-value-row">',
'            <span class="summary-value">&P16_TOTAL_COUNT.</span>',
'            <div class="summary-icon-box">',
'                <span class="fa fa-file-text-o"></span>',
'            </div>',
'            ',
'        </div>',
'    </div>',
'    ',
'    <hr class="metric-separator">',
'    ',
'    <div class="summary-metric-container">',
'        <p class="summary-label">Total Amount Imported</p>',
'        <div class="summary-value-row">',
'            <span class="summary-value failed-value">&P16_CURRENCY. &P16_TOTAL_AMT.</span>',
'            <div class="summary-icon-box">',
'                <span class="fa fa-money-bag"></span>',
'            </div>',
'        </div>',
'    </div>',
'</div>'))
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(189238991068743)
,p_plug_name=>'Filter'
,p_parent_plug_id=>wwv_flow_imp.id(55659774835685976)
,p_region_css_classes=>'filter-bar'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
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
'    margin-block-start: 2.6rem!important;',
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
'</style>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(190965595068761)
,p_plug_name=>'Cards'
,p_parent_plug_id=>wwv_flow_imp.id(55659774835685976)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:margin-top-md'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    main_data.TOTAL_INSTANCES,',
'    main_data.TOTAL_SUCCESS_ROWS,',
'    main_data.TOTAL_FAILED_ROWS,',
'',
'    (CASE WHEN FLOOR(runtime_data.AVG_RUNTIME_SEC / 3600) > 0 ',
'          THEN FLOOR(runtime_data.AVG_RUNTIME_SEC / 3600) || ''h '' ',
'          ELSE '''' END) ||',
'    (CASE WHEN FLOOR(MOD(runtime_data.AVG_RUNTIME_SEC, 3600) / 60) > 0 ',
'          THEN FLOOR(MOD(runtime_data.AVG_RUNTIME_SEC, 3600) / 60) || ''m '' ',
'          ELSE '''' END) ||',
'    FLOOR(MOD(runtime_data.AVG_RUNTIME_SEC, 60)) || ''s'' AS AVG_RUNTIME,',
'',
'    CASE ',
'        WHEN TO_DATE(:P16_START_DATE, ''dd/mm/yyyy'') = TRUNC(SYSDATE - 1)',
'         AND TO_DATE(:P16_END_DATE, ''dd/mm/yyyy'') = TRUNC(SYSDATE) THEN',
'            CASE',
'                WHEN yesterday_counts.TOTAL_INSTANCES = 0 THEN ''0% from yesterday''',
'                WHEN today_counts.TOTAL_INSTANCES = yesterday_counts.TOTAL_INSTANCES THEN ''0% from yesterday''',
'                WHEN today_counts.TOTAL_INSTANCES > yesterday_counts.TOTAL_INSTANCES THEN',
'                    ''+'' || ROUND(((today_counts.TOTAL_INSTANCES - yesterday_counts.TOTAL_INSTANCES) / yesterday_counts.TOTAL_INSTANCES) * 100, 2) ',
'                    || ''% from yesterday''',
'                ELSE',
'                    ''-'' || ROUND(((yesterday_counts.TOTAL_INSTANCES - today_counts.TOTAL_INSTANCES) / yesterday_counts.TOTAL_INSTANCES) * 100, 2) ',
'                    || ''% from yesterday''',
'            END',
'        ELSE ''--''',
'    END AS TOTAL_INSTANCE_PCT,',
'',
'    CASE ',
'        WHEN main_data.TOTAL_INSTANCES = 0 THEN ''0% success rate''',
'        ELSE ROUND((main_data.TOTAL_SUCCESS_ROWS / main_data.TOTAL_INSTANCES) * 100, 2) || ''% success rate''',
'    END AS SUCCESS_RATE,',
'',
'    CASE ',
'        WHEN TRUNC(TO_DATE(:P16_START_DATE, ''dd/mm/yyyy'')) = TRUNC(SYSDATE - 1)',
'         AND TRUNC(TO_DATE(:P16_END_DATE, ''dd/mm/yyyy'')) = TRUNC(SYSDATE) THEN',
'            CASE ',
'                WHEN yesterday_runtime.AVG_RUNTIME_SEC IS NULL THEN ''~0s from yesterday''',
'                ',
'                WHEN today_runtime.AVG_RUNTIME_SEC > yesterday_runtime.AVG_RUNTIME_SEC THEN',
'                    ''~'' ||',
'                    CASE ',
'                        WHEN FLOOR((today_runtime.AVG_RUNTIME_SEC - yesterday_runtime.AVG_RUNTIME_SEC)/60) > 0 ',
'                        THEN FLOOR((today_runtime.AVG_RUNTIME_SEC - yesterday_runtime.AVG_RUNTIME_SEC)/60) || ''m ''',
'                        ELSE ''''',
'                    END ||',
unistr('                    FLOOR(MOD((today_runtime.AVG_RUNTIME_SEC - yesterday_runtime.AVG_RUNTIME_SEC), 60)) || ''s \2191 from yesterday'''),
'                ',
'                WHEN today_runtime.AVG_RUNTIME_SEC < yesterday_runtime.AVG_RUNTIME_SEC THEN',
'                    ''~'' ||',
'                    CASE ',
'                        WHEN FLOOR((yesterday_runtime.AVG_RUNTIME_SEC - today_runtime.AVG_RUNTIME_SEC)/60) > 0 ',
'                        THEN FLOOR((yesterday_runtime.AVG_RUNTIME_SEC - today_runtime.AVG_RUNTIME_SEC)/60) || ''m ''',
'                        ELSE ''''',
'                    END ||',
unistr('                    FLOOR(MOD((yesterday_runtime.AVG_RUNTIME_SEC - today_runtime.AVG_RUNTIME_SEC), 60)) || ''s \2193 from yesterday'''),
'                ',
'                ELSE ''~0s from yesterday''',
'            END',
'        ELSE',
'            ''--''',
'    END AS AVG_RUNTIME_PCT',
'',
'FROM (',
'		SELECT',
'			COUNT(DISTINCT l.INSTANCE_ID) AS TOTAL_INSTANCES,',
'			COUNT(DISTINCT CASE WHEN l.STATUS = ''Success'' THEN l.INSTANCE_ID END) AS TOTAL_SUCCESS_ROWS,',
'			COUNT(DISTINCT CASE WHEN l.STATUS = ''Fail'' THEN l.INSTANCE_ID END) AS TOTAL_FAILED_ROWS',
'		FROM IR_INTERFACE_LOG l',
'		INNER JOIN IR_INTERFACE_FILE_LOG f ',
'			ON f.INSTANCE_ID = l.INSTANCE_ID',
'		   AND ( :P16_SOURCE IS NULL OR f.SOURCE = :P16_SOURCE )',
'           AND (',
'               ( :P16_MODULE_ID IN (1, 3) AND f.BUSINESS_UNIT = :P16_BUSINESS_UNIT )',
'            OR ( :P16_MODULE_ID = 2       AND f.LEDGER_NAME   = :P16_LEDGER )',
'            )',
'		WHERE l.MODULE_ID = :P16_MODULE_ID',
'		  AND l.INTEGRATION_NAME = :P16_INTEGRATION_NAME',
'		  AND l.CREATION_DATE BETWEEN ',
'				TO_DATE(:P16_START_DATE, ''dd/mm/yyyy'') ',
'				AND TO_DATE(:P16_END_DATE, ''dd/mm/yyyy'')',
'	) main_data',
'CROSS JOIN ',
'    (',
'    SELECT ',
'        ROUND(AVG(',
'            EXTRACT(DAY FROM (END_DATE - START_DATE)) * 86400 +',
'            EXTRACT(HOUR FROM (END_DATE - START_DATE)) * 3600 +',
'            EXTRACT(MINUTE FROM (END_DATE - START_DATE)) * 60 +',
'            EXTRACT(SECOND FROM (END_DATE - START_DATE))',
'        ), 2) AS AVG_RUNTIME_SEC',
'    FROM IR_INTERFACE_FILE_LOG f',
'    WHERE f.INSTANCE_ID IN (',
'            SELECT INSTANCE_ID',
'            FROM IR_INTERFACE_LOG',
'            WHERE MODULE_ID = :P16_MODULE_ID',
'              AND INTEGRATION_NAME = :P16_INTEGRATION_NAME',
'              AND CREATION_DATE BETWEEN ',
'                    TO_DATE(:P16_START_DATE, ''dd/mm/yyyy'') ',
'                    AND TO_DATE(:P16_END_DATE, ''dd/mm/yyyy'')',
'      )',
'      AND f.START_DATE IS NOT NULL',
'      AND f.END_DATE IS NOT NULL',
'      AND ( :P16_SOURCE IS NULL OR f.SOURCE = :P16_SOURCE )',
'      AND (',
'           ( :P16_MODULE_ID IN (1, 3) AND f.BUSINESS_UNIT = :P16_BUSINESS_UNIT )',
'        OR ( :P16_MODULE_ID = 2       AND f.LEDGER_NAME   = :P16_LEDGER )',
'        )',
') runtime_data',
'CROSS JOIN ',
'	(',
'		SELECT COUNT(DISTINCT l.INSTANCE_ID) AS TOTAL_INSTANCES',
'		FROM IR_INTERFACE_LOG l',
'        INNER JOIN IR_INTERFACE_FILE_LOG f ',
'			ON f.INSTANCE_ID = l.INSTANCE_ID',
'		   AND ( :P16_SOURCE IS NULL OR f.SOURCE = :P16_SOURCE )',
'           AND (',
'               ( :P16_MODULE_ID IN (1, 3) AND f.BUSINESS_UNIT = :P16_BUSINESS_UNIT )',
'            OR ( :P16_MODULE_ID = 2       AND f.LEDGER_NAME   = :P16_LEDGER )',
'            )',
'		WHERE l.MODULE_ID = :P16_MODULE_ID',
'		  AND TRUNC(l.CREATION_DATE) = TRUNC(SYSDATE)',
'		  AND l.INTEGRATION_NAME = :P16_INTEGRATION_NAME',
'	) today_counts',
'CROSS JOIN ',
'	(',
'		SELECT COUNT(DISTINCT l.INSTANCE_ID) AS TOTAL_INSTANCES',
'		FROM IR_INTERFACE_LOG l',
'        INNER JOIN IR_INTERFACE_FILE_LOG f ',
'			ON f.INSTANCE_ID = l.INSTANCE_ID',
'		   AND ( :P16_SOURCE IS NULL OR f.SOURCE = :P16_SOURCE )',
'           AND (',
'               ( :P16_MODULE_ID IN (1, 3) AND f.BUSINESS_UNIT = :P16_BUSINESS_UNIT )',
'            OR ( :P16_MODULE_ID = 2       AND f.LEDGER_NAME   = :P16_LEDGER )',
'            )',
'		WHERE l.MODULE_ID = :P16_MODULE_ID',
'		  AND TRUNC(l.CREATION_DATE) = TRUNC(SYSDATE - 2)',
'		  AND l.INTEGRATION_NAME = :P16_INTEGRATION_NAME',
'	) yesterday_counts',
'CROSS JOIN ',
'    (',
'    SELECT ',
'        ROUND(AVG(',
'            EXTRACT(DAY FROM (END_DATE - START_DATE)) * 86400 +',
'            EXTRACT(HOUR FROM (END_DATE - START_DATE)) * 3600 +',
'            EXTRACT(MINUTE FROM (END_DATE - START_DATE)) * 60 +',
'            EXTRACT(SECOND FROM (END_DATE - START_DATE))',
'        ), 2) AS AVG_RUNTIME_SEC',
'    FROM IR_INTERFACE_FILE_LOG f',
'    WHERE f.INSTANCE_ID IN (',
'            SELECT INSTANCE_ID',
'            FROM IR_INTERFACE_LOG',
'            WHERE MODULE_ID = :P16_MODULE_ID',
'              AND INTEGRATION_NAME = :P16_INTEGRATION_NAME',
'              AND TRUNC(CREATION_DATE) = TRUNC(SYSDATE)',
'      )',
'      AND f.START_DATE IS NOT NULL',
'      AND f.END_DATE IS NOT NULL',
'      AND ( :P16_SOURCE IS NULL OR f.SOURCE = :P16_SOURCE )',
'      AND (',
'           ( :P16_MODULE_ID IN (1, 3) AND f.BUSINESS_UNIT = :P16_BUSINESS_UNIT )',
'        OR ( :P16_MODULE_ID = 2       AND f.LEDGER_NAME   = :P16_LEDGER )',
'        )',
') today_runtime',
'CROSS JOIN ',
'    (',
'    SELECT ',
'        ROUND(AVG(',
'            EXTRACT(DAY FROM (END_DATE - START_DATE)) * 86400 +',
'            EXTRACT(HOUR FROM (END_DATE - START_DATE)) * 3600 +',
'            EXTRACT(MINUTE FROM (END_DATE - START_DATE)) * 60 +',
'            EXTRACT(SECOND FROM (END_DATE - START_DATE))',
'        ), 2) AS AVG_RUNTIME_SEC',
'    FROM IR_INTERFACE_FILE_LOG f',
'    WHERE f.INSTANCE_ID IN (',
'            SELECT INSTANCE_ID',
'            FROM IR_INTERFACE_LOG',
'            WHERE MODULE_ID = :P16_MODULE_ID',
'              AND INTEGRATION_NAME = :P16_INTEGRATION_NAME',
'              AND TRUNC(CREATION_DATE) = TRUNC(SYSDATE - 2)',
'      )',
'      AND f.START_DATE IS NOT NULL',
'      AND f.END_DATE IS NOT NULL',
'      AND ( :P16_SOURCE IS NULL OR f.SOURCE = :P16_SOURCE )',
'      AND (',
'           ( :P16_MODULE_ID IN (1, 3) AND f.BUSINESS_UNIT = :P16_BUSINESS_UNIT )',
'        OR ( :P16_MODULE_ID = 2       AND f.LEDGER_NAME   = :P16_LEDGER )',
'        )',
') yesterday_runtime;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P16_MODULE_ID,P16_SOURCE,P16_START_DATE,P16_END_DATE,P16_INTEGRATION_NAME,P16_LEDGER'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(190693944068758)
,p_region_id=>wwv_flow_imp.id(190965595068761)
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
'  overflow-x: auto;',
'}',
'',
'.card-header {',
'  display: flex;',
'  align-items: center;',
'  justify-content: space-between;',
'}',
'',
'.card-icon {',
'  background-color: #333333;',
'  color: white;',
'  border-radius: 50%;',
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
'  text-align: left;',
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
'  margin: 5px 0 0 0;',
'  font-size: 14px;',
'}',
'.card-sub {',
'  position: absolute;',
'  bottom: 10px;',
'  left: 20px;',
'  font-size: 13px;',
'}',
'</style>',
'',
'<div class="dashboard-cards">',
'  ',
'  <div class="card">',
'    <div class="card-header">',
'            <div class="card-info">',
'                <p>Total Instances</p>',
'                <h3>&TOTAL_INSTANCES.</h3>',
'            </div>',
'            <div class="card-icon">',
'                <span class="fa fa-tasks"></span>',
'            </div>',
'        </div>',
'            <span class="card-sub">&TOTAL_INSTANCE_PCT.</span>',
'  </div>',
'',
'  <div class="card">',
'    <div class="card-header">',
'            <div class="card-info">',
'                <p>Successful</p>',
'                <h3>&TOTAL_SUCCESS_ROWS.</h3>',
'            </div>',
'            <div class="card-icon">',
'                <span class="fa fa-check-circle-o"></span>',
'            </div>',
'        </div>',
'            <span class="card-sub">&SUCCESS_RATE.</span>',
'  </div>',
'',
'  <div class="card">',
'    <div class="card-header">',
'            <div class="card-info">',
'                <p>Failed</p>',
'                <h3>&TOTAL_FAILED_ROWS.</h3>',
'            </div>',
'            <div class="card-icon">',
'                <span class="fa fa-warning"></span>',
'            </div>',
'        </div>',
'            <span class="card-sub">Requires attention</span>',
'  </div>',
'',
'  <div class="card">',
'    <div class="card-header">',
'            <div class="card-info">',
'                <p>Avg Runtime</p>',
'                <h3>&AVG_RUNTIME.</h3>',
'            </div>',
'            <div class="card-icon">',
'                <span class="fa fa-clock-o"></span>',
'            </div>',
'        </div>',
'            <span class="card-sub">&AVG_RUNTIME_PCT.</span>',
'  </div>',
'',
'</div>',
''))
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(144776543512903)
,p_name=>'P16_MODULE_NAME'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(145173127512907)
,p_name=>'P16_MODULE_ID'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(188628531068737)
,p_name=>'P16_END_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(189238991068743)
,p_prompt=>'<label style="font-weight: 500;font-size: 14px;">End Date</label>'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>35
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
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
 p_id=>wwv_flow_imp.id(188894584068740)
,p_name=>'P16_START_DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(189238991068743)
,p_prompt=>'<label style="font-weight: 500;font-size: 14px;">Start Date</label>'
,p_format_mask=>'DD-MM-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>35
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
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
 p_id=>wwv_flow_imp.id(189027934068741)
,p_name=>'P16_SOURCE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(189238991068743)
,p_prompt=>'<label style="font-weight: 500;">Source</label>'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT f.SOURCE',
'FROM IR_INTERFACE_FILE_LOG f',
'WHERE EXISTS (',
'  SELECT 1',
'  FROM IR_INTERFACE_LOG l',
'  WHERE l.INSTANCE_ID      = f.INSTANCE_ID',
'    AND l.MODULE_ID        = :P16_MODULE_ID',
'    AND l.INTEGRATION_NAME = :P16_INTEGRATION_NAME',
'    AND l.CREATION_DATE    >= TO_DATE(:P16_START_DATE, ''DD/MM/YYYY'')',
'    AND l.CREATION_DATE    <=  TO_DATE(:P16_END_DATE,   ''DD/MM/YYYY'')',
')',
'AND (',
'      (:P16_MODULE_ID IN (1, 3) AND f.BUSINESS_UNIT = :P16_BUSINESS_UNIT)',
'   OR (:P16_MODULE_ID = 2       AND f.LEDGER_NAME   = :P16_LEDGER)',
');',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P16_LEDGER'
,p_ajax_items_to_submit=>'P16_MODULE_ID,P16_LEDGER,P16_INTEGRATION_NAME,P16_START_DATE,P16_END_DATE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>37.5
,p_colspan=>3
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(46853242791921216)
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
 p_id=>wwv_flow_imp.id(191215439068763)
,p_name=>'P16_INTEGRATION_NAME'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56602443158747524)
,p_name=>'P16_TOTAL_AMT'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(56602503757747525)
,p_name=>'P16_TOTAL_COUNT'
,p_item_sequence=>70
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(58682199833377615)
,p_name=>'P16_TITLE'
,p_item_sequence=>90
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(58682467365377618)
,p_name=>'P16_LEDGER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(189238991068743)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT f.LEDGER_NAME',
'FROM IR_INTERFACE_FILE_LOG f',
'WHERE (:P16_SOURCE IS NULL OR f.SOURCE = :P16_SOURCE)',
'  AND EXISTS (',
'    SELECT 1',
'    FROM IR_INTERFACE_LOG l',
'    WHERE l.INSTANCE_ID      = f.INSTANCE_ID',
'      AND l.MODULE_ID        = :P16_MODULE_ID',
'      AND l.INTEGRATION_NAME = :P16_INTEGRATION_NAME',
'      AND l.CREATION_DATE    >= TO_DATE(:P16_START_DATE, ''DD/MM/YYYY'')',
'      AND l.CREATION_DATE    <= TO_DATE(:P16_END_DATE,   ''DD/MM/YYYY'')',
'  )',
'FETCH FIRST 1 ROW ONLY;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'<label style="font-weight: 500;">Ledger</label>'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT f.LEDGER_NAME as D, f.LEDGER_NAME as R',
'FROM IR_INTERFACE_FILE_LOG f',
'WHERE (:P16_SOURCE IS NULL OR f.SOURCE = :P16_SOURCE)',
'  AND EXISTS (',
'    SELECT 1',
'    FROM IR_INTERFACE_LOG l',
'    WHERE l.INSTANCE_ID      = f.INSTANCE_ID',
'      AND l.MODULE_ID        = :P16_MODULE_ID',
'      AND l.INTEGRATION_NAME = :P16_INTEGRATION_NAME',
'      AND l.CREATION_DATE    >= TO_DATE(:P16_START_DATE, ''DD/MM/YYYY'')',
'      AND l.CREATION_DATE    <=  TO_DATE(:P16_END_DATE,   ''DD/MM/YYYY'')',
'  );'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P16_START_DATE,P16_END_DATE'
,p_ajax_items_to_submit=>'P16_MODULE_ID,P16_INTEGRATION_NAME,P16_START_DATE,P16_END_DATE,P16_SOURCE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>37.5
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P16_MODULE_ID'
,p_display_when2=>'2'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
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
 p_id=>wwv_flow_imp.id(58682559599377619)
,p_name=>'P16_BUSINESS_UNIT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(189238991068743)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT f.BUSINESS_UNIT',
'FROM IR_INTERFACE_FILE_LOG f',
'WHERE (:P16_SOURCE IS NULL OR f.SOURCE = :P16_SOURCE)',
'	AND EXISTS (',
'	  SELECT 1',
'	  FROM IR_INTERFACE_LOG l',
'	  WHERE l.INSTANCE_ID      = f.INSTANCE_ID',
'		AND l.MODULE_ID        = :P16_MODULE_ID',
'		AND l.INTEGRATION_NAME = :P16_INTEGRATION_NAME',
'		AND l.CREATION_DATE    >= TO_DATE(:P16_START_DATE, ''DD/MM/YYYY'')',
'		AND l.CREATION_DATE    <= TO_DATE(:P16_END_DATE,   ''DD/MM/YYYY'')',
')',
'FETCH FIRST 1 ROW ONLY;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'<label style="font-weight: 500;">Business Unit</label>'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT f.BUSINESS_UNIT as D, f.BUSINESS_UNIT as R',
'FROM IR_INTERFACE_FILE_LOG f',
'WHERE (:P16_SOURCE IS NULL OR f.SOURCE = :P16_SOURCE)',
'	AND EXISTS (',
'	  SELECT 1',
'	  FROM IR_INTERFACE_LOG l',
'	  WHERE l.INSTANCE_ID      = f.INSTANCE_ID',
'		AND l.MODULE_ID        = :P16_MODULE_ID',
'		AND l.INTEGRATION_NAME = :P16_INTEGRATION_NAME',
'		AND l.CREATION_DATE    >= TO_DATE(:P16_START_DATE, ''DD/MM/YYYY'')',
'		AND l.CREATION_DATE    <= TO_DATE(:P16_END_DATE,   ''DD/MM/YYYY'')',
');'))
,p_lov_display_null=>'YES'
,p_cSize=>37.5
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'RETURN :P16_MODULE_ID IN (1, 3);',
''))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
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
 p_id=>wwv_flow_imp.id(58682674913377620)
,p_name=>'P16_CURRENCY'
,p_item_sequence=>80
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(143192444512887)
,p_name=>'Hide Button & Refresh Region'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P16_SOURCE,P16_START_DATE,P16_END_DATE,P16_BUSINESS_UNIT,P16_LEDGER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(56602864381747528)
,p_event_id=>wwv_flow_imp.id(143192444512887)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_total_amt NUMBER;',
'    v_total_count NUMBER;',
'    v_currency VARCHAR2(100);',
'    v_status VARCHAR2(100);',
'    v_msg VARCHAR2(4000);',
'BEGIN',
'    IF (:P16_MODULE_ID = 1) THEN',
'        IR_IMPORT_SUMMARY.ap_rest_api(:P16_SOURCE,:P16_BUSINESS_UNIT,:P16_START_DATE,:P16_END_DATE,v_total_amt,v_total_count,v_currency,v_status,v_msg);',
'        ',
'    ELSIF (:P16_MODULE_ID = 2) THEN',
'        IR_IMPORT_SUMMARY.gl_rest_api(:P16_SOURCE,:P16_LEDGER,:P16_START_DATE,:P16_END_DATE,v_total_amt,v_total_count,v_currency,v_status,v_msg);',
'    ',
'    ELSIF (:P16_MODULE_ID = 3) THEN',
'        IR_IMPORT_SUMMARY.ar_rest_api(:P16_SOURCE,:P16_BUSINESS_UNIT,:P16_START_DATE,:P16_END_DATE,v_total_amt,v_total_count,v_currency,v_status,v_msg);',
'',
'    END IF;',
'',
'    apex_util.set_session_state(''P16_TOTAL_AMT'',TO_CHAR(v_total_amt, ''999G999G999G999G990D00''));',
'    apex_util.set_session_state(''P16_TOTAL_COUNT'',v_total_count);',
'    apex_util.set_session_state(''P16_CURRENCY'',v_currency);',
'    ',
'END;'))
,p_attribute_02=>'P16_START_DATE,P16_END_DATE,P16_SOURCE,P16_MODULE_ID,P16_BUSINESS_UNIT,P16_LEDGER'
,p_attribute_03=>'P16_TOTAL_AMT,P16_TOTAL_COUNT,P16_CURRENCY'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(56602916049747529)
,p_event_id=>wwv_flow_imp.id(143192444512887)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(188548040068736)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(143050436512886)
,p_event_id=>wwv_flow_imp.id(143192444512887)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let startDateStr = apex.item(''P16_START_DATE'').getValue(),',
'    endDateStr = apex.item(''P16_END_DATE'').getValue(),',
'    format = d => (''0'' + d.getDate()).slice(-2) + ''-'' + (''0'' + (d.getMonth() + 1)).slice(-2) + ''-'' + d.getFullYear(),',
'    todayStr = format(new Date()),',
'    yesterdayStr = format(new Date(new Date().setDate(new Date().getDate() - 1)));',
'',
'if (startDateStr === yesterdayStr && endDateStr === todayStr) {',
'    $(''#last24hr_btn'').show();',
'} else {',
'    $(''#last24hr_btn'').hide();',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(56486681973965428)
,p_event_id=>wwv_flow_imp.id(143192444512887)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(190965595068761)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(56486733412965429)
,p_event_id=>wwv_flow_imp.id(143192444512887)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(187955568068731)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(56602116068747521)
,p_name=>'Import Summary'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(56602284729747522)
,p_event_id=>wwv_flow_imp.id(56602116068747521)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_total_amt NUMBER;',
'    v_total_count NUMBER;',
'    v_currency VARCHAR2(100);',
'    v_status VARCHAR2(100);',
'    v_msg VARCHAR2(4000);',
'BEGIN',
'    IF (:P16_MODULE_ID = 1) THEN',
'        IR_IMPORT_SUMMARY.ap_rest_api(:P16_SOURCE,:P16_BUSINESS_UNIT,:P16_START_DATE,:P16_END_DATE,v_total_amt,v_total_count,v_currency,v_status,v_msg);',
'        ',
'    ELSIF (:P16_MODULE_ID = 2) THEN',
'        IR_IMPORT_SUMMARY.gl_rest_api(:P16_SOURCE,:P16_LEDGER,:P16_START_DATE,:P16_END_DATE,v_total_amt,v_total_count,v_currency,v_status,v_msg);',
'    ',
'    ELSIF (:P16_MODULE_ID = 3) THEN',
'        IR_IMPORT_SUMMARY.ar_rest_api(:P16_SOURCE,:P16_BUSINESS_UNIT,:P16_START_DATE,:P16_END_DATE,v_total_amt,v_total_count,v_currency,v_status,v_msg);',
'',
'    END IF;',
'',
'    apex_util.set_session_state(''P16_TOTAL_AMT'',TO_CHAR(v_total_amt, ''999G999G999G999G990D00''));',
'    apex_util.set_session_state(''P16_TOTAL_COUNT'',v_total_count);',
'    apex_util.set_session_state(''P16_CURRENCY'',v_currency);',
'    ',
'END;'))
,p_attribute_02=>'P16_START_DATE,P16_END_DATE,P16_SOURCE,P16_MODULE_ID,P16_BUSINESS_UNIT,P16_LEDGER'
,p_attribute_03=>'P16_TOTAL_AMT,P16_TOTAL_COUNT,P16_CURRENCY'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(56602614131747526)
,p_event_id=>wwv_flow_imp.id(56602116068747521)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(188548040068736)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58682230300377616)
,p_event_id=>wwv_flow_imp.id(56602116068747521)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P16_TITLE'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT result',
'  FROM (SELECT CASE TO_CHAR(:P16_MODULE_ID)',
'                 WHEN ''1'' THEN ''Total Payables Invoices (OIC)''',
'                 WHEN ''2'' THEN ''Total Journal Batches (OIC)''',
'                 WHEN ''3'' THEN ''Total Receivables Invoices (OIC)''',
'               END AS result',
'          FROM dual)',
'',
''))
,p_attribute_07=>'P16_MODULE_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58682317372377617)
,p_event_id=>wwv_flow_imp.id(56602116068747521)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(188548040068736)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
