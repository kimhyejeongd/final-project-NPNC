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
   
		SELECT    *
			FROM      er_document d
			left join er_aprover ea
			USING    (er_doc_serial_key)
			WHERE     er_doc_writer = ${no}
			AND       er_doc_state = '처리중'
			ORDER BY  er_doc_emergency_yn DESC,
			          er_approval_orderby;
			         
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
			d.ER_DOC_WRITER
		FROM      er_document d
		left join er_aprover ea on d.er_doc_serial_key = ea.er_doc_serial_key
		WHERE     d.er_doc_writer = ${no}
		AND       d.er_doc_state = '회수'
		ORDER BY  d.er_doc_emergency_yn DESC,
		          ea.er_approval_orderby;
		
SELECT * FROM ER_DOCUMENT ed ;
SELECT * from ER_APPROVAL_LINE ;
SELECT * from ER_APROVER ;
SELECT * FROM MEMBER;
SELECT * FROM job;
SELECT * FROM DEPARTMENT d ;
SELECT * FROM ER_AL_STORAGE;
SELECT * FROM ER_APROVER ea ;
SELECT * FROM ER_REFERER er ;
SELECT * FROM ER_FILE ;
SELECT * FROM ER_STORAGE es ;
SELECT * FROM DEPARTMENT d ;
SELECT * FROM ER_FORM ef ;
SELECT * FROM ER_FORM_FOLDER eff ;
		
DROP TABLE ER_REFERER;

SELECT * FROM ER_REFERER er ;
CREATE TABLE ER_REFERER (
	ER_REFERER_KEY	NUMBER		NOT NULL,
	ER_DOC_SERIAL_KEY	VARCHAR2(500)		NOT NULL,
	ER_REFERER_TEAM_NAME	VARCHAR2(50)		NULL,
	ER_REFERER_JOB_NAME	VARCHAR(255)		NULL,
	ER_REFERER_NAME	VARCHAR2(50)		NOT NULL,
	MEMBER_KEY NUMBER NOT null
);

ALTER TABLE ER_REFERER ADD CONSTRAINT PK_ER_REFERER PRIMARY KEY (
	ER_REFERER_KEY
);

DROP sequence SEQ_ER_REFERER_KEY;

CREATE SEQUENCE SEQ_ER_REFERER_KEY
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
CACHE 20;
COMMIT;
SELECT SEQ_ER_REFERER_KEY.nextval FROM DUAL;