--직원의 모든 정보를 출력하세요.====================================================================================================모든 정보 출력 *로 표현
select * from employees; -- from 뒤에는 테이블명을 입력합니다.

--부서의 모든 정보를 출력하세요.
select * from departments; -- from 뒤에는 테이블명을 입력합니다.

--사원의 아이디와 이름, 성을 출력하세요.
SELECT
    employee_id,
    first_name,
    last_name   -- 마지막에는 ,를 입력하지 않도록 조심합니다.
FROM employees; -- from 뒤에는 테이블명을 입력합니다.

--사원의 이름(first_name)과 전화번호 입사일 연봉을 출력하세요.
SELECT
    first_name,
    phone_number,
    hire_date,
    salary      -- 마지막에는 ,를 입력하지 않도록 조심합니다.
FROM employees; -- from 뒤에는 테이블명을 입력합니다.

--사원의 이름(firtst_name)과 성(last_name), 급여, 전화번호, 이메일, 입사일을 출력하세요.
SELECT
    first_name,
    last_name,
    salary,
    phone_number,
    email,
    hire_date   -- 마지막에는 ,를 입력하지 않도록 조심합니다.
FROM employees; -- 테이블명을 입력합니다.


--select문 별명==================================================================================================================select문 별명
-- 별명을 지정할 때는 as를 사용해도 되고 사용하지 않아도 됩니다.
-- 대소문자 구분, 공백, 특수문자 등이 필요한 경우에는 ""(쌍따옴표)로 감싸줍니다.
SELECT
    employee_id as empNo,
    first_name "E-name",
    salary "연 봉"
FROM employees;

--사원의 이름(first_name)과 전화번호 입사일 급여로 표시되도록 출력하세요.
SELECT
    first_name as "이름",
    phone_number as "전화번호",
    hire_date as "입사일",
    salary as "급여"
FROM employees;

--사원의 사원번호, 이름(first_name), 성(last_name), 급여, 전화번호, 이메일, 입사일로 표시되도록 출력하세요.
SELECT
    employee_id "사원번호",
    first_name "이름",
    last_name "성",
    salary "급여",
    phone_number "전화번호",
    email "이메일",
    hire_date "입사일"
FROM employees;

--select문 컬럼 합치기=============================================================================================================select문 culumn(컬럼) 합치기
SELECT first_name || last_name                          -- 단순 합치기 --> 성과 이름이 붙어서 출력됩니다.
FROM employees;

SELECT first_name || '  ' || last_name                  -- 공백추가 합치기 --> 성과 이름 사이에 | '공백' |를 사용하여 공백을 추가합니다.      | '공백' |
FROM employees;

SELECT first_name || ' hire date is ' || hire_date      -- 문장추가 합치기 --> 성과 입사일 사이에 | '문장' |을 사용하여 문장을 추가합니다.    | '문장' |
FROM employees;

--산술 연산자 사용하기 ( +, -, *, / 를 모두 사용 할 수 있습니다.)======================================================================산술 연산자 사용하기 ( +, -, *, / )
SELECT first_name, salary, salary*12, (salary+300)*12   -- 산술 연산자를 사용하면 계산도 가능합니다. 또한 같은 컬럼을 중복 사용도 가능합니다.  중복사용 가능
FROM employees;

SELECT job_id*12                                        -- 숫자가 아니기 때문에 계산이 불가능하여 오류가 발생합니다.                         숫자가 아닌 컬럼에 산술 연산자를 사용한 경우
FROM employees;

--전체 직원의 정보를 다음과 같이 출력하세요.
SELECT
    last_name || '-' || first_name "성명",              -- 두 컬럼을 합친 후 별명을 지정 할 수 있습니다.                                    컬럼을 합친 후 새 별명을 지정하는 방법
    salary "급여",
    salary*12 "연봉",
    (salary*12+5000) "연봉2",
    phone_number "전화번호"
FROM employees;

--where절========================================================================================================================where절
--비교연산자
--부서 번호가 10인 사원의 이름을 구하시오.
SELECT
    first_name
FROM employees
where department_id = 10;

--연봉이 15000 이사인 사원들의 이름과 연봉을 출력하세요.
SELECT
    first_name || '-' || last_name "이름",
    salary "연봉"
FROM employees
where salary >= 15000;

--이름이 Lex인 직원의 연봉을 출력하세요.
SELECT
    salary "연봉"
FROM employees
where first_name = 'Lex';                               -- 문자, 날짜는 ' '로 감싸줍니다. ' '는 대소문자를 구분합니다.                        문자, 날짜는 ' '로 감싸줍니다.

--07/01/01 이후에 입사한 사원들의 이름과 입사일을 출력하세요.
SELECT
    first_name || '-' || last_name "이름",
    hire_date "입사일"
FROM employees
where hire_date > '07/01/01';                           -- 문자, 날짜는 ' '로 감싸줍니다. ' '는 대소문자를 구분합니다.

--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요.
SELECT
    first_name || '-' || last_name "성명",
    salary "연봉"
FROM employees
where
    salary >= 14000                                     -- 일반 숫자이기 때문에 ' '로 감싸주지 않아도 됩니다.
or  salary <= 17000;                                    -- 조건 중 하나라도 해당되면 만족하는 경우에는 각 조건마다 or로 연결합니다.             여러 조건 중 한 조건만 만족해도 만족하는 경우에는 or를 사용합니다.
    
--입사일이 04/01/01에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요. (1번째 방법)
SELECT
    first_name || '-' || last_name "이름",
    hire_date "입사일"
FROM employees
where
    hire_date >= '04/01/01'                             -- 문자, 날짜는 ' '로 감싸줍니다. ' '는 대소문자를 구분합니다.                        문자, 날짜는 ' '로 감싸줍니다.
and hire_date <= '05/12/31';                            -- 조건이 여러개인 경우에는 각 조건마다 and로 연결합니다.                             동시에 여러 조건을 만족해야 하는 경우에는 and를 사용합니다.
--where hire_date between '04/01/01' and '05/12/31'     --> 이렇게 쓰는 것도 가능합니다. 대신 between과 and는 반드시 짝을 이뤄 작성합니다.

--입사일이 04/01/01에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요. (2번째 방법)
SELECT
    first_name || '-' || last_name "이름",
    hire_date "입사일"
FROM employees                            
where hire_date between '04/01/01' and '05/12/31';      --> 이렇게 쓰는 것도 가능합니다. 대신 between과 and는 반드시 짝을 이뤄 작성합니다.                        
                                                        -- 조건이 여러개인 경우에는 각 조건마다 and로 연결합니다.                             동시에 여러 조건을 만족해야 하는 경우에는 and를 사용합니다.
                                                        -- 문자, 날짜는 ' '로 감싸줍니다. ' '는 대소문자를 구분합니다.                        문자, 날짜는 ' '로 감싸줍니다.
                                                        
--In연산자=======================================================================================================================In연산자
--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오.
SELECT
    first_name || '-' || last_name "이름",
    salary "연봉"
FROM employees
where salary in (2100, 3100, 4100, 5100);               -- in 연산자 역시 and와 같은 기능을 합니다.                                         salary 중 ( )안에 해당되는 내용만 선택 할 수 있게 도와줍니다.

--Like연산자=====================================================================================================================Like연산자
SELECT
    first_name || '-' || last_name "이름",
    salary "연봉"
FROM employees
where first_name like 'K%';                              -- K%는 K로 시작하는 모든 단어를, %K는 K로 끝나는 모든 단어를 검색해 주는 역할을 합니다.
                                                         -- K_는 K로 시작하되 두글자인 모든 단어를 검색해 주는 역할을 합니다. _의 갯수에 따라 뒤에 오는 문자의 갯수가 적용됩니다.
                                                         
--이름에 am을 포함한 사원의 이름과 연봉을 출력하세요.                                                                                            '%am%'
SELECT
    first_name || '-' || last_name "이름",
    salary "연봉"
FROM employees
where first_name like '%am%';

--이름의 두 번째 글자가 a인 사원의 이름과 연봉을 출력하세요.                                                                                       '_a%'
SELECT
    first_name || '-' || last_name "이름",
    salary "연봉"
FROM employees
where first_name like '_a%';

--이름의 네 번째 글자가 a인 사원의 이름을 출력하세요.                                                                                            '___a%'
SELECT
    first_name || '-' || last_name "이름"
FROM employees
where first_name like '___a%';

--이름이 4글자인 사원 중 끝에서 두 번째 글자가 a인 사원의 이름을 출력하세요.                                                                        '__a_'
SELECT
    first_name || '-' || last_name "이름"
FROM employees
where first_name like '__a_';

--null==========================================================================================================================null
SELECT
    first_name || '-' || last_name "이름",
    salary "연봉",
    commission_pct "수당",
    salary*commission_pct "연봉*수당"
FROM employees
where salary BETWEEN 13000 and 15000;                      -- (Null)은 아무런 값도 정해지지 않았음을 의미합니다. (0을 의미하지 않습니다.)

--Null연습
SELECT
    first_name || '-' || last_name "이름",
    salary "연봉",
    commission_pct "수당"
FROM employees
where commission_pct is null;                               -- commission_pct = null    (X)  commission_pct is null    (O)

--커미션비율이 있는 사원의 이름과 연봉 커미션 비율을 출력하세요.
SELECT
    first_name || '-' || last_name "이름",
    salary*commission_pct "연봉 커미션 비율"
FROM employees
where commission_pct is not null;

--담당 매니저가 없고 커미션 비율이 없는 직원의 이름을 출력하세요.
SELECT
    first_name || '-' || last_name "이름"
FROM employees
where 
    manager_id is null
and commission_pct is null;

--Order by절=====================================================================================================================사용자가 지정한 형식에 맞게 정렬하여 출력을 해줍니다. desc 大 --> 小       asc 小 --> 大
SELECT
    first_name "이름",
    salary "연봉"
FROM employees
where
    salary >= 9000
order by salary desc,                                  -- 정렬조건이 여러개 일 시 ,로 구분하여 나열합니다.
         first_name asc;
        
--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요.
SELECT
    department_id "부서번호",
    salary "급여",
    first_name "이름"
FROM employees
order by department_id asc;

--급여가 1000이상인 직원의 이름 급여를 급여가 큰 직원부터 출력하세요.
SELECT
    first_name "이름",
    salary "급여"
FROM employees
where salary >=1000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요.
SELECT
    department_id "부서번호",
    salary "급여",
    first_name "이름"
FROM employees
order by department_id asc,
         salary desc;