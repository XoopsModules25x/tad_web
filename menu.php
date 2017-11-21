<?php
/*-----------引入檔案區--------------*/
include_once "header.php";
$plugin = "menu";
include_once "plugin_header.php";
include_once XOOPS_ROOT_PATH . "/header.php";
//$xoopsTpl->assign('plugin', $plugin);
/*-----------function區--------------*/

/*-----------執行動作判斷區----------*/
include_once $GLOBALS['xoops']->path('/modules/system/include/functions.php');
$op     = system_CleanVars($_REQUEST, 'op', '', 'string');
$MenuID = system_CleanVars($_REQUEST, 'MenuID', 0, 'int');
$CateID = system_CleanVars($_REQUEST, 'CateID', 0, 'int');

common_template($WebID, $web_all_config);

switch ($op) {

    //新增資料
    case "insert":
        $MenuID = $tad_web_menu->insert();
        header("location: {$_SERVER['PHP_SELF']}?WebID={$WebID}");
        exit;
        break;

    //更新資料
    case "update":
        $MenuID = $tad_web_menu->update($MenuID);
        header("location: {$_SERVER['PHP_SELF']}?WebID={$WebID}");
        exit;
        break;

    //輸入表格
    case "edit_form":
        $tad_web_menu->edit_form($MenuID);
        break;

    //刪除資料
    case "delete":
        $tad_web_menu->delete($MenuID);
        header("location: {$_SERVER['PHP_SELF']}?WebID={$WebID}");
        exit;
        break;

    //預設動作
    default:
        $op = 'list_all';
        $tad_web_menu->list_all($CateID, null, "assign", $tag);

        break;

}

/*-----------秀出結果區--------------*/
include_once 'footer.php';
include_once XOOPS_ROOT_PATH . '/footer.php';