prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.4'
,p_default_workspace_id=>7511807458443690
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_IUWORKSPACE'
);
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(8020038150643956)
);
wwv_flow_imp.component_end;
end;
/
