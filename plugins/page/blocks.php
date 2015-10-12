<?php
get_page_list($WebID);

function get_page_list($WebID)
{

    global $xoopsDB, $xoopsTpl;
    if (empty($WebID)) {
        retuen;
    }

    $sql = "SELECT `CateName`, `CateID`
    FROM `" . $xoopsDB->prefix("tad_web_cate") . "`
    WHERE `WebID` = '$WebID' AND `ColName` = 'page' AND `CateEnable` = '1'
    ORDER BY `CateSort`";

    $result = $xoopsDB->query($sql) or web_error($sql);

    $main = '';

    $i = 0;

    while (list($CateName, $CateID) = $xoopsDB->fetchRow($result)) {

        $sql2 = "SELECT `PageID`, `PageTitle`, `PageCount`
        FROM `" . $xoopsDB->prefix("tad_web_page") . "` WHERE `CateID` = '$CateID'
        ORDER BY `PageSort`";
        $result2 = $xoopsDB->query($sql2) or web_error($sql2);
        $content = '';
        $j       = 0;
        while (list($PageID, $PageTitle, $PageCount) = $xoopsDB->fetchRow($result2)) {
            $content[$j]['PageCount'] = $PageCount;
            $content[$j]['WebID']     = $WebID;
            $content[$j]['PageID']    = $PageID;
            $content[$j]['PageTitle'] = $PageTitle;
            $j++;
        }

        $main[$i]['CateID']   = $CateID;
        $main[$i]['CateName'] = $CateName;
        $main[$i]['content']  = $content;
        $i++;

    }
    $xoopsTpl->assign('page_list', $main);
    return $main;
}