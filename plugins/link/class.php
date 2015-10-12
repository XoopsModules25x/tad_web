<?php
class tad_web_link
{

    public $WebID = 0;
    public $web_cate;

    public function tad_web_link($WebID)
    {
        $this->WebID    = $WebID;
        $this->web_cate = new web_cate($WebID, "link", "tad_web_link");
    }

    //好站連結
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

        $sql = "select a.* from " . $xoopsDB->prefix("tad_web_link") . " as a left join " . $xoopsDB->prefix("tad_web") . " as b on a.WebID=b.WebID where b.`WebEnable`='1' $andWebID $andCateID order by a.LinkID desc";

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
            //以下會產生這些變數： $LinkID , $LinkTitle , $LinkDesc , $LinkUrl , $LinkCounter , $LinkSort , $WebID , $uid
            foreach ($all as $k => $v) {
                $$k = $v;
            }

            $main_data[$i] = $all;

            $this->web_cate->set_WebID($WebID);
            $cate = $this->web_cate->get_tad_web_cate_arr();

            $main_data[$i]['cate']     = $cate[$CateID];
            $main_data[$i]['WebTitle'] = "<a href='index.php?WebID={$WebID}'>{$Webs[$WebID]}</a>";

            $LinkDesc                  = nl2br(xoops_substr(strip_tags($LinkDesc), 0, 150));
            $main_data[$i]['LinkDesc'] = $LinkDesc;
            $i++;
        }

        $xoopsTpl->assign('link_data', $main_data);
        $xoopsTpl->assign('link_bar', $show_bar);
        $xoopsTpl->assign('isMineLink', $isMyWeb);
        $xoopsTpl->assign('showWebTitleLink', $showWebTitle);
        $xoopsTpl->assign('link', get_db_plugin($this->WebID, 'link'));
        return $total;
    }

    //以流水號秀出某筆tad_web_link資料內容
    public function show_one($LinkID = "")
    {
        global $xoopsDB;
        if (empty($LinkID)) {
            return;
        }

        $LinkID = intval($LinkID);
        $this->add_counter($LinkID);

        $sql           = "select LinkUrl from " . $xoopsDB->prefix("tad_web_link") . " where LinkID='{$LinkID}'";
        $result        = $xoopsDB->query($sql) or redirect_header($_SERVER['PHP_SELF'], 3, mysql_error());
        list($LinkUrl) = $xoopsDB->fetchRow($result);

        header("location: {$LinkUrl}");
        exit;
    }

    //tad_web_link編輯表單
    public function edit_form($LinkID = "")
    {
        global $xoopsDB, $xoopsUser, $MyWebs, $isMyWeb, $xoopsTpl;

        if (!$isMyWeb and $MyWebs) {
            redirect_header($_SERVER['PHP_SELF'] . "?WebID={$MyWebs[0]}&op=edit_form", 3, _MD_TCW_AUTO_TO_HOME);
        } elseif (empty($this->WebID)) {
            redirect_header("index.php", 3, _MD_TCW_NOT_OWNER);
        }

        //抓取預設值
        if (!empty($LinkID)) {
            $DBV = $this->get_one_data($LinkID);
        } else {
            $DBV = array();
        }

        //預設值設定

        //設定「LinkID」欄位預設值
        $LinkID = (!isset($DBV['LinkID'])) ? "" : $DBV['LinkID'];
        $xoopsTpl->assign('LinkID', $LinkID);

        //設定「LinkTitle」欄位預設值
        $LinkTitle = (!isset($DBV['LinkTitle'])) ? "" : $DBV['LinkTitle'];
        $xoopsTpl->assign('LinkTitle', $LinkTitle);

        //設定「LinkDesc」欄位預設值
        $LinkDesc = (!isset($DBV['LinkDesc'])) ? "" : $DBV['LinkDesc'];
        $xoopsTpl->assign('LinkDesc', $LinkDesc);

        //設定「LinkUrl」欄位預設值
        $LinkUrl = (!isset($DBV['LinkUrl'])) ? "" : $DBV['LinkUrl'];
        $xoopsTpl->assign('LinkUrl', $LinkUrl);

        //設定「LinkCounter」欄位預設值
        $LinkCounter = (!isset($DBV['LinkCounter'])) ? "" : $DBV['LinkCounter'];
        $xoopsTpl->assign('LinkCounter', $LinkCounter);

        //設定「LinkSort」欄位預設值
        $LinkSort = (!isset($DBV['LinkSort'])) ? $this->max_sort() : $DBV['LinkSort'];
        $xoopsTpl->assign('LinkSort', $LinkSort);

        //設定「WebID」欄位預設值
        $WebID = (!isset($DBV['WebID'])) ? $this->WebID : $DBV['WebID'];
        $xoopsTpl->assign('WebID', $WebID);

        //設定「uid」欄位預設值
        $user_uid = ($xoopsUser) ? $xoopsUser->getVar('uid') : "";
        $uid      = (!isset($DBV['uid'])) ? $user_uid : $DBV['uid'];

        //設定「CateID」欄位預設值
        $CateID    = (!isset($DBV['CateID'])) ? "" : $DBV['CateID'];
        $cate_menu = $this->web_cate->cate_menu($CateID);
        $xoopsTpl->assign('cate_menu', $cate_menu);

        $op = (empty($LinkID)) ? "insert" : "update";
        //$op="replace_tad_web_link";

        if (!file_exists(TADTOOLS_PATH . "/formValidator.php")) {
            redirect_header("index.php", 3, _MD_NEED_TADTOOLS);
        }
        include_once TADTOOLS_PATH . "/formValidator.php";
        $formValidator      = new formValidator("#myForm", true);
        $formValidator_code = $formValidator->render();

        $xoopsTpl->assign('formValidator_code', $formValidator_code);
        $xoopsTpl->assign('next_op', $op);

    }

    //新增資料到tad_web_link中
    public function insert()
    {
        global $xoopsDB, $xoopsUser;

        //取得使用者編號
        $uid = ($xoopsUser) ? $xoopsUser->getVar('uid') : "";

        $myts                 = &MyTextSanitizer::getInstance();
        $_POST['LinkTitle']   = $myts->addSlashes($_POST['LinkTitle']);
        $_POST['LinkDesc']    = $myts->addSlashes($_POST['LinkDesc']);
        $_POST['LinkUrl']     = $myts->addSlashes($_POST['LinkUrl']);
        $_POST['LinkCounter'] = intval($_POST['LinkCounter']);
        $_POST['LinkSort']    = intval($_POST['LinkSort']);
        $_POST['CateID']      = intval($_POST['CateID']);
        $_POST['WebID']       = intval($_POST['WebID']);

        $CateID = $this->web_cate->save_tad_web_cate($_POST['CateID'], $_POST['newCateName']);

        $sql = "insert into " . $xoopsDB->prefix("tad_web_link") . "
          (`CateID`, `LinkTitle` , `LinkDesc` , `LinkUrl` , `LinkCounter` , `LinkSort` , `WebID` , `uid`)
          values('{$CateID}', '{$_POST['LinkTitle']}' , '{$_POST['LinkDesc']}' , '{$_POST['LinkUrl']}' , '{$_POST['LinkCounter']}' , '{$_POST['LinkSort']}' , '{$_POST['WebID']}' , '{$uid}')";
        $xoopsDB->query($sql) or redirect_header($_SERVER['PHP_SELF'], 3, mysql_error());

        //取得最後新增資料的流水編號
        $LinkID = $xoopsDB->getInsertId();
        return $LinkID;
    }

    //更新tad_web_link某一筆資料
    public function update($LinkID = "")
    {
        global $xoopsDB, $xoopsUser;

        $myts               = &MyTextSanitizer::getInstance();
        $_POST['LinkTitle'] = $myts->addSlashes($_POST['LinkTitle']);
        $_POST['LinkDesc']  = $myts->addSlashes($_POST['LinkDesc']);
        $_POST['LinkUrl']   = $myts->addSlashes($_POST['LinkUrl']);
        $_POST['CateID']    = intval($_POST['CateID']);
        $_POST['WebID']     = intval($_POST['WebID']);

        $CateID = $this->web_cate->save_tad_web_cate($_POST['CateID'], $_POST['newCateName']);

        $anduid = onlyMine();

        $sql = "update " . $xoopsDB->prefix("tad_web_link") . " set
       `CateID` = '{$CateID}' ,
       `LinkTitle` = '{$_POST['LinkTitle']}' ,
       `LinkDesc` = '{$_POST['LinkDesc']}' ,
       `LinkUrl` = '{$_POST['LinkUrl']}' ,
       `WebID` = '{$_POST['WebID']}'
        where LinkID='$LinkID' $anduid";
        $xoopsDB->queryF($sql) or redirect_header($_SERVER['PHP_SELF'], 3, mysql_error());
        return $LinkID;
    }

    //刪除tad_web_link某筆資料資料
    public function delete($LinkID = "")
    {
        global $xoopsDB;

        $anduid = onlyMine();

        $sql = "delete from " . $xoopsDB->prefix("tad_web_link") . " where LinkID='$LinkID' $anduid";
        $xoopsDB->queryF($sql) or redirect_header($_SERVER['PHP_SELF'], 3, mysql_error());
    }

    //自動取得tad_web_link的最新排序
    public function max_sort()
    {
        global $xoopsDB;
        $sql        = "select max(`LinkSort`) from " . $xoopsDB->prefix("tad_web_link");
        $result     = $xoopsDB->query($sql) or redirect_header($_SERVER['PHP_SELF'], 3, mysql_error());
        list($sort) = $xoopsDB->fetchRow($result);
        return ++$sort;
    }

    //新增tad_web_link計數器
    public function add_counter($LinkID = '')
    {
        global $xoopsDB;
        $sql = "update " . $xoopsDB->prefix("tad_web_link") . " set `LinkCounter`=`LinkCounter`+1 where `LinkID`='{$LinkID}'";
        $xoopsDB->queryF($sql) or redirect_header($_SERVER['PHP_SELF'], 3, mysql_error());
    }

    //以流水號取得某筆tad_web_link資料
    public function get_one_data($LinkID = "")
    {
        global $xoopsDB;
        if (empty($LinkID)) {
            return;
        }

        $sql    = "select * from " . $xoopsDB->prefix("tad_web_link") . " where LinkID='$LinkID'";
        $result = $xoopsDB->query($sql) or redirect_header($_SERVER['PHP_SELF'], 3, mysql_error());
        $data   = $xoopsDB->fetchArray($result);
        return $data;
    }
}