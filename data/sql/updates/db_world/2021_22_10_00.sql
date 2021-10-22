-- fix agro del druida

delete from spell_linked_spell where spell_trigger= 5421 and spell_effect=-57339;
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('5421','-57339','0','Fix agro del druida foca');

delete from spell_linked_spell where spell_trigger= 34123 and spell_effect=-57339;
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('34123','-57339','0','Fix agro arbol');

delete from spell_linked_spell where spell_trigger= 3025 and spell_effect=-57339;
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('3025','-57339','0','Fix agro del druida gato');

delete from spell_linked_spell where spell_trigger= 5419 and spell_effect=-57339;
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('5419','-57339','0','Fix agro del druida tigre');

delete from spell_linked_spell where spell_trigger= 40120 and spell_effect=-57339;
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('40120','-57339','0','Fix agro del druida vuelo');

delete from spell_linked_spell where spell_trigger= 24905 and spell_effect=-57339;
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('24905','-57339','0','Fix agro del druida pollo');

delete from spell_linked_spell where spell_trigger= 5421 and spell_effect=-21178;
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('5421','-21178','0','Fix agro del druida foca');

delete from spell_linked_spell where spell_trigger= 34123 and spell_effect=-21178;
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('34123','-21178','0','Fix agro arbol');

delete from spell_linked_spell where spell_trigger= 3025 and spell_effect=-21178;
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('3025','-21178','0','Fix agro del druida gato');

delete from spell_linked_spell where spell_trigger= 5419 and spell_effect=-21178;
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('5419','-21178','0','Fix agro del druida tigre');

delete from spell_linked_spell where spell_trigger= 40120 and spell_effect=-21178;
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('40120','-21178','0','Fix agro del druida vuelo');

delete from spell_linked_spell where spell_trigger= 24905 and spell_effect=-21178;
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('24905','-21178','0','Fix agro del druida pollo');

