--접속유저의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--접속유저의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--접속유저의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--접속유저의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/

--------------------------------------- 회원 유형 TABLE -------------------------------------------------
CREATE TABLE MEM_TYPE
    (
    MT_ID VARCHAR2(20) DEFAULT 'M' CHECK(MT_ID IN ('A', 'M', 'H', 'P', 'E', 'K')) PRIMARY KEY 
    , MT_NAME VARCHAR2(20) NOT NULL
    );

COMMENT ON COLUMN MEM_TYPE.MT_ID IS '회원유형ID(관리자:A, 회원:M, 병원:H, 약국:P, 응급실:E, 한의원:K)';
COMMENT ON COLUMN MEM_TYPE.MT_NAME IS '회원유형이름';

------------------------------ 회원 TABLE ---------------------------------------
CREATE TABLE MEMBER 
      (
      MEM_NO VARCHAR2(20) CONSTRAINT MEM_NO_PK PRIMARY KEY
    , MT_ID VARCHAR2(20) NOT NULL CONSTRAINT MT_ID_FK REFERENCES MEM_TYPE(MT_ID)
    , MEM_ID VARCHAR2(30) NOT NULL UNIQUE
    , MEM_PWD VARCHAR2(100)
    , MEM_NAME VARCHAR2(30)
    , NICKNAME VARCHAR2(30) UNIQUE
    , EMAIL VARCHAR2(100) UNIQUE
    , EMAIL_AUTH NUMBER DEFAULT 0 NOT NULL CHECK(EMAIL_AUTH IN (0,1))
    , ADDRESS VARCHAR2(100)
    , PHONE VARCHAR2(13)
    , MEMBERSHIP CHAR(1) DEFAULT 'N' CONSTRAINT MEMBERSHIP_CK CHECK(MEMBERSHIP IN('Y', 'N'))
    , STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT STATUS_CK CHECK(STATUS IN('Y', 'N'))
    , ENROLL_DATE DATE DEFAULT SYSDATE
    , MODIFY_DATE DATE DEFAULT SYSDATE
      );
COMMENT ON COLUMN MEMBER.MEM_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.MT_ID IS '회원유형ID';
COMMENT ON COLUMN MEMBER.MEM_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.MEM_PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.MEM_NAME IS '회원이름';
COMMENT ON COLUMN MEMBER.NICKNAME IS '닉네임';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.EMAIL_AUTH IS '이메일인증여부(미인증:0, 인증:1)';
COMMENT ON COLUMN MEMBER.ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.MEMBERSHIP IS '멤버쉽구매여부';
COMMENT ON COLUMN MEMBER.STATUS IS '상태';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '가입일';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '수정일';

-------------------------------- 병원 카테고리 TABLE -----------------------------
CREATE TABLE H_CATEGORY(
   H_CTG NUMBER PRIMARY KEY,
   CTG_NAME VARCHAR2(30) NOT NULL
);


COMMENT ON COLUMN H_CATEGORY.H_CTG IS '병원기관코드';
COMMENT ON COLUMN H_CATEGORY.CTG_NAME IS '카테고리이름';

-------------------------------- 병원 TABLE -----------------------------
CREATE TABLE HOSPITAL(
   H_CODE VARCHAR2(20) PRIMARY KEY,
   H_CTG NUMBER NOT NULL REFERENCES H_CATEGORY,
   H_NAME VARCHAR2(50) NOT NULL,
   H_ADDRESS VARCHAR2(300) NOT NULL,
   H_TEL VARCHAR2(20),
   EMG_YN CHAR(1) NOT NULL CHECK(EMG_YN IN ('Y','N')),
   H_TREATTIME VARCHAR2(20) NOT NULL
);
COMMENT ON COLUMN HOSPITAL.H_CODE IS '병원기관코드';
COMMENT ON COLUMN HOSPITAL.H_CTG IS '병원카테고리';
COMMENT ON COLUMN HOSPITAL.H_NAME IS '병원이름';
COMMENT ON COLUMN HOSPITAL.H_ADDRESS IS '병원주소';
COMMENT ON COLUMN HOSPITAL.H_TEL IS '병원 전화번호';
COMMENT ON COLUMN HOSPITAL.EMG_YN IS '응급실운영여부';
COMMENT ON COLUMN HOSPITAL.H_TREATTIME IS '병원 진료시간';

-------------------------------- 첨부파일 TABLE -----------------------------
CREATE TABLE IMG_FILE(
   IMG_FILE_NO NUMBER PRIMARY KEY,
   REF_NO  VARCHAR2(20) NOT NULL,
   IMG_ORIGIN_NAME VARCHAR2(255),
   IMG_CHANGE_NAME VARCHAR2(255) NOT NULL,
   IMG_FILE_PATH VARCHAR2(1000) NOT NULL,
   UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL ,
   IMG_STATUS CHAR(1) NOT NULL CHECK (IMG_STATUS IN ('Y','N')) 
);

COMMENT ON COLUMN IMG_FILE.IMG_FILE_NO IS '파일번호';
COMMENT ON COLUMN IMG_FILE.REF_NO IS '참조게시글번호';
COMMENT ON COLUMN IMG_FILE.IMG_ORIGIN_NAME IS '파일원본명';
COMMENT ON COLUMN IMG_FILE.IMG_CHANGE_NAME IS '파일수정명';
COMMENT ON COLUMN IMG_FILE.IMG_FILE_PATH IS '파일저장경로';
COMMENT ON COLUMN IMG_FILE.UPLOAD_DATE IS '업로드일';
COMMENT ON COLUMN IMG_FILE.IMG_STATUS IS '파일상태';

-------------------------------- 리뷰 카테고리 TABLE -----------------------------
CREATE TABLE REVIEW(
   R_NO NUMBER PRIMARY KEY,
   MEM_NO VARCHAR2(20)  NOT NULL REFERENCES MEMBER,
   R_CONTENT VARCHAR2(300) NOT NULL,
   R_DATE DATE DEFAULT SYSDATE NOT NULL ,
   RATE NUMBER NOT NULL,
   RV_STATUS CHAR(1) NOT NULL CHECK (RV_STATUS IN ('Y','N')),
   H_CODE VARCHAR2(20) NOT NULL REFERENCES HOSPITAL,
   IMG_FILE_NO NUMBER NOT NULL REFERENCES IMG_FILE
);

COMMENT ON COLUMN REVIEW.R_NO IS '리뷰번호';
COMMENT ON COLUMN REVIEW.MEM_NO IS '작성자';
COMMENT ON COLUMN REVIEW.R_CONTENT IS '리뷰내용';
COMMENT ON COLUMN REVIEW.R_DATE IS '작성일';
COMMENT ON COLUMN REVIEW.RATE IS '별점';
COMMENT ON COLUMN REVIEW.RV_STATUS IS '리뷰상태';
COMMENT ON COLUMN REVIEW.H_CODE IS '병원코드';
COMMENT ON COLUMN REVIEW.IMG_FILE_NO IS '이미지번호';

---------------------------------------- 알림 TABLE---------------------------------------

CREATE TABLE ALERT
     (
     ALERT_NO VARCHAR2(20) CONSTRAINT ALERT_NO_PK PRIMARY KEY 
   , MEM_NO VARCHAR2(20) CONSTRAINT ALERT_MEM_NO_FK REFERENCES MEMBER
   , ALERT_CONTENT VARCHAR2(2000) CONSTRAINT ALERT_CONTENT_NN NOT NULL
   , ALERT_DATE DATE DEFAULT SYSDATE
   , A_STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT A_STATUS_CK CHECK(A_STATUS IN('Y', 'N')) 
     );

COMMENT ON COLUMN ALERT.ALERT_NO IS '알림번호';
COMMENT ON COLUMN ALERT.MEM_NO IS '회원번호';
COMMENT ON COLUMN ALERT.ALERT_CONTENT IS '알림내용';
COMMENT ON COLUMN ALERT.ALERT_DATE IS '알림일시';
COMMENT ON COLUMN ALERT.A_STATUS IS '알림상태';

------------------------------ 멤버십 TABLE --------------------------------

CREATE TABLE MEMBERSHIP
      (
      MEM_NO VARCHAR2(20) REFERENCES MEMBER PRIMARY KEY
    , MS_PRICE NUMBER CONSTRAINT MS_PRICE_NN NOT NULL
    , MS_MONTH CHAR(1) DEFAULT 'N' CONSTRAINT MS_MONTH_CK CHECK(MS_MONTH IN('Y', 'N'))
    , MS_YEAR CHAR(1) DEFAULT 'N' CONSTRAINT MS_YEAR_CK CHECK(MS_YEAR IN('Y', 'N'))
    , EXPIRATION_DATE DATE 
    , BUY_DATE DATE DEFAULT SYSDATE
    , END_DATE DATE CONSTRAINT END_DATE_NN NOT NULL 
      );

COMMENT ON COLUMN MEMBERSHIP.MEM_NO IS '회원번호';
COMMENT ON COLUMN MEMBERSHIP.MS_PRICE IS '가격';
COMMENT ON COLUMN MEMBERSHIP.MS_MONTH IS '월간이용권';
COMMENT ON COLUMN MEMBERSHIP.MS_YEAR IS '연간이용권';
COMMENT ON COLUMN MEMBERSHIP.EXPIRATION_DATE IS '유효기간';
COMMENT ON COLUMN MEMBERSHIP.BUY_DATE IS '구매일';
COMMENT ON COLUMN MEMBERSHIP.END_DATE IS '종료일';

-------------------------------- 약국 TABLE -----------------------------
CREATE TABLE PHARMACY(
   P_NO VARCHAR2(20) PRIMARY KEY,
   P_NAME VARCHAR2(30) ,
   P_ADDRESS VARCHAR2(60),
   P_TEL VARCHAR2(20),
   P_TIME VARCHAR2(20)
);

COMMENT ON COLUMN PHARMACY.P_NO IS '약국번호';
COMMENT ON COLUMN PHARMACY.P_NAME IS '약국이름';
COMMENT ON COLUMN PHARMACY.P_ADDRESS IS '약국주소';
COMMENT ON COLUMN PHARMACY.P_TEL IS '전화번호';
COMMENT ON COLUMN PHARMACY.P_TIME IS '운영시간';

-------------------------------- 한의원 TABLE -----------------------------
CREATE TABLE KO_HOSPITAL(
   K_NO VARCHAR2(20) PRIMARY KEY,
   K_NAME VARCHAR2(30) NOT NULL,
   K_ADDRESS VARCHAR2(60) NOT NULL,
   K_TEL VARCHAR2(20),
   K_TIME VARCHAR2(20)
);

COMMENT ON COLUMN KO_HOSPITAL.K_NO IS '한의원번호';
COMMENT ON COLUMN KO_HOSPITAL.K_NAME IS '한의원이름';
COMMENT ON COLUMN KO_HOSPITAL.K_ADDRESS IS '한의원주소';
COMMENT ON COLUMN KO_HOSPITAL.K_TEL IS '전화번호';
COMMENT ON COLUMN KO_HOSPITAL.K_TIME IS '운영시간';

------------------------------------ 응급실 TABLE ------------------------------------
CREATE TABLE EMERGENCY 
     (
     H_CODE VARCHAR2(20) CONSTRAINT H_CODE_FK REFERENCES HOSPITAL PRIMARY KEY
   , STAGE1 VARCHAR2(20) CONSTRAINT STAGE1_NN NOT NULL 
   , STAGE2 VARCHAR2(70) CONSTRAINT STAGE2_NN NOT NULL 
   , E_PAGENO NUMBER CONSTRAINT E_PAGENO_NN NOT NULL
   , E_NUMROW NUMBER CONSTRAINT E_NUMROW_NN NOT NULL  
     );

COMMENT ON COLUMN EMERGENCY.H_CODE IS '병원기관코드';
COMMENT ON COLUMN EMERGENCY.STAGE1 IS '주소(시도)';
COMMENT ON COLUMN EMERGENCY.STAGE2 IS '주소(시군구)';
COMMENT ON COLUMN EMERGENCY.E_PAGENO IS '페이지번호';
COMMENT ON COLUMN EMERGENCY.E_NUMROW IS '목록건수';

------------------------------ 약 TABLE ---------------------------------------
CREATE TABLE MEDICINE(
    MD_NO VARCHAR2(20) CONSTRAINT MD_PK PRIMARY KEY,
    P_NO VARCHAR2(23) NOT NULL REFERENCES PHARMACY(P_NO),
    K_NO VARCHAR2(20) NOT NULL REFERENCES KO_HOSPITAL(K_NO),
    MD_NAME VARCHAR2(60) NOT NULL,
    MD_IMG VARCHAR2(300),
    MD_CTG CHAR(1) NOT NULL
);

COMMENT ON COLUMN MEDICINE.MD_NO IS '약 번호';
COMMENT ON COLUMN MEDICINE.P_NO IS '약국 번호';
COMMENT ON COLUMN MEDICINE.K_NO IS '한의원 번호';
COMMENT ON COLUMN MEDICINE.MD_NAME IS '약 이름';
COMMENT ON COLUMN MEDICINE.MD_IMG IS '약 대표이미지';
COMMENT ON COLUMN MEDICINE.MD_CTG IS '약 유형';

---------------------------------------- 좋아요 TABLE ----------------------------------------
CREATE TABLE M_LIKE
    (
    MEM_NO VARCHAR2(20) CONSTRAINT MEM_NO_FK REFERENCES MEMBER 
  , H_NO VARCHAR2(20) CONSTRAINT H_NO_FK REFERENCES HOSPITAL
  , P_NO VARCHAR2(20) CONSTRAINT P_NO_FK REFERENCES PHARMACY
  , K_NO VARCHAR2(20) CONSTRAINT K_NO_FK REFERENCES KO_HOSPITAL
  , LIKE_DATE DATE DEFAULT SYSDATE
  , PRIMARY KEY(MEM_NO, H_NO, P_NO, K_NO)
    );

COMMENT ON COLUMN M_LIKE.MEM_NO IS '병원기관코드';
COMMENT ON COLUMN M_LIKE.H_NO IS '주소(시도)';
COMMENT ON COLUMN M_LIKE.P_NO IS '주소(시군구)';
COMMENT ON COLUMN M_LIKE.K_NO IS '페이지번호';
COMMENT ON COLUMN M_LIKE.LIKE_DATE IS '목록건수';



-------------------------------- 채팅방 TABLE -----------------------------
CREATE TABLE CHATROOM(
   CR_NO VARCHAR2(20) PRIMARY KEY,
   CR_STATUS CHAR(1) NOT NULL CHECK (CR_STATUS IN ('Y','N')),
   MEM_NO VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN CHATROOM.CR_NO IS '채팅방번호';
COMMENT ON COLUMN CHATROOM.CR_STATUS IS '채팅방상태';
COMMENT ON COLUMN CHATROOM.MEM_NO IS '회원번호';

-------------------------------- 채팅 메세지 TABLE -----------------------------
CREATE TABLE MESSAGE(
   MSG_NO VARCHAR2(20) PRIMARY KEY,
   M_SENDER VARCHAR2(20) NOT NULL,
   M_RECEIVER VARCHAR2(20) NOT NULL,
   MSG_CONT VARCHAR2(300) NOT NULL,
   MSG_DATE DATE NOT NULL,
   READ_YN CHAR(1) DEFAULT 'Y' CHECK(READ_YN IN('Y','N')),
   CHATROMM_NO NUMBER NOT NULL
);

COMMENT ON COLUMN MESSAGE.MSG_NO IS '메시지번호';
COMMENT ON COLUMN MESSAGE.M_SENDER IS '발신자';
COMMENT ON COLUMN MESSAGE.M_RECEIVER IS '수신자';
COMMENT ON COLUMN MESSAGE.MSG_CONT IS '메시지내용';
COMMENT ON COLUMN MESSAGE.MSG_DATE IS '작성일';
COMMENT ON COLUMN MESSAGE.READ_YN IS '읽음여부';
COMMENT ON COLUMN MESSAGE.CHATROMM_NO IS '채팅방번호';

------------------------------ 택배 TABLE ---------------------------------------

CREATE TABLE DELIVERY(
    D_NO VARCHAR2(20) CONSTRAINT DNO_PK PRIMARY KEY,
    MD_NO VARCHAR2(20) NOT NULL REFERENCES MEDICINE(MD_NO),
    BILLING_NO NUMBER NOT NULL,
    D_SENDER VARCHAR2(20) NOT NULL,
    D_RECEIVER VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN DELIVERY.D_NO IS '택배번호';
COMMENT ON COLUMN DELIVERY.D_NO IS '약번호';
COMMENT ON COLUMN DELIVERY.BILLING_NO IS '운송장번호';
COMMENT ON COLUMN DELIVERY.D_SENDER IS '발신자';
COMMENT ON COLUMN DELIVERY.D_RECEIVER IS '수신자';

------------------------------------ 시퀀스 -------------------------------------
CREATE SEQUENCE SEQ_MNO NOCACHE;
CREATE SEQUENCE SEQ_HCODE NOCACHE;
CREATE SEQUENCE SEQ_ANO NOCACHE;
CREATE SEQUENCE SEQ_INO NOCACHE;
CREATE SEQUENCE SEQ_RNO NOCACHE;
CREATE SEQUENCE SEQ_CRNO NOCACHE;
CREATE SEQUENCE SEQ_MSGNO NOCACHE;
CREATE SEQUENCE SEQ_KNO NOCACHE;
CREATE SEQUENCE SEQ_PNO NOCACHE;
CREATE SEQUENCE SEQ_DNO NOCACHE;
CREATE SEQUENCE SEQ_MDNO NOCACHE;

COMMIT;