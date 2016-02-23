<?php
$blocksArr = '';

$blocksArr['list_news']['name']                = _MD_TCW_NEWS_BLOCK_LIST;
$blocksArr['list_news']['tpl']                 = 'list_news.html';
$blocksArr['list_news']['position']            = 'block1';
$blocksArr['list_news']['config']['limit']     = 5;
$blocksArr['list_news']['colset']['limit']     = array('label' => _MD_TCW_NEWS_BLOCK_LIMIT, 'type' => 'text');
$blocksArr['list_news']['config']['show_mode'] = 'one_big';
$blocksArr['list_news']['colset']['show_mode'] = array('label' => _MD_TCW_NEWS_BLOCK_SHOW_MODE, 'type' => 'select', 'options' => array(_MD_TCW_NEWS_BLOCK_SHOW_MODE1 => 'one_big', _MD_TCW_NEWS_BLOCK_SHOW_MODE2 => 'full', _MD_TCW_NEWS_BLOCK_SHOW_MODE3 => 'list'));

$blocksArr['news_rss']['name']                  = _MD_TCW_NEWS_BLOCK_RSS;
$blocksArr['news_rss']['tpl']                   = 'news_rss.html';
$blocksArr['news_rss']['position']              = 'block1';
$blocksArr['news_rss']['config']['height']      = 400;
$blocksArr['news_rss']['colset']['height']      = array('label' => _MD_TCW_NEWS_BLOCK_RSS_HEIGHT, 'type' => 'text');
$blocksArr['news_rss']['config']['feed_url']    = 'http://class.tn.edu.tw/modules/tad_web/rss.php?WebID=10';
$blocksArr['news_rss']['colset']['feed_url']    = array('label' => _MD_TCW_NEWS_BLOCK_RSS_LINK, 'type' => 'text');
$blocksArr['news_rss']['config']['display_rss'] = 'on';
$blocksArr['news_rss']['colset']['display_rss'] = array('label' => _MD_TCW_NEWS_BLOCK_RSS_DISPLAY, 'type' => 'radio', 'options' => array(_MD_TCW_NEWS_BLOCK_RSS_DISPLAY_ALL => 'on', _MD_TCW_NEWS_BLOCK_RSS_DISPLAY_TITLE => 'title_only'));

$blockConfig['news'] = $blocksArr;
