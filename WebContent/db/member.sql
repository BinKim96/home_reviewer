-- MEMBER DDL
DROP TABLE MEMBER CASCADE CONSTRAINTS;
CREATE TABLE MEMBER(
    mId VARCHAR2(50) PRIMARY KEY,
    mPw VARCHAR2(50) NOT NULL,
    mName VARCHAR2(50) NOT NULL,
    mEmail VARCHAR2(50) NOT NULL,
    mPhoto VARCHAR2(50) NOT NULL,
    mGender VARCHAR2(10) NOT NULL,
    mRdate DATE DEFAULT SYSDATE NOT NULL,
    mReviewCnt NUMBER(5) DEFAULT 0 
);
SELECT * FROM MEMBER;
COMMIT;
-- MEMBER DML
    -- (1)mId 중복 체크
    SELECT * FROM MEMBER WHERE mId='owen6113';
    -- (2)회원 이메일 중복 체크
    SELECT * FROM MEMBER WHERE mEmail='owen6113@naver.com';
    -- (3)로그인
    SELECT * FROM MEMBER WHERE mId='owen6113' AND mPw='1042';
    -- (4)mId로 MemberDto가져오기(로그인 성공시 session에 넣기 위함 / 마이페이지 회원정보)
    SELECT * FROM MEMBER WHERE mId='owen6113';
    -- (5)회원가입
    INSERT INTO MEMBER (mId, mPw, mName, mEmail, mPhoto, mGender) 
                VALUES('odj5555' ,'5555', '오동준', 'odj5555@naver.com', 'NOIMG.JPG', 'm');
    -- (6)회원정보 수정
    UPDATE MEMBER SET mPW='6113',
                      mName='김빈우',
                      mEmail='owen6113@hanmail.net',
                      mPhoto='gico.jpg',
                      mGender='m'
                WHERE mId='owen6113';
ROLLBACK;
    -- (7)회원리스트(top-N구문)
    SELECT * FROM (SELECT ROWNUM RN, A.* FROM 
                        (SELECT * FROM MEMBER ORDER BY mRdate DESC) A)
        WHERE RN BETWEEN 1 AND 3;
    -- (8)회원수
    SELECT COUNT(*) FROM MEMBER;
    -- (9)아이디와 이름으로 회원검색
    SELECT * FROM MEMBER WHERE mId LIKE '%'||'z'||'%' OR mName LIKE '%'||'수'||'%';
ROLLBACK;
    
-- MEMBER DUMMY
INSERT INTO MEMBER (mId, mPw, mName, mEmail, mPhoto, mGender) 
                VALUES('owen6113' ,'1042', '김빈', 'owen6113@naver.com', 'gico.jpg', 'm');
INSERT INTO MEMBER (mId, mPw, mName, mEmail, mPhoto, mGender) 
                VALUES('kimbin123' ,'1234', '김정빈', 'kimbin123@naver.com', 'NOIMG.JPG', 'm');
INSERT INTO MEMBER (mId, mPw, mName, mEmail, mPhoto, mGender) 
                VALUES('pdk91' ,'1919', '박동규', 'pdk91@naver.com', 'NOIMG.JPG', 'm');
INSERT INTO MEMBER (mId, mPw, mName, mEmail, mPhoto, mGender) 
                VALUES('choijy99' ,'9999', '최진영', 'choijy99@naver.com', 'NOIMG.JPG', 'm');                
COMMIT;