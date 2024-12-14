prompt --application/shared_components/user_interface/lovs/lov_task_status
begin
--   Manifest
--     LOV_TASK_STATUS
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
 p_id=>wwv_flow_imp.id(9933190713551879)
,p_lov_name=>'LOV_TASK_STATUS'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'TBL_TASK_STATUS'
,p_return_column_name=>'ID'
,p_display_column_name=>'NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>42100514236620
);
wwv_flow_imp.component_end;
end;
/
