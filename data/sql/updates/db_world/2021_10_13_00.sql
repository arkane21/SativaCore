
-- Inmunidad faltante al quiebrazotador

UPDATE creature_template SET mechanic_immune_mask=617292635 WHERE entry IN (32916,33400);

-- Inmunidad faltante al ancestro de freya

UPDATE creature_template SET flags_extra=1073741824 WHERE entry IN (33203,33376);

