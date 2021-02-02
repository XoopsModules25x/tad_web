<?php
use Xmf\Request;
/*-----------引入檔案區--------------*/
require_once __DIR__ . '/header.php';
$plugin = 'files';
require_once __DIR__ . '/plugin_header.php';
require_once XOOPS_ROOT_PATH . '/header.php';
//$xoopsTpl->assign('plugin', $plugin);
/*-----------function區--------------*/

/*-----------執行動作判斷區----------*/
$op = Request::getString('op');
$files_sn = Request::getInt('files_sn');
$fsn = Request::getInt('fsn');
$CateID = Request::getInt('CateID');

common_template($WebID, $web_all_config);

switch ($op) {
    //新增資料
    case 'insert':
        $fsn = $tad_web_files->insert();
        header("location: {$_SERVER['PHP_SELF']}?WebID={$WebID}");
        exit;
        break;
    //更新資料
    case 'update':
        $fsn = $tad_web_files->update($fsn);
        header("location: {$_SERVER['PHP_SELF']}?WebID={$WebID}");
        exit;
        break;
    //輸入表格
    case 'edit_form':
        $tad_web_files->edit_form($fsn, $WebID);
        break;
    //刪除資料
    case 'delete':
        $tad_web_files->delete($fsn, $files_sn);
        header("location: {$_SERVER['PHP_SELF']}?WebID={$WebID}");
        exit;
        break;
    //下載檔案
    case 'tufdl':
        $TadUpFiles->add_file_counter($files_sn);
        exit;
        break;
    //預設動作
    default:
        if (empty($fsn)) {
            $op = 'list_all';
            $tad_web_files->list_all($CateID);
        }
        break;
}

/*-----------秀出結果區--------------*/
require_once __DIR__ . '/footer.php';
require_once XOOPS_ROOT_PATH . '/footer.php';
