prompt --application/shared_components/security/app_access_control/contributor
begin
--   Manifest
--     ACL ROLE: Contributor
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.4'
,p_default_workspace_id=>7511807458443690
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_IUWORKSPACE'
);
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(7815396945623666)
,p_static_id=>'CONTRIBUTOR'
,p_name=>'Contributor'
,p_description=>'Role assigned to application contributors.'
,p_version_scn=>42100313076789
);
wwv_flow_imp.component_end;
end;
/
