prompt --application/shared_components/user_interface/lovs/lov_project
begin
--   Manifest
--     LOV_PROJECT
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
 p_id=>wwv_flow_imp.id(10141560415262067)
,p_lov_name=>'LOV_PROJECT'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'TBL_PROJECT'
,p_return_column_name=>'ID'
,p_display_column_name=>'NAME'
,p_default_sort_column_name=>'NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>42100527899911
);
wwv_flow_imp.component_end;
end;
/