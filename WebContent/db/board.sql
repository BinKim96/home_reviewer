-- BOARD_DDL
DROP SEQUENCE BOARD_SEQ;
DROP TABLE BOARD CASCADE CONSTRAINTS;
CREATE SEQUENCE BOARD_SEQ MAXVALUE 9999999 NOCACHE NOCYCLE;
CREATE TABLE BOARD(
    bNum NUMBER(7) PRIMARY KEY,
    bTitle VARCHAR2(100) NOT NULL,
    bContent VARCHAR2(1000),
    bRdate DATE DEFAULT SYSDATE,
    bHit NUMBER(7) DEFAULT 0,
    bGroup NUMBER(7) NOT NULL,
    bStep NUMBER(3) NOT NULL,
    bIndent NUMBER(3) NOT NULL,
    bIp VARCHAR2(20) NOT NULL,
    mId VARCHAR2(50) REFERENCES MEMBER(mId)
);

-- BOARD_DML
   -- (1) 글목록(startRow부터 endRow까지) - 글번호, 작성자아이디, ...
    SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
        (SELECT * FROM BOARD ORDER BY bGroup DESC, bStep) A)
    WHERE RN BETWEEN 1 AND 4;
    -- (2) 글갯수
    SELECT COUNT(*) FROM BOARD;
    -- (3) 글쓰기(원글)
    INSERT INTO BOARD (bNum, mId, bTitle, bContent, bGroup, bStep, bIndent, bIp)
        VALUES (BOARD_SEQ.NEXTVAL, 'owen6113', '당신의 인생영화는 무엇인가요?','제 인생영화는 범죄도시2입니다. 다른 회원님들의 인생영화가 궁금해요', 
            BOARD_SEQ.CURRVAL, 0, 0, '192.168.10.30');
    INSERT INTO BOARD (bNum, mId, bTitle, bContent, bGroup, bStep, bIndent, bIp)
        VALUES (BOARD_SEQ.NEXTVAL, 'kimbin123', '마녀2에 대해서...', '마지막에 김다미 배우님 아니였으면 화날뻔 했습니다ㅡㅡ', 
            BOARD_SEQ.CURRVAL, 0, 0, '192.168.10.50');
    -- (4) bHit 하나 올리기(1번글 조회수 하나 올리기)
    UPDATE BOARD SET bHit = bHit +1 WHERE bNum=1;
    -- (5) bNum로 글 dto보기
    SELECT * FROM BOARD  WHERE bNum=1; 
    SELECT B.*, mName FROM BOARD B, MEMBER M WHERE B.mId=M.mId AND bNum=1; -- 이름 조인할때 
    COMMIT;
    -- (6) 글 수정하기(FId, FTitle, FContent, FILENAME,  FIp, FDATE)
    UPDATE BOARD SET bTitle = '바뀐제목',
                     bContent = '본문',
                     bIp = '192.168.151.10',
                     bRdate = SYSDATE
                WHERE bNum = 1;
    ROLLBACK;
    -- (7) 글 삭제하기(bId로 삭제하기)
    DELETE FROM BOARD WHERE bNum = 2;
    ROLLBACK;
    --  (8) 답변글 추가전 STEP a 수행
    UPDATE BOARD SET bStep = bStep+1  WHERE bGroup = 1 AND bStep>0;
    UPDATE BOARD SET bStep = bStep+1  WHERE bGroup = 4 AND bStep>0;
    -- (9) 답변글 쓰기
    INSERT INTO BOARD (bNum, mId, bTitle, bContent, bGroup, bStep, bIndent, bIp)
        VALUES (BOARD_SEQ.NEXTVAL, 'odj5555','저의 인생영화는...', '저의 인생영화는 범죄도시1이요!', 1, 1, 1, '192.168.10.151');
    INSERT INTO BOARD (bNum, mId, bTitle, bContent, bGroup, bStep, bIndent, bIp)
        VALUES (BOARD_SEQ.NEXTVAL, 'odj5555','마녀2에 대한 저의 생각은', '저는 은근볼만하던데요?', 4, 1, 1, '192.168.10.151');
    COMMIT;

    
    
    
    