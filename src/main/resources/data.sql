-- Seed des promotions et des liens iCal (idempotent)
-- Le but est de garantir la présence des 8 liens en base sans écraser les créneaux.

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIE1', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=6bdff6ce5c38d1aa02cee98928d90efe062ecec9afb461f577f8784f658a23a431076f6db405471176d9816b9e2a2bd8da2d3b75d88d50bb81ceb70d047e32b39058465e87f8975484bae8dd9e5085e7,1');

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIE2', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=2ddb23f5f54441923a2a9fcb3e346408ebe631e1a54dede210afd19e7b5ad6fb31076f6db405471176d9816b9e2a2bd8da2d3b75d88d50bb81ceb70d047e32b39058465e87f8975484bae8dd9e5085e7,1');

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIE3', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=7e9e3c16c36714273fe604091315413b11334e2ece262db633f76770d430a59d31076f6db405471176d9816b9e2a2bd8da2d3b75d88d50bb81ceb70d047e32b39058465e87f8975484bae8dd9e5085e7,1');

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIA3', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=19b0cf4537beb9be1647e92e81508c4aff1f7d8748c639f090e8ae3aecd077358af5d51cb7954027a7de0137cdbcd025e0bfd71c5e5babcec674dccf0f31e40dc71ff484990cb7d03d9997768d663aa1,1');

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIE4', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=a87af43e0fbfe42b591ed0c8038e812f60d1bc35c3929673ae5f15900b3dc1d231076f6db405471176d9816b9e2a2bd8da2d3b75d88d50bb81ceb70d047e32b39058465e87f8975484bae8dd9e5085e7,1');

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIA4', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=611e42089ebe4f30e8104f4c6bd91e9856031a47bc80be38f3b6d9b07307cf8d31076f6db405471176d9816b9e2a2bd8da2d3b75d88d50bb81ceb70d047e32b39058465e87f8975484bae8dd9e5085e7,1');

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIE5', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=dbb5cf30216cbd31e4e9a870e26c8f2b255dc57febc36bcda019d951db547ac92a2c262ab3ba48506729f6560ae33af6515870ba5a948243e99676c66e5608e44f558d252e43126e31372d198c666049,1');

MERGE INTO promotion (nom, lien_ical) KEY (nom)
VALUES ('FIA5', 'https://adecampus2.univ-jfc.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?data=c210a0c7639e93c5e8a17edb9252b42fb64159c60dd4b44e0cdbf4316087824131076f6db405471176d9816b9e2a2bd8da2d3b75d88d50bb81ceb70d047e32b39058465e87f8975484bae8dd9e5085e7,1');
