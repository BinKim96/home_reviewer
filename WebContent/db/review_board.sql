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
    --(1)리뷰작성(사용자)
    INSERT INTO REVIEW_BOARD (rbNum, rbContent, rbIp, mId, mvId) 
        VALUES (REVIEW_BOARD_SEQ.NEXTVAL, '범죄도시2 진짜 너무 재밌어요! 천만영화 축하드립니다', '192.168.10.30', 'owen6113', 1);
    INSERT INTO REVIEW_BOARD (rbNum, rbContent, rbIp, mId, mvId) 
        VALUES (REVIEW_BOARD_SEQ.NEXTVAL, '손석구 배우님 연기에 다시 한번 놀라고 갑니다', '192.168.10.3', 'odj5555', 1);
    INSERT INTO REVIEW_BOARD (rbNum, rbContent, rbIp, mId, mvId) 
        VALUES (REVIEW_BOARD_SEQ.NEXTVAL, '마녀1보다 재미가 없어요 ㅜㅜ', '192.168.10.3', 'odj5555', 2);
    INSERT INTO REVIEW_BOARD (rbNum, rbContent, rbIp, mId, mvId) 
        VALUES (REVIEW_BOARD_SEQ.NEXTVAL, '시간가는줄 모르고 봤네요 굳입니다 아주 ㅎㅎ', '192.168.10.40', 'kimbin123', 1);
    --(2)리뷰목록(사용자,관리자)-> startRow~endRow
    SELECT mId, rbContent, rbRdate, rbIp FROM REVIEW_BOARD WHERE mvId=1 ORDER BY rbRdate DESC ;
    SELECT *
        FROM(SELECT ROWNUM RN, A.* FROM(SELECT rbNum, mId, rbContent, rbRdate, rbIp FROM REVIEW_BOARD WHERE mvId=1 ORDER BY rbRdate DESC) A)
        WHERE RN BETWEEN 1 AND 3;
    --(3)리뷰수정(사용자)
    UPDATE REVIEW_BOARD SET rbContent='죄짓지말고 살랬지',
                            rbIp='192.168.10.30'                              
                    WHERE rbNum=3 AND mvId=1 AND mId='odj5555';
    --(4)리뷰삭제(사용자, 관리자)
    DELETE FROM REVIEW_BOARD WHERE rbNum=1;
    ROLLBACK;
    --(5)해당영화 리뷰 갯수
    SELECT COUNT(*) FROM REVIEW_BOARD WHERE mvId=2;
    COMMIT;
    --(6)자신이 작성한 댓글 목록
     SELECT MV.mvTitle, rbContent, rbRdate FROM REVIEW_BOARD RB, MOVIE MV WHERE RB.mvId=MV.mvId AND mId='odj5555' ORDER BY rbRdate DESC;
    SELECT *
        FROM(SELECT ROWNUM RN, A.* FROM(SELECT MV.mvTitle, rbContent, rbRdate FROM REVIEW_BOARD RB, MOVIE MV WHERE RB.mvId=MV.mvId AND mId='odj5555' ORDER BY rbRdate DESC) A)
        WHERE RN BETWEEN 1 AND 3;
    -- (7)자신이 작성한 댓글 갯수
    SELECT COUNT(*) FROM REVIEW_BOARD WHERE mId='odj5555';
    -- (8)rbNum으로 dto 가져오기
    SELECT * FROM REVIEW_BOARD WHERE rbNum='3';
-- REVIEW_BOARD_DUMMY
SELECT * FROM REVIEW_BOARD;
COMMIT;