<?php
include_once XOOPS_ROOT_PATH . "/modules/tad_web/plugins/news/langs/{$xoopsConfig['language']}.php";
$pluginConfig['name']   = _MD_TCW_NEWS;
$pluginConfig['short']  = _MD_TCW_NEWS_SHORT;
$pluginConfig['icon']   = 'fa-newspaper-o';
$pluginConfig['limit']  = '5';
$pluginConfig['cate']   = true;
$pluginConfig['common'] = true;
$pluginConfig['sql']    = array('tad_web_news');
