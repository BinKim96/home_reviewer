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
    -- (1)mId �ߺ� üũ
    SELECT * FROM MEMBER WHERE mId='owen6113';
    -- (2)ȸ�� �̸��� �ߺ� üũ
    SELECT * FROM MEMBER WHERE mEmail='owen6113@naver.com';
    -- (3)�α���
    SELECT * FROM MEMBER WHERE mId='owen6113' AND mPw='1042';
    -- (4)mId�� MemberDto��������(�α��� ������ session�� �ֱ� ���� / ���������� ȸ������)
    SELECT * FROM MEMBER WHERE mId='owen6113';
    -- (5)ȸ������
    INSERT INTO MEMBER (mId, mPw, mName, mEmail, mPhoto, mGender) 
                VALUES('odj5555' ,'5555', '������', 'odj5555@naver.com', 'NOIMG.JPG', 'm');
    -- (6)ȸ������ ����
    UPDATE MEMBER SET mPW='6113',
                      mName='����',
                      mEmail='owen6113@hanmail.net',
                      mPhoto='gico.jpg',
                      mGender='m'
                WHERE mId='owen6113';
ROLLBACK;
    -- (7)ȸ������Ʈ(top-N����)
    SELECT * FROM (SELECT ROWNUM RN, A.* FROM 
                        (SELECT * FROM MEMBER ORDER BY mRdate DESC) A)
        WHERE RN BETWEEN 1 AND 3;
    -- (8)ȸ����
    SELECT COUNT(*) FROM MEMBER;
    -- (9)���̵�� �̸����� ȸ���˻�
    SELECT * FROM MEMBER WHERE mId LIKE '%'||'z'||'%' OR mName LIKE '%'||'��'||'%';
ROLLBACK;
    
-- MEMBER DUMMY
INSERT INTO MEMBER (mId, mPw, mName, mEmail, mPhoto, mGender) 
                VALUES('owen6113' ,'1042', '���', 'owen6113@naver.com', 'gico.jpg', 'm');
INSERT INTO MEMBER (mId, mPw, mName, mEmail, mPhoto, mGender) 
                VALUES('kimbin123' ,'1234', '������', 'kimbin123@naver.com', 'NOIMG.JPG', 'm');
INSERT INTO MEMBER (mId, mPw, mName, mEmail, mPhoto, mGender) 
                VALUES('pdk91' ,'1919', '�ڵ���', 'pdk91@naver.com', 'NOIMG.JPG', 'm');
INSERT INTO MEMBER (mId, mPw, mName, mEmail, mPhoto, mGender) 
                VALUES('choijy99' ,'9999', '������', 'choijy99@naver.com', 'NOIMG.JPG', 'm');                
COMMIT;