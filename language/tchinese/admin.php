<?php
include_once '../../tadtools/language/' . $xoopsConfig['language'] . '/admin_common.php';

//main.php
define("_MA_TCW_TEAMID", "�s��");
define("_MA_TCW_TEAMNAME", "�����W��");
define("_MA_TCW_TEAMSORT", "�Ƨ�");
define("_MA_TCW_TEAMENABLE", "���A");
define("_MA_TCW_TEAMCOUNTER", "�H��");
define("_MA_TCW_MEM_AMOUNT", "�����H��");
define("_MA_TCW_TEAMLEADER", "�֦���");
define("_MA_TCW_TEAMTITLE", "�����W��");
define("_MA_TCW_MAIN_TITLE", "�ӤH�����޲z");
define("_MA_TCW_GROUP_NAME", "XOOPS�ӤH�����s��");
define("_MA_TCW_GROUP_DESC", "�Фŭק�s�զW�١A�_�h�|�y���ҲչB�@�����T�C");
define("_MA_TCW_CREATE_BY_USER", "�妸�s�W");
define("_MA_TCW_SOMEBODY_WEB", "%s���M�κ���");
define("_MA_TCW_WILL_DEL", "�N�R���H�U��ơG");
define("_MA_TCW_DEL_MEM", "�������");
define("_MA_TCW_DEL_LINK", "�n���s�����");
define("_MA_TCW_DEL_NEWS", "�̷s�������");
define("_MA_TCW_DEL_ACTION", "���ʰżv���");
define("_MA_TCW_DEL_FILES", "�ɮפU�����");
define("_MA_TCW_DEL_VIDEOS", "�u�W�v�����");
define("_MA_TCW_DEL_DISCUSS", "�d���Q�׸��");
define("_MA_TCW_DELETE", "�T�w�R���]���R�N���O���s�����}�Y�i�^");
define("_MA_TCW_UPLOAD_OWNER_PIC", "�W�ǭ�������");
define("_MA_TCW_ORDER_BY_TEAMTITLE", "�̥����W�ٱƧ�");

//save_sort.php save.php
define("_MA_TCW_UPDATE_FAIL", "��s���ѡI");
define("_MA_TCW_SAVE_SORT_OK", "�Ƨǧ����I ");
define("_MA_TCW_NEED_TAD_WEB_THEME", "<ul><li style='line-height:2;'>���Ҳջݭn�f�t <a href='http://120.115.2.90/modules/tad_modules/index.php?module_sn=77' target='_blank'>for_tad_web_theme �G��</a>�C</li><li style='line-height:2;'>�ӧG���u�ݭn�����Y��� themes �ؿ����U�Y�i�A�L���ܰ��n�]�w��ΡC</li><li style='line-height:2;'>��i<a href='" . XOOPS_URL . "/modules/tad_adm/admin/main.php'>�q�����u��c�����w��</a></li></ul>");

define('_MA_TADWEB_CATEID', '�s��');
define('_MA_TADWEB_WEBID', '���ݯZ��');
define('_MA_TADWEB_CATENAME', '�����W��');
define('_MA_TADWEB_COLNAME', '�������W��');
define('_MA_TADWEB_COLSN', '��������');
define('_MA_TADWEB_CATESORT', '�Ƨ�');
define('_MA_TADWEB_CATEENABLE', '���A');
define('_MA_TADWEB_CATECOUNTER', '�H��');
define('_MA_TCW_SELECT_CATE', '������');
define('_MA_TCW_DISK_TOTAL_SPACE_STATUS', '�����ϥΪŶ��@��');
define('_MA_TCW_DISK_TOTAL_SPACE', '�����w�ϥΪŶ�');
define('_MA_TCW_DISK_PATH', '�ӤH�����s��ؿ�');
define('_MA_TCW_DISK_SPACE_TOTAL', '�w�ϥΡG');
define('_MA_TCW_DISK_AVAILABLE_SPACE', '�A�i�ΪŶ��G');

define('_MA_TCW_WEB_SCHEDULE_TEMPLATE', '�]�w�\�Ҫ�˪O');
define('_MA_TCW_WEB_SCHEDULE_TEMPLATE_DESC', '
  <p>{�g-�`} ���ɦb�e�x�|���ܬ��i���Ѯv��J�����C</p>
  <p>�i�ھ� {�g-�`} �W�h�A�ۦ�s�W���ҡA���ݭn���]�i�H�����A�Ҧp�ĤK�`�]�����C�^�άP�����]������^�C</p>
  <p>�g��~�g���A���O��0~6�C�p�P����Ĥ@�`�� {0-1}�A�P�����Ĥ��`�� {6-5}�C</p>
  <p>���F {�g-�`} ���Ҥ��n�s��H�~�A��L����ۦ�ק�C</p>
  <p>�Y���վ��C��A�i�ۦ�ק� ' . XOOPS_ROOT_PATH . '/modules/tad_web/plugins/schedule/schedule.css �ɮפ��e</p>');

define('_MA_TCW_WEB_SCHEDULE_SUBJECT', '�]�w��ء]�ѦѮv��Ρ^');
define('_MA_TCW_WEB_SCHEDULE_SUBJECT_DESC', '����p�ǱоǬ�ءG(11��)<br>
��y;�ƾ�;���|;�۵M;����;��|;����;���鬡��;���ɬ���;�m�g�о�;�D�w�P���d<br>
������ǱоǬ�ءG(21��) <br>
���;�^�y;�ƾ�;���v;�a�z;�ͪ�;�z��;�a�y���;���d�Ш|;�{�ѻO�W;�����P�D�w;�a�F�P�ͬ����;�q��;��|;����;���N;���x�Ш|;�m�g���N����;���ɬ���;���鬡��;��׬��');
