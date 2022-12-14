SELECT * FROM EMPLOYEE e ;
SELECT * FROM DEPARTMENT d ;
SELECT * FROM history;
SELECT name, h.* FROM employee e , history h WHERE e.EMPNO = h.empno;

CREATE SEQUENCE ORIGIN
	INCREMENT BY 1
	START WITH 1000
	MAXVALUE 9999
	MINVALUE 1000
	CYCLE;


INSERT INTO DEPARTMENT VALUES (10,'지원');
INSERT INTO DEPARTMENT VALUES (20,'영업');
INSERT INTO DEPARTMENT VALUES (30,'홍보영양');
INSERT INTO DEPARTMENT VALUES (40,'제조');
INSERT INTO DEPARTMENT VALUES (50,'마케팅');
INSERT INTO DEPARTMENT VALUES (60,'IT');
INSERT INTO DEPARTMENT VALUES (70,'디자인');
INSERT INTO DEPARTMENT VALUES (80,'식품연구');
INSERT INTO Employee VALUES (2022||10||ORIGIN.NEXTVAL,'김이박',TO_DATE('1917-11-11','YYYY-MM-DD'),'서울시 동작구','삼육대 경영학과',10,'부장','12345');
INSERT INTO Employee VALUES (2022||50||ORIGIN.NEXTVAL,'고비빔',TO_DATE('2000-01-01','YYYY-MM-DD'),'전주','대졸',50,'사원','456456');
INSERT INTO Employee VALUES (2022||50||ORIGIN.NEXTVAL,'오두기',TO_DATE('1991-01-01','YYYY-MM-DD'),'광주','대졸',50,'사원','456456');
INSERT INTO Employee VALUES (2022||50||ORIGIN.NEXTVAL,'방샤니',TO_DATE('1998-10-01','YYYY-MM-DD'),'전주','대졸',50,'사원','456456');


UPDATE EMPLOYEE SET educational= '방송대 재학중' WHERE name = '최지연';
UPDATE EMPLOYEE SET rank= '회장' , DEPTNO =30 WHERE EMPNO  = 200000 ;
DELETE FROM employee WHERE empno = '최지연' AND empno = 21020;

UPDATE employee SET address ='강원도 강릉시' WHERE empno = 2022101001;

UPDATE EMPLOYEE SET rank= '과장' , DEPTNO = 40 WHERE EMPNO  = 2022201023;

insert into history values 
(2022201023,to_date('2022-10-25','YYYY-MM-DD'),'과장',40,300);

DELETE FROM history WHERE empno = 2022201023 AND moveday = TO_DATE('2205-11-22','yyyy-mm-dd') ;

UPDATE department SET dname = '경영지원' WHERE deptno = 10;

select * from department where deptno like '%'||''||'%';
SELECT d.DEPTNO 부서번호 ,count(empno) 카운트 FROM employee e , DEPARTMENT d  WHERE e.DEPTNO  = d.DEPTNO GROUP BY d.DEPTNO ;

select de.deptno,de.dname, 카운트 from (SELECT d.DEPTNO 부서번호 ,count(empno) 카운트 
FROM employee e , DEPARTMENT d  WHERE d.DEPTNO (+)= e.DEPTNO GROUP BY d.DEPTNO) subde , department de
where subde.부서번호 (+)= de.deptno
AND (de.deptno like '%'||''||'%'
OR de.dname LIKE '%'||''||'%');

SELECT empno, pass FROM EMPLOYEE WHERE empno = '2022101001' AND pass = '12345';

SELECT * FROM employee WHERE empno NOt in (SELECT r.EMPNO FROM RETIREMENT r WHERE state LIKE '퇴사');
SELECT * FROM department;
