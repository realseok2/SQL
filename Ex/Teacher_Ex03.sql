SELECT
    *
FROM
    employees;

SELECT
    AVG(salary),
    employee_id
FROM
    employees;

SELECT
    COUNT(*)                             --  null 포함 모든 갯수를 셉니다.
FROM
    employees;

SELECT
    COUNT(manager_id)                    --  null을 제외한 모든 갯수를 셉니다.
FROM
    employees;

SELECT
    COUNT(commission_pct)                --  null을 제외한 모든 갯수를 셉니다.
FROM
    employees;

SELECT
    COUNT(*),
    COUNT(commission_pct),
    AVG(salary)
FROM
    employees;

SELECT
    COUNT(*)
FROM
    employees
WHERE
    salary >= 16000;

SELECT
    COUNT(manager_id)
FROM
    employees
WHERE
    salary >= 16000;

SELECT
    SUM(salary)
FROM
    employees;

-- avg()함수 : 입력된 값들의 평균을 구하는 함수

SELECT
    AVG(salary)
FROM
    employees
WHERE
    salary > 16000;

-- manager_id 테스트 (논리적이지 않지만 그냥 연습을 위해 작성해봄) --> avg()는 null을 계산에 포함시키지 않는다.

SELECT
    AVG(manager_id)
FROM
    employees
WHERE
    salary > 16000;

-- nvl로 null을 0으로 변환시킨 후 계산을 하면 포함됩니다.

SELECT
    AVG(nvl(manager_id, 0))
FROM
    employees
WHERE
    salary > 16000;

--  max() min() 함수 : 입력된 값의 최대값과 최소값을 구하는 함수

SELECT
    MAX(salary)
FROM
    employees;

SELECT
    MIN(salary)
FROM
    employees;

SELECT
    MAX(salary),
    MIN(salary),
    SUM(salary),
    AVG(salary)
FROM
    employees;

-- group by 절

SELECT
    department_id,
    AVG(salary)
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id ASC;

SELECT
    department_id,
    COUNT(*),
    SUM(salary)
FROM
    employees
GROUP BY
    department_id;

SELECT
    department_id,
    COUNT(*),
    SUM(salary)         -- 그룹함수에서 조건절을 사용하기 위해서는 where로는 불가능하고 having절을 사용해야 합니다.
FROM
    employees
GROUP BY
    department_id
HAVING SUM(salary) > 20000
       AND SUM(salary) < 50000
ORDER BY
    department_id ASC;

-- CASE ~ END

SELECT
    employee_id,
    first_name,
    job_id,
    salary,
    CASE
        WHEN job_id = 'AC_ACCOUNT' THEN
            ( salary + salary * 0.1 )                       --대소문자 가려서 작성해야 합니다. 소문자로 작성시 적용되지 않습니다.
        WHEN job_id = 'SA_REP'     THEN
            ( salary + salary * 0.2 )
        WHEN job_id = 'ST_CLERK'   THEN
            ( salary + salary * 0.3 )
        ELSE
            salary
    END realsalary
FROM
    employees;

SELECT
    employee_id,
    first_name,
    job_id,
    salary,
    CASE
        WHEN salary >= 20000 THEN
            salary
        WHEN salary >= 10000 THEN
            ( salary + salary * 0.2 )
        WHEN salary < 15000  THEN
            ( salary + salary * 0.3 )
        ELSE
            salary + salary * 0.4
    END realsalary
FROM
    employees;
    
--------------------------------------------------------------------------------------------------------------------------------
-- 직원의 이름, 부서, 팀을 출력하세요.
-- 팀은 코드로 결정하며 부서코드가 10 ~50 이면 'A-Team'
-- 60 ~ 100 이면 'B-Team' 110 ~ 150 이면 'C-Team' 나머지는 '팀없음'으로 출력하세요.

SELECT
    first_name "이름",
    department_id "부서",
    case
        when department_id >= 10 and department_id <=50 then 'A-Team'
        when department_id >= 60 and department_id <=100 then 'B-Team'
        when department_id >= 110 and department_id <=150 then 'C-Team'
        else '팀없음'
    END Team,
    employee_id
FROM employees
order by
    department_id asc;