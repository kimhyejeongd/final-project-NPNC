-- 공지사항 테이블에 현실적인 더미 데이터 삽입
INSERT INTO NOTICE (NOTICE_TITLE, NOTICE_DETAIL, MEMBER_KEY, NOTICE_ENROLL_DATE, NOTICE_UPDATE_DATE, NOTICE_DELETE)
VALUES ('[중요] 시스템 점검 안내', 
        '안녕하세요. 시스템 안정성을 높이기 위한 정기 점검이 아래와 같이 진행됩니다.\n\n' ||
        '점검 일정: 2024년 8월 15일(목) 22:00 ~ 2024년 8월 16일(금) 02:00\n' ||
        '점검 내용: 서버 및 데이터베이스 점검\n' ||
        '점검 영향: 점검 시간 동안 시스템 사용이 불가능합니다.\n\n' ||
        '불편을 드려 죄송합니다. 양해 부탁드립니다.', 
        1, SYSDATE, SYSDATE, 'N');

INSERT INTO NOTICE (NOTICE_TITLE, NOTICE_DETAIL, MEMBER_KEY, NOTICE_ENROLL_DATE, NOTICE_UPDATE_DATE, NOTICE_DELETE)
VALUES ('신규 프로젝트 런칭', 
        '우리 회사는 2024년 9월 1일에 새로운 프로젝트인 "SmartCloud"를 런칭합니다.\n\n' ||
        '프로젝트 개요: 최신 클라우드 기반 솔루션으로 기업의 IT 인프라를 혁신합니다.\n' ||
        '기대 효과: 비용 절감, 운영 효율성 향상, 확장성 제공\n' ||
        '자세한 내용은 프로젝트 페이지에서 확인해 주세요.', 
        2, SYSDATE, SYSDATE, 'N');

INSERT INTO NOTICE (NOTICE_TITLE, NOTICE_DETAIL, MEMBER_KEY, NOTICE_ENROLL_DATE, NOTICE_UPDATE_DATE, NOTICE_DELETE)
VALUES ('보안 패치 공지', 
        '최근 보안 취약점에 대한 패치를 진행합니다.\n\n' ||
        '패치 일시: 2024년 8월 20일(화) 00:00 ~ 06:00\n' ||
        '패치 내용: 보안 취약점 수정 및 시스템 안정화\n' ||
        '패치 영향: 패치 시간 동안 일부 시스템의 접근이 제한될 수 있습니다.\n\n' ||
        '업데이트 후에도 문제가 발생하면 IT 지원팀에 문의해 주세요.', 
        3, SYSDATE, SYSDATE, 'N');

INSERT INTO NOTICE (NOTICE_TITLE, NOTICE_DETAIL, MEMBER_KEY, NOTICE_ENROLL_DATE, NOTICE_UPDATE_DATE, NOTICE_DELETE)
VALUES ('직원 교육 안내', 
        '다음 주 월요일(2024년 8월 12일)부터 새로운 직원 교육 프로그램이 시작됩니다.\n\n' ||
        '교육 내용: 최신 기술 트렌드 및 내부 시스템 교육\n' ||
        '교육 시간: 09:00 ~ 17:00\n' ||
        '참여 대상: 모든 직원\n' ||
        '기타 사항: 교육에 필요한 자료는 교육 시작 전 이메일로 발송됩니다.', 
        4, SYSDATE, SYSDATE, 'N');

INSERT INTO NOTICE (NOTICE_TITLE, NOTICE_DETAIL, MEMBER_KEY, NOTICE_ENROLL_DATE, NOTICE_UPDATE_DATE, NOTICE_DELETE)
VALUES ('해커톤 대회 참가 안내', 
        '회사의 해커톤 대회가 2024년 8월 30일에 개최됩니다.\n\n' ||
        '대회 일정: 2024년 8월 30일(금) 10:00 ~ 18:00\n' ||
        '참가자격: 모든 개발자\n' ||
        '대회 주제: 인공지능 기반의 혁신적인 솔루션 개발\n' ||
        '참가 신청은 HR팀에 문의해 주세요.', 
        5, SYSDATE, SYSDATE, 'N');

INSERT INTO NOTICE (NOTICE_TITLE, NOTICE_DETAIL, MEMBER_KEY, NOTICE_ENROLL_DATE, NOTICE_UPDATE_DATE, NOTICE_DELETE)
VALUES ('2024년도 성과급 지급 안내', 
        '2024년도 성과급 지급이 2024년 9월 5일에 진행됩니다.\n\n' ||
        '대상자: 모든 정규직 직원\n' ||
        '지급 방법: 계좌 이체\n' ||
        '기타 사항: 성과급 지급에 대한 자세한 사항은 HR팀에 문의해 주세요.', 
        1, SYSDATE, SYSDATE, 'N');
