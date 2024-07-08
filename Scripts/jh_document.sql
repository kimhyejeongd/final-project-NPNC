--전체 생성된 테이블 조회
SELECT table_name 
FROM user_tables;

SELECT * FROM ER_DOCUMENT ed ;
SELECT * from ER_APPROVAL_LINE ;
SELECT * FROM MEMBER;
SELECT * FROM ER_AL_STORAGE;
SELECT * FROM ER_APPROVAL_LINE eal ;
SELECT * FROM ER_APROVAL_MEMBER eam ;
SELECT * FROM ER_FILE ;
SELECT * FROM ER_STORAGE es ;
SELECT * FROM ER_DOCUMENT ed ;

DROP TABLE ER_DOCUMENT CASCADE CONSTRAINTS;

--erd 수정
/*ALTER TABLE ER_DOCUMENT RENAME COLUMN er_document_key TO er_doc_key;
ALTER TABLE ER_DOCUMENT RENAME COLUMN er_document_writer TO er_doc_writer;
ALTER TABLE ER_DOCUMENT RENAME COLUMN er_document_title TO er_doc_title;
ALTER TABLE ER_DOCUMENT RENAME COLUMN er_doct_content TO er_doc_content;
ALTER TABLE ER_DOCUMENT RENAME COLUMN er_create_date TO er_doc_crate_date;
ALTER TABLE ER_DOCUMENT RENAME COLUMN er_approval_date TO er_doc_approval_date;
ALTER TABLE ER_DOCUMENT RENAME COLUMN er_storage_key TO er_doc_storage_key;
ALTER TABLE ER_DOCUMENT ADD (er_doc_emergency_yn char); 
ALTER TABLE ER_DOCUMENT ADD (er_doc_delete_yn char DEFAULT 'N'); 
ALTER TABLE ER_DOCUMENT ADD (er_doc_update_date date DEFAULT sysdate); 
ALTER TABLE ER_DOCUMENT modify (er_doc_update_date date DEFAULT sysdate); 
ALTER TABLE ER_DOCUMENT drop COLUMN er_open;
ALTER TABLE ER_DOCUMENT drop COLUMN er_reciever;*/

--제약조건 확인
SELECT *
FROM user_constraints
WHERE table_name = 'ER_DOCUMENT';
--제약조건 삭제
ALTER TABLE ER_DOCUMENT drop CONSTRAINT fk_er_document_writer;
--참조 추가
ALTER TABLE ER_DOCUMENT ADD CONSTRAINT fk_er_doc_writer FOREIGN KEY (er_doc_writer) REFERENCES member(member_key);

--새로 생성
CREATE TABLE ER_DOCUMENT (
    ER_DOC_KEY             VARCHAR2(200) NOT NULL, --50에서 수정
    ER_DOC_WRITER          NUMBER NOT NULL,
    ER_DOC_TITLE           VARCHAR2(50) NULL,
    ER_DOC_CONTENT         VARCHAR2(1000) NULL,
    ER_DOC_CREATE_DATE     DATE DEFAULT SYSDATE NOT NULL,
    ER_DOC_APPROVAL_DATE   DATE NULL,
    ER_DOC_EMERGENCY_YN    CHAR NULL,
    ER_DOC_DELETE_YN       CHAR  DEFAULT 'N' NOT NULL,
    ER_DOC_UPDATE_DATE     DATE  DEFAULT SYSDATE not NULL,
    ER_DOC_STOARGE         VARCHAR2(50) NOT NULL
);
COMMENT ON COLUMN ER_DOCUMENT.ER_DOC_WRITER IS '본인';
COMMENT ON COLUMN ER_DOCUMENT.ER_DOC_CREATE_DATE IS '상신시 결재 시작';
COMMENT ON COLUMN ER_DOCUMENT.ER_DOC_APPROVAL_DATE IS '최종결재 완료일';
COMMENT ON COLUMN ER_DOCUMENT.ER_DOC_DELETE_YN IS 'Y면 삭제(취소선)';
COMMENT ON COLUMN ER_DOCUMENT.ER_DOC_UPDATE_DATE IS '문서상신시 혹은 문서수정시 일자';

ALTER TABLE ER_DOCUMENT modify (ER_DOC_KEY varchar2(200));

ALTER TABLE ER_DOCUMENT ADD CONSTRAINT PK_ER_DOCUMENT PRIMARY KEY (
	ER_DOC_KEY
);

ALTER TABLE ER_DOCUMENT ADD CONSTRAINT fk_er_doc_writer 
FOREIGN KEY (er_doc_writer) REFERENCES member(member_key);

--문서 시퀀스(자바에서 문자열로 추가할 예정)
CREATE SEQUENCE SEQ_ER_DOC_KEY
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
CACHE 20;