SELECT    
		 	ER_DOC_KEY,
		 	ER_DOC_SERIAL_KEY,
		 	ER_DOC_WRITER,
		 	ER_DOC_TITLE,
		 	ER_DOC_CREATE_DATE,
		 	ER_DOC_EMERGENCY_YN,
		 	ER_DOC_DELETE_YN,
		 	ER_DOC_STOARGE_KEY,
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
		 	ER_APPROVAL_CATEGORY,
		 	ER_APPROVAL_STATE,
		 	ER_APPROVAL_OPINION,
		 	ER_APPROVAL_DATE,
		 	ER_APPROVAL_ORDERBY,
		 	JOB_KEY,
		 	JOB_NAME,
		 	DEPARTMENT_KEY,
		 	DEPARTMENT_NAME
		FROM      
		 	ER_DOCUMENT d
		LEFT JOIN
			ER_APROVER ea USING(ER_DOC_SERIAL_KEY)
		JOIN
			JOB j ON ea.ER_APPROVER_JOB_KEY = j.JOB_KEY 
		JOIN
			DEPARTMENT d2 ON ea.ER_APPROVER_TEAM_KEY = d2.DEPARTMENT_KEY 
		WHERE     
			ER_DOC_WRITER = ${no}
		AND       
			ER_DOC_STATE = '처리중'
		ORDER BY  
			ER_DOC_EMERGENCY_YN DESC,
			ER_DOC_CREATE_DATE DESC,
			ER_APPROVAL_ORDERBY;

SELECT * FROM er_document WHERE er_doc_key = 106;

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
		ALTER TABLE ER_DOCUMENT ADD ER_DOC_COMPLETE_DATE date DEFAULT sysdate;

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

--결재 대기
WITH ER1 AS
(
SELECT 
	ER_DOC_SERIAL_KEY edsk,
	ER_APPROVER_KEY eak,
	ER_APPROVAL_STATE eas,
	ER_APPROVAL_ORDERBY eao
FROM ER_APROVER ea2
WHERE MEMBER_KEY = 5
)
	SELECT * 
	FROM ER1 er 
	JOIN ER_DOCUMENT ed
	ON er.edsk = ed.ER_DOC_SERIAL_KEY
--	LEFT JOIN er_aprover aps
--	ON aps.ER_DOC_SERIAL_KEY = er.edsk
	WHERE ed.ER_DOC_STATE ='처리중'
	AND NOT EXISTS (
		    SELECT 1
		    FROM ER_APROVER a
		    WHERE a.ER_DOC_SERIAL_KEY = er.edsk
--		    AND a.ER_APPROVAL_ORDERBY <![CDATA[<]]> ea.ER_APPROVAL_ORDERBY
		    AND a.ER_APPROVAL_ORDERBY < er.eao
		    AND a.ER_APPROVAL_STATE != '보류'
		);
	
	
	
--처리중인 문서, 로그인회원이 결재자로 있는 문서만 출력
SELECT 
		    fd.ER_DOC_KEY,
		    fd.ER_DOC_SERIAL_KEY,
		    fd.ER_DOC_WRITER,
		    fd.department_key AS writer_dept_key,
		    fd.department_name AS writer_dept_name,
		    fd.job_key AS writer_job_key,
		    fd.job_name AS writer_job_name,
		    fd.ER_DOC_TITLE,
		    fd.ER_DOC_CREATE_DATE,
		    fd.ER_DOC_EMERGENCY_YN,
		    fd.ER_DOC_DELETE_YN,
		    fd.ER_DOC_STOARGE,
		    fd.ER_DOC_FILENAME,
		    fd.ER_DOC_STATE,
		    fd.ER_DOC_STATE_UPDATE_DATE,
		    fd.ER_DOC_LAST_UPDATER,
		    fd.ER_DOC_LAST_UPDATE_REASON,
		    ea.ER_APPROVER_KEY,
		    ea.MEMBER_KEY,
		    ea.ER_APPROVER_NAME,
		    ea.ER_APPROVER_TEAM_KEY,
		    d.DEPARTMENT_NAME,
		    ea.ER_APPROVER_JOB_KEY,
		    j.JOB_NAME,
		    ea.ER_APPROVAL_CATEGORY,
		    ea.ER_APPROVAL_STATE,
		    ea.ER_APPROVAL_OPINION,
		    ea.ER_DOC_SERIAL_KEY,
		    ea.ER_APPROVAL_DATE,
		    ea.ER_APPROVAL_ORDERBY,
		    d.DEPARTMENT_NAME,
		    ef.ER_FILE_KEY,
		    ef.ER_FILE_ORI_NAME,
		    ef.ER_FILE_RENAME,
		    ef.ER_DOC_KEY,
		    ef.ER_DOC_SERIAL_KEY,
		    ef.ER_FILE_SIZE,
		    ef.ER_FILE_FORM,
		    ef.ER_FILE_UPLOAD_DATE,
		    ef.ER_FILE_ORDERBY,
		    ef.ER_FILE_UPLODAER,
		    ef.ER_FILE_UPDATE_DATE,
		    ef.ER_FILE_UPDATER,
		    ef.ER_FILE_UPDATE_REASON,
		    er.ER_REFERER_KEY,
		    er.ER_DOC_SERIAL_KEY,
		    er.ER_REFERER_TEAM_KEY,
		    er.ER_REFERER_JOB_KEY,
		    er.ER_REFERER_NAME,
		    er.MEMBER_KEY
		FROM ER_APROVER ea 
		JOIN (
			    SELECT 
			        ed.ER_DOC_KEY,
			        ed.ER_DOC_SERIAL_KEY,
			        ed.ER_DOC_WRITER,
			        m.department_key,
			        d2.department_name,
			        m.job_key,
			        j2.job_name,
			        ed.ER_DOC_TITLE,
			        ed.ER_DOC_CREATE_DATE,
			        ed.ER_DOC_EMERGENCY_YN,
			        ed.ER_DOC_DELETE_YN,
			        ed.ER_DOC_STOARGE,
			        ed.ER_DOC_FILENAME,
			        ed.ER_DOC_STATE,
			        ed.ER_DOC_STATE_UPDATE_DATE,
			        ed.ER_DOC_LAST_UPDATER,
			        ed.ER_DOC_LAST_UPDATE_REASON
			    FROM 
			        ER_DOCUMENT ed 
			    JOIN
			        ER_APROVER ea ON ed.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
			    LEFT JOIN 
			    	MEMBER m ON ed.ER_DOC_WRITER = m.member_key
			    JOIN 
			    	DEPARTMENT d2 ON d2.department_key = m.department_key
			    JOIN 
			    	job j2 ON j2.job_key = m.job_key
			    WHERE
			        ed.ER_DOC_STATE = '처리중'
			    AND    
			        ea.member_Key = 4
			) fd 
			ON fd.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
		LEFT JOIN 
			ER_FILE ef ON ef.ER_DOC_SERIAL_KEY = fd.ER_DOC_SERIAL_KEY
		LEFT JOIN 
			DEPARTMENT d ON d.DEPARTMENT_KEY = ea.ER_APPROVER_TEAM_KEY 
		LEFT JOIN 
			job j ON j.job_KEY = ea.ER_APPROVER_JOB_KEY 
		LEFT JOIN 
			ER_REFERER er ON er.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
		WHERE NOT EXISTS (
		    SELECT 1
		    FROM ER_APROVER a
		    WHERE a.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
--		    AND a.ER_APPROVAL_ORDERBY <![CDATA[<]]> ea.ER_APPROVAL_ORDERBY
		    AND a.ER_APPROVAL_ORDERBY < ea.ER_APPROVAL_ORDERBY
		    AND a.ER_APPROVAL_STATE != '승인'
		)
		AND NOT EXISTS (
		    SELECT 1
		    FROM ER_APROVER a
		    WHERE a.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
		    AND a.ER_APPROVAL_ORDERBY = ea.ER_APPROVAL_ORDERBY
		    AND a.ER_APPROVAL_STATE = '대기'
		)
		ORDER BY 
			ER_DOC_EMERGENCY_YN DESC,
			ER_DOC_CREATE_DATE DESC,
			ER_APPROVAL_ORDERBY ASC;
			

SELECT 
        fd.ER_DOC_KEY,
        fd.ER_DOC_SERIAL_KEY,
        fd.ER_DOC_WRITER,
        fd.department_key AS writer_dept_key,
        fd.department_name AS writer_dept_name,
        fd.job_key AS writer_job_key,
        fd.job_name AS writer_job_name,
        fd.ER_DOC_TITLE,
        fd.ER_DOC_CREATE_DATE,
        fd.ER_DOC_EMERGENCY_YN,
        fd.ER_DOC_DELETE_YN,
        fd.ER_DOC_STOARGE,
        fd.ER_DOC_FILENAME,
        fd.ER_DOC_STATE,
        fd.ER_DOC_STATE_UPDATE_DATE,
        fd.ER_DOC_LAST_UPDATER,
        fd.ER_DOC_LAST_UPDATE_REASON,
        ef.ER_FILE_KEY,
        ef.ER_FILE_ORI_NAME,
        ef.ER_FILE_RENAME,
        ef.ER_DOC_KEY,
        ef.ER_DOC_SERIAL_KEY,
        ef.ER_FILE_SIZE,
        ef.ER_FILE_FORM,
        ef.ER_FILE_UPLOAD_DATE,
        ef.ER_FILE_ORDERBY,
        ef.ER_FILE_UPLODAER,
        ef.ER_FILE_UPDATE_DATE,
        ef.ER_FILE_UPDATER,
        ef.ER_FILE_UPDATE_REASON
    FROM ER_APROVER ea 
    JOIN (
            SELECT 
                ed.ER_DOC_KEY,
                ed.ER_DOC_SERIAL_KEY,
                ed.ER_DOC_WRITER,
                m.department_key,
                d2.department_name,
                m.job_key,
                j2.job_name,
                ed.ER_DOC_TITLE,
                ed.ER_DOC_CREATE_DATE,
                ed.ER_DOC_EMERGENCY_YN,
                ed.ER_DOC_DELETE_YN,
                ed.ER_DOC_STOARGE,
                ed.ER_DOC_FILENAME,
                ed.ER_DOC_STATE,
                ed.ER_DOC_STATE_UPDATE_DATE,
                ed.ER_DOC_LAST_UPDATER,
                ed.ER_DOC_LAST_UPDATE_REASON
            FROM 
                ER_DOCUMENT ed 
            JOIN
                ER_APROVER ea ON ed.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
            LEFT JOIN 
                MEMBER m ON ed.ER_DOC_WRITER = m.member_key
            JOIN 
                DEPARTMENT d2 ON d2.department_key = m.department_key
            JOIN 
                job j2 ON j2.job_key = m.job_key
            WHERE
                ed.ER_DOC_STATE = '처리중'
            AND    
                ea.member_Key = ${no}
            AND
                NOT EXISTS (
                    SELECT 1
                    FROM ER_APROVER a
                    WHERE a.ER_DOC_SERIAL_KEY = ed.ER_DOC_SERIAL_KEY
                    AND a.ER_APPROVAL_ORDERBY < ea.ER_APPROVAL_ORDERBY
                    AND a.ER_APPROVAL_STATE != '승인'
                )
        ) fd 
        ON fd.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
    LEFT JOIN 
        ER_FILE ef ON ef.ER_DOC_SERIAL_KEY = fd.ER_DOC_SERIAL_KEY
    LEFT JOIN 
        DEPARTMENT d ON d.DEPARTMENT_KEY = ea.ER_APPROVER_TEAM_KEY 
    LEFT JOIN 
        job j ON j.job_KEY = ea.ER_APPROVER_JOB_KEY 
    WHERE 
        ea.MEMBER_KEY = ${no}
    ORDER BY 
        ER_DOC_EMERGENCY_YN DESC,
        ER_DOC_CREATE_DATE DESC,
        ER_APPROVAL_ORDERBY ASC
        
--결재자, 참조인 조인
WITH FilteredDocs AS (
    SELECT 
        ed.ER_DOC_KEY,
        ed.ER_DOC_SERIAL_KEY,
        ed.ER_DOC_WRITER,
        m.department_key,
        d2.department_name,
        m.job_key,
        j2.job_name,
        ed.ER_DOC_TITLE,
        ed.ER_DOC_CREATE_DATE,
        ed.ER_DOC_EMERGENCY_YN,
        ed.ER_DOC_DELETE_YN,
        ed.ER_DOC_STOARGE,
        ed.ER_DOC_FILENAME,
        ed.ER_DOC_STATE,
        ed.ER_DOC_STATE_UPDATE_DATE,
        ed.ER_DOC_LAST_UPDATER,
        ed.ER_DOC_LAST_UPDATE_REASON
    FROM 
        ER_DOCUMENT ed 
    JOIN
        ER_APROVER ea ON ed.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
    LEFT JOIN 
        MEMBER m ON ed.ER_DOC_WRITER = m.member_key
    JOIN 
        DEPARTMENT d2 ON d2.department_key = m.department_key
    JOIN 
        job j2 ON j2.job_key = m.job_key
    WHERE
        ed.ER_DOC_STATE = '처리중'
    AND    
        ea.member_Key = ${no}
    AND
        NOT EXISTS (
            SELECT 1
            FROM ER_APROVER a
            WHERE a.ER_DOC_SERIAL_KEY = ed.ER_DOC_SERIAL_KEY
            AND a.ER_APPROVAL_ORDERBY < ea.ER_APPROVAL_ORDERBY
            AND a.ER_APPROVAL_STATE != '승인'
        )
)
SELECT 
    fd.ER_DOC_KEY,
    fd.ER_DOC_SERIAL_KEY,
    fd.ER_DOC_WRITER,
    fd.department_key AS writer_dept_key,
    fd.department_name AS writer_dept_name,
    fd.job_key AS writer_job_key,
    fd.job_name AS writer_job_name,
    fd.ER_DOC_TITLE,
    fd.ER_DOC_CREATE_DATE,
    fd.ER_DOC_EMERGENCY_YN,
    fd.ER_DOC_DELETE_YN,
    fd.ER_DOC_STOARGE,
    fd.ER_DOC_FILENAME,
    fd.ER_DOC_STATE,
    fd.ER_DOC_STATE_UPDATE_DATE,
    fd.ER_DOC_LAST_UPDATER,
    fd.ER_DOC_LAST_UPDATE_REASON,
    ef.ER_FILE_KEY,
    ef.ER_FILE_ORI_NAME,
    ef.ER_FILE_RENAME,
    ef.ER_DOC_KEY,
    ef.ER_DOC_SERIAL_KEY,
    ef.ER_FILE_SIZE,
    ef.ER_FILE_FORM,
    ef.ER_FILE_UPLOAD_DATE,
    ef.ER_FILE_ORDERBY,
    ef.ER_FILE_UPLODAER,
    ef.ER_FILE_UPDATE_DATE,
    ef.ER_FILE_UPDATER,
    ef.ER_FILE_UPDATE_REASON,
    ea.ER_APPROVER_KEY,
    ea.MEMBER_KEY,
    ea.ER_APPROVER_NAME,
    ea.ER_APPROVER_TEAM_KEY,
    d.DEPARTMENT_NAME AS approver_dept_name,
    ea.ER_APPROVER_JOB_KEY,
    j.JOB_NAME AS approver_job_name,
    ea.ER_APPROVAL_CATEGORY,
    ea.ER_APPROVAL_STATE,
    ea.ER_APPROVAL_OPINION,
    ea.ER_APPROVAL_DATE,
    ea.ER_APPROVAL_ORDERBY,
    er.ER_REFERER_KEY,
    er.ER_REFERER_TEAM_KEY,
    er.ER_REFERER_JOB_KEY,
    er.ER_REFERER_NAME,
    er.MEMBER_KEY AS referer_member_key
FROM 
    FilteredDocs fd
LEFT JOIN 
    ER_FILE ef ON ef.ER_DOC_SERIAL_KEY = fd.ER_DOC_SERIAL_KEY
LEFT JOIN 
    ER_APROVER ea ON ea.ER_DOC_SERIAL_KEY = fd.ER_DOC_SERIAL_KEY
LEFT JOIN 
    DEPARTMENT d ON d.DEPARTMENT_KEY = ea.ER_APPROVER_TEAM_KEY 
LEFT JOIN 
    job j ON j.job_KEY = ea.ER_APPROVER_JOB_KEY 
LEFT JOIN 
    ER_REFERER er ON er.ER_DOC_SERIAL_KEY = fd.ER_DOC_SERIAL_KEY
ORDER BY 
    fd.ER_DOC_EMERGENCY_YN DESC,
    fd.ER_DOC_CREATE_DATE DESC,
    ea.ER_APPROVAL_ORDERBY ASC
    
    
--보류한 문서
    SELECT 
		    fd.ER_DOC_KEY,
		    fd.ER_DOC_SERIAL_KEY,
		    fd.ER_DOC_WRITER,
		    fd.department_key AS writer_dept_key,
		    fd.department_name AS writer_dept_name,
		    fd.job_key AS writer_job_key,
		    fd.job_name AS writer_job_name,
		    fd.ER_DOC_TITLE,
		    fd.ER_DOC_CREATE_DATE,
		    fd.ER_DOC_EMERGENCY_YN,
		    fd.ER_DOC_DELETE_YN,
		    fd.ER_DOC_STOARGE,
		    fd.ER_DOC_FILENAME,
		    fd.ER_DOC_STATE,
		    fd.ER_DOC_STATE_UPDATE_DATE,
		    fd.ER_DOC_LAST_UPDATER,
		    fd.ER_DOC_LAST_UPDATE_REASON,
		    ea.ER_APPROVER_KEY,
		    ea.MEMBER_KEY,
		    ea.ER_APPROVER_NAME,
		    ea.ER_APPROVER_TEAM_KEY,
		    d.DEPARTMENT_NAME,
		    ea.ER_APPROVER_JOB_KEY,
		    j.JOB_NAME,
		    ea.ER_APPROVAL_CATEGORY,
		    ea.ER_APPROVAL_STATE,
		    ea.ER_APPROVAL_OPINION,
		    ea.ER_DOC_SERIAL_KEY,
		    ea.ER_APPROVAL_DATE,
		    ea.ER_APPROVAL_ORDERBY,
		    d.DEPARTMENT_NAME,
		    ef.ER_FILE_KEY,
		    ef.ER_FILE_ORI_NAME,
		    ef.ER_FILE_RENAME,
		    ef.ER_DOC_KEY,
		    ef.ER_DOC_SERIAL_KEY,
		    ef.ER_FILE_SIZE,
		    ef.ER_FILE_FORM,
		    ef.ER_FILE_UPLOAD_DATE,
		    ef.ER_FILE_ORDERBY,
		    ef.ER_FILE_UPLODAER,
		    ef.ER_FILE_UPDATE_DATE,
		    ef.ER_FILE_UPDATER,
		    ef.ER_FILE_UPDATE_REASON,
		    er.ER_REFERER_KEY,
		    er.ER_DOC_SERIAL_KEY,
		    er.ER_REFERER_TEAM_KEY,
		    er.ER_REFERER_JOB_KEY,
		    er.ER_REFERER_NAME,
		    er.MEMBER_KEY
		FROM ER_APROVER ea 
		JOIN (
			    SELECT 
			        ed.ER_DOC_KEY,
			        ed.ER_DOC_SERIAL_KEY,
			        ed.ER_DOC_WRITER,
			        m.department_key,
			        d2.department_name,
			        m.job_key,
			        j2.job_name,
			        ed.ER_DOC_TITLE,
			        ed.ER_DOC_CREATE_DATE,
			        ed.ER_DOC_EMERGENCY_YN,
			        ed.ER_DOC_DELETE_YN,
			        ed.ER_DOC_STOARGE,
			        ed.ER_DOC_FILENAME,
			        ed.ER_DOC_STATE,
			        ed.ER_DOC_STATE_UPDATE_DATE,
			        ed.ER_DOC_LAST_UPDATER,
			        ed.ER_DOC_LAST_UPDATE_REASON
			    FROM 
			        ER_DOCUMENT ed 
			    JOIN
			        ER_APROVER ea ON ed.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
			    LEFT JOIN 
			    	MEMBER m ON ed.ER_DOC_WRITER = m.member_key
			    JOIN 
			    	DEPARTMENT d2 ON d2.department_key = m.department_key
			    JOIN 
			    	job j2 ON j2.job_key = m.job_key
			    WHERE
			        ed.ER_DOC_STATE = '처리중'
			    AND    
			        ea.member_Key = ${no}
			    AND
		        NOT EXISTS (
		            SELECT 1
		            FROM ER_APROVER a
		            WHERE a.ER_DOC_SERIAL_KEY = ed.ER_DOC_SERIAL_KEY
		            AND a.ER_APPROVAL_ORDERBY = ea.ER_APPROVAL_ORDERBY
		            AND a.ER_APPROVAL_STATE != '보류'
		        )
			) fd 
			ON fd.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
		LEFT JOIN 
			ER_FILE ef ON ef.ER_DOC_SERIAL_KEY = fd.ER_DOC_SERIAL_KEY
		LEFT JOIN 
			DEPARTMENT d ON d.DEPARTMENT_KEY = ea.ER_APPROVER_TEAM_KEY 
		LEFT JOIN 
			job j ON j.job_KEY = ea.ER_APPROVER_JOB_KEY 
		LEFT JOIN 
			ER_REFERER er ON er.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
		ORDER BY 
			ER_DOC_EMERGENCY_YN DESC,
			ER_DOC_CREATE_DATE DESC,
			ER_APPROVAL_ORDERBY ASC
			
--반려
			SELECT 
		    fd.ER_DOC_KEY,
		    fd.ER_DOC_SERIAL_KEY,
		    fd.ER_DOC_WRITER,
		    fd.department_key AS writer_dept_key,
		    fd.department_name AS writer_dept_name,
		    fd.job_key AS writer_job_key,
		    fd.job_name AS writer_job_name,
		    fd.ER_DOC_TITLE,
		    fd.ER_DOC_CREATE_DATE,
		    fd.ER_DOC_EMERGENCY_YN,
		    fd.ER_DOC_DELETE_YN,
		    fd.ER_DOC_STOARGE,
		    fd.ER_DOC_FILENAME,
		    fd.ER_DOC_STATE,
		    fd.ER_DOC_STATE_UPDATE_DATE,
		    fd.ER_DOC_LAST_UPDATER,
		    fd.ER_DOC_LAST_UPDATE_REASON,
		    ea.ER_APPROVER_KEY,
		    ea.MEMBER_KEY,
		    ea.ER_APPROVER_NAME,
		    ea.ER_APPROVER_TEAM_KEY,
		    d.DEPARTMENT_NAME,
		    ea.ER_APPROVER_JOB_KEY,
		    j.JOB_NAME,
		    ea.ER_APPROVAL_CATEGORY,
		    ea.ER_APPROVAL_STATE,
		    ea.ER_APPROVAL_OPINION,
		    ea.ER_DOC_SERIAL_KEY,
		    ea.ER_APPROVAL_DATE,
		    ea.ER_APPROVAL_ORDERBY,
		    d.DEPARTMENT_NAME,
		    ef.ER_FILE_KEY,
		    ef.ER_FILE_ORI_NAME,
		    ef.ER_FILE_RENAME,
		    ef.ER_DOC_KEY,
		    ef.ER_DOC_SERIAL_KEY,
		    ef.ER_FILE_SIZE,
		    ef.ER_FILE_FORM,
		    ef.ER_FILE_UPLOAD_DATE,
		    ef.ER_FILE_ORDERBY,
		    ef.ER_FILE_UPLODAER,
		    ef.ER_FILE_UPDATE_DATE,
		    ef.ER_FILE_UPDATER,
		    ef.ER_FILE_UPDATE_REASON,
		    er.ER_REFERER_KEY,
		    er.ER_DOC_SERIAL_KEY,
		    er.ER_REFERER_TEAM_KEY,
		    er.ER_REFERER_JOB_KEY,
		    er.ER_REFERER_NAME,
		    er.MEMBER_KEY
		FROM ER_APROVER ea 
		JOIN (
			    SELECT 
			        ed.ER_DOC_KEY,
			        ed.ER_DOC_SERIAL_KEY,
			        ed.ER_DOC_WRITER,
			        m.department_key,
			        d2.department_name,
			        m.job_key,
			        j2.job_name,
			        ed.ER_DOC_TITLE,
			        ed.ER_DOC_CREATE_DATE,
			        ed.ER_DOC_EMERGENCY_YN,
			        ed.ER_DOC_DELETE_YN,
			        ed.ER_DOC_STOARGE,
			        ed.ER_DOC_FILENAME,
			        ed.ER_DOC_STATE,
			        ed.ER_DOC_STATE_UPDATE_DATE,
			        ed.ER_DOC_LAST_UPDATER,
			        ed.ER_DOC_LAST_UPDATE_REASON
			    FROM 
			        ER_DOCUMENT ed 
			    JOIN
			        ER_APROVER ea ON ed.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
			    JOIN 
			    	MEMBER m ON ed.ER_DOC_WRITER = m.member_key
			    JOIN 
			    	DEPARTMENT d2 ON d2.department_key = m.department_key
			    JOIN 
			    	job j2 ON j2.job_key = m.job_key
			    WHERE
			        ed.ER_DOC_STATE = '반려'
			    AND    
			        ea.member_Key = ${no}
			) fd 
			ON fd.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
		LEFT JOIN 
			ER_FILE ef ON ef.ER_DOC_SERIAL_KEY = fd.ER_DOC_SERIAL_KEY
		LEFT JOIN 
			DEPARTMENT d ON d.DEPARTMENT_KEY = ea.ER_APPROVER_TEAM_KEY 
		LEFT JOIN 
			job j ON j.job_KEY = ea.ER_APPROVER_JOB_KEY 
		LEFT JOIN 
			ER_REFERER er ON er.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
		ORDER BY 
			ER_DOC_EMERGENCY_YN DESC,
			ER_DOC_CREATE_DATE DESC,
			ER_APPROVAL_ORDERBY ASC
			
			
--참조문서
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
		d.ER_DOC_COMPLETE_DATE,
		ef.ER_FILE_KEY,
		ef.ER_FILE_ORI_NAME,
		ef.ER_FILE_RENAME,
		ef.ER_DOC_KEY,
		ef.ER_DOC_SERIAL_KEY,
		ef.ER_FILE_SIZE,
		ef.ER_FILE_FORM,
		ef.ER_FILE_UPLOAD_DATE,
		ef.ER_FILE_ORDERBY,
		ef.ER_FILE_UPLODAER,
		ef.ER_FILE_UPDATE_DATE,
		ef.ER_FILE_UPDATER,
		ef.ER_FILE_UPDATE_REASON,
		ea.ER_APPROVER_KEY,
		ea.MEMBER_KEY,
		ea.ER_APPROVER_NAME,
		ea.ER_APPROVER_TEAM_KEY,
		ea.ER_APPROVER_JOB_KEY,
		ea.ER_APPROVAL_CATEGORY,
		ea.ER_APPROVAL_STATE,
		ea.ER_APPROVAL_OPINION,
		ea.ER_DOC_SERIAL_KEY,
		ea.ER_APPROVAL_DATE,
		ea.ER_APPROVAL_ORDERBY,
		ea.ER_APPROVER_TEAM_KEY,
		de.DEPARTMENT_NAME,
		ea.ER_APPROVER_JOB_KEY,
		j.JOB_NAME,
		er.ER_REFERER_KEY,
		er.ER_DOC_SERIAL_KEY,
		er.ER_REFERER_TEAM_KEY,
		er.ER_REFERER_JOB_KEY,
		er.ER_REFERER_NAME,
		er.MEMBER_KEY
FROM      
	er_document d
LEFT JOIN 
	ER_FILE ef ON ef.ER_DOC_SERIAL_KEY = d.ER_DOC_SERIAL_KEY
LEFT JOIN 
	er_aprover ea ON d.er_doc_serial_key = ea.er_doc_serial_key
LEFT JOIN 
	DEPARTMENT de ON de.DEPARTMENT_KEY = ea.ER_APPROVER_TEAM_KEY 
LEFT JOIN 
	job j ON j.job_KEY = ea.ER_APPROVER_JOB_KEY 
LEFT JOIN 
	ER_REFERER er ON er.ER_DOC_SERIAL_KEY = d.ER_DOC_SERIAL_KEY
WHERE     
	er.MEMBER_KEY = ${no}
AND       
	d.er_doc_state = '처리완료'
ORDER BY  
	d.er_doc_emergency_yn DESC,
	ER_DOC_CREATE_DATE DESC,
	ea.er_approval_orderby