-- RESERVE_MOVIE DDL
DROP TABLE RESERVE_MOVIE;
DROP SEQUENCE RESERVE_MOVIE_SEQ; 
CREATE SEQUENCE RESERVE_MOVIE_SEQ MAXVALUE 9999999 NOCACHE NOCYCLE;
CREATE TABLE RESERVE_MOVIE(
    rmId NUMBER(7) PRIMARY KEY,
    rmRdate DATE DEFAULT SYSDATE NOT NULL,
    mId VARCHAR2(50) REFERENCES MEMBER(mId),
    mvId NUMBER(7) REFERENCES MOVIE(mvId)
);
SELECT * FROM RESERVE_MOVIE;
-- RESERVE_MOVIE DML
    --(1) ��ȭ ���ϱ�
    INSERT INTO RESERVE_MOVIE (rmId, mId, mvId) VALUES(RESERVE_MOVIE_SEQ.NEXTVAL, 'owen6113', 1);
    INSERT INTO RESERVE_MOVIE (rmId, mId, mvId) VALUES(RESERVE_MOVIE_SEQ.NEXTVAL, 'owen6113', 2);
    INSERT INTO RESERVE_MOVIE (rmId, mId, mvId) VALUES(RESERVE_MOVIE_SEQ.NEXTVAL, 'odj5555', 1);
    INSERT INTO RESERVE_MOVIE (rmId, mId, mvId) VALUES(RESERVE_MOVIE_SEQ.NEXTVAL, 'odj5555', 2);
    
    INSERT INTO RESERVE_MOVIE (rmId, mId, mvId) VALUES(RESERVE_MOVIE_SEQ.NEXTVAL, 'pdk91', 1);
    INSERT INTO RESERVE_MOVIE (rmId, mId, mvId) VALUES(RESERVE_MOVIE_SEQ.NEXTVAL, 'pdk91', 2);
    INSERT INTO RESERVE_MOVIE (rmId, mId, mvId) VALUES(RESERVE_MOVIE_SEQ.NEXTVAL, 'pdk91', 3);
    INSERT INTO RESERVE_MOVIE (rmId, mId, mvId) VALUES(RESERVE_MOVIE_SEQ.NEXTVAL, 'pdk91', 4);
    INSERT INTO RESERVE_MOVIE (rmId, mId, mvId) VALUES(RESERVE_MOVIE_SEQ.NEXTVAL, 'pdk91', 5);
    ROLLBACK;
    COMMIT;
    --(2) ��ȭ �� ����ϱ�
    DELETE FROM RESERVE_MOVIE WHERE mId='owen6113' AND mvId=1;
    
    DELETE FROM RESERVE_MOVIE WHERE rmId=15;
    --(3) ���� ��ȭ ���
    SELECT *
        FROM(SELECT ROWNUM RN, A.* FROM(SELECT MV.mvId, MV.mvTitle, MV.mvPoster, TO_CHAR(MV.mvReleaseDate, 'YYYY') mvReleaseYear, (SELECT COUNT(*) FROM MOVIE_LIKE WHERE mvId=MV.mvId GROUP BY mvId) mlCnt, RM.mId FROM RESERVE_MOVIE RM, MOVIE MV WHERE RM.mvId=MV.mvId AND mId='owen6113' ORDER BY rmRdate DESC) A)
        WHERE RN BETWEEN 1 AND 5;
    --(4) ����� ���� ��ȭ ����
    SELECT COUNT(*) FROM RESERVE_MOVIE WHERE mId='owen6113' AND mvId=1;