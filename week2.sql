SELECT *
FROM emp;
-------------------- 1 -------------------------
SELECT ename, hiredate, TRUNC((sysdate - hiredate) / 365) AS "�ټӿ���"
FROM emp;

-----------------2 -------------------------
SELECT TO_NUMBER('-1,234,567.89','9,999,999.99')
FROM dual;

-------------------- 3 -------------------------
SELECT empno,ename,sal,NVL(comm, 0), NVL(sal*comm, 0)
FROM emp
WHERE sal * NVL(comm, 0) < 1000000;

-------------------- 4 -------------------------
SELECT empno, ename, sal, NVL(TO_CHAR(comm),'�ش����')
FROM emp;  --  NVL ���

SELECT empno, ename, sal, DECODE(comm , null , '�ش����', comm)
FROM emp; -- DECODE ���

SELECT empno, ename, sal, 
CASE
WHEN comm is null THEN '�ش����'
ELSE TO_CHAR(comm)
END AS comm
FROM emp; -- CASE ���

-------------------- 5 -------------------------
SELECT ename, hiredate, TRUNC((SYSDATE - hiredate) / 365) AS "�ټӿ���",
CASE TRUNC((SYSDATE - hiredate) / 365)
WHEN 10 THEN '10'
WHEN 20 THEN '20'
WHEN 30 THEN '30'
WHEN 40 THEN '40'
ELSE '*'
END AS "Ȳ�ݿ�������"
FROM emp;

-------------------- 6 -------------------------
SELECT empno, ename, job, sal,
CASE
WHEN job = 'CLERK' THEN ROUND(sal*1.2)
WHEN job = 'MANAGER' THEN ROUND(sal*1.5)
ELSE sal
END AS "�λ�� sal"
FROM emp;

-------------------- 7 -------------------------
CREATE TABLE testemp as SELECT *        -- CTAS ���
FROM emp;

SELECT * 
FROM testemp;
UPDATE testemp
SET sal = DECODE(job, 'CLERK', ROUND(sal*1.2), 'MANAGER',ROUND(sal*1.5),sal);

SELECT empno, ename, job, sal
FROM testemp;

DROP TABLE testemp;
-------------------- 8 -------------------------
SELECT empno, ename, sal, nvl(comm, 0), sal+sal*nvl(comm, 0),
CASE 
WHEN sal+sal*nvl(comm, 0) >= 1000000 THEN 'good'
WHEN sal+sal*nvl(comm, 0) >= 5000 THEN 'average'
WHEN sal+sal*nvl(comm, 0) between 1 and 4999 THEN 'bad'
WHEN sal+sal*nvl(comm, 0) = 0 THEN 'no good'
END AS "��"
FROM emp;
