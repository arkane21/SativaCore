-- fix martillo de thorim
UPDATE creature SET position_x=2135.02 WHERE id IN (32865);
UPDATE creature SET position_y=-289.65 WHERE id IN (32865);
-- fix rayo de la muerte
UPDATE creature_template SET InhabitType=1 WHERE entry IN (33882);
-- fix ataques magicos faltantes en freya
UPDATE creature_template SET dmgschool=4 WHERE entry IN (33202,33398);
UPDATE creature_template SET dmgschool=3 WHERE entry IN (32919,33401);
-- thorim y adds de yoggsaron no tenian ap
UPDATE creature_template SET attackpower=805 WHERE entry IN (32865,33147); 
UPDATE creature_template SET attackpower=805 WHERE entry IN (33988,33989); 

