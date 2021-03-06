-- Lucas Reid COMP325-01 Lab4
1.SELECT EMP_ID, EMP_LNAME ||', '||EMP_FNAME FROM LAB3_EMPLOYEES;

2.SELECT EMP_ID, CONCAT(EMP_LNAME, CONCAT(', ', EMP_FNAME)) FROM LAB3_EMPLOYEES;

3.SELECT RPAD(EMP_ID,10,'.'), LPAD(RPAD(EMP_LNAME, LENGTH(EMP_LNAME)+5,'.'),LENGTH(EMP_LNAME)+5,'.'), LPAD(EMP_TITLE, 40,'.')
FROM LAB3_EMPLOYEES;

4.SELECT EMP_ID, EMP_LNAME,EMP_TITLE, REPLACE(EMP_TITLE, 'Programmer','Developer') 
FROM LAB3_EMPLOYEES;

5.SELECT EMP_ID, UPPER(EMP_LNAME), INITCAP(EMP_FNAME) FROM LAB3_EMPLOYEES;

6.SELECT EMP_ID, EMP_LNAME, EMP_TITLE, LENGTH(EMP_TITLE) FROM LAB3_EMPLOYEES;

7.SELECT EMP_ID,EMP_LNAME,
CONCAT(EMP_LNAME, CONCAT('_',CONCAT(SUBSTR(EMP_FNAME,1,1),'@ourCompany.com')))AS EMP_EMAIL,
CONCAT(EMP_ID, ASCII(SUBSTR(EMP_LNAME,1,2))) AS EMP_EMAL_PW 
FROM LAB3_EMPLOYEES;

8. SELECT EMP_ID, EMP_LNAME FROM LAB3_EMPLOYEES WHERE SOUNDEX(EMP_LNAME) = SOUNDEX("White");


