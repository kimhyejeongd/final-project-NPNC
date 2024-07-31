SELECT * FROM board;
CREATE SEQUENCE board_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
   CREATE OR REPLACE TRIGGER trg_board_before_insert
BEFORE INSERT ON BOARD
FOR EACH ROW
BEGIN
    IF :NEW.BOARD_KEY IS NULL THEN
        SELECT board_seq.NEXTVAL
        INTO :NEW.BOARD_KEY
        FROM dual;
    END IF;
END;
SELECT constraint_name, column_name
FROM all_cons_columns
WHERE constraint_name = 'SYS_C0079592';
SELECT board_seq.NEXTVAL FROM dual;

CREATE OR REPLACE TRIGGER trg_board_before_insert
BEFORE INSERT ON BOARD
FOR EACH ROW
BEGIN
    IF :NEW.BOARD_KEY IS NULL THEN
        SELECT board_seq.NEXTVAL
        INTO :NEW.BOARD_KEY
        FROM dual;
    END IF;
END;

SELECT BOARD_KEY, COUNT(*)
FROM BOARD
GROUP BY BOARD_KEY
HAVING COUNT(*) > 1;

SELECT constraint_name, column_name
FROM all_cons_columns
WHERE table_name = 'BOARD_FILE'
  AND column_name = 'BOARD_FILE_KEY';
 CREATE SEQUENCE board_file_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;
CREATE OR REPLACE TRIGGER trg_board_file_before_insert
BEFORE INSERT ON BOARD_FILE
FOR EACH ROW
BEGIN
    IF :NEW.BOARD_FILE_KEY IS NULL THEN
        SELECT board_file_seq.NEXTVAL
        INTO :NEW.BOARD_FILE_KEY
        FROM dual;
    END IF;
END;
ALTER TABLE BOARD_FILE
MODIFY BOARD_FILE_POST VARCHAR2(100);

SELECT * FROM board;
SELECT * FROM BOARD_FILE bf WHERE BOARD_KEY =40;

