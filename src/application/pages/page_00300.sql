prompt --application/pages/page_00300
begin
--   Manifest
--     PAGE: 00300
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
 p_id=>300
,p_name=>'Your Tasks'
,p_alias=>'YOUR-TASKS'
,p_step_title=>'Your Tasks'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function drop_over_handle(event) {',
'    event.preventDefault();',
'}',
'',
'function drag_handle(event) {',
'    event.dataTransfer.setData("text", event.target.getAttribute("data-task-id"));',
'}',
'',
'function drop_handle(droppedOnElement, event) {',
'    event.preventDefault(event);',
'    const taskId = event.dataTransfer.getData("text");',
'',
'    event.target.closest(".kanban-bucket").appendChild($(`[data-task-id=${taskId}]`)[0]);',
'    $x("P300_DRAGGED_TASK_ID").value = taskId;',
'    $x("P300_DROPPED_ON_TASK_STATUS_ID").value = droppedOnElement.getAttribute("data-status-id");',
'',
'    apex.server.process(',
'        "CHANGE_TASK_STATUS",',
'        { pageItems: "#P300_DRAGGED_TASK_ID, #P300_DROPPED_ON_TASK_STATUS_ID" }',
'    );',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Container for the entire Kanban board */',
'.kanban-container {',
'    display: flex;',
'    gap: 0; /* No gap to ensure seamless dividers */',
'}',
'',
'/* Each bucket in the Kanban board */',
'.kanban-bucket {',
'    flex: 1;',
'    border-right: 1px solid #ccc; /* Divider between buckets */',
'    padding: 0px 20px;',
'    display: flex;',
'    flex-direction: column;',
'    gap: 20px;',
'}',
'',
'/* Remove left border for the first bucket */',
'.kanban-bucket:first-child {',
'    border-left: none;',
'}',
'',
'/* Remove right border for the last bucket */',
'.kanban-bucket:last-child {',
'    border-right: none;',
'}',
'',
'/* Title of each bucket */',
'.kanban-bucket-title {',
'    text-align: center;',
'    font-size: 21px;',
'    margin-bottom: 10px;',
'}',
'',
'/* Each card representing a task */',
'.kanban-card {',
'    border: 1px solid #ddd;',
'    border-radius: 5px;',
'    padding: 10px;',
'    background-color: #ffffff;',
'    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);',
'    transition: all 0.2s ease; /* Smooth transition */',
'}',
'',
'/* Title of each task card */',
'.kanban-card-title {',
'    margin: 0;',
'    font-size: 16px;',
'    font-weight: 600;',
'}',
'',
'/* Description of the task */',
'.kanban-card-description {',
'    margin: 5px 0;',
'    font-size: 12px;',
'    color: #555;',
'}',
'',
'/* Meta information (Deadline and Priority) */',
'.kanban-card-meta {',
'    display: flex;',
'    justify-content: space-between;',
'    font-size: 14px;',
'    color: #555;',
'}',
'',
'/* Hover effect for Kanban cards */',
'.kanban-card:hover {',
'    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;',
'    cursor: pointer;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9829472744248040)
,p_plug_name=>'Kanban Board'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(7558756847622856)
,p_plug_display_sequence=>70
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    -- Cursor for task statuses',
'    CURSOR cur_status IS',
'        SELECT id, name',
'          FROM tbl_task_status',
'         ORDER BY id;',
'',
'    -- Determine the assigned user ID once, outside the loop',
'    l_user_id tbl_user.id%TYPE;',
'',
'    -- Cursor for tasks based on status_id',
'    CURSOR cur_task(p_status_id NUMBER) IS',
'        SELECT id, name, ',
'               description, ',
'               TO_CHAR(deadline, ''YYYY-MM-DD'') AS deadline, ',
'               CASE task_priority_id',
'                   WHEN 1 THEN ''<span class="fa fa-angle-down u-color-30-text fa-lg" aria-hidden="true"></span>''',
'                   WHEN 2 THEN ''<span aria-hidden="true" class="fa fa-minus u-color-31-text fa-lg"></span>''',
'                   WHEN 3 THEN ''<span aria-hidden="true" class="fa fa-angle-up u-color-37-text fa-lg"></span>''',
'                   WHEN 4 THEN ''<span aria-hidden="true" class="fa fa-angle-double-up u-color-39-text fa-lg"></span>''',
'                   ELSE ''<span aria-hidden="true" class="fa fa-question-circle fa-lg"></span>''',
'               END AS priority_icon',
'          FROM tbl_task',
'         WHERE task_status_id = p_status_id',
'           AND assigned_user_id = l_user_id',
'           AND task_status_id <> 3',
'         ORDER BY name;',
'',
'    l_result CLOB := ''<div class="kanban-container">''; -- Container for Kanban board',
'BEGIN',
'    -- Fetch the user ID based on the current application user',
'    SELECT id',
'      INTO l_user_id',
'      FROM tbl_user',
'     WHERE LOWER(email) = LOWER(:APP_USER);',
'',
'    -- Loop through statuses',
'    FOR l_status IN cur_status LOOP',
'        l_result := l_result || ''<div class="kanban-bucket" data-status-id="'' || l_status.id || ''" ondrop="drop_handle(this,event)" ondragover="drop_over_handle(event)">'';',
'        l_result := l_result || ''<h3 class="kanban-bucket-title">'' || apex_escape.html(l_status.name) || ''</h3>'';',
'',
'        -- Loop through tasks for the current status',
'        FOR l_task IN cur_task(l_status.id) LOOP',
'            l_result := l_result || ''<div class="kanban-card" draggable="true" data-task-id="'' || l_task.id || ''" ondragstart="drag_handle(event)">'';',
'            l_result := l_result || ''<h4 class="kanban-card-title">'' || apex_escape.html(l_task.name) || ''</h4>'';',
'            l_result := l_result || ''<p class="kanban-card-description">'' || apex_escape.html(l_task.description) || ''</p>'';',
'            l_result := l_result || ''<div class="kanban-card-meta">'';',
'            l_result := l_result || l_task.priority_icon;',
'            l_result := l_result || l_task.deadline;',
'            l_result := l_result || ''</div>''; -- Close meta',
'            l_result := l_result || ''</div>''; -- Close task card',
'        END LOOP;',
'',
'        l_result := l_result || ''</div>''; -- Close bucket',
'    END LOOP;',
'',
'    l_result := l_result || ''</div>''; -- Close the flex container',
'',
'    RETURN l_result;',
'END;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9829595798248041)
,p_name=>'P300_DROPPED_ON_TASK_STATUS_ID'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9829671863248042)
,p_name=>'P300_DRAGGED_TASK_ID'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9829756111248043)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHANGE_TASK_STATUS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE tbl_task',
'    SET',
'        task_status_id = :P300_DROPPED_ON_TASK_STATUS_ID',
'    WHERE',
'        id = :P300_DRAGGED_TASK_ID;',
'        ',
'    -- Eliminate "Error: SyntaxError: Unexpected end of JSON input"',
'    apex_json.open_object;',
'    apex_json.write(''success'', true);',
'    apex_json.close_object;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9829756111248043
);
wwv_flow_imp.component_end;
end;
/
