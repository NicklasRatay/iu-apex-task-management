prompt --application/shared_components/security/authorizations/team_member_rights
begin
--   Manifest
--     SECURITY SCHEME: Team Member Rights
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.4'
,p_default_workspace_id=>7511807458443690
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_IUWORKSPACE'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(7815678821623667)
,p_name=>'Team Member Rights'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'RETURN user_management_pkg.has_role(:APP_USER, 3);'
,p_error_message=>'Insufficient privileges, you are do not have the Team Member role.'
,p_version_scn=>42100448530602
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_imp.component_end;
end;
/
