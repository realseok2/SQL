--  단일행 함수


--  문자 함수

--  initcap()===================================================================================================================
--  일반 출력시 모두 대문자로 출력됩니다. 첫 문자만 대문자로 출력하고 나머지는 소문자로 출력하기 위해서 initcap(컬럼)을 사용합니다.
SELECT
    email,
    INITCAP(email)
FROM employees;

SELECT
    initcap('aaaaa')
FROM dual;                                              --  test용인 가상의 테이블입니다. employees는 상관도 없는데 사용할 필요가 없기 때문에.

SELECT
    email,
    initcap(email),
    department_id
FROM employees
where department_id = 100;

--  Lower(컬럼명) // Upper(컬럼명)
SELECT
    Lower('abcdeABCDE'),
    Upper('abcdeABCDE')
FROM dual;

--  입력되는 값을 전부 소문자 / 대문자로 변경하는 함수
SELECT
    first_name,
    lower(first_name),
    upper(first_name)
FROM employees
where department_id = 100;

--  SUBSTR(컬럼명, 시작위치, 글자수)===============================================================================================       SUBSTR
--  주어진 문자열에서 특정 길이의 문자열을 구하는 함수    
SELECT
    substr('abcdefg', 1, 3)         --  앞에서부터 출발하여 1번째 문자부터 출력하여 3개를 출력합니다.
FROM dual;

SELECT
    substr('abcdefg', -3, 2)        --  뒤에서부터 출발하여 3칸을 간 뒤 다시 오른쪽 방향으로 2개를 출력합니다.
FROM dual;

--  LPAD(컬럼명, 자리수, '채울문자') / RPAD(컬럼명, 자리수, '채울문자')===============================================================      LPAD, RPAD
SELECT
    first_name,
    LPAD(first_name, 10, '*'),
    RPAD(first_name, 10, '*')
FROM employees;

-- REPLACE(컬럼명, 문자1, 문자2)==================================================================================================     replace
SELECT
    first_name,
    replace(first_name, 'a', '*')
FROM employees
where department_id = 100;

SELECT
    first_name,
    replace(first_name, 'a', '*'),
    substr(first_name, 2, 3),
    replace(first_name, substr(first_name, 2, 3), '***')
FROM employees
where department_id = 100;

SELECT
    ltrim('         aaa            '),
    rtrim('         aaa            '),
    ltrim('         aaa            ') || '---------'
FROM dual;

--  숫자함수
--  Round(숫자, 출력을 원하는 자릿수)==============================================================================================
SELECT
    round(123.456, 2) "r2",       --  소수점 자릿수에서 반올림
    round(123.456, 0) "r0",       --  소수점 반올림
    round(123.456, -1) "r-1"      --  1의자리 반올림
FROM dual;

--  TRUNC(숫자, 출력을 원하는 자릿수)==============================================================================================
SELECT
    trunc(123.456, 2) "r2",        --  소수점 자릿수에서 버림
    trunc(123.456, 0) "r0",        --  소수점 버림
    trunc(123.456, -2) "r-1"       --  10의자리부터 버림 
FROM dual;

--  날짜 함수====================================================================================================================
--  sysdate                                                     --  등록된 날짜를 보여줍니다.
SELECT
    sysdate,
    first_name
FROM employees;

--  months_between(d1, d2)
SELECT
    sysdate,
    hire_date,
    months_between(sysdate, hire_date)
FROM employees
where department_id = 110;

--  last_day(d)
SELECT
    last_day('20/06/04'),
    last_day(sysdate)
FROM dual;

--  변환함수=====================================================================================================================
--  TO_CHAR(n, fmt)                                                                                                                     숫자 --> 문자 변환하기
SELECT
    first_name,
    salary*12,
    to_char(salary*12, '999999'),
    to_char(salary*12, '099999'),
    to_char(salary*12, '999,999'),
    to_char(salary*12, '999999.9999')
FROM employees
where department_id = 110;

SELECT
    to_char(9876, '99999'),
    to_char(9876, '099999'),
    to_char(9876, '$9999'),
    to_char(9876, '9999.99'),
    to_char(9876, '99,999')
FROM dual;

--  TO_CHAR(d, fmt)=============================================================================================================       날짜 --> 문자 변형하기
SELECT
    sysdate,
    to_char(sysdate, 'yyyy"年" mm"月" dd"日" day hh12"시" MI"분" SS"초"')
FROM dual;

--  NVL(컬럼명, null 일 때 값) / NVL2(컬럼명, null 아닐 때 값, null 일 때 값)
SELECT
    first_name,
    commission_pct,
    nvl(commission_pct, 0),
    salary * commission_pct,
    salary * NVL(commission_pct,0),
    nvl2(commission_pct, 1, 0)
FROM employees;