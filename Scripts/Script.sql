CREATE TABLE ALARM(
	ALARM_KEY NUMBER PRIMARY KEY,
    ALARM_TPYE VARCHAR2(100) NOT NULL,
    ALARM_PATH VARCHAR2(1000) NOT NULL,
    ALARM_RE_MEMBER NUMBER NOT NULL,
    ALARM_SEND_MEMBER NUMBER NOT NULL,
    ALARM_DATE DATE NOT NULL, 
    ALARM_DATE_READ VARCHAR2(10) DEFAULT 'N' NOT NULL 
    
);
SELECT * FROM MEMBER;
UPDATE ALARM SET ALARM_READ = 'Y' WHERE ALARM_RE_MEMBER='1'; 
 	INSERT INTO ALARM VALUES(SEQ_ALARM.NEXTVAL ,'TYPE' ,'PATH',1 ,1 ,SYSDATE ,'N');
SELECT * FROM alarm;
SELECT * FROM "MEMBER" m ;
SELECT * FROM POST_MESSAGE_RECEIVER pmr ;

ALTER TABLE alarm
RENAME COLUMN ALARM_DATE_READ TO ALARM_READ;

-- ALARM pk
CREATE SEQUENCE SEQ_ALARM
START WITH 1  -- 1부터 시작
INCREMENT BY 1  -- 1씩 증가
NOMINVALUE  -- 최소값 없음
NOMAXVALUE  -- 최대값 없음
NOCYCLE  -- 순환하지 않음
CACHE 20;  -- 20개를 캐시에 저장
SELECT  * FROM "MEMBER" m ;
DROP TABLE ALARM;