prompt --application/shared_components/user_interface/lovs/lov_user
begin
--   Manifest
--     LOV_USER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.4'
,p_default_workspace_id=>7511807458443690
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_IUWORKSPACE'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(9933334481554786)
,p_lov_name=>'LOV_USER'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'VW_USER_FULL_NAME'
,p_return_column_name=>'ID'
,p_display_column_name=>'FULL_NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'LAST_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>42100514261864
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(9935211900579908)
,p_query_column_name=>'ID'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(9934443924579907)
,p_query_column_name=>'FIRST_NAME'
,p_heading=>'First Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(9934853143579908)
,p_query_column_name=>'LAST_NAME'
,p_heading=>'Last Name'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(9935653500579909)
,p_query_column_name=>'FULL_NAME'
,p_heading=>'Full Name'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
