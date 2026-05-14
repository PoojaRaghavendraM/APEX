prompt --application/pages/page_09999
begin
--   Manifest
--     PAGE: 09999
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
 p_id=>9999
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'IR Dashboard -Main - Log In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* ====== EY Integrisync Login Custom Styles ====== */',
'.custom-login {',
'  max-width: 500px;',
'  margin: 5% auto;',
'  padding: 2rem;',
'  background: #FFFFFF;',
'  border-radius: 10px;',
'  box-shadow: 0 4px 15px rgba(0,0,0,0.1);',
'  text-align: center;',
'}',
'',
'/* Header */',
'.custom-login-header {',
'  margin-bottom: 1.5rem;',
'}',
'.main-title {',
'  font-size: 22px;',
'  font-weight: bold;',
'  color: #333333; ',
'  margin-bottom: 0.5rem;',
'}',
'.sub-title {',
'  font-size: 18px;',
'  color: #999999;',
'  margin-bottom: 1rem;',
'}',
'',
'/* Input Fields */',
'.custom-login-body .t-Form-fieldContainer {',
'  margin-bottom: 1rem;',
'}',
'',
'/* Login Button */',
'.custom-login-buttons .t-Button {',
'  width: 100%;',
'  /* background-color: #FFE600;',
'  color: #333333; */',
'  background-color: #FFE600;',
'  color: #333333;',
'  font-weight: 600;',
'}',
'',
'/* Help Link */',
'.custom-login-help {',
'  margin-top: 1rem;',
'}',
'.custom-login-help a {',
'  color: #0072CE;',
'}',
'.custom-login-help a:hover {',
'  text-decoration: underline;',
'}',
'',
'/* Divider */',
'.custom-or-divider {',
'  text-align: center;',
'  margin: 1.5rem 0;',
'  position: relative;',
'  color: #333333;',
'  font-size: 14px;',
'}',
'.custom-or-divider::before,',
'.custom-or-divider::after {',
'  content: "";',
'  position: absolute;',
'  width: 35%;',
'  height: 1px;',
'  background: #CCCCCC;',
'  top: 50%;',
'}',
'.custom-or-divider::before {',
'  left: 0;',
'}',
'.custom-or-divider::after {',
'  right: 0;',
'}',
'',
'/* SSO Button */',
'.custom-login-sso {',
'  text-align: left;',
'  margin-top: 0.5rem;',
'}',
'',
'.custom-login-sso .t-Button {',
'  color: #333333; ',
'  background-color: #FFFFFF;',
'  font-weight: 600;',
'  border-color: #FFE600;',
'  border-radius: 6px;',
'  cursor: pointer;',
'  transition: 0.2s ease;',
'}',
'',
''))
,p_step_template=>2101157952850466385
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'12'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(46860096491921286)
,p_plug_name=>'IR Dashboard'
,p_title=>'Integrisync Account Sign In'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(50529511723196567)
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(50479599797771716)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(46860096491921286)
,p_button_name=>'SSO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'SSO/Okta'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(46861735249921297)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(46860096491921286)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(90115887100859)
,p_branch_name=>'Go To Page 3 (Login)'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.:APEX_AUTHENTICATION=SSO:&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(46861735249921297)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(50480073473771721)
,p_branch_name=>'Go To Page 3 (SSO)'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.:APEX_AUTHENTICATION=SSO:&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(50479599797771716)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(46860521494921294)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(46860096491921286)
,p_prompt=>'User Name'
,p_placeholder=>'User name or email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="username"'
,p_field_template=>2318601014859922299
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large:margin-bottom-none'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(46860905926921295)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(46860096491921286)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="current-password"'
,p_field_template=>2318601014859922299
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(50479815937771719)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>'APEX_AUTHENTICATION.login( p_username => :P9999_USERNAME, p_password => :P9999_PASSWORD );'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(46861735249921297)
,p_required_patch=>wwv_flow_imp.id(46853242791921216)
,p_internal_uid=>50479815937771719
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(46865722940921301)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>46865722940921301
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(46865356433921301)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P9999_USERNAME := apex_authentication.get_login_username_cookie;'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>46865356433921301
);
wwv_flow_imp.component_end;
end;
/
