-- Lucas Reid COMP325-01 lab5
1. CREATE TABLE Lab4_Employees (EMP_ID INTEGER PRIMARY KEY, EMP_LNAME VARCHAR2(30) NOT NULL, EMP_BIRTHDATE DATE, EMP_HIREDATE DATE);
2.INSERT INTO Lab4_Employees (EMP_ID, EMP_LNAME, EMP_BIRTHDATE, EMP_HIREDATE) VALUES (1, 'Reid', 
	'09-OCT-1993','27-SEP-2016');
  INSERT INTO Lab4_Employees (EMP_ID, EMP_LNAME, EMP_BIRTHDATE, EMP_HIREDATE) VALUES (2, 'Hiles', 
	'30-DEC-1992','15-JUL-2014');
  INSERT INTO Lab4_Employees (EMP_ID, EMP_LNAME, EMP_BIRTHDATE, EMP_HIREDATE) VALUES (3, 'Mosier', 
	'17-APR-1969','22-JAN-2000');
  INSERT INTO Lab4_Employees (EMP_ID, EMP_LNAME, EMP_BIRTHDATE, EMP_HIREDATE) VALUES (4, 'Reid', 
	'12-JAN-1991','07-FEB-2012');
  INSERT INTO Lab4_Employees (EMP_ID, EMP_LNAME, EMP_BIRTHDATE, EMP_HIREDATE) VALUES (5, 'James', 
	'12-OCT-1982','27-SEP-2016');
  INSERT INTO Lab4_Employees (EMP_ID, EMP_LNAME, EMP_BIRTHDATE, EMP_HIREDATE) VALUES (6, 'Heffner', 
	'09-OCT-1993','20-MAR-2016');
  INSERT INTO Lab4_Employees (EMP_ID, EMP_LNAME, EMP_BIRTHDATE, EMP_HIREDATE) VALUES (7, 'Miller', 
	'05-NOV-1980','27-NOV-2003');
  INSERT INTO Lab4_Employees (EMP_ID, EMP_LNAME, EMP_BIRTHDATE, EMP_HIREDATE) VALUES (8, 'Lanette', 
	TO_DATE('19, 03, 1990','DD,MM,YYYY'),'27-SEP-2016');
  INSERT INTO Lab4_Employees (EMP_ID, EMP_LNAME, EMP_BIRTHDATE, EMP_HIREDATE) VALUES (9, 'Goel', 
	TO_DATE('1984, 08, 30','YYYY, MM, DD'),'27-SEP-2016');
  INSERT INTO Lab4_Employees (EMP_ID, EMP_LNAME, EMP_BIRTHDATE, EMP_HIREDATE) VALUES (10, 'Wrynn', 
	TO_DATE('09,2005,12', 'DD, YYYY,MM'),'27-SEP-2016');

3. SELECT EMP_ID, EMP_LNAME, TO_CHAR(EMP_BIRTHDATE,'MON DD YYYY') FROM Lab4_Employees; 

4. SELECT EMP_ID, EMP_LNAME, TO_CHAR(EMP_HIREDATE, '"Quarter:"q, YYYY') FROM Lab4_Employees;

5. SELECT EMP_ID, EMP_LNAME, TO_CHAR(EMP_HIREDATE, 'DDSPTH "of" MONTH, YEAR') FROM Lab4_Employees;

6. SELECT EMP_ID, EMP_LNAME, TO_CHAR(SYSDATE,'YYYY')-TO_CHAR(EMP_BIRTHDATE,'YYYY')
AS AGE  FROM Lab4_Employees;

7. SELECT EMP_ID, EMP_LNAME, TO_CHAR(EMP_HIREDATE,'YYYY')-TO_CHAR(EMP_BIRTHDATE,'YYYY') AS Age,
ROUND(MONTHS_BETWEEN(EMP_HIREDATE, EMP_BIRTHDATE)) as MON FROM Lab4_Employees;

8. SELECT  EMP_ID, EMP_LNAME,ROUND(MONTHS_BETWEEN(SYSDATE, EMP_HIREDATE)*365)as "Days in company" FROM Lab4_Employees

9.SELECT EMP_ID, EMP_LNAME, EXTRACT(YEAR FROM EMP_HIREDATE) "Hire Dates" FROM 
Lab4_Employees ORDER BY EMP_HIREDATE;

10.SELECT TO_CHAR(TO_DATE('01-JAN-2016','DD MM YYYY'),'DAY"," DDSPTH "of" MONTH') FROM dual;

11.SELECT LAST_DAY(TO_DATE('02-FEB-2012','DD MM YYYY')) FROM dual;

12.ALTER SESSION SET NLS_DATE_FORMAT = 'MONTH DD, YYYY';

13.CREATE TABLE Lab4_Employee_Log (EMP_LOG_ID INTEGER PRIMARY KEY, EMP_ID INTEGER,
FOREIGN KEY (EMP_ID) REFERENCES Lab4_Employees(EMP_ID), EMP_ENTERED TIMESTAMP(4), EMP_EXITED TIMESTAMP(4));

14. INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (1,4, TIMESTAMP '2016 -09-27 07:30:10.1234',TIMESTAMP '2016 -09-27 16:28:50.3562'); 

    INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (2,1, TIMESTAMP '2016 -09-27 07:30:38.1384',TIMESTAMP '2016 -09-27 16:31:22.3992'); 

    INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (3,8, TIMESTAMP '2016 -09-27 07:31:06.6589',TIMESTAMP '2016 -09-27 16:32:29.9983'); 

    INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (4,2, TIMESTAMP '2016 -09-27 07:31:45.5454',TIMESTAMP '2016 -09-27 16:25:28.3562'); 

    INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (5,6, TIMESTAMP '2016 -09-27 07:29:58.3544',TIMESTAMP '2016 -09-27 16:39:00.7562'); 

    INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (6,7, TIMESTAMP '2016 -09-27 07:20:00.4321',TIMESTAMP '2016 -09-27 16:33:57.5842'); 

  INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (7,3, TIMESTAMP '2016 -09-26 07:33:33.4321',TIMESTAMP '2016 -09-26 16:20:57.5842'); 
  INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (8,5, TIMESTAMP '2016 -09-26 07:30:52.4321',TIMESTAMP '2016 -09-26 16:33:57.5842'); 
  INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (9,9, TIMESTAMP '2016 -09-26 07:28:07.4321',TIMESTAMP '2016 -09-26 16:30:47.5842'); 
  INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (10,10, TIMESTAMP '2016 -09-26 07:28:07.4321',TIMESTAMP '2016 -09-26 16:33:57.5842'); 

  INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (11,1, TIMESTAMP '2016 -09-26 07:30:00.0000',TIMESTAMP '2016 -09-26 16:29:37.5842'); 
  INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (12,2, TIMESTAMP '2016 -09-26 07:34:00.4321',TIMESTAMP '2016 -09-26 16:30:50.5842'); 
  INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (13,3, TIMESTAMP '2016 -09-26 07:32:22.4321',TIMESTAMP '2016 -09-26 16:29:00.5842'); 
  INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (14,4, TIMESTAMP '2016 -09-26 07:28:30.4321',TIMESTAMP '2016 -09-26 16:31:07.5842'); 
  INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (15,5, TIMESTAMP '2016 -09-26 07:39:39.4321',TIMESTAMP '2016 -09-26 16:35:09.5842'); 
  INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (16,6, TIMESTAMP '2016 -09-26 07:30:02.4321',TIMESTAMP '2016 -09-26 16:30:53.5842'); 
  INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (17,7, TIMESTAMP '2016 -09-26 07:30:00.4321',TIMESTAMP '2016 -09-26 16:31:30.5842'); 
  INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (18,8, TIMESTAMP '2016 -09-26 07:29:35.4321',TIMESTAMP '2016 -09-26 16:28:57.5842'); 
  INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (19,9, TIMESTAMP '2016 -09-26 07:29:00.4321',TIMESTAMP '2016 -09-26 16:25:59.5842'); 
  INSERT INTO Lab4_Employee_Log (EMP_LOG_ID, EMP_ID, EMP_ENTERED, EMP_EXITED) Values (20,10, TIMESTAMP '2016 -09-26 07:28:07.4321',TIMESTAMP '2016 -09-26 16:33:00.5842'); 

15.SELECT EMP_ID, Lab4_Employees.EMP_LNAME 
   FROM Lab4_Employee_Log NATURAL JOIN Lab4_Employees
   WHERE (EXTRACT(HOUR FROM EMP_ENTERED)<7 
   OR (EXTRACT(HOUR FROM EMP_ENTERED)=7 AND EXTRACT(MINUTE FROM EMP_ENTERED)<30))
   OR (EXTRACT(HOUR FROM EMP_EXITED)>17 
   OR EXTRACT(HOUR FROM EMP_EXITED)=17 AND EXTRACT(MINUTE FROM EMP_EXITED)>30);

16.SELECT EMP_ID, EMP_EXITED-EMP_ENTERED FROM Lab4_Employee_Log;

17.SELECT TZ_OFFSET('EST') FROM dual;

18.SELECT SYSDATE FROM dual;

19.SELECT EXTRACT(YEAR FROM SYSDATE) from dual;









