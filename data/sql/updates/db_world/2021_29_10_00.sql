-- Fix inmunidad al knockback inmortal guardian

UPDATE creature_template SET flags_extra=2097152 WHERE entry IN (36064, 36067);

