CREATE TABLE `tad_web_files` (
  `fsn` smallint(5) unsigned NOT NULL auto_increment COMMENT '檔案流水號',
  `CateID` smallint(6) unsigned NOT NULL default 0,
  `WebID` smallint(6) unsigned NOT NULL default 0 COMMENT '所屬班級',
  `uid` mediumint(8) unsigned NOT NULL default 0 COMMENT '上傳者',
  `file_date` datetime NOT NULL default '0000-00-00 00:00:00' COMMENT '日期',
PRIMARY KEY (`fsn`)
) ENGINE=MyISAM;
