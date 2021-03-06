<?php
function list_calendar($WebID, $config = [])
{
    global $xoopsDB, $xoopsTpl, $TadUpFiles;
    if (empty($WebID)) {
        return;
    }
    require_once __DIR__ . '/class.php';

    $tad_web_calendar = new tad_web_calendar($WebID);
    $limit = isset($config['limit']) ? $config['limit'] : '';
    $block = $tad_web_calendar->list_all('', $limit, 'return');
    $block['main_data'] = true;

    return $block;
}
