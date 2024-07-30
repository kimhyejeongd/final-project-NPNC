SELECT 
		    *
		FROM
		    er_document d
		JOIN 
		    member m ON d.er_doc_writer = m.MEMBER_KEY
		JOIN 
		    department de ON m.DEPARTMENT_KEY = de.department_key
		JOIN 
		    job j ON m.JOB_KEY = j.JOB_KEY 
		LEFT JOIN 
		    ER_APROVER a ON d.er_doc_serial_key = a.er_doc_serial_key
		LEFT JOIN 	
			ER_REFERER er ON d.ER_DOC_SERIAL_KEY = er.ER_DOC_SERIAL_KEY 
		WHERE
		    d.er_doc_state = '처리중'
		ORDER BY 
			d.ER_DOC_CREATE_DATE DESC, 
			a.er_approval_orderby;
			
SELECT * FROM ER_APROVER WHERE MEMBER_KEY = 5;

WITH waitingDoc as(
SELECT 
	* 
FROM 
	ER_APROVER ea
JOIN
	ER_DOCUMENT ed ON ed.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY 
WHERE
	ed.ER_DOC_STATE = '처리중'
AND	
	ea.member_Key = 5
)

--참조인 추가로 데이터 정확성 떨어지는지 확인
SELECT 
	--ea.*, d.DEPARTMENT_NAME, ef.*, er.*
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
JOIN
	(
	SELECT 
		ea.ER_DOC_SERIAL_KEY
	FROM 
		ER_APROVER ea
	JOIN
		ER_DOCUMENT ed ON ed.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
	WHERE
		ed.ER_DOC_STATE = '처리중'
	AND	
		ea.member_Key = 5
	) w 
ON w.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY 
LEFT JOIN ER_FILE ef ON ef.ER_DOC_SERIAL_KEY = w.er_doc_serial_key
LEFT JOIN DEPARTMENT d ON d.DEPARTMENT_KEY = ea.ER_APPROVER_TEAM_KEY 
LEFT JOIN job j ON j.job_KEY = ea.ER_APPROVER_JOB_KEY 
LEFT JOIN ER_REFERER er ON er.ER_DOC_SERIAL_KEY = w.ER_DOC_SERIAL_KEY;

--2안 서브쿼리 변경
SELECT 
	--ea.*, d.DEPARTMENT_NAME, ef.*, er.*
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
JOIN
	(
	SELECT 
		ea.ER_DOC_SERIAL_KEY,
		ed.ER_DOC_STATE -- 문서 상태를 포함한 모든 필요한 열 선택
	FROM 
		ER_DOCUMENT ed 
	JOIN
		ER_APROVER ea ON ed.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
	WHERE
		ed.ER_DOC_STATE = '처리중'
	AND	
		ea.member_Key = 5
	) w 
ON w.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY 
LEFT JOIN ER_FILE ef ON ef.ER_DOC_SERIAL_KEY = w.er_doc_serial_key
LEFT JOIN DEPARTMENT d ON d.DEPARTMENT_KEY = ea.ER_APPROVER_TEAM_KEY 
LEFT JOIN job j ON j.job_KEY = ea.ER_APPROVER_JOB_KEY 
LEFT JOIN ER_REFERER er ON er.ER_DOC_SERIAL_KEY = w.ER_DOC_SERIAL_KEY
LEFT JOIN ER_DOCUMENT ed2 ON ed2.ER_DOC_SERIAL_KEY  = w.ER_DOC_SERIAL_KEY;


WITH FilteredDocuments AS (
    SELECT 
        ed.ER_DOC_KEY,
        ed.ER_DOC_SERIAL_KEY,
        ed.ER_DOC_WRITER,
        ed.ER_DOC_TITLE,
        ed.ER_DOC_CREATE_DATE,
        ed.ER_DOC_EMERGENCY_YN,
        ed.ER_DOC_DELETE_YN,
        ed.ER_DOC_STOARGE,
        ed.ER_DOC_FILENAME,
        ed.ER_DOC_STATE,
        ed.ER_DOC_STATE_UPDATE_DATE,
        ed.ER_DOC_LAST_UPDATER,
        ed.ER_DOC_LAST_UPDATE_REASON,
        ed.er_file_key
    FROM 
        ER_DOCUMENT ed 
    JOIN
        ER_APROVER ea ON ed.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
    WHERE
        ed.ER_DOC_STATE = '처리중'
    AND    
        ea.member_Key = 5
);

--최종 : 결재 대기 문서
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
        ed.ER_DOC_STATE = '처리중'
    AND    
        ea.member_Key = 5
) fd ON fd.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
LEFT JOIN ER_FILE ef ON ef.ER_DOC_SERIAL_KEY = fd.ER_DOC_SERIAL_KEY
LEFT JOIN DEPARTMENT d ON d.DEPARTMENT_KEY = ea.ER_APPROVER_TEAM_KEY 
LEFT JOIN job j ON j.job_KEY = ea.ER_APPROVER_JOB_KEY 
LEFT JOIN ER_REFERER er ON er.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
WHERE NOT EXISTS (
    SELECT 1
    FROM ER_APROVER a
    WHERE a.ER_DOC_SERIAL_KEY = ea.ER_DOC_SERIAL_KEY
    AND a.ER_APPROVAL_ORDERBY < ea.ER_APPROVAL_ORDERBY
    AND a.ER_APPROVAL_STATE != '승인'
)
ORDER BY 
		ER_DOC_EMERGENCY_YN DESC,
		ER_DOC_CREATE_DATE DESC,
		ER_APPROVAL_ORDERBY;