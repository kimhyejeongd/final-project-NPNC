SELECT * FROM MEMBER;
-- AB_EXTERNAL 테이블에 더미 데이터 삽입 (한국어 이름)
INSERT INTO AB_EXTERNAL (
    AB_EXTERNAL_KEY, MEMBER_KEY, AB_EXTERNAL_NAME, AB_EXTERNAL_TELL, AB_EXTERNAL_EMAIL, AB_EXTERNAL_GENDER, AB_EXTERNAL_DEPARTMENT, AB_EXTERNAL_JOB, AB_EXTERNAL_MEMO, AB_EXTERNAL_BOOKMARK, AB_EXTERNAL_COMPANY, AB_EXTERNAL_DELETE
) VALUES (
    1, 1, '김철수', '010-1234-5678', 'chulsoo.kim@example.com', 'M', '영업부', '매니저', '최고 실적 보유자', 'Y', 'ABC 회사', 'N'
);

INSERT INTO AB_EXTERNAL (
    AB_EXTERNAL_KEY, MEMBER_KEY, AB_EXTERNAL_NAME, AB_EXTERNAL_TELL, AB_EXTERNAL_EMAIL, AB_EXTERNAL_GENDER, AB_EXTERNAL_DEPARTMENT, AB_EXTERNAL_JOB, AB_EXTERNAL_MEMO, AB_EXTERNAL_BOOKMARK, AB_EXTERNAL_COMPANY, AB_EXTERNAL_DELETE
) VALUES (
    2, 2, '이영희', '010-2345-6789', 'younghee.lee@example.com', 'F', '마케팅부', '팀장', '우수한 발표 능력 보유', 'N', 'XYZ 회사', 'N'
);

INSERT INTO AB_EXTERNAL (
    AB_EXTERNAL_KEY, MEMBER_KEY, AB_EXTERNAL_NAME, AB_EXTERNAL_TELL, AB_EXTERNAL_EMAIL, AB_EXTERNAL_GENDER, AB_EXTERNAL_DEPARTMENT, AB_EXTERNAL_JOB, AB_EXTERNAL_MEMO, AB_EXTERNAL_BOOKMARK, AB_EXTERNAL_COMPANY, AB_EXTERNAL_DELETE
) VALUES (
    3, 3, '박민수', '010-3456-7890', 'minsoo.park@example.com', 'M', 'IT부서', '개발자', 'Java 능숙', 'Y', 'LMN 회사', 'N'
);

INSERT INTO AB_EXTERNAL (
    AB_EXTERNAL_KEY, MEMBER_KEY, AB_EXTERNAL_NAME, AB_EXTERNAL_TELL, AB_EXTERNAL_EMAIL, AB_EXTERNAL_GENDER, AB_EXTERNAL_DEPARTMENT, AB_EXTERNAL_JOB, AB_EXTERNAL_MEMO, AB_EXTERNAL_BOOKMARK, AB_EXTERNAL_COMPANY, AB_EXTERNAL_DELETE
) VALUES (
    4, 4, '최지은', '010-4567-8901', 'jieun.choi@example.com', 'F', '인사부', '채용 담당자', '우수한 인재 소싱 능력 보유', 'N', 'OPQ 회사', 'N'
);

INSERT INTO AB_EXTERNAL (
    AB_EXTERNAL_KEY, MEMBER_KEY, AB_EXTERNAL_NAME, AB_EXTERNAL_TELL, AB_EXTERNAL_EMAIL, AB_EXTERNAL_GENDER, AB_EXTERNAL_DEPARTMENT, AB_EXTERNAL_JOB, AB_EXTERNAL_MEMO, AB_EXTERNAL_BOOKMARK, AB_EXTERNAL_COMPANY, AB_EXTERNAL_DELETE
) VALUES (
    5, 5, '정수현', '010-5678-9012', 'soohyun.jeong@example.com', 'F', '재무부', '회계사', '우수한 분석 능력 보유', 'Y', 'EFG 회사', 'N'
);

INSERT INTO AB_EXTERNAL (
    AB_EXTERNAL_KEY, MEMBER_KEY, AB_EXTERNAL_NAME, AB_EXTERNAL_TELL, AB_EXTERNAL_EMAIL, AB_EXTERNAL_GENDER, AB_EXTERNAL_DEPARTMENT, AB_EXTERNAL_JOB, AB_EXTERNAL_MEMO, AB_EXTERNAL_BOOKMARK, AB_EXTERNAL_COMPANY, AB_EXTERNAL_DELETE
) VALUES (
    6, 6, '최민준', '010-6789-0123', 'minjun.choi@example.com', 'M', '기술부', '엔지니어', '우수한 문제 해결 능력 보유', 'N', 'HIJ 회사', 'N'
);
SELECT * FROM AB_EXTERNAL;