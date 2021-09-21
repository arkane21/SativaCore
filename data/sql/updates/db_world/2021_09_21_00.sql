-- Spell negativa Algalon  --

UPDATE spell_custom_attr SET attributes=12288 WHERE spell_id IN (64412);

-- Aggro Druida Pollo/Gato --

DELETE FROM spell_threath WHERE entry IN (24858,768);
insert into `spell_threat` (`entry`, `flatMod`, `pctMod`, `apPctMod`) values('24858','0','1','0');
insert into `spell_threat` (`entry`, `flatMod`, `pctMod`, `apPctMod`) values('768','0','1','0');