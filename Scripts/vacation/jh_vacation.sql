--전체 생성된 테이블 조회
SELECT table_name 
FROM user_tables;

SELECT * FROM VACATION ;

SELECT * FROM ER_DOCUMENT ed ORDER BY ER_DOC_CREATE_DATE desc;
SELECT * FROM ER_DOCUMENT ed WHERE ER_DOC_STATE = '처리완료' ORDER BY ER_DOC_CREATE_DATE DESC;
SELECT * from er_ap_line_storage ;
SELECT * from er_ap_line;
SELECT * from ER_APROVER  ORDER BY ER_DOC_SERIAL_KEY desc;
SELECT * from ER_REFERER er ;
SELECT * FROM MEMBER;
SELECT * FROM job;
SELECT * FROM ER_AL_STORAGE;
SELECT * FROM ER_APROVER ea ;
SELECT * FROM ER_FILE ORDER BY ER_FILE_UPLOAD_DATE desc;
SELECT * FROM ER_STORAGE es ;
SELECT * FROM DEPARTMENT d ;
SELECT * FROM ER_FORM ef ;
SELECT * FROM ER_FORM_FOLDER eff ;
SELECT * FROM DEPARTMENT d ;


--제약조건 확인
SELECT *
FROM user_constraints
WHERE table_name = 'ER_DOCUMENT';
--제약조건 삭제
ALTER TABLE ER_DOCUMENT drop CONSTRAINT fk_er_document_writer;
--참조 추가
ALTER TABLE ER_DOCUMENT ADD CONSTRAINT fk_er_doc_writer FOREIGN KEY (er_doc_writer) REFERENCES member(member_key);
DROP TABLE VACATION ;


CREATE TABLE VACATION (
	VACATION_KEY	NUMBER		NOT NULL,
	VACATION_NAME	VARCHAR2(100)		NOT NULL,
	VACATION_CALC_YN	VARCHAR2(50)	DEFAULT 'Y'	NOT NULL
);

ALTER TABLE VACATION ADD CONSTRAINT PK_VACATION PRIMARY KEY (
	VACATION_KEY
);



DROP TABLE VACATION_USE ;

CREATE TABLE VACATION_APPLY (
	VACATION_USE_KEY	NUMBER		NOT NULL,
	VACATION_KEY	NUMBER		NOT NULL,
	ER_DOCUMENT_KEY	VARCHAR2(500)		NOT NULL,
	VACATION_APPLY_DATE	DATE	DEFAULT SYSDATE	NOT NULL,
	VACATION_APPLY_STATUS	VARCHAR2(50)	DEFAULT '대기'	NOT NULL,
	VACATION_START_DATE	DATE		NULL,
	VACATION_END_DATE	DATE		NULL,
	VACATION_USE_COUNT	NUMBER		NOT NULL,
	VACATION_MEMBER_KEY	NUMBER		NOT NULL,
	VACATION_REASON	VARCHAR2(1000)		NULL
);

ALTER TABLE VACATION_APPLY ADD CONSTRAINT PK_VACATION_APPLY PRIMARY KEY (
	VACATION_USE_KEY
);


ALTER TABLE ER_DOCUMENT RENAME column ER_DOC_STOARGE_KEY TO ER_DOC_STORAGE_KEY;
ALTER TABLE ER_DOCUMENT RENAME column ER_DOC_STATE_UPDTE_DATE TO ER_DOC_STATE_UPDATE_DATE;
ALTER TABLE ER_DOCUMENT RENAME column ER_DOC_UNIQUE_NUM TO ER_DOC_SERIAL_KEY;
--ALTER TABLE ER_DOCUMENT ADD ER_DOC_STATE VARCHAR2(50) DEFAULT '처리중' NOT null;
--ALTER TABLE ER_DOCUMENT MODIFY er_doc_title varchar2(500);
ALTER TABLE ER_DOCUMENT ADD er_doc_storage_key NUMBER;
UPDATE ER_DOCUMENT SET er_doc_storage_key = 1;

ALTER TABLE ER_DOCUMENT DROP COLUMN ER_DOC_STOARGE;
ALTER TABLE ER_DOCUMENT DROP COLUMN er_file_key;

--pk
ALTER TABLE ER_DOCUMENT ADD CONSTRAINT PK_ER_DOCUMENT PRIMARY KEY (
	ER_DOC_KEY
);
--참조
ALTER TABLE ER_DOCUMENT ADD CONSTRAINT fk_er_doc_writer 
FOREIGN KEY (er_doc_writer) REFERENCES member(member_key);
ALTER TABLE ER_DOCUMENT ADD CONSTRAINT er_file_key 
FOREIGN KEY (er_file) REFERENCES member(er_file_key);

--문서 시퀀스(자바에서 문자열로 추가할 예정)
DROP sequence SEQ_ER_DOC_KEY;
DROP sequence SEQ_ER_DOC_UNIQUE_NUM;

CREATE SEQUENCE SEQ_ER_DOC_KEY
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
CACHE 20;
COMMIT;
SELECT SEQ_ER_DOC_SERIAL_KEY_DRAFT.nextval FROM DUAL;
CREATE SEQUENCE SEQ_ER_DOC_SERIAL_KEY_DRAFT
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
CACHE 20;
SELECT SEQ_ER_DOC_SERIAL_KEY_.nextval FROM DUAL;
CREATE SEQUENCE SEQ_ER_DOC_SERIAL_KEY
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
CACHE 20;
COMMIT;
ROLLBACK;
INSERT INTO ER_document values(SEQ_ER_DOC_KEY.nextval, '240709-D2F1-23', 3, '2024년 기술지원팀 (주)33사 기술지원 결과보고서', default, 'Y', DEFAULT, '보관함명', '문서제목.html', DEFAULT, NULL, NULL, NULL);
INSERT INTO ER_document values(SEQ_ER_DOC_KEY.nextval, '240709-D2F1-22', 3, '2024년 기술지원팀 (주)33사 기술지원 결과보고서', default, 'N', DEFAULT, '보관함명', '문서제목.html', DEFAULT, NULL, NULL, NULL);
INSERT INTO ER_document values(SEQ_ER_DOC_KEY.nextval, '240710-D2F1-29', 3, '2024년 기술지원팀 (주)33사 기술지원 결과보고서', default, 'N', DEFAULT, '보관함명', '문서제목.html', DEFAULT, NULL, NULL, NULL);
--INSERT INTO ER_document values(TO_CHAR(SYSDATE, 'YYMMDD') || '-' || 'D2F3' || '-' || to_char(SEQ_ER_FORM.nextval), 3, '문서제목', default, null, 'N', default, null, '보관함명', '문서제목.html');