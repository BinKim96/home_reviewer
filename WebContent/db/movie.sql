-- MOVIE DDL
DROP TABLE MOVIE CASCADE CONSTRAINTS;
DROP SEQUENCE MOVIE_SEQ;
CREATE SEQUENCE MOVIE_SEQ MAXVALUE 9999999 NOCACHE NOCYCLE;
CREATE TABLE MOVIE(
    mvId NUMBER(7) PRIMARY KEY,
    mvTitle VARCHAR2(100) NOT NULL,
    gId NUMBER(3) REFERENCES GENRE(gId),
    mvReleaseDate DATE NOT NULL,
    mvDirector VARCHAR2(50) NOT NULL,
    mvCast VARCHAR2(100) NOT NULL,
    mvRunningTime VARCHAR2(10) NOT NULL,
    grId NUMBER(1) REFERENCES GRADE(grId),
    mvPoster VARCHAR2(50) NOT NULL,
    mvContent VARCHAR2(4000) NOT NULL,
    mvRdate DATE DEFAULT SYSDATE NOT NULL
);
SELECT * FROM MOVIE;
-- MOVIE DML
    -- (1)��ȭ�̸��˻�(�����, ������)
    SELECT * FROM MOVIE WHERE mvTitle LIKE '%'||'��'||'%';
    -- (2)��ȭ���(������)#
    INSERT INTO MOVIE (mvId, mvTitle, gId, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grId, mvPoster, mvContent) 
                VALUES(MOVIE_SEQ.NEXTVAL ,'����2', 2, '2022-06-15', '������', '�Žþ�, ������, ������, ����', '137��', 3, '����2.jpg', '������ ����� ��, ��ü�Ҹ��� ������ ������ �������� ���� ������Ʈ�� ����ǰ� �ִ� ��ũ�� ����ȭ�ȴ�. �װ����� Ȧ�� ��Ƴ��� �ҳ�� ���� ó�� ���� ������ ���� ����� �쿬�� ���� ������ �������� ���忡�� ������ ������ �ϻ� �����ذ���. ����, �ҳడ ���ǵ��� ����� �Ѵ� å���� ��� ���� ������Ʈ�� â���� ���Ѱ��� ������ �ް� ���ſ� ���� ���� ��� ����, ������ ���� �������� �븮�� ������ ���� ��ο� ���ؿ��� �� �ǹ��� 4�ι���� ���� �ٸ� ������ ���� ������ �𿩵�� �����ϸ鼭 �ҳ� �ȿ� ������ ������ ����µ�...');
    INSERT INTO MOVIE (mvId, mvTitle, gId, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grId, mvPoster, mvContent) 
                VALUES(MOVIE_SEQ.NEXTVAL ,'ž��: �Ź���', 2, '2022-06-22', '���� �ڽŽ�Ű', '�� ũ����, ������ �ڷ�, ������ �ڳڸ�', '130��', 2, 'ž��_�Ź���.jpg', '�ְ��� ���Ϸ����� �������� �ι� �Ź���(�� ũ����)�� �ڽ��� ������ �Ʒ��б� �������� ��Ź�ȴ�. ���� ���� �𸣴� �������� �Ź����� ���ø� ���������� ������ ����� �ϴ� ��� �Ʒÿ��� ������ ���� �ϱ� ���� �������� ���� �Ƿ¿� ��ΰ� �е��ȴ�. �Ź����� ���־Ʒ� �߰��� ����ũ�� �׾ư��� �����鿡�� ������ �پ�Ѵ� ������ �ӹ��� �־����� �Ź����� �ڽ��� ����ģ ������ �Բ� �������� �� �� �� �ϴ� �� ���࿡ �����µ���');
    INSERT INTO MOVIE (mvId, mvTitle, gId, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grId, mvPoster, mvContent) 
                VALUES(MOVIE_SEQ.NEXTVAL ,'�����̴���: �� ���� Ȩ', 2, '2021-12-15', '�� ����', '�� Ȧ����, �����̾�, ���׵�Ʈ �Ĺ���ġ', '148��', 2, '�����̴���_�����Ȩ.jpg', '���̽��׸������� �跫���� ���� ��ü�� ź�γ� �����̴��� ������ ��Ŀ���� �Ϸ� ��ħ�� ����� �ϻ��� �Ұ� �ȴ�. ������ �ذ��ϱ� ���� ������ ��Ʈ���������� ã�ư� ������ û������ ������ �ʰ� ��Ƽ������ �����鼭 ���� �ٸ� ������ ��û������ ��Ÿ����. ������ �����۽����� ����� �����̴��ǿ��� ���� ������ ���� �������� ������ ���ݿ� ������ ��Ŀ���� ��� �־��� ���⸦ �°� �Ǵµ���');
    INSERT INTO MOVIE (mvId, mvTitle, gId, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grId, mvPoster, mvContent) 
                VALUES(MOVIE_SEQ.NEXTVAL ,'�͸��� Į�� ������ ���ѿ�����', 26, '2021-01-27', '������Ű �Ϸ��', '�ϳ��� ����Ű, ī�� ��ī��', '117��', 3, '�͸��� Į��_�����ǹ��ѿ�����.jpg', '���ͷ� ���� ������ �������ڡ��� �ǵ����� ���� �ͻ�밡 �� ��ź���Ρ�! ��� ���� �޸��� ���ѿ������� �°����� ���� ���� ������ٴ� �ҽĿ� ����������, ���̳뽺�ɡ��� �Բ� �ӹ� ������ ���� ���ѿ����� ž���Ѵ�. �׸��� �� ������ ���� �ͻ�� �ְ� �˻� ���� ��������! �̵��� ���ѿ����� ���� �ִ� ������ ���縦 �����ϰ� ��θ� ���ϱ� ���� ����� �� ������ �����ϴµ��� �� Į�� �Ǹ��� �����!');             
    -- (3)��ȭ���(������, �ֽŵ�ϼ�����)(#, , )
    SELECT mvTitle, TO_CHAR(mvReleaseDate, 'YYYY') mvReleaseYear, mvPoster FROM MOVIE ORDER BY mvRdate DESC; 
    SELECT mvTitle || '(' || (SELECT COUNT(*) FROM MOVIE_LIKE WHERE mvId=MOVIE.mvId GROUP BY mvId) || ')' mvTITLE, TO_CHAR(mvReleaseDate, 'YYYY') mvReleaseYear, mvPoster FROM MOVIE ORDER BY mvRdate DESC;
    
    SELECT mvTitle, TO_CHAR(mvReleaseDate, 'YYYY') mvReleaseYear, mvPoster FROM MOVIE ORDER BY mvRdate DESC; 
    
    -- �����ڰ� ��ȭ����Ѽ�����(top-N����) --
    SELECT * 
        FROM (SELECT ROWNUM RN, mvTitle, TO_CHAR(mvReleaseDate, 'YYYY') mvReleaseYear, mvPoster FROM MOVIE ORDER BY mvRdate DESC)
        WHERE RN BETWEEN 1 AND 5;
   
     -- �α�� ž����
    SELECT * 
        FROM (SELECT MVID, MVTITLE, MVRELEASEDATE, MVPOSTER,(SELECT COUNT(*) FROM MOVIE_LIKE WHERE mvId=M.mvId GROUP BY mvId) mlCnt FROM MOVIE M ORDER BY MLCNT DESC, MVRELEASEDATE DESC) 
        WHERE ROWNUM<4;    
     
    -- �ֽŰ����� ž����
    SELECT * 
        FROM (SELECT MVID, MVTITLE, MVRELEASEDATE, MVPOSTER,(SELECT COUNT(*) FROM MOVIE_LIKE WHERE mvId=M.mvId GROUP BY mvId) mlCnt FROM MOVIE M ORDER BY MVRELEASEDATE DESC) 
        WHERE ROWNUM<4;
        
    -- (3)-1 ��ü��ȭ����
    SELECT COUNT(*) FROM MOVIE;
    -- (4)��ȭ�󼼺���(�����,������) -> mvId�� MovieDto��������
    SELECT mvTitle, G.gName, TO_CHAR(mvReleaseDate, 'YYYY') mvReleaseYear, mvReleaseDate, mvDirector, mvCast, mvRunningTime, GR.grName, mvPoster, mvContent,(SELECT COUNT(*) FROM MOVIE_LIKE WHERE mvId=M.mvId GROUP BY mvId) mlCnt 
        FROM MOVIE M, GENRE G, GRADE GR 
        WHERE M.gId=G.gId AND M.grId=GR.grId AND mvId=3; 
    -- (5)��ȭ����(������)
    UPDATE MOVIE SET mvTitle='���˵���2',
                     gId=8,
                     mvReleaseDate='2022-05-18',
                     mvDirector='�̻��',
                     mvCast='������, �ռ���, �ֱ�ȭ',
                     mvRunningTime='106��',
                     grId=3,
                     mvPoster='���˵���2.jpg',
                     mvContent='�������� �������� �� 4�� ��, ��õ�� ���¹��� ��Ʈ������ ������ �����ڸ� �ε��޾� ����� �̼��� �޴´�. �������� ������(������)�� ���ϸ�(�ֱ�ȭ) ������ ���� �����ڿ��Լ� �������� ������, ���� �ڿ� ���ں��� ������ ���̴� ���ػ�(�ռ���)�� ������ �˰� �ȴ�. �������� ��õ�� ���¹��� �ѱ��� ��Ʈ���� ������ ����� ���˸� �������� ���ػ��� ���������� �ѱ� �����ϴµ�... ���� ��� ��� �� ���� ����! �����ϰ� ȭ���� ���� ���� ������ �ٽ� ��������!'
                WHERE mvId=1;
    -- (6)��ȭ����(������)
    DELETE FROM MOVIE WHERE mvId=1;
    ROLLBACK;
    -- (7)��ȭ�󼼰˻����(�����) -> �ֽż�(�����ȼ�), �帣��, ���ƿ丹��(���ƿ�����)��
    SELECT COUNT(*) FROM MOVIE_LIKE; 
-- MOVIE DUMMY
INSERT INTO MOVIE (mvId, mvTitle, gId, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grId, mvPoster, mvContent) 
                VALUES(MOVIE_SEQ.NEXTVAL ,'���˵���2', 8, '2022-05-18', '�̻��', '������, �ռ���, �ֱ�ȭ', '106��', 3, '���˵���2.jpg', '�������� �������� �� 4�� ��, ��õ�� ���¹��� ��Ʈ������ ������ �����ڸ� �ε��޾� ����� �̼��� �޴´�. �������� ������(������)�� ���ϸ�(�ֱ�ȭ) ������ ���� �����ڿ��Լ� �������� ������, ���� �ڿ� ���ں��� ������ ���̴� ���ػ�(�ռ���)�� ������ �˰� �ȴ�. �������� ��õ�� ���¹��� �ѱ��� ��Ʈ���� ������ ����� ���˸� �������� ���ػ��� ���������� �ѱ� �����ϴµ�... ���� ��� ��� �� ���� ����! �����ϰ� ȭ���� ���� ���� ������ �ٽ� ��������!');
SELECT * FROM GENRE;
SELECT * FROM GRADE;
COMMIT;