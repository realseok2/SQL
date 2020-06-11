--  JOIN========================================================================================================================
--  from에서 각각 별명을 지정해 준 뒤 select에서 별명. 을 붙여 작성해줍니다. 
SELECT
    em.first_name,
    em.department_id,
    de.department_id,
    de.department_name
FROM employees em, departments de
where em.department_id = de.department_id;

--  모든 직원이름, 업무명을 출력하세요.
SELECT
    e.employee_id,
    e.first_name "직원이름",
    e.job_id,
    j.job_id,
    j.job_title "업무명"
FROM employees e, jobs j
where e.job_id = j.job_id;


--  모든 직원이름, 부서이름, 업무명을 출력하세요.
SELECT
    e.employee_id,
    e.first_name,
    e.department_id,    --  확인용
    d.department_id,    --  확인용
    d.department_name,
    e.job_id,           --  확인용
    j.job_id,           --  확인용
    j.job_title
FROM employees e, departments d, jobs j
where
    e.department_id = d.department_id
and e.job_id = j.job_id;