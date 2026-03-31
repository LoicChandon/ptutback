-- Data de test à partir du fichier ICS - H2 Database

-- Promotions
INSERT INTO promotion (nom, lien_ical) VALUES ('FIE1', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=6bdff6ce5c38d1aa02cee98928d90efe062ecec9afb461f577f8784f658a23a431076f6db405471176d9816b9e2a2bd8da2d3b75d88d50bb81ceb70d047e32b39058465e87f8975484bae8dd9e5085e7,1');
INSERT INTO promotion (nom, lien_ical) VALUES ('FIE2', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=2ddb23f5f54441923a2a9fcb3e346408ebe631e1a54dede210afd19e7b5ad6fb31076f6db405471176d9816b9e2a2bd8da2d3b75d88d50bb81ceb70d047e32b39058465e87f8975484bae8dd9e5085e7,1');
INSERT INTO promotion (nom, lien_ical) VALUES ('FIE3', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=7e9e3c16c36714273fe604091315413b11334e2ece262db633f76770d430a59d31076f6db405471176d9816b9e2a2bd8da2d3b75d88d50bb81ceb70d047e32b39058465e87f8975484bae8dd9e5085e7,1');
INSERT INTO promotion (nom, lien_ical) VALUES ('FIA3', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=19b0cf4537beb9be1647e92e81508c4aff1f7d8748c639f090e8ae3aecd077358af5d51cb7954027a7de0137cdbcd025e0bfd71c5e5babcec674dccf0f31e40dc71ff484990cb7d03d9997768d663aa1,1');
INSERT INTO promotion (nom, lien_ical) VALUES ('FIE4', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=a87af43e0fbfe42b591ed0c8038e812f60d1bc35c3929673ae5f15900b3dc1d231076f6db405471176d9816b9e2a2bd8da2d3b75d88d50bb81ceb70d047e32b39058465e87f8975484bae8dd9e5085e7,1');
INSERT INTO promotion (nom, lien_ical) VALUES ('FIA4', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=611e42089ebe4f30e8104f4c6bd91e9856031a47bc80be38f3b6d9b07307cf8d31076f6db405471176d9816b9e2a2bd8da2d3b75d88d50bb81ceb70d047e32b39058465e87f8975484bae8dd9e5085e7,1');
INSERT INTO promotion (nom, lien_ical) VALUES ('FIE5', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=dbb5cf30216cbd31e4e9a870e26c8f2b255dc57febc36bcda019d951db547ac92a2c262ab3ba48506729f6560ae33af6515870ba5a948243e99676c66e5608e44f558d252e43126e31372d198c666049,1');
INSERT INTO promotion (nom, lien_ical) VALUES ('FIA5', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=c210a0c7639e93c5e8a17edb9252b42fb64159c60dd4b44e0cdbf4316087824131076f6db405471176d9816b9e2a2bd8da2d3b75d88d50bb81ceb70d047e32b39058465e87f8975484bae8dd9e5085e7,1');

-- Salles (extraites du fichier ICS)
INSERT INTO salle (nom) VALUES ('B011');
INSERT INTO salle (nom) VALUES ('B101');
INSERT INTO salle (nom) VALUES ('B009');
INSERT INTO salle (nom) VALUES ('B019a');
INSERT INTO salle (nom) VALUES ('B007');
INSERT INTO salle (nom) VALUES ('Grand auditorium');

-- Enseignants (extraits du fichier ICS)
INSERT INTO enseignant (nom, prenom, email) VALUES ('BARBARA', 'Julien', 'julien.barbara@universite.fr');
INSERT INTO enseignant (nom, prenom, email) VALUES ('CHAARI', 'Lotfi', 'lotfi.chaari@universite.fr');
INSERT INTO enseignant (nom, prenom, email) VALUES ('O''NEILL', 'Kevin', 'kevin.oneill@universite.fr');
INSERT INTO enseignant (nom, prenom, email) VALUES ('BAQUE', 'Lucia', 'lucia.baque@universite.fr');
INSERT INTO enseignant (nom, prenom, email) VALUES ('BARREAU', 'Sylvain', 'sylvain.barreau@universite.fr');
INSERT INTO enseignant (nom, prenom, email) VALUES ('WINTERTON', 'Claire', 'claire.winterton@universite.fr');
INSERT INTO enseignant (nom, prenom, email) VALUES ('SINGER', 'Nicolas', 'nicolas.singer@universite.fr');
INSERT INTO enseignant (nom, prenom, email) VALUES ('SAMB', 'Rokhaya', 'rokhaya.samb@universite.fr');
INSERT INTO enseignant (nom, prenom, email) VALUES ('PECATTE', 'Jean-Marie', 'jean-marie.pecatte@universite.fr');

-- Créneaux (extraits et parsés du fichier ICS)
INSERT INTO creneau (title, location, start_time, end_time, professor, group_name, course_type, description) 
VALUES ('DI-3 Sport', 'B011', '2026-04-13 08:30:00', '2026-04-13 10:30:00', 'BARBARA Julien', 'GRP-02', 'TD', 'Rugby - Terrain synthétique Borde Basse');

INSERT INTO creneau (title, location, start_time, end_time, professor, group_name, course_type, description) 
VALUES ('TP-E3-2-IS-4 Imagerie médicale', 'B011', '2026-04-03 14:00:00', '2026-04-03 15:00:00', 'CHAARI Lotfi', 'GRP-03', 'TP', 'Imagerie médicale - cours en distanciel');

INSERT INTO creneau (title, location, start_time, end_time, professor, group_name, course_type, description) 
VALUES ('TD-E3-2-PROJET-1 Projet Tuteuré', 'B101', '2026-04-02 06:15:00', '2026-04-02 08:15:00', NULL, 'GRP-01', 'TD', 'Projet Tuteuré');

INSERT INTO creneau (title, location, start_time, end_time, professor, group_name, course_type, description) 
VALUES ('TD-E3-2-DI-4 Parcours professionnel', NULL, '2026-04-10 08:30:00', '2026-04-10 10:30:00', 'BAQUE Lucia', 'GRP-02', 'TD', 'DI-4 Projet Professionnel');

INSERT INTO creneau (title, location, start_time, end_time, professor, group_name, course_type, description) 
VALUES ('TD-E3-2-DI-1 Anglais', 'B011', '2026-04-07 13:45:00', '2026-04-07 15:45:00', 'O''NEILL Kevin', 'GRP-02', 'TD', 'DI-1 Anglais');

INSERT INTO creneau (title, location, start_time, end_time, professor, group_name, course_type, description) 
VALUES ('TP-E3-2-DI-1 Anglais', 'B101', '2026-04-15 14:00:00', '2026-04-15 16:00:00', 'WINTERTON Claire', 'GRP-02', 'TP', 'DI-1 Anglais');

INSERT INTO creneau (title, location, start_time, end_time, professor, group_name, course_type, description) 
VALUES ('TP-E3-2-IN-2 DeVops et réseaux', 'B101', '2026-04-03 06:15:00', '2026-04-03 08:15:00', 'SINGER Nicolas', 'GRP-03', 'TP', 'IN-2 DevOps et réseaux');

INSERT INTO creneau (title, location, start_time, end_time, professor, group_name, course_type, description) 
VALUES ('CM-E3-2-IS-4 Imagerie médicale', 'B011', '2026-04-01 13:00:00', '2026-04-01 14:00:00', 'CHAARI Lotfi', NULL, 'CM', 'Imagerie médicale - cours en présentiel');

INSERT INTO creneau (title, location, start_time, end_time, professor, group_name, course_type, description) 
VALUES ('Bilan Semestriel FIE3', 'B007', '2026-04-15 06:15:00', '2026-04-15 08:15:00', 'PECATTE Jean-Marie', NULL, 'CM', 'Présence Obligatoire - Bilan Semestriel');

INSERT INTO creneau (title, location, start_time, end_time, professor, group_name, course_type, description) 
VALUES ('TD-E3-2-DI-4 Parcours professionnel Évaluation', 'B019a', '2026-04-13 11:45:00', '2026-04-13 13:45:00', 'BAQUE Lucia', 'GRP-01', 'TD', 'DI-4 Projet Professionnel - Evaluation votaire');

INSERT INTO creneau (title, location, start_time, end_time, professor, group_name, course_type, description) 
VALUES ('TD-E3-2-DI-3 Sport', NULL, '2026-03-31 06:15:00', '2026-03-31 08:15:00', NULL, 'GRP-01', 'TD', 'DI-3 Sport - Rugby groupe 2');
