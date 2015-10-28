<?php

if (homework_onUpdate1_chk()) {
    homework_onUpdate1_go();
}

//修改討論區計數欄位名稱
function homework_onUpdate1_chk()
{
    global $xoopsDB;
    $sql    = "select count(`HomeworkPostDate`) from " . $xoopsDB->prefix("tad_web_homework");
    $result = $xoopsDB->query($sql);
    if (empty($result)) {
        return true;
    }

    return false;
}

function homework_onUpdate1_go()
{
    global $xoopsDB;
    $sql = "ALTER TABLE " . $xoopsDB->prefix("tad_web_homework") . " CHANGE `toCal` `toCal` date NOT NULL default '0000-00-00' COMMENT '加到行事曆', ADD `HomeworkPostDate` datetime NOT NULL default '0000-00-00 00:00:00' COMMENT '顯示日期' AFTER `uid`";
    $xoopsDB->queryF($sql);
    $sql = "update " . $xoopsDB->prefix("tad_web_homework") . " set `HomeworkPostDate` = `HomeworkDate`";
    $xoopsDB->queryF($sql);
    return true;
}
