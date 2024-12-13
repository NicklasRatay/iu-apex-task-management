prompt --application/shared_components/security/authentications/custom_authentication_via_tbl_user
begin
--   Manifest
--     AUTHENTICATION: Custom Authentication via TBL_USER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.4'
,p_default_workspace_id=>7511807458443690
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_IUWORKSPACE'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(9113597265221345)
,p_name=>'Custom Authentication via TBL_USER'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_03=>'user_management_pkg.authenticate'
,p_attribute_05=>'N'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>42100443185850
);
wwv_flow_imp.component_end;
end;
/
