-- Inmunes adds Tajoescama --

UPDATE creature_template SET mechanic_immune_mask=617294619 WHERE entry IN (33388,33850,33453,33851);
UPDATE creature_template SET mechanic_immune_mask=mechanic_immune_mask &~2048 WHERE entry IN (33388,33850,33453,33851);
