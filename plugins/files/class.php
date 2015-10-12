<?php
class tad_web_files
{

    public $WebID = 0;
    public $web_cate;

    public function tad_web_files($WebID)
    {
        $this->WebID    = $WebID;
        $this->web_cate = new web_cate($WebID, "files", "tad_web_files");
    }

    //檔案下載
    public function list_all($CateID = "", $limit = "")
    {
        global $xoopsDB, $xoopsTpl, $isMyWeb;

        $showWebTitle = (empty($this->WebID)) ? 1 : 0;
        $andWebID     = (empty($this->WebID)) ? "" : "and a.WebID='{$this->WebID}'";

        //取得tad_web_cate所有資料陣列
        $cate_menu = $this->web_cate->cate_menu($CateID, 'page', false, true, false, true);
        $xoopsTpl->assign('cate_menu', $cate_menu);

        $andCateID = "";
        if (!empty($CateID)) {
            //取得單一分類資料
            $cate = $this->web_cate->get_tad_web_cate($CateID);
            $xoopsTpl->assign('cate', $cate);
            $andCateID = "and a.`CateID`='$CateID'";
        }

        $data = $title = "";

        $sql = "select a.* , b.* from " . $xoopsDB->prefix("tad_web_files") . " as a join " . $xoopsDB->prefix("tad_web_files_center") . " as b on a.fsn=b.col_sn  left join " . $xoopsDB->prefix("tad_web") . " as c on a.WebID=c.WebID where c.`WebEnable`='1' and b.col_name='fsn' $andWebID $andCateID order by a.file_date desc";

        $to_limit = empty($limit) ? 20 : $limit;

        //getPageBar($原sql語法, 每頁顯示幾筆資料, 最多顯示幾個頁數選項);
        $PageBar  = getPageBar($sql, $to_limit, 10);
        $bar      = $PageBar['bar'];
        $sql      = $PageBar['sql'];
        $total    = $PageBar['total'];
        $show_bar = empty($limit) ? $bar : "";

        $result = $xoopsDB->query($sql) or redirect_header($_SERVER['PHP_SELF'], 3, mysql_error());

        $main_data = "";

        $i = 0;

        $Webs = getAllWebInfo();

        while ($all = $xoopsDB->fetchArray($result)) {

            //以下會產生這些變數： $fsn , $uid , $CateID , $file_date  , $WebID
            foreach ($all as $k => $v) {
                $$k = $v;
            }

            $main_data[$i] = $all;

            $this->web_cate->set_WebID($WebID);
            $cate = $this->web_cate->get_tad_web_cate_arr();

            $main_data[$i]['cate']     = $cate[$CateID];
            $main_data[$i]['WebTitle'] = "<a href='index.php?WebID={$WebID}'>{$Webs[$WebID]}</a>";

            $uid_name  = XoopsUser::getUnameFromId($uid, 1);
            $file_date = substr($file_date, 0, 10);

            $showurl = "<a href='" . XOOPS_URL . "/modules/tad_web/files.php?WebID={$WebID}&op=tufdl&files_sn=$files_sn' class='iconize'>{$description}</a>";

            $main_data[$i]['showurl']  = $showurl;
            $main_data[$i]['uid_name'] = $uid_name;
            $i++;
        }

        $xoopsTpl->assign('file_data', $main_data);
        $xoopsTpl->assign('file_bar', $show_bar);
        $xoopsTpl->assign('isMineFiles', $isMyWeb);
        $xoopsTpl->assign('showWebTitleFiles', $showWebTitle);
        $xoopsTpl->assign('files', get_db_plugin($this->WebID, 'files'));
        return $total;
    }

    //以流水號秀出某筆tad_web_file資料內容
    public function show_one($fsn = "")
    {
    }

    //tad_web_files編輯表單
    public function edit_form($fsn = "", $WebID = "")
    {
        global $xoopsDB, $xoopsUser, $MyWebs, $isMyWeb, $xoopsTpl, $TadUpFiles;

        if (!$isMyWeb and $MyWebs) {
            redirect_header($_SERVER['PHP_SELF'] . "?WebID={$MyWebs[0]}&op=edit_form", 3, _MD_TCW_AUTO_TO_HOME);
        } elseif (empty($this->WebID)) {
            redirect_header("index.php", 3, _MD_TCW_NOT_OWNER);
        }

        //抓取預設值
        if (!empty($fsn)) {
            $DBV = $this->get_one_data($fsn);
        } else {
            $DBV = array();
        }

        //預設值設定

        //設定「fsn」欄位預設值
        $fsn = (!isset($DBV['fsn'])) ? "" : $DBV['fsn'];
        $xoopsTpl->assign('fsn', $fsn);

        //設定「uid」欄位預設值
        $user_uid = ($xoopsUser) ? $xoopsUser->getVar('uid') : "";

        $uid = (!isset($DBV['uid'])) ? $user_uid : $DBV['uid'];
        $xoopsTpl->assign('uid', $uid);

        //設定「file_date」欄位預設值
        $file_date = (!isset($DBV['file_date'])) ? date("Y-m-d H:i:s") : $DBV['file_date'];

        //設定「WebID」欄位預設值
        $WebID = (!isset($DBV['WebID'])) ? $this->WebID : $DBV['WebID'];
        $xoopsTpl->assign('WebID', $WebID);

        //設定「CateID」欄位預設值
        $CateID    = (!isset($DBV['CateID'])) ? "" : $DBV['CateID'];
        $cate_menu = $this->web_cate->cate_menu($CateID);
        $xoopsTpl->assign('cate_menu', $cate_menu);

        $op = (empty($fsn)) ? "insert" : "update";

        $xoopsTpl->assign('next_op', $op);

        $TadUpFiles->set_col("fsn", $fsn);
        $upform = $TadUpFiles->upform();
        $xoopsTpl->assign('upform', $upform);
    }

    //新增資料到tad_web_files中
    public function insert()
    {
        global $xoopsDB, $xoopsUser, $TadUpFiles;

        //取得使用者編號
        $uid = ($xoopsUser) ? $xoopsUser->getVar('uid') : "";

        $myts = &MyTextSanitizer::getInstance();

        $_POST['CateID'] = intval($_POST['CateID']);
        $_POST['WebID']  = intval($_POST['WebID']);

        $CateID = $this->web_cate->save_tad_web_cate($_POST['CateID'], $_POST['newCateName']);

        $sql = "insert into " . $xoopsDB->prefix("tad_web_files") . "
          (`uid` , `CateID` , `file_date`  , `WebID`)
          values('{$uid}' , '{$CateID}' , now()  , '{$_POST['WebID']}')";

        $xoopsDB->query($sql) or redirect_header($_SERVER['PHP_SELF'], 3, mysql_error());

        //取得最後新增資料的流水編號
        $fsn = $xoopsDB->getInsertId();

        $TadUpFiles->set_col('fsn', $fsn);
        $TadUpFiles->upload_file('upfile', 640, null, null, null, true);
        return $fsn;
    }

    //更新tad_web_files某一筆資料
    public function update($fsn = "")
    {
        global $xoopsDB, $TadUpFiles;

        $myts = &MyTextSanitizer::getInstance();

        $_POST['CateID'] = intval($_POST['CateID']);
        $_POST['WebID']  = intval($_POST['WebID']);

        $CateID = $this->web_cate->save_tad_web_cate($_POST['CateID'], $_POST['newCateName']);

        $anduid = onlyMine();

        $sql = "update " . $xoopsDB->prefix("tad_web_files") . " set
        `CateID` = '{$CateID}' ,
        `file_date` = now() ,
        `WebID` = '{$_POST['WebID']}'
        where fsn='$fsn' $anduid";
        $xoopsDB->queryF($sql) or redirect_header($_SERVER['PHP_SELF'], 3, mysql_error());

        $TadUpFiles->set_col('fsn', $fsn);
        $TadUpFiles->upload_file('upfile', 640, null, null, null, true);
        return $fsn;
    }

    //刪除tad_web_files某筆資料資料
    public function delete($fsn = "")
    {
        global $xoopsDB, $TadUpFiles;
        $anduid = onlyMine();
        $sql    = "delete from " . $xoopsDB->prefix("tad_web_files") . " where fsn='$fsn' $anduid";
        $xoopsDB->queryF($sql) or redirect_header($_SERVER['PHP_SELF'], 3, mysql_error());

        $TadUpFiles->set_col("fsn", $fsn);
        $TadUpFiles->del_files();
    }

    //以流水號取得某筆tad_web_files資料
    public function get_one_data($fsn = "")
    {
        global $xoopsDB;
        if (empty($fsn)) {
            return;
        }

        $sql    = "select * from " . $xoopsDB->prefix("tad_web_files") . " where fsn='$fsn'";
        $result = $xoopsDB->query($sql) or redirect_header($_SERVER['PHP_SELF'], 3, mysql_error());
        $data   = $xoopsDB->fetchArray($result);
        return $data;
    }

}