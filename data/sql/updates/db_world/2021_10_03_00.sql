-- Correccion a los daños adds freya
-- Ahora tienen daño magico
UPDATE creature_template SET mindmg=3474, maxdmg=5311 WHERE entry IN (32919);
UPDATE creature_template SET mindmg=7648, maxdmg=10381 WHERE entry IN (33401); 
UPDATE creature_template SET mindmg=3474, maxdmg=5311 WHERE entry IN (33202);
UPDATE creature_template SET mindmg=7648, maxdmg=10381 WHERE entry IN (33398);
