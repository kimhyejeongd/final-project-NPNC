
SELECT * FROM CHATTING_ROOM ;
SELECT * FROM CHATTING_FILE ;
SELECT * FROM CHATTING_MESSAGE cm ;
SELECT * FROM MEMBER;
SELECT *
  FROM all_sequences;
  
 
ALTER TABLE CHATTING_FILE MODIFY(CHAT_MSG_FILE_POST varchar(200)); 


SELECT * FROM MEMBER WHERE MEMBER_ID='1';

ALTER TABLE CHATTING_MESSAGE MODIFY CHAT_MSG_DETAIL VARCHAR2(1000 CHAR);


	SELECT 
			cm.CHAT_MSG_KEY,
			cm.MEMBER_KEY,
			cm.CHAT_ROOM_KEY,
			cm.CHAT_MSG_DETAIL,
			cm.CHAT_MSG_TIME,
			cm.CHAT_MSG_NOTICE,
			cm.CHAT_READ_COUNT,
			cf.CHAT_MSG_FILE_POST,
			cf.FILE_CONTENT_TYPE 
		FROM chatting_message cm 
		LEFT JOIN chatting_file cf ON cm.chat_msg_key = cf.chat_msg_key 
		WHERE chat_room_key = 29
		ORDER BY chat_msg_time DESC
		
		
		
		SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'chatting_message';
	
	SELECT constraint_name, constraint_type, search_condition
FROM user_constraints
WHERE table_name = 'CHATTING_MESSAGE' AND constraint_type = 'C';


ALTER TABLE CHATTING_MESSAGE DROP CONSTRAINT SYS_C0079576;

SELECT * FROM ALL_constraints WHERE CONSTRAINT_type = 'R';

SELECT
    ac.CONSTRAINT_NAME,
    ac.TABLE_NAME,
    acc.COLUMN_NAME,
    ac.R_CONSTRAINT_NAME,
    ac2.TABLE_NAME AS REFERENCED_TABLE_NAME,
    acc2.COLUMN_NAME AS REFERENCED_COLUMN_NAME
FROM
    ALL_CONSTRAINTS ac
    JOIN ALL_CONS_COLUMNS acc ON ac.CONSTRAINT_NAME = acc.CONSTRAINT_NAME
    AND ac.OWNER = acc.OWNER
    JOIN ALL_CONSTRAINTS ac2 ON ac.R_CONSTRAINT_NAME = ac2.CONSTRAINT_NAME
    AND ac2.OWNER = ac.OWNER
    JOIN ALL_CONS_COLUMNS acc2 ON ac2.CONSTRAINT_NAME = acc2.CONSTRAINT_NAME
    AND ac2.OWNER = acc2.OWNER
    AND acc.POSITION = acc2.POSITION
WHERE
    ac.CONSTRAINT_TYPE = 'R'
ORDER BY
    ac.CONSTRAINT_NAME,
    acc.POSITION;

ALTER TABLE CHATTING_FILE ADD CONSTRAINT SYS_C0079606;

DELETE FROM CHATTING_FILE cf ;
DELETE FROM CHATTING_GROUP cg ;
DELETE FROM CHATTING_IS_READ cir ;
DELETE FROM CHATTING_MESSAGE cm ;
DELETE FROM CHATTING_ROOM cr ;

SELECT * FROM CHATTING_FILE cf ;

ALTER TABLE CHATTING_FILE RENAME COLUMN CHAT_KEY TO CHAT_ROOM_KEY;

SELECT
    ac.CONSTRAINT_NAME,
    ac.TABLE_NAME,
    acc.COLUMN_NAME,
    ac.R_CONSTRAINT_NAME,
    ac2.TABLE_NAME AS REFERENCED_TABLE_NAME,
    acc2.COLUMN_NAME AS REFERENCED_COLUMN_NAME
FROM
    ALL_CONSTRAINTS ac
    JOIN ALL_CONS_COLUMNS acc ON ac.CONSTRAINT_NAME = acc.CONSTRAINT_NAME
    AND ac.OWNER = acc.OWNER
    JOIN ALL_CONSTRAINTS ac2 ON ac.R_CONSTRAINT_NAME = ac2.CONSTRAINT_NAME
    AND ac2.OWNER = ac.OWNER
    JOIN ALL_CONS_COLUMNS acc2 ON ac2.CONSTRAINT_NAME = acc2.CONSTRAINT_NAME
    AND ac2.OWNER = acc2.OWNER
    AND acc.POSITION = acc2.POSITION
WHERE
    ac.CONSTRAINT_TYPE = 'R'
    AND ac.TABLE_NAME = 'CHATTING_IS_READ';

   
   ALTER TABLE CHATTING_IS_READ DROP CONSTRAINT FK_CHATTING_MSG_TO_IS_READ;
   
  ALTER TABLE CHATTING_IS_READ
ADD CONSTRAINT FK_CHATTING_MSG_TO_IS_READ FOREIGN KEY (CHAT_MSG_KEY)
REFERENCES CHATTING_MESSAGE (CHAT_MSG_KEY)
ON DELETE CASCADE;

SELECT * FROM CHATTING_GROUP cg ;
SELECT * FROM CHATTING_MESSAGE cm ;
DELETE FROM CHATTING_ROOM cr ;

ALTER TABLE CHATTING_GROUP ADD chat_group_status varchar2(50) CHECK (chat_group_status IN ('Y', 'N'));
ALTER TABLE CHATTING_GROUP DROP COLUMN chat_group_status;

UPDATE CHATTING_GROUP SET CHAT_GROUP_STATUS = 'Y';

ALTER TABLE CHATTING_GROUP ADD CHAT_GROUP_DATE DATE;

SELECT * FROM MEMBER;

	   	SELECT *
		FROM (
		    SELECT CHAT_ROOM_KEY, MIN(CREATED_AT) AS CREATED_AT
		    FROM CHATTING_GROUP
		    WHERE CHAT_ROOM_KEY IN (
		        SELECT CHAT_ROOM_KEY
		        FROM CHATTING_GROUP
		        WHERE MEMBER_KEY IN (1,2)
		        GROUP BY CHAT_ROOM_KEY
		        HAVING COUNT(DISTINCT MEMBER_KEY) = 2
		    )
		    GROUP BY CHAT_ROOM_KEY
		    HAVING COUNT(*) = 2
		    ORDER BY MIN(CREATED_AT) ASC
		)
		WHERE ROWNUM = 1;

SELECT COUNT(*) FROM CHATTING_GROUP WHERE CHAT_ROOM_KEY =87 AND CHAT_GROUP_STATUS = 'Y';

		DELETE FROM CHATTING_GROUP WHERE CHAT_ROOM_KEY = ${roomId}
		
		
		SELECT * FROM job;
	
	SELECT * FROM MEMBER;
	SELECT * FROM DEPARTMENT d ;

		select * from MEMBER m LEFT JOIN DEPARTMENT d ON d.DEPARTMENT_KEY = m.DEPARTMENT_KEY order by m.MEMBER_ID

		
		SELECT * FROM MEMBER;
		
			select * from MEMBER m LEFT JOIN DEPARTMENT d ON d.DEPARTMENT_KEY = m.DEPARTMENT_KEY order by m.MEMBER_ID;
		
		SELECT * FROM CHATTING_ROOM cr ;
			        INSERT INTO CHATTING_GROUP (CHAT_GROUP_KEY,CHAT_ROOM_KEY, member_KEY, CHAT_GROUP_STATUS,CHAT_GROUP_DATE)
        VALUES (SEQ_CHAT_GROUP_KEY.nextval,88,2,'Y',SYSDATE);
       
       
       DELETE FROM CHATTING_GROUP cg WHERE chat_room_key = 88 AND MEMBER_key =2;
      
      
      SELECT * FROM CHATTING_GROUP cg ;
     
     DELETE FROM CHATTING_GROUP cg  WHERE member_key=2;
    
    SELECT * FROM CHATTING_IS_READ cir WHERE MEMBER_KEY =8;

   SELECT * FROM CHATTING_MESSAGE cm WHERE chat_msg_key=1123;
   
  SELECT * FROM CHATTING_FILE cf ;
  
 
 SELECT * FROM ER_STORAGE_FOLDER;
 
CREATE TABLE "ER_STORAGE_FOLDER" (
	"ER_FOLDER_KEY"	NUMBER NOT NULL,
	"ER_FOLDER_NAME" VARCHAR2(50) NOT NULL,
	"ER_FOLDER_REF"	NUMBER NULL,
	"ER_FOLDER_LEVEL" NUMBER DEFAULT 1 NOT NULL,
	"ER_FOLDER_USE_YN"	CHAR	DEFAULT 'Y'	NOT NULL
);


ALTER TABLE "ER_STORAGE_FOLDER" ADD CONSTRAINT "PK_ER_STORAGE_FOLDER" PRIMARY KEY (
	"ER_FOLDER_KEY"
);
ALTER TABLE "ER_STORAGE_FOLDER" ADD CONSTRAINT "PK_ER_STORAGE_FOLDER" PRIMARY KEY (
	"ER_FOLDER_KEY"
);


ALTER TABLE "ER_STORAGE_FOLDER" ADD CONSTRAINT "FK_ER_STORAGE_FOLDER" FOREIGN KEY (
	"ER_FOLDER_REF"
)
REFERENCES "ER_STORAGE_FOLDER" (
	"ER_FOLDER_KEY"
);


ALTER TABLE "ER_STORAGE" ADD CONSTRAINT "FK_ER_STORAGE_TO_FOLDER" FOREIGN KEY (
	"ER_STORAGE_FOLDER_KEY"
)
REFERENCES "ER_STORAGE_FOLDER" (
	"ER_FOLDER_KEY"
);

SELECT * FROM ER_STORAGE es ;
SELECT * FROM ER_STORAGE_FOLDER ;

INSERT INTO  ER_STORAGE_FOLDER(
				ER_FOLDER_KEY,
				ER_FOLDER_NAME,
				ER_FOLDER_GROUP,
				ER_FOLDER_LEVEL,
				ER_FOLDER_USE_YN
				)VALUES(
				SEQ_ER_FOLDER_KEY.NEXTVAL,
				'회계팀',
				5,
				2,
				'Y'
				);
			
			
INSERT INTO  ER_STORAGE_FOLDER(
				ER_FOLDER_KEY,
				ER_FOLDER_NAME,
				ER_FOLDER_GROUP,
				ER_FOLDER_LEVEL,
				ER_FOLDER_USE_YN
				)VALUES(
				SEQ_ER_FOLDER_KEY.NEXTVAL,
				'2023',
				SEQ_ER_FOLDER_GROUP.NEXTVAL,
				1,
				'Y'
				);
			
			
			DELETE ER_STORAGE_FOLDER;
   
   
   CREATE SEQUENCE SEQ_ER_STOARGE_KEY
   INCREMENT BY 1
   START WITH 1;
  
   CREATE SEQUENCE SEQ_ER_FOLDER_GROUP
   INCREMENT BY 1
   START WITH 1;
  
   CREATE SEQUENCE SEQ_ER_STORAGE_FOLDER_KEY
   INCREMENT BY 1
   START WITH 1;

  CREATE SEQUENCE SEQ_ER_FOLDER_KEY
   INCREMENT BY 1
   START WITH 1;
  
  
  
  SELECT * FROM ER_STORAGE_FOLDER ORDER BY ER_FOLDER_GROUP DESC, ER_FOLDER_LEVEL ASC;
  DELETE ER_STORAGE_FOLDER;
  
 ALTER TABLE ER_STORAGE_FOLDER RENAME COLUMN ER_FOLDER_REF TO ER_FOLDER_GROUP;
    
ALTER TABLE ER_STORAGE_FOLDER DROP CONSTRAINT FK_ER_STORAGE_FOLDER;
ALTER TABLE ER_STORAGE_FOLDER MODIFY ER_FOLDER_GROUP NUMBER NOT NULL;

SELECT * FROM ER_STORAGE es ;
    
INSERT INTO ER_STORAGE es (
	ER_STOARGE_KEY,
	ER_STORAGE_FOLDER_KEY,
	ER_STORAGE_NAME,
	ER_STORAGE_TERM,
	ER_STORAGE_MANAGER,
	ER_STORAGE_ORDERBY
	)VALUES(
	SEQ_ER_STOARGE_KEY.NEXTVAL,
	33,
	'지출',
	5,
	1,
	NULL
	
);

SELECT * FROM ER_STORAGE es WHERE ER_STORAGE_FOLDER_KEY=  ;


SELECT * FROM CHATTING_MESSAGE cm ;
    
    SELECT 
			cm.CHAT_MSG_KEY,
			cm.MEMBER_KEY,
			cm.CHAT_ROOM_KEY,
			cm.CHAT_MSG_DETAIL,
			cm.CHAT_MSG_TIME,
			cm.CHAT_MSG_NOTICE,
			cm.CHAT_READ_COUNT,
			cf.CHAT_MSG_FILE_POST,
			cf.FILE_CONTENT_TYPE ,
			m.MEMBER_NAME 
		FROM chatting_message cm 
		LEFT JOIN chatting_file cf ON cm.chat_msg_key = cf.chat_msg_key 
		LEFT JOIN MEMBER m ON cm.MEMBER_KEY  = m.MEMBER_KEY 
		WHERE CM.chat_room_key = 88
		ORDER BY chat_msg_time ASC;
    
SELECT * FROM MEMBER;

SELECT * FROM ER_STORAGE_FOLDER esf ;

SELECT *
			FROM CHATTING_GROUP cg
			LEFT JOIN MEMBER m ON cg.MEMBER_KEY = m.MEMBER_KEY
			WHERE cg.CHAT_ROOM_KEY = 89 and cg.CHAT_GROUP_STATUS='Y';

		
SELECT * FROM ER_STORAGE_FOLDER esf ;


	SELECT
			ER_FOLDER_KEY,
			ER_FOLDER_NAME,
			ER_FOLDER_GROUP,
			ER_FOLDER_LEVEL,
			ER_FOLDER_USE_YN
		FROM ER_STORAGE_FOLDER
		WHERE ER_FOLDER_KEY = 30;
	
	
	ALTER TABLE ER_STORAGE_FOLDER ADD ER_FOLDER_ORDERBY NUMBER NOT NULL;

SELECT * FROM all_CONSTRAINTS; WHERE CONSTRAINT_name ='FK_ER_STORAGE_TO_FOLDER';

ALTER TABLE ER_STORAGE
ADD CONSTRAINT FK_ER_STORAGE_TO_FOLDER
FOREIGN KEY(ER_STORAGE_folder_key)
REFERENCES er_storage_folder(ER_FOLDER_KEY) 
ON DELETE CASCADE;

SELECT * FROM ER_STORAGE_FOLDER esf ;
SELECT * FROM ER_STORAGE esf ;

ALTER TABLE ER_STORAGE_FOLDER 
ADD CONSTRAINT FK_ER_STORAGE_TO_FOLDER 
FOREIGN KEY (ER_STORAGE_FOLDER_KEY) 
REFERENCES ER_STORAGE_FOLDER (ER_FOLDER_KEY) 
ON DELETE CASCADE;

DELETE FROM ER_STORAGE_FOLDER esf;

ALTER TABLE ER_STORAGE_FOLDER ADD COLUMN ;

INSERT INTO ER_STORAGE_FOLDER esf(
		ER_FOLDER_KEY,
		ER_FOLDER_NAME,
		ER_FOLDER_GROUP,
		ER_FOLDER_LEVEL,
		ER_FOLDER_USE_YN,
		ER_FOLDER_ORDERBY
	) VALUES (
	seq_er_folder_key.nextval,
	'2024',
	21,
	1,
	DEFAULT,
	2
);


	SELECT * FROM ER_STORAGE_FOLDER esf ;
DELETE FROM ER_STORAGE_FOLDER;
SELECT * FROM all_SEQUENCEs;
	

	SELECT COUNT(*)
		FROM ER_STORAGE_FOLDER
		WEHRE ER_FOLDER_LEVEL =1;
UPDATE ER_STORAGE_FOLDER SET ER_FOLDER_GROUP = 22 WHERE ER_FOLDER_KEY =44;
DELETE FROM ER_STORAGE_FOLDER esf  WHERE er_folder_key = 45;

ALTER TABLE ER_STORAGE_FOLDER
MODIFY er_folder_orderby NUMBER NULL;

SELECT * FROM "MEMBER1" m ;
SELECT * FROM ER_STORAGE es ;
SELECT * FROM ER_STORAGE_FOLDER esf ;
INSERT INTO ER_STORAGE esf 
VALUES (1,53,'일반 기안문 폴더',5,8,1);

UPDATE ER_STORAGE SET ER_STORAGE_NAME = '일반 기안문'
WHERE ER_STOARGE_KEY =1;

UPDATE ER_STORAGE_FOLDER  SET ER_FOLDER_GROUP = 1 WHERE ER_FOLDER_KEY =37;

SELECT * FROM ER_STORAGE es ;
SELECT * FROM ER_STORAGE_FOLDER esf 
ORDER BY ER_FOLDER_GROUP DESC ,
		ER_FOLDER_LEVEL ASC,
		er_folder_orderby asc;
		SELECT * FROM ER_STORAGE es ;
	
	UPDATE ER_STORAGE_FOLDER
		SET ER_FOLDER_GROUP = ER_FOLDER_GROUP-1;
		
			UPDATE ER_STORAGE_FOLDER
		SET ER_FOLDER_ORDERBY = ER_FOLDER_ORDERBY-1;