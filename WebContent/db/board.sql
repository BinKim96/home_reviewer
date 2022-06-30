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
   -- (1) �۸��(startRow���� endRow����) - �۹�ȣ, �ۼ��ھ��̵�, ...
    SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
        (SELECT * FROM BOARD ORDER BY bGroup DESC, bStep) A)
    WHERE RN BETWEEN 1 AND 4;
    -- (2) �۰���
    SELECT COUNT(*) FROM BOARD;
    -- (3) �۾���(����)
    INSERT INTO BOARD (bNum, mId, bTitle, bContent, bGroup, bStep, bIndent, bIp)
        VALUES (BOARD_SEQ.NEXTVAL, 'owen6113', '����� �λ���ȭ�� �����ΰ���?','�� �λ���ȭ�� ���˵���2�Դϴ�. �ٸ� ȸ���Ե��� �λ���ȭ�� �ñ��ؿ�', 
            BOARD_SEQ.CURRVAL, 0, 0, '192.168.10.30');
    INSERT INTO BOARD (bNum, mId, bTitle, bContent, bGroup, bStep, bIndent, bIp)
        VALUES (BOARD_SEQ.NEXTVAL, 'kimbin123', '����2�� ���ؼ�...', '�������� ��ٹ� ���� �ƴϿ����� ȭ���� �߽��ϴ٤Ѥ�', 
            BOARD_SEQ.CURRVAL, 0, 0, '192.168.10.50');
    -- (4) bHit �ϳ� �ø���(1���� ��ȸ�� �ϳ� �ø���)
    UPDATE BOARD SET bHit = bHit +1 WHERE bNum=1;
    -- (5) bNum�� �� dto����
    SELECT * FROM BOARD  WHERE bNum=1; 
    SELECT B.*, mName FROM BOARD B, MEMBER M WHERE B.mId=M.mId AND bNum=1; -- �̸� �����Ҷ� 
    COMMIT;
    -- (6) �� �����ϱ�(FId, FTitle, FContent, FILENAME,  FIp, FDATE)
    UPDATE BOARD SET bTitle = '�ٲ�����',
                     bContent = '����',
                     bIp = '192.168.151.10',
                     bRdate = SYSDATE
                WHERE bNum = 1;
    ROLLBACK;
    -- (7) �� �����ϱ�(bId�� �����ϱ�)
    DELETE FROM BOARD WHERE bNum = 2;
    ROLLBACK;
    --  (8) �亯�� �߰��� STEP a ����
    UPDATE BOARD SET bStep = bStep+1  WHERE bGroup = 1 AND bStep>0;
    UPDATE BOARD SET bStep = bStep+1  WHERE bGroup = 4 AND bStep>0;
    -- (9) �亯�� ����
    INSERT INTO BOARD (bNum, mId, bTitle, bContent, bGroup, bStep, bIndent, bIp)
        VALUES (BOARD_SEQ.NEXTVAL, 'odj5555','���� �λ���ȭ��...', '���� �λ���ȭ�� ���˵���1�̿�!', 1, 1, 1, '192.168.10.151');
    INSERT INTO BOARD (bNum, mId, bTitle, bContent, bGroup, bStep, bIndent, bIp)
        VALUES (BOARD_SEQ.NEXTVAL, 'odj5555','����2�� ���� ���� ������', '���� ���ٺ����ϴ�����?', 4, 1, 1, '192.168.10.151');
    COMMIT;

    
    
    
    