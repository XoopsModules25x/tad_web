<?php
include_once XOOPS_ROOT_PATH . "/modules/tad_web/plugins/aboutus/langs/{$xoopsConfig['language']}.php";
$pluginConfig['name']   = _MD_TCW_ABOUTUS;
$pluginConfig['short']  = _MD_TCW_ABOUTUS_SHORT;
$pluginConfig['icon']   = 'fa-smile-o';
$pluginConfig['limit']  = '';
$pluginConfig['cate']   = false;
$pluginConfig['common'] = true;
$pluginConfig['sql']    = array('tad_web_link_mems', 'tad_web_mems');