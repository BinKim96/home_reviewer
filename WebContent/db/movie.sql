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
    -- (1)영화이름검색(사용자, 관리자)
    SELECT * FROM MOVIE WHERE mvTitle LIKE '%'||'범'||'%';
    -- (2)영화등록(관리자)#
    INSERT INTO MOVIE (mvId, mvTitle, gId, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grId, mvPoster, mvContent) 
                VALUES(MOVIE_SEQ.NEXTVAL ,'마녀2', 2, '2022-06-15', '박훈정', '신시아, 박은빈, 서은수, 진구', '137분', 3, '마녀2.jpg', '자윤이 사라진 뒤, 정체불명의 집단의 무차별 습격으로 마녀 프로젝트가 진행되고 있는 아크가 초토화된다. 그곳에서 홀로 살아남은 소녀는 생애 처음 세상 밖으로 발을 내딛고 우연히 만난 경희의 도움으로 농장에서 지내며 따뜻한 일상에 적응해간다. 한편, 소녀가 망실되자 행방을 쫓는 책임자 장과 마녀 프로젝트의 창시자 백총괄의 지령을 받고 제거에 나선 본사 요원 조현, 경희의 농장 소유권을 노리는 조직의 보스 용두와 상해에서 온 의문의 4인방까지 각기 다른 목적을 지닌 세력이 모여들기 시작하면서 소녀 안에 숨겨진 본성이 깨어나는데...');
    INSERT INTO MOVIE (mvId, mvTitle, gId, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grId, mvPoster, mvContent) 
                VALUES(MOVIE_SEQ.NEXTVAL ,'탑건: 매버릭', 2, '2022-06-22', '조셉 코신스키', '톰 크루즈, 마일즈 텔러, 제니퍼 코넬리', '130분', 2, '탑건_매버릭.jpg', '최고의 파일럿이자 전설적인 인물 매버릭(톰 크루즈)은 자신이 졸업한 훈련학교 교관으로 발탁된다. 그의 명성을 모르던 팀원들은 매버릭의 지시를 무시하지만 실전을 방불케 하는 상공 훈련에서 눈으로 봐도 믿기 힘든 전설적인 조종 실력에 모두가 압도된다. 매버릭의 지휘아래 견고한 팀워크를 쌓아가던 팀원들에게 국경을 뛰어넘는 위험한 임무가 주어지자 매버릭은 자신이 가르친 동료들과 함께 마지막이 될 지 모를 하늘 위 비행에 나서는데…');
    INSERT INTO MOVIE (mvId, mvTitle, gId, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grId, mvPoster, mvContent) 
                VALUES(MOVIE_SEQ.NEXTVAL ,'스파이더맨: 노 웨이 홈', 2, '2021-12-15', '존 왓츠', '톰 홀랜드, 젠데이아, 베네딕트 컴버배치', '148분', 2, '스파이더맨_노웨이홈.jpg', '‘미스테리오’의 계략으로 세상에 정체가 탄로난 스파이더맨 ‘피터 파커’는 하루 아침에 평범한 일상을 잃게 된다. 문제를 해결하기 위해 ‘닥터 스트레인지’를 찾아가 도움을 청하지만 뜻하지 않게 멀티버스가 열리면서 각기 다른 차원의 불청객들이 나타난다. ‘닥터 옥토퍼스’를 비롯해 스파이더맨에게 깊은 원한을 가진 숙적들의 강력한 공격에 ‘피터 파커’는 사상 최악의 위기를 맞게 되는데…');
    INSERT INTO MOVIE (mvId, mvTitle, gId, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grId, mvPoster, mvContent) 
                VALUES(MOVIE_SEQ.NEXTVAL ,'귀멸의 칼날 극장판 무한열차편', 26, '2021-01-27', '소토자키 하루오', '하나에 나츠키, 카토 아카리', '117분', 3, '귀멸의 칼날_극장판무한열차편.jpg', '혈귀로 변한 여동생 ‘네즈코’를 되돌리기 위해 귀살대가 된 ‘탄지로’! 어둠 속을 달리는 무한열차에서 승객들이 흔적 없이 사라진다는 소식에 ‘젠이츠’, ‘이노스케’와 함께 임무 수행을 위해 무한열차에 탑승한다. 그리고 그 곳에서 만난 귀살대 최강 검사 염주 ‘렌고쿠’! 이들은 무한열차에 숨어 있는 혈귀의 존재를 직감하고 모두를 구하기 위해 목숨을 건 혈전을 시작하는데… 그 칼로 악몽을 끊어라!');             
    -- (3)영화목록(관리자, 최신등록순으로)(#, , )
    SELECT mvTitle, TO_CHAR(mvReleaseDate, 'YYYY') mvReleaseYear, mvPoster FROM MOVIE ORDER BY mvRdate DESC; 
    SELECT mvTitle || '(' || (SELECT COUNT(*) FROM MOVIE_LIKE WHERE mvId=MOVIE.mvId GROUP BY mvId) || ')' mvTITLE, TO_CHAR(mvReleaseDate, 'YYYY') mvReleaseYear, mvPoster FROM MOVIE ORDER BY mvRdate DESC;
    
    SELECT mvTitle, TO_CHAR(mvReleaseDate, 'YYYY') mvReleaseYear, mvPoster FROM MOVIE ORDER BY mvRdate DESC; 
    
    -- 관리자가 영화등록한순으로(top-N구문) --
    SELECT * 
        FROM (SELECT ROWNUM RN, mvTitle, TO_CHAR(mvReleaseDate, 'YYYY') mvReleaseYear, mvPoster FROM MOVIE ORDER BY mvRdate DESC)
        WHERE RN BETWEEN 1 AND 5;
   
     -- 인기순 탑쓰리
    SELECT * 
        FROM (SELECT MVID, MVTITLE, MVRELEASEDATE, MVPOSTER,(SELECT COUNT(*) FROM MOVIE_LIKE WHERE mvId=M.mvId GROUP BY mvId) mlCnt FROM MOVIE M ORDER BY MLCNT DESC, MVRELEASEDATE DESC) 
        WHERE ROWNUM<4;    
     
    -- 최신개봉순 탑쓰리
    SELECT * 
        FROM (SELECT MVID, MVTITLE, MVRELEASEDATE, MVPOSTER,(SELECT COUNT(*) FROM MOVIE_LIKE WHERE mvId=M.mvId GROUP BY mvId) mlCnt FROM MOVIE M ORDER BY MVRELEASEDATE DESC) 
        WHERE ROWNUM<4;
        
    -- (3)-1 전체영화갯수
    SELECT COUNT(*) FROM MOVIE;
    -- (4)영화상세보기(사용자,관리자) -> mvId로 MovieDto가져오기
    SELECT mvTitle, G.gName, TO_CHAR(mvReleaseDate, 'YYYY') mvReleaseYear, mvReleaseDate, mvDirector, mvCast, mvRunningTime, GR.grName, mvPoster, mvContent,(SELECT COUNT(*) FROM MOVIE_LIKE WHERE mvId=M.mvId GROUP BY mvId) mlCnt 
        FROM MOVIE M, GENRE G, GRADE GR 
        WHERE M.gId=G.gId AND M.grId=GR.grId AND mvId=3; 
    -- (5)영화수정(관리자)
    UPDATE MOVIE SET mvTitle='범죄도시2',
                     gId=8,
                     mvReleaseDate='2022-05-18',
                     mvDirector='이상용',
                     mvCast='마동석, 손석구, 최귀화',
                     mvRunningTime='106분',
                     grId=3,
                     mvPoster='범죄도시2.jpg',
                     mvContent='가리봉동 소탕작전 후 4년 뒤, 금천서 강력반은 베트남으로 도주한 용의자를 인도받아 오라는 미션을 받는다. 괴물형사 마석도(마동석)와 전일만(최귀화) 반장은 현지 용의자에게서 수상함을 느끼고, 그의 뒤에 무자비한 악행을 벌이는 강해상(손석구)이 있음을 알게 된다. 마석도와 금천서 강력반은 한국과 베트남을 오가며 역대급 범죄를 저지르는 강해상을 본격적으로 쫓기 시작하는데... 나쁜 놈들 잡는 데 국경 없다! 통쾌하고 화끈한 범죄 소탕 작전이 다시 펼쳐진다!'
                WHERE mvId=1;
    -- (6)영화삭제(관리자)
    DELETE FROM MOVIE WHERE mvId=1;
    ROLLBACK;
    -- (7)영화상세검색목록(사용자) -> 최신순(오래된순), 장르별, 좋아요많은(좋아요적은)순
    SELECT COUNT(*) FROM MOVIE_LIKE; 
-- MOVIE DUMMY
INSERT INTO MOVIE (mvId, mvTitle, gId, mvReleaseDate, mvDirector, mvCast, mvRunningTime, grId, mvPoster, mvContent) 
                VALUES(MOVIE_SEQ.NEXTVAL ,'범죄도시2', 8, '2022-05-18', '이상용', '마동석, 손석구, 최귀화', '106분', 3, '범죄도시2.jpg', '가리봉동 소탕작전 후 4년 뒤, 금천서 강력반은 베트남으로 도주한 용의자를 인도받아 오라는 미션을 받는다. 괴물형사 마석도(마동석)와 전일만(최귀화) 반장은 현지 용의자에게서 수상함을 느끼고, 그의 뒤에 무자비한 악행을 벌이는 강해상(손석구)이 있음을 알게 된다. 마석도와 금천서 강력반은 한국과 베트남을 오가며 역대급 범죄를 저지르는 강해상을 본격적으로 쫓기 시작하는데... 나쁜 놈들 잡는 데 국경 없다! 통쾌하고 화끈한 범죄 소탕 작전이 다시 펼쳐진다!');
SELECT * FROM GENRE;
SELECT * FROM GRADE;
COMMIT;