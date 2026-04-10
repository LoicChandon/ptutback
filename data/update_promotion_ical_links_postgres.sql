-- Mise a jour des liens iCal par promotion (PostgreSQL)
-- Repartition demandee :
-- - Cycle preparatoire : FIE1, FIE2
-- - Cycle inge : FIE3, FIE4, FIE5
-- - Cycle apprentis : FIA3, FIA4, FIA5

INSERT INTO promotion (nom, lien_ical)
VALUES
    ('FIE1', 'https://drive.google.com/uc?export=download&id=1CZdh1kmK_VW6qtspUofsirCPANpp0z-S'),
    ('FIE2', 'https://drive.google.com/uc?export=download&id=1CZdh1kmK_VW6qtspUofsirCPANpp0z-S'),
    ('FIE3', 'https://drive.google.com/uc?export=download&id=1E_oezdd0a_xfFX84VLqy6CQRacTkg-Nh'),
    ('FIE4', 'https://drive.google.com/uc?export=download&id=1E_oezdd0a_xfFX84VLqy6CQRacTkg-Nh'),
    ('FIE5', 'https://drive.google.com/uc?export=download&id=1E_oezdd0a_xfFX84VLqy6CQRacTkg-Nh'),
    ('FIA3', 'https://drive.google.com/uc?export=download&id=1_RqGXLPzKhMJreY-Wj2CUVoe6QNIaFhv'),
    ('FIA4', 'https://drive.google.com/uc?export=download&id=1_RqGXLPzKhMJreY-Wj2CUVoe6QNIaFhv'),
    ('FIA5', 'https://drive.google.com/uc?export=download&id=1_RqGXLPzKhMJreY-Wj2CUVoe6QNIaFhv')
ON CONFLICT (nom)
DO UPDATE SET lien_ical = EXCLUDED.lien_ical;
