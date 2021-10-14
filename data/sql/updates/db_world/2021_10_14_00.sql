
-- Tras el minitesteo se detecto que le faltaban mas inmunidades a los add de freya
-- adds
UPDATE creature_template SET mechanic_immune_mask=617299803 WHERE entry IN (32919, 33401);
UPDATE creature_template SET flags_extra=2097153 WHERE entry IN (32919, 33401);
UPDATE creature_template SET flags_extra=2097153 WHERE entry IN (33202, 33398);
UPDATE creature_template SET flags_extra=2097153 WHERE entry IN (32916, 33400);

