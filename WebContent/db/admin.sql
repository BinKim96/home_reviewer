-- ADMIN DDL
DROP TABLE ADMIN CASCADE CONSTRAINTS;
CREATE TABLE ADMIN(
    aId VARCHAR2(30) PRIMARY KEY,
    aPw VARCHAR2(30) NOT NULL,
    aName VARCHAR2(30) NOT NULL
);
SELECT * FROM ADMIN;

-- ADMIN DML
-- (1) ������ �α���
SELECT * FROM ADMIN WHERE aId='admin1' AND aPw='111';
-- (2) �α��� �� ���ǿ� ���� �뵵 : aId�� AdminDto ��������
SELECT * FROM ADMIN WHERE aId='admin1';
-- ADMIN DUMMY
INSERT INTO ADMIN (aId, aPw, aName) VALUES ('admin1', '111', '������1');
INSERT INTO ADMIN (aId, aPw, aName) VALUES ('admin2', '222', '������2');
COMMIT;