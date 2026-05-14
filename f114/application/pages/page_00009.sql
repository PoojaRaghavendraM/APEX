prompt --application/pages/page_00009
begin
--   Manifest
--     PAGE: 00009
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
 p_id=>9
,p_name=>'Edit User'
,p_alias=>'EDIT-USER'
,p_page_mode=>'MODAL'
,p_step_title=>'Edit User'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(70024200850845)
,p_plug_name=>'Edit User'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'IR_USERS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(72465995850846)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(72881839850847)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(72465995850846)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(74683244850848)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(72465995850846)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P9_USER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(51660496134843306)
,p_branch_name=>'Go To Page 6'
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(74683244850848)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14683865604058)
,p_name=>'P9_ROLE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(70024200850845)
,p_prompt=>'Role'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT LISTAGG(rm.ROLE_NAME, '':'') WITHIN GROUP (ORDER BY rm.ROLE_NAME) AS selected_roles',
'FROM IR_USER_ROLES ur',
'JOIN IR_ROLE_MASTER rm',
'  ON ur.ROLE_ID = rm.ROLE_ID',
'WHERE ur.USER_ID = :P9_USER_ID;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>'select distinct ROLE_NAME as d, ROLE_NAME as r from IR_ROLE_MASTER where UPPER(STATUS) = ''ACTIVE'';'
,p_cHeight=>5
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_controls', 'ALL')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66110341105543237)
,p_name=>'P9_USER_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(70024200850845)
,p_item_source_plug_id=>wwv_flow_imp.id(70024200850845)
,p_source=>'USER_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66110479583543238)
,p_name=>'P9_USER_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(70024200850845)
,p_item_source_plug_id=>wwv_flow_imp.id(70024200850845)
,p_prompt=>'User'
,p_source=>'USER_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66110583371543239)
,p_name=>'P9_USER_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(70024200850845)
,p_item_source_plug_id=>wwv_flow_imp.id(70024200850845)
,p_prompt=>'Email'
,p_source=>'USER_EMAIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66110682552543240)
,p_name=>'P9_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(70024200850845)
,p_item_source_plug_id=>wwv_flow_imp.id(70024200850845)
,p_prompt=>'Status'
,p_source=>'STATUS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'Inactive',
  'off_value', 'Inactive',
  'on_label', 'Active',
  'on_value', 'Active',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(72940608850847)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(72881839850847)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(73751547850847)
,p_event_id=>wwv_flow_imp.id(72940608850847)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(362222714396294)
,p_name=>'Refresh Role'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(362637770396294)
,p_event_id=>wwv_flow_imp.id(362222714396294)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_ROLE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14443550604055)
,p_event_id=>wwv_flow_imp.id(362222714396294)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_ROLE'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT LISTAGG(rm.ROLE_NAME, '':'') WITHIN GROUP (ORDER BY rm.ROLE_NAME) AS selected_roles',
'FROM IR_USER_ROLES ur',
'JOIN IR_ROLE_MASTER rm',
'  ON ur.ROLE_ID = rm.ROLE_ID',
'WHERE ur.USER_ID = :P9_USER_ID;'))
,p_attribute_07=>'P9_USER_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(75877728850848)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process form Edit User'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'    -- Update user details',
'    UPDATE IR_USERS',
'       SET USER_NAME = :P9_USER_NAME,',
'           USER_EMAIL = :P9_USER_EMAIL,',
'           STATUS    = :P9_STATUS',
'     WHERE USER_ID   = :P9_USER_ID;',
'',
'    -- Delete roles that are unselected',
'    DELETE FROM IR_USER_ROLES',
'     WHERE USER_ID = :P9_USER_ID',
'       AND ROLE_ID NOT IN (',
'           SELECT ROLE_ID',
'             FROM IR_ROLE_MASTER',
'            WHERE ROLE_NAME IN (',
'                SELECT REGEXP_SUBSTR(:P9_ROLE, ''[^:]+'', 1, LEVEL)',
'                  FROM dual',
'                CONNECT BY REGEXP_SUBSTR(:P9_ROLE, ''[^:]+'', 1, LEVEL) IS NOT NULL',
'            )',
'       );',
'',
'    -- Insert new roles (if not already assigned)',
'    FOR r IN (',
'        SELECT ROLE_ID',
'          FROM IR_ROLE_MASTER',
'         WHERE ROLE_NAME IN (',
'             SELECT REGEXP_SUBSTR(:P9_ROLE, ''[^:]+'', 1, LEVEL)',
'               FROM dual',
'             CONNECT BY REGEXP_SUBSTR(:P9_ROLE, ''[^:]+'', 1, LEVEL) IS NOT NULL',
'         )',
'           AND ROLE_ID NOT IN (',
'               SELECT ROLE_ID',
'                 FROM IR_USER_ROLES',
'                WHERE USER_ID = :P9_USER_ID',
'           )',
'    )',
'    LOOP',
'        INSERT INTO IR_USER_ROLES (USER_ID, ROLE_ID)',
'        VALUES (:P9_USER_ID, r.ROLE_ID);',
'    END LOOP;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(74683244850848)
,p_internal_uid=>50648985046723457
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(76223128850848)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>50649330446723457
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(75473491850848)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(70024200850845)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Edit User'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>50648580809723457
);
wwv_flow_imp.component_end;
end;
/
