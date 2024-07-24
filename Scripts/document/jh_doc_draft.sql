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

SELECT 
	ea.*, d.DEPARTMENT_NAME, ef.*
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
LEFT JOIN job j ON j.job_KEY = ea.ER_APPROVER_JOB_KEY ;
LEFT JOIN ER_REFERER er ON er.ER_DOC_SERIAL_KEY = w.ER_DOC_SERIAL_KEY;