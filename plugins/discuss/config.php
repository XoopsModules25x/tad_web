<?php
include_once XOOPS_ROOT_PATH . "/modules/tad_web/plugins/discuss/langs/{$xoopsConfig['language']}.php";
$pluginConfig['name']   = _MD_TCW_DISCUSS;
$pluginConfig['short']  = _MD_TCW_DISCUSS_SHORT;
$pluginConfig['icon']   = 'fa-comments';
$pluginConfig['limit']  = '5';
$pluginConfig['cate']   = true;
$pluginConfig['common'] = true;
$pluginConfig['sql']    = array('tad_web_discuss');
