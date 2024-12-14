prompt --application/pages/page_00101
begin
--   Manifest
--     PAGE: 00101
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
 p_id=>101
,p_name=>'User Details'
,p_alias=>'USER-DETAILS'
,p_page_mode=>'MODAL'
,p_step_title=>'User Details'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9712100463878084)
,p_plug_name=>'User Details'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(7557375013622853)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'TBL_USER'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9720275611878120)
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
 p_id=>wwv_flow_imp.id(9720620728878121)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9720275611878120)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(7697505251623177)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9722055887878126)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9720275611878120)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(7697505251623177)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P101_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9722427820878127)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9720275611878120)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(7697505251623177)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P101_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9722849292878128)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9720275611878120)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(7697505251623177)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P101_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9117040712364808)
,p_name=>'P101_PASSWORD'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_prompt=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_display_when=>'P101_ID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_imp.id(7696313669623172)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9117137612364809)
,p_name=>'P101_CONFIRM_PASSWORD'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_prompt=>'Confirm Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_display_when=>'P101_ID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_imp.id(7696313669623172)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9118826400364826)
,p_name=>'P101_ENCRYPTED_PASSWORD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_item_source_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_source=>'ENCRYPTED_PASSWORD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9120094168364838)
,p_name=>'P101_ROLES'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_prompt=>'Roles'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_named_lov=>'LOV_ROLES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(7695055560623167)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CONTAINS'
,p_attribute_02=>'N'
,p_attribute_04=>'N'
,p_attribute_09=>'0'
,p_attribute_13=>'Y'
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9712469992878089)
,p_name=>'P101_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_item_source_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9712806435878096)
,p_name=>'P101_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_item_source_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_read_only_when=>'P101_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(7696313669623172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9713287484878098)
,p_name=>'P101_FIRST_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_item_source_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_prompt=>'First Name'
,p_source=>'FIRST_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P101_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(7695055560623167)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9713665702878099)
,p_name=>'P101_LAST_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_item_source_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_prompt=>'Last Name'
,p_source=>'LAST_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_display_when=>'P101_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(7695055560623167)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9714031955878101)
,p_name=>'P101_IS_ACTIVE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_item_source_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_prompt=>'Is Active'
,p_source=>'IS_ACTIVE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when=>'P101_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(7696313669623172)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9714430301878102)
,p_name=>'P101_CREATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_is_query_only=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_item_source_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_source=>'CREATED_AT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9715202790878106)
,p_name=>'P101_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_item_source_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_source=>'CREATED_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9715638912878107)
,p_name=>'P101_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_is_query_only=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_item_source_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_source=>'UPDATED_AT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9716414270878109)
,p_name=>'P101_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_item_source_plug_id=>wwv_flow_imp.id(9712100463878084)
,p_source=>'UPDATED_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(9120110672364839)
,p_computation_sequence=>10
,p_computation_item=>'P101_ROLES'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    LISTAGG(r.id, '':'') WITHIN GROUP (ORDER BY r.id) AS roles',
'FROM ',
'    tbl_role r',
'JOIN ',
'    tbl_user_role ur ON r.id = ur.role_id',
'WHERE ',
'    ur.user_id = :P101_ID;',
''))
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9117342826364811)
,p_validation_name=>'Passwords Match'
,p_validation_sequence=>10
,p_validation=>':P101_PASSWORD = :P101_CONFIRM_PASSWORD'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Passwords do not match.'
,p_associated_item=>wwv_flow_imp.id(9117137612364809)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9120366436364841)
,p_validation_name=>'Password Strength'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'LENGTH(:P101_PASSWORD) >= 8',
'AND REGEXP_LIKE(:P101_PASSWORD, ''[A-Z]'')    -- At least one uppercase letter',
'AND REGEXP_LIKE(:P101_PASSWORD, ''[a-z]'')    -- At least one lowercase letter',
'AND REGEXP_LIKE(:P101_PASSWORD, ''[0-9]'')    -- At least one number',
'AND REGEXP_LIKE(:P101_PASSWORD, ''[^A-Za-z0-9]'') -- At least one special character'))
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Password must have at least 8 characters, an uppercase letter, a lowercase letter, a number, and a special character.'
,p_associated_item=>wwv_flow_imp.id(9117040712364808)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9120450383364842)
,p_validation_name=>'Email Validation'
,p_validation_sequence=>30
,p_validation=>'REGEXP_LIKE(:P101_EMAIL, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'')'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Please enter a valid email address.'
,p_associated_item=>wwv_flow_imp.id(9712806435878096)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(9720758801878121)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(9720620728878121)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(9721561419878124)
,p_event_id=>wwv_flow_imp.id(9720758801878121)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9117291616364810)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9712100463878084)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Save or Delete'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P101_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>9117291616364810
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9723658891878130)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P101_ID := user_management_pkg.create_user(',
'    p_username => :P101_EMAIL,',
'    p_password => :P101_PASSWORD',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P101_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_internal_uid=>9723658891878130
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9120266727364840)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Roles'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_roles apex_t_varchar2; -- Built-in APEX type for handling lists',
'BEGIN',
'    -- Parse selected roles',
'    l_roles := apex_string.split(:P101_ROLES, '':'');',
'    ',
'    -- Delete existing roles for the user',
'    DELETE FROM tbl_user_role WHERE user_id = :P101_ID;',
'    ',
'    -- Insert new roles',
'    FOR i IN 1..l_roles.COUNT LOOP',
'        INSERT INTO tbl_user_role (user_id, role_id)',
'        VALUES (:P101_ID, l_roles(i));',
'    END LOOP;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_internal_uid=>9120266727364840
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9724018672878131)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>9724018672878131
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9723255004878129)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(9712100463878084)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form User Details'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9723255004878129
);
wwv_flow_imp.component_end;
end;
/
