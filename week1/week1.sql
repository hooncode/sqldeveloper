select sysdate
from dual;

alter session set nls_date_format = 'yyyy/mm/dd hh:mi:ss'; -- ��¥ ����� sysdate�� ����

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
select ename,to_char(hiredate,'day') as ����
from emp
where to_char(hiredate,'day') in ('������','�ݿ���')
order by 1;

--------------------ex 5 -----------------------------
select ename,to_char(hiredate,'mon')
from emp
where rtrim(to_char(hiredate,'mon')) in ('2��','12��')
order by 1;

