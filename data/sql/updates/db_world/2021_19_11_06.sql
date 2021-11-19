DELETE FROM creature_loot_template WHERE Entry= 18436 AND Reference= 43005;
DELETE FROM creature_loot_template WHERE Entry= 18436 AND Reference= 190001;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `GroupId`, `Comment`) VALUES ('18436', '1', '190001', '8', '2', 'gema azul rojo amarillo'); 

DELETE FROM creature_loot_template WHERE Entry= 18436 AND Reference= 190002;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `GroupId`, `Comment`) VALUES ('18436', '2', '190002', '8', '2', 'gema naranja verde morada'); 

DELETE FROM creature_loot_template WHERE Entry= 18436 AND Item= 29434;
DELETE FROM creature_loot_template WHERE Entry= 18436 AND Item= 40753;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES ('18436', '40753', '0', '100', '1', '0', '1', '1', 'emblema de valor'); 



DELETE FROM creature_loot_template WHERE Entry= 18433 AND Reference= 43000;
DELETE FROM creature_loot_template WHERE Entry= 18433 AND Reference= 190001;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `GroupId`, `Comment`) VALUES ('18433', '1', '190001', '8', '2', 'gema azul rojo amarillo'); 

DELETE FROM creature_loot_template WHERE Entry= 18433 AND Reference= 43005;
DELETE FROM creature_loot_template WHERE Entry= 18433 AND Reference= 190002;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `GroupId`, `Comment`) VALUES ('18433', '2', '190002', '8', '2', 'gema naranja verde morada'); 

DELETE FROM creature_loot_template WHERE Entry= 18433 AND Item= 29434;
DELETE FROM creature_loot_template WHERE Entry= 18433 AND Item= 40753;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES ('18433', '40753', '0', '100', '1', '0', '1', '1', 'emblema de valor'); 



DELETE FROM gameobject_loot_template WHERE Entry= 21764 AND Reference= 190002;
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `GroupId`, `Comment`) VALUES ('21764', '2', '190002', '8', '0', 'gema naranja verde morada'); 

DELETE FROM gameobject_loot_template WHERE Entry= 21764 AND Reference= 35094;
DELETE FROM gameobject_loot_template WHERE Entry= 21764 AND Reference= 190001;
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `GroupId`, `Comment`) VALUES ('21764', '4', '190001', '8', '0', 'gema azul rojo amarillo'); 


DELETE FROM gameobject_loot_template WHERE Entry= 21764 AND Item= 29434;
DELETE FROM gameobject_loot_template WHERE Entry= 21764 AND Item= 45624;
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES ('21764', '45624', '0', '100', '1', '0', '1', '1', 'emblema de conquista'); 

