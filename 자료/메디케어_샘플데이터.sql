--------------------------------- 회원 유형 샘플데이터 ------------------------------------
INSERT INTO MEM_TYPE VALUES('A', '관리자');
INSERT INTO MEM_TYPE VALUES('M', '회원');
INSERT INTO MEM_TYPE VALUES('H', '병원');
INSERT INTO MEM_TYPE VALUES('P', '약국');
INSERT INTO MEM_TYPE VALUES('E', '응급실');
INSERT INTO MEM_TYPE VALUES('K', '한의원');

----------------------------------- 회원 샘플데이터 ------------------------------------
INSERT INTO MEMBER
VALUES(SEQ_MNO.NEXTVAL, 'A', 'admin', 'admin', '관리자', 'admin', 'admin@naver.com', 1, NULL, '010-1124-5532', 'Y', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO MEMBER
VALUES(SEQ_MNO.NEXTVAL, 'K', 'user01', 'pass01', '노정민', 'njm', 'njm@naver.com', 1, '서울특별시 강남구', '010-4234-5555', 'Y', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO MEMBER
VALUES(SEQ_MNO.NEXTVAL, 'E',  'user02', 'pass02', '윤상연', 'ysy', 'ysy@gmail.com', 1, '서울특별시 관악구', '010-2234-6654', 'N', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO MEMBER
VALUES(SEQ_MNO.NEXTVAL, 'H',  'user03', 'pass03', '이종민', 'ljm', 'ljm@daum.net', 1, '서울특별시 영등포구', '010-3564-8876', 'Y', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO MEMBER
VALUES(SEQ_MNO.NEXTVAL, 'P',  'user04', 'pass04', '이한기', 'lhg', 'lhg@naver.com', 1, '서울특별시 서대문구', '010-8875-1134', 'Y', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO MEMBER
VALUES(SEQ_MNO.NEXTVAL, 'M',  'user05', 'pass05', '김시연', 'ksy', 'ksy@naver.com', 0, '경기도 용인시', '010-7511-2254', 'N', DEFAULT, DEFAULT, DEFAULT);
