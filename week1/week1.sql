select sysdate
from dual;

alter session set nls_date_format = 'yyyy/mm/dd hh:mi:ss'; -- 날짜 방식을 sysdate에 변경

----------------ex 1 ---------------------------------
select ename, sal
from emp
where ename = 'SMITH';

----------------ex 2 ---------------------------------
select empno, lpad(ename,20), rpad(sal,10)
from emp;

----------------ex 3 ---------------------------------
select to_char(sysdate, 'dd mon yy')
from dual;

----------------ex 4 ---------------------------------
select ename,to_char(hiredate,'day') as 요일
from emp
where to_char(hiredate,'day') in ('수요일','금요일')
order by 1;

--------------------ex 5 -----------------------------
select ename,to_char(hiredate,'mon')
from emp
where rtrim(to_char(hiredate,'mon')) in ('2월','12월')
order by 1;

