prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.4'
,p_default_workspace_id=>7511807458443690
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_IUWORKSPACE'
);
wwv_flow_imp_page.create_page(
 p_id=>3
,p_name=>'Change Password'
,p_alias=>'CHANGE-PASSWORD'
,p_page_mode=>'MODAL'
,p_step_title=>'Change Password'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9821529791211974)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(7580249658622906)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9821952294211975)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9821529791211974)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(7697505251623177)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9823712898211979)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9821529791211974)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(7697505251623177)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9120886499364846)
,p_name=>'P3_OLD_PASSWORD'
,p_item_sequence=>10
,p_prompt=>'Old Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(7695055560623167)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9120962789364847)
,p_name=>'P3_NEW_PASSWORD'
,p_item_sequence=>20
,p_prompt=>'New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(7695055560623167)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9121042661364848)
,p_name=>'P3_CONFIRM_PASSWORD'
,p_item_sequence=>30
,p_prompt=>'Confirm Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(7695055560623167)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9121288392364850)
,p_validation_name=>'Old Password Correct'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'user_management_pkg.authenticate(',
'        p_username => LOWER(:APP_USER),',
'        p_password => :P3_OLD_PASSWORD',
'    )'))
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Old password is incorrect.'
,p_associated_item=>wwv_flow_imp.id(9120886499364846)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9825548357248001)
,p_validation_name=>'Passwords Match'
,p_validation_sequence=>20
,p_validation=>':P3_NEW_PASSWORD = :P3_CONFIRM_PASSWORD'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Passwords do not match.'
,p_associated_item=>wwv_flow_imp.id(9121042661364848)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9825686326248002)
,p_validation_name=>'Password Strength'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'LENGTH(:P3_NEW_PASSWORD) >= 8',
'AND REGEXP_LIKE(:P3_NEW_PASSWORD, ''[A-Z]'')    -- At least one uppercase letter',
'AND REGEXP_LIKE(:P3_NEW_PASSWORD, ''[a-z]'')    -- At least one lowercase letter',
'AND REGEXP_LIKE(:P3_NEW_PASSWORD, ''[0-9]'')    -- At least one number',
'AND REGEXP_LIKE(:P3_NEW_PASSWORD, ''[^A-Za-z0-9]'') -- At least one special character'))
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Password must have at least 8 characters, an uppercase letter, a lowercase letter, a number, and a special character.'
,p_associated_item=>wwv_flow_imp.id(9120962789364847)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(9822035976211975)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(9821952294211975)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(9822888358211977)
,p_event_id=>wwv_flow_imp.id(9822035976211975)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9121122653364849)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Password'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'user_management_pkg.change_password(',
'        p_username => LOWER(:APP_USER),',
'        p_new_password => :P3_NEW_PASSWORD',
'    );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9121122653364849
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9825281234211982)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>9825281234211982
);
wwv_flow_imp.component_end;
end;
/
