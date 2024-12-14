prompt --application/shared_components/navigation/lists/navigation_menu
begin
--   Manifest
--     LIST: Navigation Menu
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.4'
,p_default_workspace_id=>7511807458443690
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_IUWORKSPACE'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(7521124400622754)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
,p_version_scn=>42100515630695
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7824294659623716)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(9898916582516695)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Your Projects'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-folder-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'200'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(9724698173878134)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Users'
,p_list_item_link_target=>'f?p=&APP_ID.:100:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-users'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'100,101'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8000631151624637)
,p_list_item_display_sequence=>10000
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=&APP_ID.:10000:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-user-wrench'
,p_security_scheme=>wwv_flow_imp.id(7815560117623667)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
