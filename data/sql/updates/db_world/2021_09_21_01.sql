-- Inmune mask add Freya --

UPDATE creature_template SET mechanic_immune_mask=617294619 WHERE entry IN (32916,33400,32918,33399);
UPDATE creature_template SET mechanic_immune_mask=mechanic_immune_mask &~2048 WHERE entry IN (32918,33399);
