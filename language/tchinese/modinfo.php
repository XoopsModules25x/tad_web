<?php
include_once XOOPS_ROOT_PATH . "/modules/tadtools/language/{$xoopsConfig['language']}/modinfo_common.php";

define("_MI_TCW_NAME", "�h�H�����t��");
define("_MI_TCW_AUTHOR", "tad(tad0616@gmail.com)");
define("_MI_TCW_CREDITS", "tad");
define("_MI_TCW_DESC", "XOOPS�h�H�����t�ΡA�i�Ψӷ�@�Z�ź����A�Ϊ̨ϥΪ̪��ӤH����");

define('_MI_TCW_ABOUTUS', '����ڭ�');
define('_MI_TCW_NEWS', '�̷s����');
define('_MI_TCW_ACTION', '���ʰżv');
define('_MI_TCW_VIDEO', '�v��');
define('_MI_TCW_FILES', '�U��');
define('_MI_TCW_LINK', '�`�κ���');
define('_MI_TCW_DISCUSS', '�d��ï');

define('_MI_TCW_ADMENU1', '�����޲z');
define('_MI_TCW_ADMENU2', '��������');
define('_MI_TCW_ADMENU3', '�����]�w');
define('_MI_TCW_ADMENU4', '�ϥΪŶ�');
define('_MI_TCW_ADMENU5', '�Ҫ�˪O');
define('_MI_TCW_ADMENU6', '����q��');

define("_MI_TCW_BNAME1", "�����C����");
define("_MI_TCW_BDESC1", "�C�X�Ҧ��ӤH���������");

define("_MI_TCW_BNAME2", "�̷s�Q��");
define("_MI_TCW_BDESC2", "�̷s�Q��");

define("_MI_TCW_BNAME3", "���ʰżv");
define("_MI_TCW_BDESC3", "���ʰżv");

define("_MI_TCW_BNAME4", "���");
define("_MI_TCW_BDESC4", "���");

define("_MI_TCW_WEB_MODE_TITLE", "�Ҳխ������D");
define("_MI_TCW_WEB_MODE_DESC", "���Ҳխ������e�{�����D");
define("_MI_TCW_WEB_MODE_DEF", "�Z�ź����@��");

define('_MI_TCW_WEB_DIRNAME', basename(dirname(dirname(__DIR__))));
define('_MI_TCW_WEB_HELP_HEADER', __DIR__ . '/help/helpheader.tpl');
define('_MI_TCW_WEB_BACK_2_ADMIN', '�޲z');

//help
define('_MI_TCW_WEB_HELP_OVERVIEW', '���n');

define('_MI_TCW_WEB_SCHEDULE_TEMPLATE', '�\�Ҫ�˪O');
define('_MI_TCW_WEB_SCHEDULE_TEMPLATE_DESC', '�ŰʡA�Хѫ�x�u<a href="' . XOOPS_URL . '/modules/tad_web/admin/schedule.php">�Ҫ�˪O</a>�v�ק蠟');
define('_MI_TCW_WEB_SCHEDULE_TEMPLATE_DEF', '<table class="table table-bordered schedule_table">
    <tbody>
        <tr>
            <td class="schedule_head"><strong>�ɶ�</strong></td>
            <td class="schedule_head"><strong>�`</strong></td>
            <td class="schedule_head"><strong>�@</strong></td>
            <td class="schedule_head"><strong>�G</strong></td>
            <td class="schedule_head"><strong>�T</strong></td>
            <td class="schedule_head"><strong>�|</strong></td>
            <td class="schedule_head"><strong>��</strong></td>
            <td class="schedule_head"><strong>��</strong></td>
        </tr>
        <tr>
            <td class="schedule_time">08:00~08:40</td>
            <td class="schedule_section">&nbsp;</td>
            <td class="schedule_cell">�ɮv�ɶ�</td>
            <td class="schedule_cell">�ɮv�ɶ�</td>
            <td class="schedule_cell">�ɮv�ɶ�</td>
            <td class="schedule_cell">�ɮv�ɶ�</td>
            <td class="schedule_cell">�ɮv�ɶ�</td>
            <td class="schedule_cell">�ɮv�ɶ�</td>
        </tr>
        <tr>
            <td class="schedule_time">08:40~09:20</td>
            <td class="schedule_section">�@</td>
            <td class="schedule_cell">{1-1}</td>
            <td class="schedule_cell">{2-1}</td>
            <td class="schedule_cell">{3-1}</td>
            <td class="schedule_cell">{4-1}</td>
            <td class="schedule_cell">{5-1}</td>
            <td class="schedule_cell">{6-1}</td>
        </tr>
        <tr>
            <td class="schedule_time">09:30~10:10</td>
            <td class="schedule_section">�G</td>
            <td class="schedule_cell">{1-2}</td>
            <td class="schedule_cell">{2-2}</td>
            <td class="schedule_cell">{3-2}</td>
            <td class="schedule_cell">{4-2}</td>
            <td class="schedule_cell">{5-2}</td>
            <td class="schedule_cell">{6-2}</td>
        </tr>
        <tr>
            <td class="schedule_time">10:30~11:10</td>
            <td class="schedule_section">�T</td>
            <td class="schedule_cell">{1-3}</td>
            <td class="schedule_cell">{2-3}</td>
            <td class="schedule_cell">{3-3}</td>
            <td class="schedule_cell">{4-3}</td>
            <td class="schedule_cell">{5-3}</td>
            <td class="schedule_cell">{6-3}</td>
        </tr>
        <tr>
            <td class="schedule_time">11:20~12:00</td>
            <td class="schedule_section">�|</td>
            <td class="schedule_cell">{1-4}</td>
            <td class="schedule_cell">{2-4}</td>
            <td class="schedule_cell">{3-4}</td>
            <td class="schedule_cell">{4-4}</td>
            <td class="schedule_cell">{5-4}</td>
            <td class="schedule_cell">{6-4}</td>
        </tr>
        <tr>
            <td class="schedule_time">12:00~12:40</td>
            <td class="schedule_section">&nbsp;</td>
            <td class="schedule_note" colspan="6" rowspan="1">���\�ɶ�</td>
        </tr>
        <tr>
            <td class="schedule_time">12:40~13:30</td>
            <td class="schedule_section">&nbsp;</td>
            <td class="schedule_note" colspan="6" rowspan="1">�ȥ�ɶ�</td>
        </tr>
        <tr>
            <td class="schedule_time">13:40~14:20</td>
            <td class="schedule_section">��</td>
            <td class="schedule_cell">{1-5}</td>
            <td class="schedule_cell">{2-5}</td>
            <td class="schedule_cell">{3-5}</td>
            <td class="schedule_cell">{4-5}</td>
            <td class="schedule_cell">{5-5}</td>
            <td class="schedule_cell">&nbsp;</td>
        </tr>
        <tr>
            <td class="schedule_time">14:30~15:10</td>
            <td class="schedule_section">��</td>
            <td class="schedule_cell">{1-6}</td>
            <td class="schedule_cell">{2-6}</td>
            <td class="schedule_cell">{3-6}</td>
            <td class="schedule_cell">{4-6}</td>
            <td class="schedule_cell">{5-6}</td>
            <td class="schedule_cell">&nbsp;</td>
        </tr>
        <tr>
            <td class="schedule_time">15:20~16:00</td>
            <td class="schedule_section">�C</td>
            <td class="schedule_cell">{1-7}</td>
            <td class="schedule_cell">{2-7}</td>
            <td class="schedule_cell">{3-7}</td>
            <td class="schedule_cell">{4-7}</td>
            <td class="schedule_cell">{5-7}</td>
            <td class="schedule_cell">&nbsp;</td>
        </tr>
        <tr>
            <td class="schedule_time">&nbsp;</td>
            <td class="schedule_section">�K</td>
            <td class="schedule_cell">{1-8}</td>
            <td class="schedule_cell">{2-8}</td>
            <td class="schedule_cell">{3-8}</td>
            <td class="schedule_cell">{4-8}</td>
            <td class="schedule_cell">{5-8}</td>
            <td class="schedule_cell">&nbsp;</td>
        </tr>
    </tbody>
</table>');

define('_MI_TCW_WEB_SCHEDULE_SUBJECTS', '�\�Ҫ��س]�w');
define('_MI_TCW_WEB_SCHEDULE_SUBJECTS_DESC', '�ŰʡA�Хѫ�x�u<a href="' . XOOPS_URL . '/modules/tad_web/admin/schedule.php">�Ҫ�˪O</a>�v�ק蠟');
define('_MI_TCW_WEB_SCHEDULE_SUBJECTS_DEF', '��y;�ƾ�;���|;�۵M;����;��|;����;���鬡��;���ɬ���;�m�g�о�;�D�w�P���d');
define('_MI_TADWEB_ABOUTUS_MODE', '�`�������C��e�{�Ҧ�');
define('_MI_TADWEB_ABOUTUS_MODE_DESC', '�]�w�`�������C��e�{�Ҧ�');
define('_MI_TADWEB_ABOUTUS_MODE_KEY1', '�H��');
define('_MI_TADWEB_ABOUTUS_MODE_KEY2', '�����W��');
define('_MI_TADWEB_ABOUTUS_MODE_KEY3', '�\�Ҫ�');
define('_MI_TADWEB_ABOUTUS_MODE_KEY4', '�p��ï');

define('_MI_TADWEB_CAL_COLS', '������ƾ���ܤ��e');
define('_MI_TADWEB_CAL_COLS_DESC', '�]�w������ƾ����ܪ����e');
define('_MI_TADWEB_CAL_COLS_KEY1', '�����ƥ�');
define('_MI_TADWEB_CAL_COLS_KEY2', '�l���ƥ�');
define('_MI_TADWEB_CAL_COLS_KEY3', '�s�D�ƥ�');
define('_MI_TADWEB_CAL_COLS_KEY4', '�p��ï');

define('_MI_TADWEB_USER_SPACE_QUOTA', '�l�����i�ϥεw�ЪŶ��W��');
define('_MI_TADWEB_USER_SPACE_QUOTA_DESC', '��쬰MB�A��J�Ʀr�Y�i');
define('_MI_TCW_LIST_WEB_TEXT', '�����C��ƧǨ̾�');
define('_MI_TCW_LIST_WEB_DESC', '�`���������C���ƧǨ̾�');
define('_MI_TCW_LIST_WEB_OPT1', '���ӫ��w����');
define('_MI_TCW_LIST_WEB_OPT2', '���ӤH��Ѥp��j');
define('_MI_TCW_LIST_WEB_OPT3', '���ӤH��Ѥj��p');
define('_MI_TCW_LIST_WEB_OPT4', '���ӫد�������¨�s');
define('_MI_TCW_LIST_WEB_OPT5', '���ӫد�����ѷs����');
