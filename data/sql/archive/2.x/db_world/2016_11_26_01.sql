-- DB update 2016_11_26_00 -> 2016_11_26_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS 
FROM information_schema.COLUMNS 
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2016_11_26_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2016_11_26_00 2016_11_26_01 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1479653240477084000'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--
INSERT INTO version_db_world (`sql_rev`) VALUES ('1479653240477084000');

DROP TABLE IF EXISTS `creature_questitem`;
CREATE TABLE `creature_questitem` (
  `CreatureEntry` int(10) unsigned NOT NULL DEFAULT '0',
  `Idx` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureEntry`,`Idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `gameobject_questitem`;
CREATE TABLE `gameobject_questitem` (
  `GameObjectEntry` int(10) unsigned NOT NULL DEFAULT '0',
  `Idx` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`GameObjectEntry`,`Idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO gameobject_questitem (`GameObjectEntry`, `Idx`, `ItemId`)
(SELECT gameobject_template.entry, 0, gameobject_template.questItem1 FROM gameobject_template WHERE gameobject_template.questItem1 != 0);
INSERT INTO gameobject_questitem (`GameObjectEntry`, `Idx`, `ItemId`)
(SELECT gameobject_template.entry, 1, gameobject_template.questItem2 FROM gameobject_template WHERE gameobject_template.questItem2 != 0);
INSERT INTO gameobject_questitem (`GameObjectEntry`, `Idx`, `ItemId`)
(SELECT gameobject_template.entry, 2, gameobject_template.questItem3 FROM gameobject_template WHERE gameobject_template.questItem3 != 0);
INSERT INTO gameobject_questitem (`GameObjectEntry`, `Idx`, `ItemId`)
(SELECT gameobject_template.entry, 3, gameobject_template.questItem4 FROM gameobject_template WHERE gameobject_template.questItem4 != 0);
INSERT INTO gameobject_questitem (`GameObjectEntry`, `Idx`, `ItemId`)
(SELECT gameobject_template.entry, 4, gameobject_template.questItem5 FROM gameobject_template WHERE gameobject_template.questItem5 != 0);
INSERT INTO gameobject_questitem (`GameObjectEntry`, `Idx`, `ItemId`)
(SELECT gameobject_template.entry, 5, gameobject_template.questItem6 FROM gameobject_template WHERE gameobject_template.questItem6 != 0);

INSERT INTO creature_questitem (`CreatureEntry`, `Idx`, `ItemId`)
(SELECT creature_template.entry, 0, creature_template.questItem1 FROM creature_template WHERE creature_template.questItem1 != 0);
INSERT INTO creature_questitem (`CreatureEntry`, `Idx`, `ItemId`)
(SELECT creature_template.entry, 1, creature_template.questItem2 FROM creature_template WHERE creature_template.questItem2 != 0);
INSERT INTO creature_questitem (`CreatureEntry`, `Idx`, `ItemId`)
(SELECT creature_template.entry, 2, creature_template.questItem3 FROM creature_template WHERE creature_template.questItem3 != 0);
INSERT INTO creature_questitem (`CreatureEntry`, `Idx`, `ItemId`)
(SELECT creature_template.entry, 3, creature_template.questItem4 FROM creature_template WHERE creature_template.questItem4 != 0);
INSERT INTO creature_questitem (`CreatureEntry`, `Idx`, `ItemId`)
(SELECT creature_template.entry, 4, creature_template.questItem5 FROM creature_template WHERE creature_template.questItem5 != 0);
INSERT INTO creature_questitem (`CreatureEntry`, `Idx`, `ItemId`)
(SELECT creature_template.entry, 5, creature_template.questItem6 FROM creature_template WHERE creature_template.questItem6 != 0);

ALTER TABLE `creature_template` DROP `questItem1`, DROP `questItem2`, DROP `questItem3`, DROP `questItem4`, DROP `questItem5`, DROP `questItem6`;
ALTER TABLE `gameobject_template` DROP `questItem1`, DROP `questItem2`, DROP `questItem3`, DROP `questItem4`, DROP `questItem5`, DROP `questItem6`;
--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
