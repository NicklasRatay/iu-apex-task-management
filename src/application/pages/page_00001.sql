prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'Tick-It'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.card-container {',
'    text-align: center;',
'    padding: 24px 0px;',
'}',
'',
'.card-title {',
'    font-size: 64px;',
'    margin-bottom: 32px;',
'    font-weight: 300;',
'}',
'',
'.card-subtitle {',
'    font-size: 32px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9828064690248026)
,p_plug_name=>'Right Container'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(7557375013622853)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'col-xxs-12 col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 col-xxl-6'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7825167575623722)
,p_plug_name=>'Project and Task Counts'
,p_parent_plug_id=>wwv_flow_imp.id(9828064690248026)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(7584352373622914)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ''Projects'' AS title,',
'    COUNT(1) AS metric',
'FROM tbl_project',
'UNION ALL',
'SELECT ',
'    ''Tasks'',',
'    COUNT(1)',
'FROM tbl_task;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(9827999513248025)
,p_region_id=>wwv_flow_imp.id(7825167575623722)
,p_layout_type=>'GRID'
,p_grid_column_count=>2
,p_card_css_classes=>'card-container'
,p_title_adv_formatting=>false
,p_title_column_name=>'METRIC'
,p_title_css_classes=>'card-title'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'TITLE'
,p_sub_title_css_classes=>'card-subtitle'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
,p_pk1_column_name=>'TITLE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9828172036248027)
,p_plug_name=>'Upcoming Tasks'
,p_parent_plug_id=>wwv_flow_imp.id(9828064690248026)
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(7586239997622918)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    id,',
'    name,',
'    description,',
'    CASE task_priority_id',
'        WHEN 1 THEN ''fa fa-angle-down u-color-30''',
'        WHEN 2 THEN ''fa fa-minus u-color-31''',
'        WHEN 3 THEN ''fa fa-angle-up u-color-37''',
'        WHEN 4 THEN ''fa fa-angle-double-up u-color-39''',
'        ELSE ''fa fa-question-circle''',
'    END AS priority_icon,',
'    TO_CHAR(deadline, ''YYYY-MM-DD'') AS deadline',
'FROM tbl_task',
'WHERE task_status_id <> 3',
'ORDER BY deadline ASC',
'FETCH FIRST 5 ROWS ONLY;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(9828231688248028)
,p_region_id=>wwv_flow_imp.id(9828172036248027)
,p_layout_type=>'ROW'
,p_title_adv_formatting=>false
,p_title_column_name=>'NAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'DESCRIPTION'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'DYNAMIC_CLASS'
,p_icon_class_column_name=>'PRIORITY_ICON'
,p_icon_css_classes=>'TESTTESTTEST'
,p_icon_position=>'START'
,p_badge_column_name=>'DEADLINE'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9828374146248029)
,p_plug_name=>'Left Container'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(7557375013622853)
,p_plug_display_sequence=>10
,p_plug_grid_column_css_classes=>'col-xxs-12 col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 col-xxl-6'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9828468335248030)
,p_plug_name=>'All Tasks per Status'
,p_parent_plug_id=>wwv_flow_imp.id(9828374146248029)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(7623903199622999)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(9828578784248031)
,p_region_id=>wwv_flow_imp.id(9828468335248030)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(9828613690248032)
,p_chart_id=>wwv_flow_imp.id(9828578784248031)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ts.name AS status_name,',
'    COUNT(t.id) AS task_count,',
'    CASE ts.id',
'        WHEN 1 THEN ''#FFB347'' -- Light Orange',
'        WHEN 2 THEN ''#87CEEB'' -- Light Blue',
'        WHEN 3 THEN ''#98FB98'' -- Light Green',
'        ELSE ''#D3D3D3'' -- Light Gray for unknown status',
'    END AS status_color',
'FROM ',
'    tbl_task t',
'JOIN ',
'    tbl_task_status ts',
'    ON t.task_status_id = ts.id',
'GROUP BY ',
'    ts.id,',
'    ts.name',
'ORDER BY ',
'    ts.id;',
''))
,p_items_value_column_name=>'TASK_COUNT'
,p_items_label_column_name=>'STATUS_NAME'
,p_custom_column_name=>'STATUS_NAME'
,p_color=>'&STATUS_COLOR.'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9828920394248035)
,p_plug_name=>'Pending Tasks per Priority'
,p_parent_plug_id=>wwv_flow_imp.id(9828374146248029)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(7623903199622999)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(9829094411248036)
,p_region_id=>wwv_flow_imp.id(9828920394248035)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(9829190337248037)
,p_chart_id=>wwv_flow_imp.id(9829094411248036)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    tp.name AS priority_name,',
'    COUNT(t.id) AS task_count,',
'    CASE tp.id',
'        WHEN 1 THEN ''#D3D3D3'' -- Gray',
'        WHEN 2 THEN ''#87CEEB'' -- Light Blue',
'        WHEN 3 THEN ''#FFA500'' -- Light Orange',
'        WHEN 4 THEN ''#FF6347'' -- Light Red',
'        ELSE ''#9E9E9E'' -- Default Gray for unknown priorities',
'    END AS priority_color',
'FROM ',
'    tbl_task t',
'JOIN ',
'    tbl_task_priority tp',
'    ON t.task_priority_id = tp.id',
'WHERE ',
'    t.task_status_id <> 3 -- Exclude completed tasks',
'GROUP BY ',
'    tp.name, tp.id',
'ORDER BY ',
'    tp.id;',
''))
,p_items_value_column_name=>'TASK_COUNT'
,p_items_label_column_name=>'PRIORITY_NAME'
,p_custom_column_name=>'PRIORITY_COLOR'
,p_color=>'&PRIORITY_COLOR.'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(9829293761248038)
,p_chart_id=>wwv_flow_imp.id(9829094411248036)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(9829307475248039)
,p_chart_id=>wwv_flow_imp.id(9829094411248036)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp.component_end;
end;
/
