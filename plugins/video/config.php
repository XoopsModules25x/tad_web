<?php
include_once XOOPS_ROOT_PATH . "/modules/tad_web/plugins/video/langs/{$xoopsConfig['language']}.php";
$pluginConfig['name']   = _MD_TCW_VIDEO;
$pluginConfig['short']  = _MD_TCW_VIDEO_SHORT;
$pluginConfig['icon']   = 'fa-film';
$pluginConfig['limit']  = '5';
$pluginConfig['cate']   = true;
$pluginConfig['common'] = true;
$pluginConfig['sql']    = array('tad_web_video');