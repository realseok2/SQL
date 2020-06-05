--Random 순서로 OracleDB 1일차 복습 2020년 06월 04일

--  01. 사원의 사원번호, 이름(first_name), 성(last_name), 급여, 전화번호, 이메일, 입사일을 출력하세요.                               (O)
SELECT
    first_name,
    last_name,
    salary,
    phone_number,
    email,
    hire_date
FROM employees;

--  02. 이름의 두 번째 글자가 a인 사원의 이름과 연봉을 출력하세요.                                                                 (ㅁ)      --> like를 까먹었었음
SELECT
    first_name "이름",
    salary "연봉"
FROM employees
where
    first_name like '_a%';
    
--  03. 연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요.                                                       (o)
SELECT
    first_name "이름",
    salary "연봉"
FROM employees
WHERE
    salary <= 14000
OR  salary >=17000;

--  04. 부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요.                                                          (O)
SELECT
    department_id "부서번호",
    salary "급여",
    first_name "이름"
FROM employees
order by department_id asc;

--  05. 커미션 비율이 있는 사원의 이름과 연봉, 커미션 비율을 출력하세요.                                                             (O)
SELECT
    first_name "이름",
    salary "연봉",
    commission_pct "커미션 비율"
FROM employees
where commission_pct is not null;

--  06. 사원의 이름(first_name)과 성(last_name), 급여, 전화번호, 이메일, 입사일을 출력하세요.                                       (O)
SELECT
    first_name,
    last_name,
    salary,
    phone_number,
    email,
    hire_date
FROM employees;

--  07. 07/01/01 이후에 입사한 사원들의 이름과 입사일을 출력하세요.                                                                (O)
SELECT
    first_name "이름",
    hire_date "입사일"
FROM employees
where
    hire_date >= '07/01/01';
    
--  08. 이름의 네 번째 글자가 a인 사원의 이름을 출력하세요.                                                                        (O)
SELECT
    first_name || '-' || last_name "이름"
FROM employees
where first_name like '___a%';

--  09. 연봉이 14000 이상 17000 이하인 사원의 이름과 연봉을 구하시오. (2가지 방법 모두 작성해주세요.)                                 (O)
--  1번째 방법                                                                                                                (O)
SELECT
    first_name || '-' || last_name "이름",
    salary "연봉"
FROM employees
where
    salary >= 14000
and salary <= 17000;

--  2번째 방법                                                                                                                (O)
SELECT
    first_name || '-' || last_name "이름",
    salary "연봉"
FROM employees
where salary BETWEEN 14000 and 17000;

--  10. 사원의 이름(first_name)과 전화번호, 입사일, 급여 로 표시되도록 출력하세요.                                                  (O)
SELECT
    first_name "이름",
    phone_number "전화번호",
    hire_date "입사일",
    salary "급여"
FROM employees;

--  11. 급여가 1000 이상인 직원의 이름, 급여를 급여가 큰 직원부터 출력하세요.                                                       (O)
SELECT
    first_name || '-' || last_name "이름",
    salary "급여"
FROM employees
WHERE
    salary >= 1000
order by salary desc;

--  12. 성명(first_name last_name) 성과 이름 사이에 -로 구분하고 급여, 연봉(급여*12), 연봉2(급여*12+5000), 전화번호를 출력하세요.      (O)
SELECT
    first_name || '-' || last_name "이름",
    salary "급여",
    salary*12 "연봉",
    (salary*12+5000) "연봉2",
    phone_number "전화번호"
FROM employees;

--  13. 이름이 Lex인 직원의 연봉을 출력하세요.                                                                                   (x)       employees 뒤에 ;를 안지웠음, first_name = 'Lex'를 생각해내지 못했음.
select
    salary "연봉"
from employees
where first_name = 'Lex';

--  14. 사원의 이름(first_name)과 전화번호, 입사일, 연봉을 출력하세요.                                                             (O)
SELECT
    first_name,
    phone_number,
    hire_date,
    salary
FROM employees;

--  15. 담당 매니저가 없고 커미션 비율이 없는 직원의 이름을 출력하세요.                                                              (O)
SELECT
    first_name || '-' || last_name "이름"
FROM employees
where
    manager_id is null
and commission_pct is null;

--  16. 연봉이 2100, 3100, 4100, 5100인 사원의 이름과 연봉을 구하시오.                                                            (O)
SELECT
    first_name,
    salary
FROM employees
where
    salary in (2100, 3100, 4100, 5100);

--  17. 이름에 am을 포함한 사원의 이름과 연봉을 출력하세요.                                                                        (O)
SELECT
    first_name,
    salary
FROM employees
where
    first_name like '%am%';

--  18. 연봉이 15000 이상인 사원들의 이름과 연봉을 출력하세요.                                                                     (O)
SELECT
    first_name,
    salary
FROM employees
where salary >= 15000;

--  19. 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호와 급여, 이름을 출력하세요.                       (O)      and가 아니고 ,로 연결합니다.
SELECT
    department_id,
    salary,
    first_name
FROM employees
order by
    department_id asc,
    salary desc;

--  20. 이름이 4글자인 사원 중 끝에서 두 번째 글자가 a인 사원의 이름을 출력하세요.                                                    (O)
SELECT
    first_name
FROM employees
where first_name like '__a_';

--  21. 입사일이 04/01/01에서 05/12/31 사이인 사원의 이름과 입사일을 출력하세요. ( 2가지 방법을 사용하세요.)                           (O) 
--  1번째 방법
SELECT
    first_name,
    hire_date
FROM employees
where
    hire_date >= '04/01/01'
and hire_date <= '05/12/31';

--  2번째 방법
SELECT
    first_name,
    hire_date
FROM employees
where hire_date between '04/01/01' and '05/12/31';
