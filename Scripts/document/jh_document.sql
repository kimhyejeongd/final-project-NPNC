SELECT 
			d.ER_DOC_KEY,
			d.ER_DOC_SERIAL_KEY,
			d.ER_DOC_WRITER,
			d.ER_DOC_TITLE,
			d.ER_DOC_CREATE_DATE,
			d.ER_DOC_EMERGENCY_YN,
			d.ER_DOC_DELETE_YN,
			d.ER_DOC_STOARGE,
			d.ER_DOC_FILENAME, 
			d.ER_DOC_STATE, 
			d.ER_DOC_STATE_UPDATE_DATE,
			d.ER_DOC_LAST_UPDATER,
			d.ER_DOC_LAST_UPDATE_REASON,
			f.ER_FILE_KEY,
			f.ER_FILE_ORI_NAME,
			f.ER_FILE_RENAME,
			f.ER_DOC_KEY,
			f.ER_DOC_SERIAL_KEY,
			f.ER_FILE_SIZE,
			f.ER_FILE_FORM,
			f.ER_FILE_UPLOAD_DATE,
			f.ER_FILE_ORDERBY,
			f.ER_FILE_UPLODAER,
			f.ER_FILE_UPDATE_DATE,
			f.ER_FILE_UPDATER,
			f.ER_FILE_UPDATE_REASON,
			ea.ER_APPROVER_KEY,
			ea.MEMBER_KEY,
			ea.ER_APPROVER_NAME,
			ea.ER_APPROVER_TEAM_KEY,
			d2.DEPARTMENT_NAME,
			ea.ER_APPROVER_JOB_KEY,
			j.JOB_NAME,
			ea.ER_APPROVAL_CATEGORY,
			ea.ER_APPROVAL_STATE,
			ea.ER_APPROVAL_OPINION,
			ea.ER_DOC_SERIAL_KEY,
			ea.ER_APPROVAL_DATE,
			ea.ER_APPROVAL_ORDERBY,
			er.ER_REFERER_KEY,
			er.ER_DOC_SERIAL_KEY,
			er.ER_REFERER_TEAM_KEY,
			d2.DEPARTMENT_NAME,
			er.ER_REFERER_JOB_KEY,
			j.JOB_NAME,
			er.ER_REFERER_NAME,
			er.MEMBER_KEY
		FROM   
			er_document d
        JOIN 
       		er_aprover ea ON d.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
		LEFT JOIN
      		ER_REFERER er ON d.ER_DOC_SERIAL_KEY = er.ER_DOC_SERIAL_KEY 
		JOIN
			job j ON ea.ER_APPROVER_JOB_KEY = j.JOB_KEY 
		JOIN
			DEPARTMENT d2 ON ea.ER_APPROVER_TEAM_KEY = d2.DEPARTMENT_KEY 
        LEFT JOIN 
        	er_file f ON d.ER_DOC_SERIAL_KEY = f.ER_DOC_SERIAL_KEY 
		WHERE  d.ER_DOC_SERIAL_KEY = '240722-1F1-TEMP-1';

--상세보기
SELECT 
			d.ER_DOC_KEY,
			d.ER_DOC_SERIAL_KEY,
			d.ER_DOC_WRITER,
			d.ER_DOC_TITLE,
			d.ER_DOC_CREATE_DATE,
			d.ER_DOC_EMERGENCY_YN,
			d.ER_DOC_DELETE_YN,
			d.ER_DOC_STOARGE,
			d.ER_DOC_FILENAME, 
			d.ER_DOC_STATE, 
			d.ER_DOC_STATE_UPDATE_DATE,
			d.ER_DOC_LAST_UPDATER,
			d.ER_DOC_LAST_UPDATE_REASON,
			f.ER_FILE_KEY,
			f.ER_FILE_ORI_NAME,
			f.ER_FILE_RENAME,
			f.ER_DOC_KEY,
			f.ER_DOC_SERIAL_KEY,
			f.ER_FILE_SIZE,
			f.ER_FILE_FORM,
			f.ER_FILE_UPLOAD_DATE,
			f.ER_FILE_ORDERBY,
			f.ER_FILE_UPLODAER,
			f.ER_FILE_UPDATE_DATE,
			f.ER_FILE_UPDATER,
			f.ER_FILE_UPDATE_REASON,
			ea.ER_APPROVER_KEY,
			ea.MEMBER_KEY,
			ea.ER_APPROVER_NAME,
			ea.ER_APPROVER_TEAM_KEY,
			d2.DEPARTMENT_NAME,
			ea.ER_APPROVER_JOB_KEY,
			j.JOB_NAME,
			ea.ER_APPROVAL_CATEGORY,
			ea.ER_APPROVAL_STATE,
			ea.ER_APPROVAL_OPINION,
			ea.ER_DOC_SERIAL_KEY,
			ea.ER_APPROVAL_DATE,
			ea.ER_APPROVAL_ORDERBY,
			er.ER_REFERER_KEY,
			er.ER_DOC_SERIAL_KEY,
			er.ER_REFERER_TEAM_NAME,
			er.ER_REFERER_JOB_NAME,
			er.ER_REFERER_NAME,
			er.MEMBER_KEY
		FROM   
			er_document d
        JOIN 
       		er_aprover ea ON d.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
		LEFT JOIN
      		ER_REFERER er ON d.ER_DOC_SERIAL_KEY = er.ER_DOC_SERIAL_KEY 
		JOIN
			job j ON ea.ER_APPROVER_JOB_KEY = j.JOB_KEY 
		JOIN
			DEPARTMENT d2 ON ea.ER_APPROVER_TEAM_KEY = d2.DEPARTMENT_KEY 
        LEFT JOIN 
        	er_file f ON d.ER_DOC_SERIAL_KEY = f.ER_DOC_SERIAL_KEY 
		WHERE  d.ER_DOC_KEY = ${docId};
--결재 대기 문서
--처리중인 모든 문서
SELECT
		d.ER_DOC_KEY, 
		    d.ER_DOC_SERIAL_KEY, 
		    d.ER_DOC_WRITER, 
		    d.ER_DOC_TITLE, 
		    d.ER_DOC_CREATE_DATE, 
		    d.ER_DOC_EMERGENCY_YN, 
		    d.ER_DOC_DELETE_YN, 
		    d.ER_DOC_STOARGE, 
		    d.ER_DOC_FILENAME,
		    d.ER_DOC_STATE,
		    d.ER_DOC_STATE_UPDATE_DATE, 
		    d.ER_DOC_LAST_UPDATER, 
		    d.ER_DOC_LAST_UPDATE_REASON,
		    a1.ER_APPROVER_KEY,
		    a1.MEMBER_KEY,
		    a1.ER_APPROVER_NAME,
		    a1.ER_APPROVER_TEAM,
		    a1.ER_APPROVER_JOB,
		    a1.ER_APPROVAL_CATEGORY,
		    a1.ER_APPROVAL_STATE,
		    a1.ER_APPROVAL_OPINION, 
		    a1.ER_DOC_SERIAL_KEY,
		    a1.ER_APPROVAL_DATE,
		    a1.ER_APPROVAL_ORDERBY,
		    er.ER_REFERER_KEY,
		    er.ER_DOC_SERIAL_KEY,
		    er.ER_REFERER_TEAM_NAME,
		    er.ER_REFERER_JOB_NAME,
		    er.ER_REFERER_NAME,
		    er.MEMBER_KEY
		FROM 
		    er_document d
		LEFT JOIN 
		    er_aprover a1
		ON 
		    d.ER_DOC_SERIAL_KEY = a1.ER_DOC_SERIAL_KEY
		LEFT JOIN 
			ER_REFERER er 
		ON
			d.ER_DOC_SERIAL_KEY = er.ER_DOC_SERIAL_KEY
		WHERE    
			d.er_doc_state = '처리중' --처리중 문서
		ORDER BY  
			d.er_doc_emergency_yn DESC,
			d.er_doc_create_date,
			a1.er_approval_orderby;

		--오라클 현재 버전에서 JSON_ARRAYAGG 지원안함 12c 이상만 활용가능
--SELECT 
--    d.ER_DOC_KEY, 
--    d.ER_DOC_SERIAL_KEY, 
--    d.ER_DOC_TITLE, 
--    d.ER_DOC_CREATE_DATE, 
--    d.ER_DOC_EMERGENCY_YN, 
--    d.ER_DOC_DELETE_YN, 
--    d.ER_DOC_STOARGE, 
--    d.ER_DOC_FILENAME,
--    d.ER_DOC_STATE,
--    d.ER_DOC_STATE_UPDATE_DATE, 
--    d.ER_DOC_LAST_UPDATER, 
--    d.ER_DOC_LAST_UPDATE_REASON,
--    d.ER_DOC_WRITER, 
--    de.department_name,
--    j.job_name,
--    m.MEMBER_NAME,
--    a.member_key,
--     (
--        SELECT JSON_ARRAYAGG(
--                   JSON_OBJECT(
--                       ea.member_key,
--                       ea.ER_APPROVER_TEAM,
--                       ea.ER_APPROVER_JOB,
--                       ea.ER_APPROVER_NAME,
--                       ea.ER_APPROVAL_CATEGORY,
--                       ea.ER_APPROVAL_STATE,
--                       ea.ER_APPROVAL_ORDERBY
--                   ) 
--               )
--        FROM ER_APROVER ea
--        WHERE ea.er_doc_serial_key = d.er_doc_serial_key
--    ) AS approvers_info
--FROM
--    er_document d
--JOIN 
--    member m ON d.er_doc_writer = m.MEMBER_KEY
--JOIN 
--    DEPARTMENT de ON m.DEPARTMENT_KEY = de.department_key
--JOIN 
--    job j ON m.JOB_KEY = j.JOB_KEY 
--JOIN 
--    ER_APROVER a ON d.er_doc_serial_key = a.er_doc_serial_key
--WHERE
--    d.er_doc_state = '처리중'
--    AND a.member_key = ${no}
--    AND NOT EXISTS (
--        SELECT 1 
--        FROM ER_APROVER a2
--        WHERE a2.er_doc_serial_key = d.er_doc_serial_key
--        AND a2.er_approval_orderby < a.er_approval_orderby
--        AND a2.ER_APPROVAL_STATE != '승인'
--    )
--ORDER BY
--    d.er_doc_serial_key, a.ER_APPROVAL_ORDERBY;
		
SELECT 
    d.ER_DOC_KEY, 
			d.ER_DOC_SERIAL_KEY, 
			d.ER_DOC_TITLE, 
			d.ER_DOC_CREATE_DATE, 
			d.ER_DOC_EMERGENCY_YN, 
			d.ER_DOC_DELETE_YN, 
			d.ER_DOC_STOARGE, 
			d.ER_DOC_FILENAME,
			d.ER_DOC_STATE,
			d.ER_DOC_STATE_UPDATE_DATE, 
			d.ER_DOC_LAST_UPDATER, 
			d.ER_DOC_LAST_UPDATE_REASON,
			d.ER_DOC_WRITER, 
		    j.job_name,
		    m.MEMBER_NAME,
		    a.member_key,
			a.ER_APPROVER_TEAM,
		    a.ER_APPROVER_JOB,
		    a.ER_APPROVER_NAME,
		    a.ER_APPROVAL_CATEGORY,
		    a.ER_APPROVAL_STATE,
		    a.er_approval_orderby
FROM
    er_document d
JOIN 
    member m ON d.er_doc_writer = m.MEMBER_KEY
JOIN 
    department de ON m.DEPARTMENT_KEY = de.department_key
JOIN 
    job j ON m.JOB_KEY = j.JOB_KEY 
JOIN 
    ER_APROVER a ON d.er_doc_serial_key = a.er_doc_serial_key
WHERE
    d.er_doc_state = '처리중'
AND NOT EXISTS (
    SELECT 1 
    FROM ER_APROVER a3
    WHERE a3.er_doc_serial_key = d.er_doc_serial_key
    AND a3.er_approval_orderby < a.er_approval_orderby
    AND a3.ER_APPROVAL_STATE != '승인'
)
ORDER BY
    d.er_doc_serial_key;

SELECT 
		    d.ER_DOC_KEY, 
			d.ER_DOC_SERIAL_KEY, 
			d.ER_DOC_TITLE, 
			d.ER_DOC_CREATE_DATE, 
			d.ER_DOC_EMERGENCY_YN, 
			d.ER_DOC_DELETE_YN, 
			d.ER_DOC_STOARGE, 
			d.ER_DOC_FILENAME,
			d.ER_DOC_STATE,
			d.ER_DOC_STATE_UPDATE_DATE, 
			d.ER_DOC_LAST_UPDATER, 
			d.ER_DOC_LAST_UPDATE_REASON,
			d.ER_DOC_WRITER, 
		    j.job_name,
		    m.MEMBER_NAME,
		    a.member_key,
		    a.ER_APPROVER_KEY,
			a.ER_APPROVER_TEAM_KEY,
			de.DEPARTMENT_NAME,
		    a.ER_APPROVER_JOB_KEY,
		    j.JOB_NAME,
		    a.ER_APPROVER_NAME,
		    a.ER_APPROVAL_CATEGORY,
		    a.ER_APPROVAL_STATE,
		    a.er_approval_orderby
		FROM
		    er_document d
		JOIN 
		    member m ON d.er_doc_writer = m.MEMBER_KEY
		JOIN 
		    department de ON m.DEPARTMENT_KEY = de.department_key
		JOIN 
		    job j ON m.JOB_KEY = j.JOB_KEY 
		JOIN 
		    ER_APROVER a ON d.er_doc_serial_key = a.er_doc_serial_key
		WHERE
		    d.er_doc_state = '처리중'
		    AND NOT EXISTS (
		        SELECT 1 
		        FROM ER_APROVER a3
		        WHERE a3.er_doc_serial_key = d.er_doc_serial_key
		        AND a3.er_approval_orderby < a.er_approval_orderby
		        AND a3.ER_APPROVAL_STATE != '승인'
		    )
		ORDER BY 
			d.er_doc_create_date DESC, 
			a.er_approval_orderby;
SELECT    
 	*
FROM      
 	er_document d
left join 
	er_aprover ea USING(er_doc_serial_key)
JOIN
	job j ON ea.ER_APPROVER_JOB_KEY = j.JOB_KEY 
JOIN
	DEPARTMENT d2 ON ea.ER_APPROVER_TEAM_KEY = d2.DEPARTMENT_KEY 
WHERE     
	er_doc_state = '처리중'
ORDER BY  
	er_doc_emergency_yn DESC,
	er_doc_serial_key,
	er_approval_orderby;
--진행중 문서
SELECT    
		 	*
		FROM      
		 	er_document d
		left join 
			er_aprover ea USING(er_doc_serial_key)
		JOIN
			job j ON ea.ER_APPROVER_JOB_KEY = j.JOB_KEY 
		JOIN
			DEPARTMENT d2 ON ea.ER_APPROVER_TEAM_KEY = d2.DEPARTMENT_KEY 
		WHERE     
			er_doc_writer = ${no}
		AND       
			er_doc_state = '처리중'
		ORDER BY  
			er_doc_emergency_yn DESC,
			er_approval_orderby;
SELECT * 
		FROM   
			er_document d
        LEFT JOIN 
        	er_file f ON d.ER_DOC_SERIAL_KEY = f.ER_DOC_SERIAL_KEY 
        JOIN 
       		er_aprover ea ON d.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
       	LEFT JOIN
       		ER_REFERER er ON d.ER_DOC_SERIAL_KEY = er.ER_DOC_SERIAL_KEY 
		WHERE  d.ER_DOC_KEY = ${docId};

--전체 생성된 테이블 조회
SELECT table_name 
FROM user_tables;

SELECT * FROM ER_DOCUMENT ed ;
SELECT * from ER_APPROVAL_LINE ;
SELECT * from ER_APROVER ;
SELECT * from ER_REFERER er ;
SELECT * FROM MEMBER;
SELECT * FROM ER_AL_STORAGE;
SELECT * FROM ER_APPROVAL_LINE eal ;
SELECT * FROM ER_APROVER ea ;
SELECT * FROM ER_REFERENCE er ;
SELECT * FROM ER_FILE ;
SELECT * FROM ER_STORAGE es ;
SELECT * FROM DEPARTMENT d ;
SELECT * FROM ER_FORM ef ;
SELECT * FROM ER_FORM_FOLDER eff ;
SELECT * FROM DEPARTMENT d ;

--DROP TABLE ER_REFERENCE CASCADE CONSTRAINTS;


--제약조건 확인
SELECT *
FROM user_constraints
WHERE table_name = 'ER_DOCUMENT';
--제약조건 삭제
ALTER TABLE ER_DOCUMENT drop CONSTRAINT fk_er_document_writer;
--참조 추가
ALTER TABLE ER_DOCUMENT ADD CONSTRAINT fk_er_doc_writer FOREIGN KEY (er_doc_writer) REFERENCES member(member_key);
DROP TABLE ER_DOCUMENT;

CREATE TABLE ER_DOCUMENT (
	ER_DOC_KEY	number	NOT NULL,
	ER_DOC_SERIAL_KEY	VARCHAR2(200)	unique	NOT NULL,
	ER_DOC_WRITER	NUMBER		NOT NULL,
	ER_DOC_TITLE	VARCHAR2(500)		NULL,
	ER_DOC_CREATE_DATE	DATE	DEFAULT SYSDATE	NULL,
	ER_DOC_EMERGENCY_YN	CHAR		NULL,
	ER_DOC_DELETE_YN	CHAR	DEFAULT 'N'	NOT NULL,
	ER_DOC_STOARGE	VARCHAR2(50)		NULL,
	ER_DOC_FILENAME	VARCHAR2(1000)		NULL,
	ER_DOC_STATE VARCHAR2(50) DEFAULT '처리중' NOT NULL,
	ER_DOC_STATE_UPDATE_DATE	DATE		NULL,
	ER_DOC_LAST_UPDATER NUMBER NULL,
	ER_DOC_LAST_UPDATE_REASON VARCHAR2(1000) NULL,
	er_file_key NUMBER null
);
ALTER TABLE ER_DOCUMENT RENAME column ER_DOC_STATE_UPDTE_DATE TO ER_DOC_STATE_UPDATE_DATE;
ALTER TABLE ER_DOCUMENT RENAME column ER_DOC_UNIQUE_NUM TO ER_DOC_SERIAL_KEY;
--ALTER TABLE ER_DOCUMENT ADD ER_DOC_STATE VARCHAR2(50) DEFAULT '처리중' NOT null;
--ALTER TABLE ER_DOCUMENT MODIFY er_doc_title varchar2(500);

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