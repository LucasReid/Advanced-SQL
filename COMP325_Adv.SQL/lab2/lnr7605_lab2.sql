--Lucas Reid  COMP325-01 lab2
1. SELECT * FROM LAB2_PRODUCT WHERE LAB2_PRODUCT.P_DESCRIPT LIKE '%jigsaw%';

2. SELECT * FROM LAB2_PRODUCT WHERE LAB2_PRODUCT.P_DESCRIPT LIKE '%jigsaw%' AND P_PRICE > 50.00;

3. SELECT * FROM LAB2_VENDOR WHERE V_STATE IN ('TN', 'GA') AND LAB2_VENDOR.V_ORDER LIKE 'Y';

4. SELECT CUS_CODE, INV_NUMBER,INV_TOTAL,INV_DATE,CUS_FNAME,CUS_LNAME FROM LAB2_INVOICE NATURAL JOIN 	LAB2_CUSTOMER WHERE LAB2_INVOICE.INV_TOTAL >= 150.00;

5. SELECT LAB2_CUSTOMER.CUS_CODE, INV_NUMBER,INV_TOTAL,INV_DATE,CUS_FNAME,CUS_LNAME FROM LAB2_INVOICE, LAB2_CUSTOMER WHERE LAB2_INVOICE.INV_TOTAL >= 150.00 AND LAB2_CUSTOMER.CUS_CODE = LAB2_INVOICE.CUS_CODE;

6. SELECT CUS_LNAME, CUS_FNAME, CUS_AREACODE,CUS_PHONE,CUS_BALANCE FROM LAB2_CUSTOMER WHERE 	CUS_BALANCE > 200.00;

7. SELECT INV_NUMBER, CUS_CODE, CUS_LNAME,CUS_FNAME,INV_DATE,INV_TOTAL FROM LAB2_INVOICE JOIN LAB2_CUSTOMER USING(CUS_CODE) WHERE LAB2_INVOICE.INV_DATE = '2012-01-16';

8. SELECT AVG(P_DISCOUNT) FROM LAB2_PRODUCT NATURAL JOIN LAB2_VENDOR WHERE V_STATE = 'TN';

9. SELECT LAB2_LINE.P_CODE,LINE_UNITS,LAB2_INVOICE.INV_NUMBER,INV_DATE FROM LAB2_INVOICE JOIN LAB2_LINE ON (LAB2_LINE.INV_NUMBER = LAB2_INVOICE.INV_NUMBER);

10.SELECT P_CODE,LINE_UNITS,INV_NUMBER,INV_DATE, LAB2_CUSTOMER.CUS_CODE,CUS_FNAME, CUS_LNAME FROM LAB2_LINE NATURAL JOIN LAB2_INVOICE NATURAL JOIN LAB2_CUSTOMER WHERE CUS_AREACODE = '615';

11.SELECT * FROM LAB2_VENDOR LEFT OUTER JOIN LAB2_PRODUCT ON (LAB2_VENDOR.V_CODE = LAB2_PRODUCT.V_CODE);

12.SELECT * FROM LAB2_VENDOR RIGHT OUTER JOIN LAB2_PRODUCT ON (LAB2_VENDOR.V_CODE = LAB2_PRODUCT.V_CODE);

13.CREATE TABLE LAB2_EMPLOYEES  ( EMP_ID INTEGER PRIMARY KEY, LNAME VARCHAR(25) NOT NULL, FNAME VARCHAR(25) NOT NULL, HIREDATE DATE NOT NULL, GENDER CHAR(1), DEPT_NAME VARCHAR(10), SALARY NUMERIC(8,2) , MANAGER_ID INTEGER);

INSERT INTO LAB2_EMPLOYEES (EMP_ID, LNAME, FNAME, HIREDATE, GENDER, DEPT_NAME, SALARY, MANAGER_ID) VALUES (1, 'Martin', 'Joseph', '2000-10-10', 'M', 'Sales', '42000', 3);

INSERT INTO LAB2_EMPLOYEES (EMP_ID, LNAME, FNAME, HIREDATE, GENDER, DEPT_NAME, SALARY, MANAGER_ID) VALUES (2, 'Stiemer', 'Jay', '2010-01-09', 'M', 'Marketing', '42001', 3);

INSERT INTO LAB2_EMPLOYEES (EMP_ID, LNAME, FNAME, HIREDATE, GENDER, DEPT_NAME, SALARY, MANAGER_ID) VALUES (3, 'Andrews', 'Robyn', '2006-12-08', 'W', 'HR', '42030', 4);

INSERT INTO LAB2_EMPLOYEES (EMP_ID, LNAME, FNAME, HIREDATE, GENDER, DEPT_NAME, SALARY, MANAGER_ID) VALUES (4, 'Reid', 'Lucas', '2000-04-01', 'M', 'CEO', '44000', 4);

14.ALTER TABLE LAB2_EMPLOYEES ADD CONSTRAINT EMP_FKEY FOREIGN KEY (MANAGER_ID) REFERENCES LAB2_EMPLOYEES(EMP_ID);

15.SELECT q.EMP_ID, q.FNAME, q.LNAME, q.SALARY,l.EMP_ID, l.FNAME, l.LNAME FROM LAB2_EMPLOYEES q, LAB2_EMPLOYEES l WHERE q.MANAGER_ID = l.EMP_ID;
