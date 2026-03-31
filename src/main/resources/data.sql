-- Data de test à partir du fichier ICS - H2 Database

-- Promotions
INSERT INTO promotion (nom) VALUES ('FIE1');
INSERT INTO promotion (nom) VALUES ('FIE2');
INSERT INTO promotion (nom) VALUES ('FIE3');
INSERT INTO promotion (nom) VALUES ('FIA3');
INSERT INTO promotion (nom) VALUES ('FIE4');
INSERT INTO promotion (nom) VALUES ('FIA4');
INSERT INTO promotion (nom) VALUES ('FIE5');
INSERT INTO promotion (nom) VALUES ('FIA5');

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
