1.CREATE SEQUENCE seq_lab11_tablPK
start with 1 increment by 1
nocache;

2.CREATE SEQUENCE seq_lab11_tab2PK
start with 1 increment by 1
nocache;

3.CREATE SEQUENCE seq_lab11_tab3PK
start with 1 increment by 1
minvalue 1 maxvalue 50000
cycle;

4.CREATE TABLE Lab11_Tab1 ( col1 INTEGER PRIMARY KEY, col2 INTEGER, col3 CHAR(5));

5.set serveroutput on
declare
  v_randomStr CHAR(5);
  v_numrows   INTEGER;
  v_rows_ctr  INTEGER;
begin
  v_numrows   := 10;
  v_rows_ctr  := 0;
  
  loop 
  v_randomStr := DBMS_RANDOM.string('U',5);
  v_rows_ctr:= v_rows_ctr +1;
    insert into Lab11_tab1 (col1, col2, col3) values (seq_lab11_tablPK.nextval, 
    seq_lab11_tab2PK.nextval, v_randomStr);
  exit when v_rows_ctr >= v_numrows;  
  end loop;
  
end;
/
6.CREATE TABLE Lab11_Tab2( col1 INTEGER PRIMARY KEY, col2 INTEGER, col3 CHAR(5));
	CREATE INDEX ind_lab11_tab2_col2 on Lab11_tab2 (col2);

7.CREATE INDEX ind_lab11_col3 on Lab11_tab2 (col3);

8.set serveroutput on
declare
  v_randomStr CHAR(5);
  v_numrows   INTEGER;
  v_rows_ctr  INTEGER;
begin
  v_numrows   := 10;
  v_rows_ctr  := 0;
  
  loop 
  v_randomStr := DBMS_RANDOM.string('U',5);
  v_rows_ctr:= v_rows_ctr +1;
    insert into Lab11_tab2 (col1, col2, col3) values (seq_lab11_tab2PK.nextval, 
    seq_lab11_tab2PK.nextval, v_randomStr);
  exit when v_rows_ctr >= v_numrows;  
  end loop;
  
end;
/

9.Table 1 = 200010 rows
  Table 2 = 200010 rows

10.
Table 1
SET TIMING ON
SELECT col1, col2, col3 from Lab11_Tab1 WHERE col2 = 45 or col2 = 67;
Elapsed: 00:00:00.057
--in table
SELECT col1, col2, col3 from Lab11_Tab1 WHERE col3 like 'HVXSL';
Elapsed: 00:00:00.017
--not in table
SELECT col1, col2, col3 from Lab11_Tab1 WHERE col3 like 'LUCAS';
Elapsed: 00:00:00.008

Table 2
SET TIMING ON
SELECT col1, col2, col3 from Lab11_Tab2 WHERE col2 = 400000 or col2 = 201000;
Elapsed: 00:00:00.012
--in table
SELECT col1, col2, col3 from Lab11_Tab2 WHERE col3 like 'KFGMY';
Elapsed: 00:00:00.004
--not in table
SELECT col1, col2, col3 from Lab11_Tab2 WHERE col3 like 'ZZZZZ';
Elapsed: 00:00:00.001

11.
SET TIMING ON
SELECT sum(col2) from Lab11_Tab2;
table 1
Elapsed: 00:00:00.029
table 2
Elapsed: 00:00:00.033

12.













