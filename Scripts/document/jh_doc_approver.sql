--전자결재 결재자
SELECT * FROM MEMBER;
SELECT * FROM job;
SELECT * FROM DEPARTMENT d ;
SELECT * FROM ER_APROVer eam;

UPDATE ER_APROVER 
SET ER_APPROVER_Job_KEY = 'J4'
WHERE ER_APPROVER_NAME = '강진주';

--DROP TABLE ER_APROVER;

CREATE TABLE ER_APROVER (
	ER_APPROVER_KEY		NUMBER		NOT NULL,
	MEMBER_KEY			NUMBER		NOT NULL,
	ER_APPROVER_NAME	VARCHAR2(50)		NOT NULL,
	ER_APPROVER_TEAM_KEY	VARCHAR2(50)		NOT NULL,
	ER_APPROVER_JOB_KEY		VARCHAR2(50)		NULL,
	ER_APPROVAL_CATEGORY	VARCHAR2(50)	NOT NULL,
	ER_APPROVAL_STATE	VARCHAR2(50)		NOT NULL,
	ER_APPROVAL_OPINION	VARCHAR2(1000)		NULL,
	ER_DOC_SERIAL_KEY			VARCHAR2(500)		NOT NULL,
	ER_APPROVAL_DATE	DATE	DEFAULT sysdate	NULL,
	ER_APPROVAL_ORDERBY	NUMBER		NOT NULL
);
ALTER TABLE ER_APROVER MODIFY ER_DOC_KEY varchar2(500);
ALTER TABLE ER_APROVER RENAME column ER_APPROVER_TEAM TO ER_APPROVER_TEAM_KEY;
ALTER TABLE ER_APROVER RENAME column ER_APPROVER_JOB TO ER_APPROVER_JOB_KEY;
ALTER TABLE ER_APROVER RENAME column ER_DOC_KEY TO ER_DOC_SERIAL_KEY;
ALTER TABLE ER_APROVER ADD CONSTRAINT PK_ER_APROVER PRIMARY KEY (
	ER_APPROVER_KEY
);

DROP sequence SEQ_ER_APPROVER_KEY;
ROLLBACK;
CREATE SEQUENCE SEQ_ER_APPROVER_KEY
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
CACHE 20;

SELECT SEQ_ER_APPROVER_KEY.nextval FROM DUAL;
INSERT INTO ER_aprover values(SEQ_ER_APPROVER_KEY.nextval, 2,'나팀장', '경영팀', '팀장', '검토', '대기', null, '20240606-D1F2-1', null, 1);

INSERT INTO ER_aprover values(SEQ_ER_APPROVER_KEY.nextval, 2, '김팀장', '기술지원팀', '팀장', '검토', '대기', null, AAAtDXAABAAALCRAAD, null, 1);



SELECT    
		 	ER_DOC_KEY,
		 	ER_DOC_SERIAL_KEY,
		 	ER_DOC_WRITER,
		 	m.DEPARTMENT_KEY,
		 	m.JOB_KEY,
		 	ER_DOC_TITLE,
		 	ER_DOC_CREATE_DATE,
		 	ER_DOC_EMERGENCY_YN,
		 	ER_DOC_DELETE_YN,
		 	ER_DOC_STOARGE,
		 	ER_DOC_FILENAME,
		 	ER_DOC_STATE,
		 	ER_DOC_STATE_UPDATE_DATE,
		 	ER_DOC_LAST_UPDATER,
		 	ER_DOC_LAST_UPDATE_REASON,
		 	ER_APPROVER_KEY,
		 	MEMBER_KEY,
		 	ER_APPROVER_NAME,
		 	ER_APPROVER_TEAM_KEY,
		 	ER_APPROVER_JOB_KEY,
		 	DEPARTMENT_NAME
		 	JOB_NAME,
		 	ER_APPROVAL_CATEGORY,
		 	ER_APPROVAL_STATE,
		 	ER_APPROVAL_OPINION,
		 	ER_APPROVAL_DATE,
		 	ER_APPROVAL_ORDERBY
		FROM      
		 	ER_DOCUMENT d
		JOIN
			MEMBER m ON m.MEMBER_KEY = d.ER_DOC_WRITER 
		LEFT JOIN
			ER_APROVER ea USING(ER_DOC_SERIAL_KEY)
		JOIN
			JOB j ON ea.ER_APPROVER_JOB_KEY = j.JOB_KEY 
		JOIN
			DEPARTMENT d2 ON ea.ER_APPROVER_TEAM_KEY = d2.DEPARTMENT_KEY 
		WHERE     
			ER_DOC_WRITER = 5
		AND       
			ER_DOC_STATE = '처리중'
		ORDER BY  
			ER_DOC_EMERGENCY_YN DESC,
			ER_DOC_CREATE_DATE DESC,
			ER_APPROVAL_ORDERBY;