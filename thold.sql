DROP TABLE IF EXISTS `thold_data`;
CREATE TABLE `thold_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `rra_id` int(11) NOT NULL DEFAULT '0',
  `data_id` int(11) NOT NULL DEFAULT '0',
  `graph_id` int(11) NOT NULL DEFAULT '0',
  `graph_template` int(11) NOT NULL DEFAULT '0',
  `data_template` int(11) NOT NULL DEFAULT '0',
  `thold_hi` varchar(100) DEFAULT NULL,
  `thold_low` varchar(100) DEFAULT NULL,
  `thold_fail_trigger` int(10) unsigned DEFAULT NULL,
  `thold_fail_count` int(11) NOT NULL DEFAULT '0',
  `time_hi` varchar(100) DEFAULT NULL,
  `time_low` varchar(100) DEFAULT NULL,
  `time_fail_trigger` int(12) NOT NULL DEFAULT '1',
  `time_fail_length` int(12) NOT NULL DEFAULT '1',
  `thold_warning_hi` varchar(100) DEFAULT NULL,
  `thold_warning_low` varchar(100) DEFAULT NULL,
  `thold_warning_fail_trigger` int(10) unsigned DEFAULT NULL,
  `thold_warning_fail_count` int(11) NOT NULL DEFAULT '0',
  `time_warning_hi` varchar(100) DEFAULT NULL,
  `time_warning_low` varchar(100) DEFAULT NULL,
  `time_warning_fail_trigger` int(12) NOT NULL DEFAULT '1',
  `time_warning_fail_length` int(12) NOT NULL DEFAULT '1',
  `thold_alert` int(1) NOT NULL DEFAULT '0',
  `thold_enabled` enum('on','off') NOT NULL DEFAULT 'on',
  `thold_type` int(3) NOT NULL DEFAULT '0',
  `bl_enabled` enum('on','off') NOT NULL DEFAULT 'off',
  `bl_ref_time_range` int(10) unsigned DEFAULT NULL,
  `bl_pct_down` int(10) unsigned DEFAULT NULL,
  `bl_pct_up` int(10) unsigned DEFAULT NULL,
  `bl_fail_trigger` int(10) unsigned DEFAULT NULL,
  `bl_fail_count` int(11) unsigned DEFAULT NULL,
  `bl_alert` int(2) NOT NULL DEFAULT '0',
  `lastread` varchar(100) DEFAULT NULL,
  `oldvalue` varchar(100) DEFAULT NULL,
  `repeat_alert` int(10) unsigned DEFAULT NULL,
  `notify_default` enum('on','off') DEFAULT NULL,
  `notify_extra` varchar(512) DEFAULT NULL,
  `notify_warning_extra` varchar(512) DEFAULT NULL,
  `host_id` int(10) DEFAULT NULL,
  `syslog_priority` int(2) NOT NULL DEFAULT '3',
  `data_type` int(12) NOT NULL DEFAULT '0',
  `cdef` int(11) NOT NULL DEFAULT '0',
  `percent_ds` varchar(64) NOT NULL DEFAULT '',
  `expression` varchar(70) NOT NULL DEFAULT '',
  `template` int(11) NOT NULL DEFAULT '0',
  `template_enabled` char(3) NOT NULL DEFAULT '',
  `tcheck` int(1) NOT NULL DEFAULT '0',
  `exempt` char(3) NOT NULL DEFAULT 'off',
  `restored_alert` char(3) NOT NULL DEFAULT 'off',
  `bl_thold_valid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `host_id` (`host_id`),
  KEY `rra_id` (`rra_id`),
  KEY `data_id` (`data_id`),
  KEY `graph_id` (`graph_id`),
  KEY `template` (`template`),
  KEY `thold_enabled` (`thold_enabled`),
  KEY `template_enabled` (`template_enabled`),
  KEY `tcheck` (`tcheck`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Threshold data';

DROP TABLE IF EXISTS `thold_template`;
CREATE TABLE `thold_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `data_template_id` int(10) NOT NULL DEFAULT '0',
  `data_template_name` varchar(100) NOT NULL DEFAULT '',
  `data_source_id` int(10) NOT NULL DEFAULT '0',
  `data_source_name` varchar(100) NOT NULL DEFAULT '',
  `data_source_friendly` varchar(100) NOT NULL DEFAULT '',
  `thold_hi` varchar(100) DEFAULT NULL,
  `thold_low` varchar(100) DEFAULT NULL,
  `thold_fail_trigger` int(10) unsigned DEFAULT NULL,
  `time_hi` varchar(100) DEFAULT NULL,
  `time_low` varchar(100) DEFAULT NULL,
  `time_fail_trigger` int(12) NOT NULL DEFAULT '1',
  `time_fail_length` int(12) NOT NULL DEFAULT '1',
  `thold_warning_hi` varchar(100) DEFAULT NULL,
  `thold_warning_low` varchar(100) DEFAULT NULL,
  `thold_warning_fail_trigger` int(10) unsigned DEFAULT NULL,
  `time_warning_hi` varchar(100) DEFAULT NULL,
  `time_warning_low` varchar(100) DEFAULT NULL,
  `time_warning_fail_trigger` int(12) NOT NULL DEFAULT '1',
  `time_warning_fail_length` int(12) NOT NULL DEFAULT '1',
  `thold_enabled` enum('on','off') NOT NULL DEFAULT 'on',
  `thold_type` int(3) NOT NULL DEFAULT '0',
  `bl_enabled` enum('on','off') NOT NULL DEFAULT 'off',
  `bl_ref_time_range` int(10) unsigned DEFAULT NULL,
  `bl_pct_down` int(10) unsigned DEFAULT NULL,
  `bl_pct_up` int(10) unsigned DEFAULT NULL,
  `bl_fail_trigger` int(10) unsigned DEFAULT NULL,
  `bl_fail_count` int(11) unsigned DEFAULT NULL,
  `bl_alert` int(2) NOT NULL DEFAULT '0',
  `repeat_alert` int(10) unsigned DEFAULT NULL,
  `notify_default` enum('on','off') DEFAULT NULL,
  `notify_extra` varchar(512) DEFAULT NULL,
  `notify_warning_extra` varchar(512) DEFAULT NULL,
  `data_type` int(12) NOT NULL DEFAULT '0',
  `cdef` int(11) NOT NULL DEFAULT '0',
  `percent_ds` varchar(64) NOT NULL DEFAULT '',
  `exempt` char(3) NOT NULL DEFAULT 'off',
  `restored_alert` char(3) NOT NULL DEFAULT 'off',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `data_source_id` (`data_source_id`),
  KEY `data_template_id` (`data_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Table of thresholds defaults for graphs';

DROP TABLE IF EXISTS `plugin_thold_template_contact`;
CREATE TABLE plugin_thold_template_contact (
  template_id int(12) NOT NULL,
  contact_id int(12) NOT NULL,
  KEY template_id (template_id),
  KEY contact_id (contact_id)
) TYPE=MyISAM COMMENT='Table of Tholds Template Contacts';

DROP TABLE IF EXISTS `plugin_thold_threshold_contact`;
CREATE TABLE plugin_thold_threshold_contact (
  thold_id int(12) NOT NULL,
  contact_id int(12) NOT NULL,
  KEY thold_id (thold_id),
  KEY contact_id (contact_id)
) TYPE=MyISAM COMMENT='Table of Tholds Threshold Contacts';

DROP TABLE IF EXISTS `plugin_thold_contacts`;
CREATE TABLE plugin_thold_contacts (
  `id` int(12) NOT NULL auto_increment,
  `user_id` int(12) NOT NULL,
  `type` varchar(32) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`),
  KEY `user_id` (`user_id`)
) TYPE=MyISAM;

DROP TABLE `plugin_thold_log`;
CREATE TABLE `plugin_thold_log` (
  `id` int(12) NOT NULL auto_increment,
  `time` int(24) NOT NULL,
  `host_id` int(10) NOT NULL,
  `graph_id` int(10) NOT NULL,
  `threshold_id` int(10) NOT NULL,
  `threshold_value` varchar(64) NOT NULL,
  `current` varchar(64) NOT NULL,
  `status` int(5) NOT NULL,
  `type` int(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `time` (`time`),
  KEY `host_id` (`host_id`),
  KEY `graph_id` (`graph_id`),
  KEY `threshold_id` (`threshold_id`),
  KEY `status` (`status`),
  KEY `type` (`type`)
) ENGINE=MyISAM COMMENT='Table of All Threshold Breaches';

REPLACE INTO user_auth_realm VALUES (18, 1);
REPLACE INTO user_auth_realm VALUES (19, 1);

REPLACE INTO settings VALUES ('alert_bl_past_default',86400);
REPLACE INTO settings VALUES ('alert_bl_timerange_def',10800);
REPLACE INTO settings VALUES ('alert_bl_percent_def',20);
REPLACE INTO settings VALUES ('alert_bl_trigger',3);
