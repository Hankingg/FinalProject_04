--------------------------------- ȸ�� ���� ���õ����� ------------------------------------
INSERT INTO MEM_TYPE VALUES('A', '������');
INSERT INTO MEM_TYPE VALUES('M', 'ȸ��');
INSERT INTO MEM_TYPE VALUES('H', '����');
INSERT INTO MEM_TYPE VALUES('P', '�౹');
INSERT INTO MEM_TYPE VALUES('E', '���޽�');
INSERT INTO MEM_TYPE VALUES('K', '���ǿ�');

----------------------------------- ȸ�� ���õ����� ------------------------------------
INSERT INTO MEMBER
VALUES(SEQ_MNO.NEXTVAL, 'A', 'admin', 'admin', '������', 'admin', 'admin@naver.com', 1, NULL, '010-1124-5532', 'Y', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO MEMBER
VALUES(SEQ_MNO.NEXTVAL, 'K', 'user01', 'pass01', '������', 'njm', 'njm@naver.com', 1, '����Ư���� ������', '010-4234-5555', 'Y', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO MEMBER
VALUES(SEQ_MNO.NEXTVAL, 'E',  'user02', 'pass02', '����', 'ysy', 'ysy@gmail.com', 1, '����Ư���� ���Ǳ�', '010-2234-6654', 'N', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO MEMBER
VALUES(SEQ_MNO.NEXTVAL, 'H',  'user03', 'pass03', '������', 'ljm', 'ljm@daum.net', 1, '����Ư���� ��������', '010-3564-8876', 'Y', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO MEMBER
VALUES(SEQ_MNO.NEXTVAL, 'P',  'user04', 'pass04', '���ѱ�', 'lhg', 'lhg@naver.com', 1, '����Ư���� ���빮��', '010-8875-1134', 'Y', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO MEMBER
VALUES(SEQ_MNO.NEXTVAL, 'M',  'user05', 'pass05', '��ÿ�', 'ksy', 'ksy@naver.com', 0, '��⵵ ���ν�', '010-7511-2254', 'N', DEFAULT, DEFAULT, DEFAULT);
