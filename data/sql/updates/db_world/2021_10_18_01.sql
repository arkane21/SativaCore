
-- esto fixea el problema de casteo del ancestro de freya asi como la inmunidad al knockback

UPDATE creature_template set type_flags=76, mechanic_immune_mask=650853979 WHERE entry IN (33203, 33376);
