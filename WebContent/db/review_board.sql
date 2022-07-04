-- REVIEW_BOARD
DROP SEQUENCE REVIEW_BOARD_SEQ;
DROP TABLE REVIEW_BOARD CASCADE CONSTRAINTS;
CREATE SEQUENCE REVIEW_BOARD_SEQ MAXVALUE 9999999 NOCACHE NOCYCLE;
CREATE TABLE REVIEW_BOARD(
    rbNum NUMBER(7) PRIMARY KEY,
    rbContent VARCHAR2(1000) NOT NULL,
    rbRdate DATE DEFAULT SYSDATE NOT NULL,
    rbIp VARCHAR2(20) NOT NULL,
    mId VARCHAR2(50) REFERENCES MEMBER(mId),
    mvId NUMBER(7) REFERENCES MOVIE(mvId)
);

-- REVIEW_BOARD_DML
    --(1)�����ۼ�(�����)
    INSERT INTO REVIEW_BOARD (rbNum, rbContent, rbIp, mId, mvId) 
        VALUES (REVIEW_BOARD_SEQ.NEXTVAL, '���˵���2 ��¥ �ʹ� ��վ��! õ����ȭ ���ϵ帳�ϴ�', '192.168.10.30', 'owen6113', 1);
    INSERT INTO REVIEW_BOARD (rbNum, rbContent, rbIp, mId, mvId) 
        VALUES (REVIEW_BOARD_SEQ.NEXTVAL, '�ռ��� ���� ���⿡ �ٽ� �ѹ� ���� ���ϴ�', '192.168.10.3', 'odj5555', 1);
    INSERT INTO REVIEW_BOARD (rbNum, rbContent, rbIp, mId, mvId) 
        VALUES (REVIEW_BOARD_SEQ.NEXTVAL, '����1���� ��̰� ����� �̤�', '192.168.10.3', 'odj5555', 2);
    INSERT INTO REVIEW_BOARD (rbNum, rbContent, rbIp, mId, mvId) 
        VALUES (REVIEW_BOARD_SEQ.NEXTVAL, '�ð������� �𸣰� �ó׿� ���Դϴ� ���� ����', '192.168.10.40', 'kimbin123', 1);
    --(2)������(�����,������)-> startRow~endRow
    SELECT mId, rbContent, rbRdate, rbIp FROM REVIEW_BOARD WHERE mvId=1 ORDER BY rbRdate DESC ;
    SELECT *
        FROM(SELECT ROWNUM RN, A.* FROM(SELECT rbNum, mId, rbContent, rbRdate, rbIp FROM REVIEW_BOARD WHERE mvId=1 ORDER BY rbRdate DESC) A)
        WHERE RN BETWEEN 1 AND 3;
    --(3)�������(�����)
    UPDATE REVIEW_BOARD SET rbContent='���������� �취��',
                            rbIp='192.168.10.30'                              
                    WHERE rbNum=3 AND mvId=1 AND mId='odj5555';
    --(4)�������(�����, ������)
    DELETE FROM REVIEW_BOARD WHERE rbNum=1;
    ROLLBACK;
    --(5)�ش翵ȭ ���� ����
    SELECT COUNT(*) FROM REVIEW_BOARD WHERE mvId=2;
    COMMIT;
    --(6)�ڽ��� �ۼ��� ��� ���
     SELECT MV.mvTitle, rbContent, rbRdate FROM REVIEW_BOARD RB, MOVIE MV WHERE RB.mvId=MV.mvId AND mId='odj5555' ORDER BY rbRdate DESC;
    SELECT *
        FROM(SELECT ROWNUM RN, A.* FROM(SELECT MV.mvTitle, rbContent, rbRdate FROM REVIEW_BOARD RB, MOVIE MV WHERE RB.mvId=MV.mvId AND mId='odj5555' ORDER BY rbRdate DESC) A)
        WHERE RN BETWEEN 1 AND 3;
    -- (7)�ڽ��� �ۼ��� ��� ����
    SELECT COUNT(*) FROM REVIEW_BOARD WHERE mId='odj5555';
    -- (8)rbNum���� dto ��������
    SELECT * FROM REVIEW_BOARD WHERE rbNum='3';
-- REVIEW_BOARD_DUMMY
SELECT * FROM REVIEW_BOARD;
COMMIT;