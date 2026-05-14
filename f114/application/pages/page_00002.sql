prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
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
 p_id=>2
,p_name=>'Failed Records'
,p_alias=>'FAILED-RECORDS'
,p_page_mode=>'MODAL'
,p_step_title=>'Failed Records Breakdown'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'300'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(55495327819619812)
,p_plug_name=>'Failed Records Breakdown'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'  .breakdown-table {',
'    width: 100%;',
'    border-collapse: collapse;',
'  }',
'',
'  .breakdown-table td {',
'    padding: 5px 0;',
'    font-size: 15px;',
'  }',
'',
'  .breakdown-table .label {',
'    text-align: left;',
'  }',
'',
'  .breakdown-table .value {',
'    text-align: right;',
'    font-weight: 700;',
'  }',
'</style>',
'',
'<table class="breakdown-table">',
'  <tr>',
'    <td class="label">Validation</td>',
'    <td class="value">&P2_VAL_FAILED_ROW_COUNT.</td>',
'  </tr>',
'  <tr>',
'    <td class="label">Transformation</td>',
'    <td class="value">&P2_TF_FAILED_ROW_COUNT.</td>',
'  </tr>',
'  <tr>',
'    <td class="label">Import</td>',
'    <td class="value">&P2_IMPORT_FAIL_ROW_COUNT.</td>',
'  </tr>',
'  <tr>',
'    <td class="label">Load</td>',
'    <td class="value">&P2_LOAD_FAIL_ROW_COUNT.</td>',
'  </tr>',
'</table>',
'',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(55494313739619802)
,p_name=>'P2_VAL_FAILED_ROW_COUNT'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(55494575182619804)
,p_name=>'P2_TF_FAILED_ROW_COUNT'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(55494660071619805)
,p_name=>'P2_IMPORT_FAIL_ROW_COUNT'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(55494773149619806)
,p_name=>'P2_LOAD_FAIL_ROW_COUNT'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
