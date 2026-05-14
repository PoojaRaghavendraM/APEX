prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
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
 p_id=>3
,p_name=>'Home Page'
,p_alias=>'HOME-PAGE'
,p_step_title=>'Home'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_FILES#cards.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Header-logo-link .apex-logo-text {',
'    display: none;',
'}',
'.a-CardView {',
'    background-color: rgba(204, 204, 204, 0.5);',
'}',
'',
'.a-CardView-header {',
'    background-color: rgba(204, 204, 204, 1);',
'}',
'',
'.a-TMV-w-scroll {',
'  overflow-x: hidden;  /* hide scrollbar */',
'}',
'.t-Body {',
'    background: rgba(204,204,204,0.2);',
'}',
'.t-Body-contentInner {',
'    background: rgba(204,204,204,0);',
'}',
'.t-Region--noBorder>.t-Region-bodyWrap>.t-Region-body {',
'    background-color: rgba(204,204,204,0.2);',
'}',
''))
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(114473661795624)
,p_plug_name=>'Module Cards'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--accent1:t-Region--noBorder:t-Region--hiddenOverflow'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_location=>null
,p_plug_source=>'<p style="font-size: 16px;">Choose a module to view detailed integration analytics and reconciliation status</p>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(114262905795622)
,p_plug_name=>'Cards'
,p_parent_plug_id=>wwv_flow_imp.id(114473661795624)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'MODULE_ID,',
'MODULE_ABBREV,',
'MODULE_NAME,',
'MODULE_CLASS,',
'case when MODULE_CLASS = ''card-enabled'' then to_char(active_int)',
'else ''-'' end active_int,',
'case when MODULE_CLASS = ''card-enabled'' then to_char(runs)',
'else ''-'' end runs,',
'case when MODULE_CLASS = ''card-enabled'' then to_char(success_rate)',
'else ''-'' end success_rate',
'from',
'(SELECT',
'    mod.MODULE_ID,',
'    mod.MODULE_ABBREV,',
'    mod.MODULE_NAME,',
'    CASE ',
'        WHEN IR_AUTH_PKG.role_access(:P_USER_ID, mod.MODULE_ID) = 1 ',
'        THEN ''card-enabled''',
'        ELSE ''card-disabled''',
'    END AS MODULE_CLASS,',
'    ',
'    COUNT(DISTINCT int.int_id) AS active_int,',
'    COUNT(inst_all.instance_id) AS runs,',
'    ',
'    CASE ',
'        WHEN COUNT(DISTINCT inst_all.instance_id) = 0 THEN 0',
'        ELSE ROUND(',
'            (COUNT(DISTINCT inst_success.instance_id) * 100.0) / ',
'            COUNT(DISTINCT inst_all.instance_id), 2',
'        )',
'    END AS success_rate',
'',
'FROM IR_MODULES mod',
'',
'LEFT JOIN IR_INTEGRATIONS int ',
'    ON mod.module_id = int.module_id',
'',
'LEFT JOIN IR_INTERFACE_LOG inst_all ',
'    ON mod.module_id = inst_all.module_id ',
'    AND int.int_id = inst_all.int_id ',
'    AND inst_all.creation_date >= SYSDATE - 1',
'',
'',
'LEFT JOIN IR_INTERFACE_LOG inst_success ',
'    ON mod.module_id = inst_success.module_id ',
'    AND int.int_id = inst_success.int_id ',
'    AND inst_success.creation_date  >= SYSDATE - 1',
'    AND inst_success.status = ''Success''',
'',
'GROUP BY ',
'    mod.MODULE_ID,',
'    mod.MODULE_ABBREV,',
'    mod.MODULE_NAME,',
'    IR_AUTH_PKG.role_access(:P_USER_ID, mod.MODULE_ID)',
')',
';'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P_USER_ID'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(114312551795623)
,p_region_id=>wwv_flow_imp.id(114262905795622)
,p_layout_type=>'GRID'
,p_grid_column_count=>3
,p_component_css_classes=>'&module_class.'
,p_title_adv_formatting=>true
,p_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'  .module-header {',
'    display: flex;',
'    align-items: left;',
'}',
'',
'  .module-icon {',
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
'</style>',
'',
'<div class="custom-card" data-module-id="&MODULE_ID.">',
'    <div class="&MODULE_CLASS. module-icon">',
'        <i class="fa fa-file-text-o"></i></div>',
'        ',
'    <div class="module-header">',
'<h4 style="font-weight: bold; font-size: 16px; justify-content: center;"><span class="&MODULE_CLASS.">&MODULE_NAME.</span></h4>',
'</div>',
'</div>'))
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'  .metric-row {',
'    display: flex;',
'    justify-content: space-between;',
'    align-items: center;',
'    margin-bottom: 10px;',
'    font-size: 14px;',
'  }',
'',
'  .metric-label {',
'    display: flex;',
'    align-items: center;',
'    font-weight: 450;',
'  }',
'',
'  .metric-label i {',
'    font-size: 14px;',
'    margin-right: 18px;',
'  }',
'',
'  .metric-value {',
'    font-size: 14px;',
'    font-weight: bold;',
'  }',
'</style>',
'<div class="metric-row">',
'  <span class="&MODULE_CLASS. metric-label">',
'    <i class="fa fa-circle"></i> Active Integrations',
'  </span>',
'  <span class="&MODULE_CLASS. metric-value">&ACTIVE_INT.</span>',
'</div>',
'',
'<div class="metric-row">',
'  <span class="&MODULE_CLASS. metric-label">',
'    <i class="fa fa-clock-o"></i> Last 24H Runs',
'  </span>',
'  <span class="&MODULE_CLASS. metric-value">&RUNS.</span>',
'</div>',
'',
'<div class="metric-row">',
'  <span class="&MODULE_CLASS. metric-label">',
'    <i class="fa fa-check-circle"></i> Success Rate',
'  </span>',
'  <span class="&MODULE_CLASS. metric-value">&SUCCESS_RATE.%</span>',
'</div>',
'<br>',
'<div>',
'    <span class="&MODULE_CLASS.">',
'    <i class="fa fa-arrow-right" style="float: right;"></i>',
'    </span>',
'</div>'))
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
,p_pk1_column_name=>'MODULE_CLASS'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(2713285464602006)
,p_card_id=>wwv_flow_imp.id(114312551795623)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_MODULE_NAME,P7_MODULE_ID:&MODULE_NAME.,&MODULE_ID.'
,p_link_attributes=>'&MODULE_ID.'
,p_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_condition_expr1=>'MODULE_CLASS'
,p_condition_expr2=>'card-enabled'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54122706259164102)
,p_plug_name=>'Title'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display: flex; align-items: center; justify-content: start; gap: 820px; ">',
'  <h2 style="margin: 0; font-size: 30px; font-weight: 600;">',
'    Integration Reconciliation Dashboard',
'  </h2>',
'',
'  <button ',
'    class="t-Button t-Button--primary t-Button--small" ',
'    onclick="javascript:apex.navigation.redirect(''f?p=&APP_ID.:3:&SESSION.'');"',
'    style="background-color: #FFE600; color: #000; box-sizing: border-box; font-family: EYInterstate; font-size: 14px; font-style: normal; font-weight: 700; line-height: 22px;"',
'  >',
'    <span class="t-Icon fa fa-refresh"></span> Refresh',
'  </button>',
'</div>',
'',
'<p style="font-size: 16px;margin-top: 10px;line-height: 1.5;">',
'  Gain a single source of truth for your Oracle integrations. The Integration Reconciliation Dashboard connects every hop - from file receipt to final import - so you can monitor, reconcile, and troubleshoot with clarity and speed.',
'</p>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(114724844795627)
,p_name=>'P_USER_ID'
,p_item_sequence=>60
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select USER_ID from IR_USERS',
'where USER_EMAIL = :APP_USER'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53466265442447044)
,p_name=>'P_MODULE_ID'
,p_item_sequence=>70
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
