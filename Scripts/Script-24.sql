SELECT constraint_name, constraint_type, search_condition
FROM all_constraints
WHERE table_name = 'AB_EXTERNAL'
AND constraint_name LIKE 'SYS_C%'; -- 시스템 제약 조건 이름 패턴
