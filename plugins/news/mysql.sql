CREATE TABLE `tad_web_news` (
  `NewsID` smallint(6) unsigned NOT NULL auto_increment COMMENT '編號',
  `CateID` smallint(6) unsigned NOT NULL default 0,
  `WebID` smallint(6) unsigned NOT NULL default 0 COMMENT '所屬班級',
  `NewsTitle` varchar(255) NOT NULL default '' COMMENT '標題',
  `NewsContent` longtext NOT NULL COMMENT '內容',
  `NewsDate` datetime NOT NULL COMMENT '發布日期',
  `toCal` datetime NOT NULL COMMENT '加到行事曆',
  `NewsUrl` varchar(255) NOT NULL default '' COMMENT '相關連結',
  `NewsCounter` smallint(6) unsigned NOT NULL default 0 COMMENT '人氣',
  `NewsEnable` enum('1','0')  NOT NULL default '1' COMMENT '狀態',
  `uid` mediumint(8) unsigned NOT NULL default 0 COMMENT '發布者',
PRIMARY KEY (`NewsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
