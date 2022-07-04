-- MOVIE_LIKE DDL
DROP SEQUENCE MOVIE_LIKE_SEQ;
DROP TABLE MOVIE_LIKE;
CREATE SEQUENCE MOVIE_LIKE_SEQ MAXVALUE 9999999 NOCACHE NOCYCLE;
CREATE TABLE MOVIE_LIKE(
    mlNum NUMBER(7) PRIMARY KEY,
    mlRdate DATE DEFAULT SYSDATE NOT NULL,
    mId VARCHAR2(50) REFERENCES MEMBER(mId),
    mvId NUMBER(7) REFERENCES MOVIE(mvId)
);
SELECT * FROM MOVIE_LIKE;

-- MOVIE_LIKE_DML
-- (1)해당영화 좋아요 누르기
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'owen6113', 1);
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'odj5555', 2);
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'owen6113', 2);
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'owen6113', 3);
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'odj5555', 3);
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'kimbin123', 3);
    
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'kimbin123', 4);
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'kimbin123', 5);
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'pdk91', 1);
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'pdk91', 2);
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'pdk91', 3);
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'pdk91', 4);
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'pdk91', 5);
    
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'odj5555', 1);
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'kimbin123', 1);
    INSERT INTO MOVIE_LIKE (mlNum, mId, mvId) VALUES(MOVIE_LIKE_SEQ.NEXTVAL, 'choijy99', 1);
    COMMIT;
-- (2)해당영화 좋아요 취소하기
    DELETE FROM MOVIE_LIKE WHERE mId='owen6113' AND mvId=1;
    
-- (3)좋아요 눌렀는지 아닌지 여부 확인
    SELECT COUNT(*) FROM MOVIE_LIKE WHERE mId='owen6113' AND mvId='3';
    
    DELETE FROM MOVIE_LIKE WHERE mId='owen6113' AND mvId ='2';
    DELETE FROM MOVIE_LIKE WHERE mlNum='28';
    DELETE FROM MOVIE_LIKE WHERE mId='owen6113' AND mvId ='2';
    COMMIT;