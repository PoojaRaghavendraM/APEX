prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
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
 p_id=>10
,p_name=>'Remove Roles'
,p_alias=>'REMOVE-ROLES'
,p_page_mode=>'MODAL'
,p_step_title=>'Remove Roles'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(52913825518779521)
,p_plug_name=>'Remove Roles'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select USER_ID,',
'       USER_NAME,',
'       USER_EMAIL,',
'       (select distinct ROLE_NAME from IR_ROLE_MASTER where UPPER(STATUS) = ''ACTIVE'') as Role,',
'       STATUS',
'from IR_USERS'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(52917630845779526)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1230814848112055)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(52917630845779526)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1231154103112056)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(52917630845779526)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(1182180003410423)
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(1231154103112056)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52889636516955373)
,p_name=>'P10_ROLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(52913825518779521)
,p_item_source_plug_id=>wwv_flow_imp.id(52913825518779521)
,p_prompt=>'Role'
,p_source=>'ROLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>'select distinct ROLE_NAME as d, ROLE_ID as r from IR_ROLE_MASTER where UPPER(STATUS) = ''ACTIVE'';'
,p_cSize=>30
,p_cMaxlength=>16000
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52895849375955407)
,p_name=>'P10_MULTI_N_ID'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54090698713969867)
,p_name=>'P10_ARBITRARY_VALUE'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66109747720543231)
,p_name=>'P10_USER_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(52913825518779521)
,p_item_source_plug_id=>wwv_flow_imp.id(52913825518779521)
,p_source=>'USER_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66109881313543232)
,p_name=>'P10_USER_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(52913825518779521)
,p_item_source_plug_id=>wwv_flow_imp.id(52913825518779521)
,p_source=>'USER_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(66109921459543233)
,p_name=>'P10_USER_EMAIL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(52913825518779521)
,p_prompt=>'User Email'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT LISTAGG(U.USER_EMAIL, '':'') WITHIN GROUP (ORDER BY U.USER_EMAIL) AS email',
'  FROM IR_USERS U',
' WHERE U.USER_ID IN (',
'    SELECT TO_NUMBER(REGEXP_SUBSTR(:P10_MULTI_N_ID, ''[^:]+'', 1, LEVEL))',
'      FROM dual',
'    CONNECT BY REGEXP_SUBSTR(:P10_MULTI_N_ID, ''[^:]+'', 1, LEVEL) IS NOT NULL',
')',
'AND EXISTS (',
'    SELECT 1',
'    FROM IR_USER_ROLES UR',
'    WHERE UR.USER_ID = U.USER_ID',
'      AND UR.ROLE_ID IN (',
'          SELECT TO_NUMBER(REGEXP_SUBSTR(:P10_ROLE, ''[^:]+'', 1, LEVEL))',
'          FROM dual',
'          CONNECT BY REGEXP_SUBSTR(:P10_ROLE, ''[^:]+'', 1, LEVEL) IS NOT NULL',
'      )',
')'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct USER_EMAIL as d, USER_EMAIL as r',
'  FROM IR_USERS',
' WHERE USER_ID IN (',
'    SELECT TO_NUMBER(REGEXP_SUBSTR(:P10_MULTI_N_ID, ''[^:]+'', 1, LEVEL))',
'      FROM dual',
'    CONNECT BY REGEXP_SUBSTR(:P10_MULTI_N_ID, ''[^:]+'', 1, LEVEL) IS NOT NULL',
')'))
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
 p_id=>wwv_flow_imp.id(66110096493543234)
,p_name=>'P10_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(52913825518779521)
,p_item_source_plug_id=>wwv_flow_imp.id(52913825518779521)
,p_source=>'STATUS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1233153882112066)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(1230814848112055)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1233666945112067)
,p_event_id=>wwv_flow_imp.id(1233153882112066)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1234067780112067)
,p_name=>'Refresh email'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_ROLE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(66110177384543235)
,p_event_id=>wwv_flow_imp.id(1234067780112067)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P10_USER_EMAIL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(66110273148543236)
,p_event_id=>wwv_flow_imp.id(1234067780112067)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P10_USER_EMAIL'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT LISTAGG(U.USER_EMAIL, '':'') WITHIN GROUP (ORDER BY U.USER_EMAIL) AS email',
'  FROM IR_USERS U',
' WHERE U.USER_ID IN (',
'    SELECT TO_NUMBER(REGEXP_SUBSTR(:P10_MULTI_N_ID, ''[^:]+'', 1, LEVEL))',
'      FROM dual',
'    CONNECT BY REGEXP_SUBSTR(:P10_MULTI_N_ID, ''[^:]+'', 1, LEVEL) IS NOT NULL',
')',
'AND EXISTS (',
'    SELECT 1',
'    FROM IR_USER_ROLES UR',
'    WHERE UR.USER_ID = U.USER_ID',
'      AND UR.ROLE_ID IN (',
'          SELECT TO_NUMBER(REGEXP_SUBSTR(:P10_ROLE, ''[^:]+'', 1, LEVEL))',
'          FROM dual',
'          CONNECT BY REGEXP_SUBSTR(:P10_ROLE, ''[^:]+'', 1, LEVEL) IS NOT NULL',
'      )',
')'))
,p_attribute_07=>'P10_MULTI_N_ID,P10_ROLE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1232441417112065)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process form Remove Roles'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_role_id   NUMBER;',
'BEGIN',
'',
'    -- Loop through each selected Role',
'    FOR r_role IN (',
'        SELECT TO_NUMBER(REGEXP_SUBSTR(:P10_ROLE, ''[^:]+'', 1, LEVEL)) AS role_id',
'        FROM dual',
'        CONNECT BY REGEXP_SUBSTR(:P10_ROLE, ''[^:]+'', 1, LEVEL) IS NOT NULL',
'    )',
'    LOOP',
'        -- Remove mapping for emails',
'        DELETE FROM IR_USER_ROLES',
'        WHERE ROLE_ID = r_role.role_id',
'          AND USER_ID IN (',
'              SELECT USER_ID',
'              FROM IR_USERS',
'              WHERE USER_EMAIL IN (',
'                  SELECT REGEXP_SUBSTR(:P10_USER_EMAIL, ''[^:]+'', 1, LEVEL)',
'                  FROM dual',
'                  CONNECT BY REGEXP_SUBSTR(:P10_USER_EMAIL, ''[^:]+'', 1, LEVEL) IS NOT NULL',
'              )',
'              AND USER_ID IN (',
'                  SELECT TO_NUMBER(REGEXP_SUBSTR(:P10_MULTI_N_ID, ''[^:]+'', 1, LEVEL))',
'                  FROM dual',
'                  CONNECT BY REGEXP_SUBSTR(:P10_MULTI_N_ID, ''[^:]+'', 1, LEVEL) IS NOT NULL',
'              )',
'          );',
'    END LOOP;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1231154103112056)
,p_internal_uid=>52910788881559461
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1230071062112054)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(52913825518779521)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Assign/Remove Roles'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>52908418526559450
);
wwv_flow_imp.component_end;
end;
/
