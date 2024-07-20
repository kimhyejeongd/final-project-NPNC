--전체 생성된 테이블 조회
SELECT table_name 
FROM user_tables;

SELECT * FROM ER_DOCUMENT ed ;
SELECT * from ER_APPROVAL_LINE ;
SELECT * from ER_APROVER ;
SELECT * FROM MEMBER;
SELECT * FROM JOB j ;
SELECT * FROM ER_AL_STORAGE;
SELECT * FROM ER_APPROVAL_LINE eal ;
SELECT * FROM ER_APROVER ea ;
SELECT * FROM ER_FILE ;
SELECT * FROM ER_STORAGE es ;
SELECT * FROM ER_DOCUMENT ed ;
SELECT * FROM DEPARTMENT d ;
SELECT * FROM ER_FORM ef ;

--제약조건 확인
SELECT *
FROM user_constraints
WHERE table_name = 'ER_DOCUMENT';


--제약조건 삭제
--ALTER TABLE ER_DOCUMENT drop CONSTRAINT fk_er_document_writer;

DROP TABLE ER_FILE;

CREATE TABLE ER_FILE (
	ER_FILE_KEY	NUMBER		NOT NULL,
	ER_FILE_ORI_NAME	VARCHAR2(500)		NOT NULL,
	ER_FILE_RENAME	VARCHAR2(500)		NULL,
	ER_DOC_KEY	NUMBER		NOT NULL,
	ER_DOC_SERIAL_KEY	VARCHAR2(500)		NULL,
	ER_FILE_SIZE	NUMBER		NOT NULL,
	ER_FILE_FORM	VARCHAR2(50)		NULL,
	ER_FILE_UPLOAD_DATE	DATE	DEFAULT sysdate	NOT NULL,
	ER_FILE_ORDERBY	NUMBER		NULL,
	ER_FILE_UPLODAER	NUMBER		NOT NULL,
	ER_FILE_UPDATE_DATE	DATE		NULL,
	ER_FILE_UPDATER	NUMBER		NULL,
	ER_FILE_UPDATE_REASON	VARCHAR2(1000)		NULL
);

ALTER TABLE ER_FILE ADD CONSTRAINT PK_ER_FILE PRIMARY KEY (
	ER_FILE_KEY
);
select * from er_document
			left join er_file using(ER_DOC_SERIAL_KEY)
			where er_document.er_doc_key = 6;

ALTER TABLE ER_DOCUMENT RENAME column ER_DOC_STATE_UPDTE_DATE TO ER_DOC_STATE_UPDATE_DATE;
ALTER TABLE ER_DOCUMENT RENAME column ER_DOC_UNIQUE_NUM TO ER_DOC_SERIAL_KEY;
--ALTER TABLE ER_DOCUMENT ADD ER_DOC_STATE VARCHAR2(50) DEFAULT '처리중' NOT null;
--ALTER TABLE ER_DOCUMENT MODIFY er_doc_title varchar2(500);

ALTER TABLE ER_DOCUMENT DROP COLUMN er_file_key;


--문서 시퀀스(자바에서 문자열로 추가할 예정)
DROP sequence SEQ_ER_FILE_KEY;

CREATE SEQUENCE SEQ_ER_FILE_KEY
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
CACHE 20;
COMMIT;
SELECT SEQ_ER_DOC_SERIAL_KEY.nextval FROM DUAL;
ROLLBACK;
--INSERT INTO ER_document values(TO_CHAR(SYSDATE, 'YYMMDD') || '-' || 'D2F3' || '-' || to_char(SEQ_ER_FORM.nextval), 3, '문서제목', default, null, 'N', default, null, '보관함명', '문서제목.html');