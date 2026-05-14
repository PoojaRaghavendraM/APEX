prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
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
 p_id=>0
,p_name=>'Global Page'
,p_step_title=>'Global Page'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_page_component_map=>'14'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(56604401303747544)
,p_plug_name=>'AI Chatbot'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!-- AI Chatbot Button -->',
'<div id="ai-chatbot-button" class="ai-chatbot-button">',
'    <span class="fa fa-chatbot icon"></span>',
'</div>',
'',
'<!-- Styles for the Button -->',
'<style>',
'    .ai-chatbot-button {',
'        position: fixed;',
'        bottom: 20px;',
'        right: 20px;',
'        background-color: #ffe600;',
'        color: #333333;',
'        border-radius: 50%;',
'        width: 60px;',
'        height: 60px;',
'        display: flex;',
'        align-items: center;',
'        justify-content: center;',
'        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);',
'        cursor: pointer;',
'        z-index: 1000;',
'    }',
'',
'    .ai-chatbot-button:hover {',
'        background-color: #ffe600;',
'    }',
'',
'    .ai-chatbot-button .icon {',
'        font-size: 24px;',
'    }',
'</style>',
'',
'<!-- JavaScript for Interaction -->',
'<script>',
'    document.getElementById(''ai-chatbot-button'').addEventListener(''click'', function() {',
'        apex.event.trigger(document, ''ai_chatbot'');',
'    });',
'</script>',
''))
,p_plug_display_condition_type=>'CURRENT_PAGE_IN_CONDITION'
,p_plug_display_when_condition=>'3,4,6,7,16,17'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(57685302342735035)
,p_name=>'AI Chatbot'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ai_chatbot'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(57685713299735040)
,p_event_id=>wwv_flow_imp.id(57685302342735035)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_AI_ASSISTANT'
,p_attribute_01=>'DIALOG'
,p_attribute_02=>'AI Chatbot'
,p_ai_config_id=>wwv_flow_imp.id(57682367684593832)
);
wwv_flow_imp.component_end;
end;
/
