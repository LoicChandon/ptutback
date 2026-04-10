-- Seed des promotions et des liens iCal (idempotent)
-- Le but est de garantir la présence des 8 liens en base sans écraser les créneaux.

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIE1', 'https://drive.google.com/uc?export=download&id=1CZdh1kmK_VW6qtspUofsirCPANpp0z-S');

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIE2', 'https://drive.google.com/uc?export=download&id=1CZdh1kmK_VW6qtspUofsirCPANpp0z-S');

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIE3', 'https://drive.google.com/uc?export=download&id=1E_oezdd0a_xfFX84VLqy6CQRacTkg-Nh');

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIA3', 'https://drive.google.com/uc?export=download&id=1_RqGXLPzKhMJreY-Wj2CUVoe6QNIaFhv');

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIE4', 'https://drive.google.com/uc?export=download&id=1E_oezdd0a_xfFX84VLqy6CQRacTkg-Nh');

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIA4', 'https://drive.google.com/uc?export=download&id=1_RqGXLPzKhMJreY-Wj2CUVoe6QNIaFhv');

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIE5', 'https://drive.google.com/uc?export=download&id=1E_oezdd0a_xfFX84VLqy6CQRacTkg-Nh');

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIA5', 'https://drive.google.com/uc?export=download&id=1_RqGXLPzKhMJreY-Wj2CUVoe6QNIaFhv');
