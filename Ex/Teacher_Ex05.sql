--  'den'보다 급여를 많이 받는 사람의 이름과 급여는??================================================================================

--  'den'의 급여를 구하는 코드
SELECT salary
FROM employees
where first_name = 'Den';

--  'den'보다 급여를 많이 받는 사람의 이름과 급여 코드
SELECT
    employee_id "직원아이디",
    first_name "이름",
    salary "급여"
FROM employees
where salary > (SELECT salary
               FROM employees
               where first_name = 'Den')
order by salary desc;

--  급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?==============================================================================
--  급여를 가장 적게 받는 사람의 급여 코드
SELECT
    min(salary)
FROM employees;

--  급여를 가장 적게 받는 사람의 이름, 급여, 사원번호 코드
SELECT
    first_name "이름",
    salary "급여",
    employee_id "사원번호"
FROM employees
where salary = (SELECT
                min(salary)
                FROM employees);

--  평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요.============================================================================
--  평균급여를 구하는 코드
SELECT
    round(avg(salary))
FROM employees;

--  평균 급여보다 적게 받는 사람의 이름, 급여를 구하는 코드
SELECT
    first_name "이름",
    salary "급여",
    employee_id "직원번호"
FROM employees
where salary < (SELECT
                round(avg(salary))
                FROM employees)
order by salary desc;

--  다중형========================================================================================================================
--  부서번호가 110인 사원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력하세요.
--  부서번호가 110인 사원의 급여 코드
SELECT
    salary
FROM employees
where department_id = 100;


SELECT
    employee_id "사번",
    first_name "이름",
    salary "급여"
FROM employees
where salary in (SELECt salary
                 FROM employees
                 where department_id = 110);
                 
--  각 부서별로 최고급여를 받는 사원을 출력하세요.
--  각 부서별 최고급여 코드
SELECT
--    d.department_name "부서이름",
    max(e.salary)
FROM departments d, employees e
where e.department_id = d.department_id
group by d.department_id;

SELECT
    employee_id "사번",
    first_name "이름"
FROM employees
where salary = (SELECT
                max(e.salary)
                FROM departments d, employees e
                where e.department_id = d.department_id
                group by d.department_id);
                
--  rownum 순서매기기 ===========================================================================================================
--  1단계
SELECT
    employee_id,
    first_name,
    salary
FROM employees
order by salary desc;

--  2단계 정렬부터 rownum
SELECT
    rownum,
    e.employee_id,
    e.first_name,
    e.salary,
    e.hire_date
FROM (SELECT
        employee_id,
        first_name,
        salary,
        hire_date
     FROM employees
     order by salary desc) e;

--  3단계 where절 때문에 안됨
SELECT
    w.rn,
    w.employee_id,
    w.first_name,
    w.salary,
    w.hire_date
FROM (SELECT
         rownum rn,
          e.employee_id,
          e.first_name,
          e.salary,
          e.hire_date
      FROM (SELECT
                employee_id,
                first_name,
                salary,
                hire_date
            FROM employees
            order by salary desc) e
      )w
where rn <= 5
and rn >= 3;

--  07년에 입사한 직원 중에서 급여가 많은 순서 3번째에서 7번째 사이의 사원의 이름과 급여 입사일을 출력하세요.===============================
--  1단계 07년에 입사한 직원의 이름과 급여, 입사일 찾기
SELECT
    first_name,
    salary,
    hire_date
FROM employees
where hire_date between '07/01/01' and '07/12/31';

--  2단계 07년에 입사한 직원의 급여 순서대로 정렬
SELECT
    e.first_name,
    e.salary,
    e.hire_date
FROM (SELECT
        first_name,
        salary,
        hire_date
      FROM employees
      where hire_date between '07/01/01' and '07/12/31') e
order by salary desc;

--  3단계 급여순으로 정렬된 목록에서 3 ~ 7번째 추출하기
SELECT
    w.rn,
    w.first_name,
    w.salary,
    w.hire_date
FROM (SELECT
        rownum rn,
        e.first_name,
        e.salary,
        e.hire_date
     FROM (SELECT
               first_name,
               salary,
               hire_date
           FROM employees
           where hire_date between '07/01/01' and '07/12/31') e
    order by salary desc) w
where rn >= 3
and   rn <= 7;

--------------------------------------------------------------------------------------------------------------------------------
--  선생님 방법
--  1단계 07년 입사자 급여 내림차순 정렬
SELECT
    employee_id,
    first_name,
    hire_date,
    salary
FROM employees
where hire_date like '07%'
order by salary desc;

--  2단계 1단계 정리된 코드를 순서매기기
SELECT
    rownum,
    employee_id,
    first_name,
    hire_date,
    salary
FROM    (SELECT
            employee_id,
            first_name,
            hire_date,
            salary
        FROM employees
        where hire_date like '07%'
        order by salary desc);

--  3단계 2단계에서 정리된 코드에서 3 ~ 7 번째로 급여가 많은 사원 정보 출력
SELECT
    rn,
    employee_id,
    first_name,
    hire_date,
    salary
FROM (SELECT
        rownum rn,
        employee_id,
        first_name,
        hire_date,
        salary
    FROM    (SELECT
                employee_id,
                first_name,
                hire_date,
                salary
            FROM employees
            where hire_date like '07%'
            order by salary desc)
        )
where rn >= 3
and   rn <= 7;