prompt --application/shared_components/files/icons_app_icon_32_png
begin
--   Manifest
--     APP STATIC FILES: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.4'
,p_default_workspace_id=>7511807458443690
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_IUWORKSPACE'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF4000000017352474200AECE1CE90000021E494441545847ED954D4F13511486DF1666C8CC541869DA52D050410C62208434B024B0941FC0D6C495FFC2A53FC11D6E5DB8';
wwv_flow_imp.g_varchar2_table(2) := 'EB9AC49D265D98AAF8518381F055069AE9F4636466DA9A3366B48176EE9D348690CCEC2639F7BCCF7DCFC78D2C6E15DBB8C62F1202840E840EDC3807DA8E0DA7A6438E363119BF05D369A17ED1C4A95187A026111914026D95407BC0D6353C4CC858984C';
wwv_flow_imp.g_varchar2_table(3) := '5D11A95B367635033BC7060435C10DC10D20182758BE3F8ED4B0EC9B9C40B63FEDC11E1EE382E00220CB57A74699E29E2241E40A075C4E3001A8E63392D5D5F6CE2B968C06CAB55F9064091955C2C7C3737CAF46993DC104A0BA6F66EFF9DA49E24F1693';
wwv_flow_imp.g_varchar2_table(4) := 'C88EC7F0F4CD67645271F0BAC004B8DDAA61ED41EF7A768AE78F6A78F5E1F46FA9B6770EA08BAA2F3C13602252C5CA74DA4DE2D9DC8A0EE0D1D888FBEFDDFCB238C553198AE6507F0033D205E627E26E92BAA1E3C5E359E4BE9EE165FE04CFD733AEEDDD';
wwv_flow_imp.g_varchar2_table(5) := 'C429FEDDB77D1C0D8CF607A05A3AD6E7EEB8492A4605D3C9113CCBFE2B492F718ACF15F661C97D020C59556CCCFD29C165083F718A7D9DFFC91C45660F741B4372C2B11D3882D4733714F64A289A62FF634837919A2696D20AF722A2E67CBB5BC660CC7F';
wwv_flow_imp.g_varchar2_table(6) := '022837D301CF7AB151C6DA6C1A8AE8FFD8D0FCBFFF51628E9F97971B800E503FDC55A23DB722D9FE456B30EBDE39168100E820F50481B41D0B0945841253A0554C680DDBB5FCBF3EC75CCF5BC0A0C00E04CCCF0C0F01420742077E03EC8A2E50561CE8AD';
wwv_flow_imp.g_varchar2_table(7) := '0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(7811439047623639)
,p_file_name=>'icons/app-icon-32.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/