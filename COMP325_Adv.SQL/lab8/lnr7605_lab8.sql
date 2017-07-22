1.SET SERVEROUTPUT ON

declare 
  v_side1    double precision  := 2.5;
  v_side2    double precision  := 6.7;
  v_side3    double precision  := 8.2;
  v_longest  double precision  := 0.0;
  v_combined double precision;
 

 begin
 dbms_output.put_line('The lengths of the three sides are: '||v_side1||', '
 ||v_side2||', '||v_side3||'.'); 
 
 --Test code for equal sides
 if v_side1 = v_side2 and v_side1 = v_side3 then
     dbms_output.put_line('This is an Equalateral Triangle');
     --side 1 = side 2
 elsif v_side1 = v_side2 and v_side1 < v_side3 then
    v_longest := v_side3;
    v_combined := v_side1 *2;
    --side 1 = side 3
 elsif v_side1 = v_side3 and v_side1 < v_side2 then
    v_longest := v_side2;
    v_combined := v_side1 *2;
    --side 2 = side 3
 elsif v_side2 = v_side3 and v_side2 < v_side1 then
    v_longest := v_side1;
    v_combined := v_side2 *2;
 end if;
 
  if v_side2<v_side1 and v_side3<v_side1 then 
    v_longest := v_side1;
    v_combined := v_side2+v_side3;
  elsif v_side1<v_side2 and v_side3<v_side2 then 
    v_longest := v_side2;
    v_combined := v_side1+v_side3;
  else
   v_longest :=v_side3;
   v_combined := v_side1+v_side2;
  end if; 
  
  dbms_output.put_line('The Longes side is :'||v_longest);
  dbms_output.put_line('The sum of the two shorter sides is :'||v_combined);
  
  if v_longest > v_combined then
  dbms_output.put_line('The sum of the two shortest sides is less than the longest.');
  dbms_output.put_line('This is not a Triangle!');
  else
  dbms_output.put_line('This is a Triangle!');
 end if;
 
 end;
 /
 
2.set serveroutput on 
declare
  v_prod_id       LAB8_PRODUCT.P_CODE%type;
  v_prod_name     LAB8_PRODUCT.P_DESCRIPT%type;
  v_prod_quantity LAB8_PRODUCT.P_QOH%type;
  
    CURSOR v_prod_cursor IS SELECT P_CODE, P_DESCRIPT,P_QOH FROM LAB8_PRODUCT WHERE P_QOH>10;
begin
dbms_output.put_line('Product Code         Product Desription                Quantity');
dbms_output.put_line('------------         ------------------                --------');
  open v_prod_cursor;
    loop
      fetch v_prod_cursor INTO v_prod_id, v_prod_name, v_prod_quantity;
      exit when v_prod_cursor%NOTFOUND;
      
      dbms_output.put_line(RPAD(v_prod_id, 20,' ')||RPAD(v_prod_name, 38,' ')
      ||RPAD(v_prod_quantity, 10,' '));
    end loop;
  close v_prod_cursor;

end;
/

3.set serveroutput on 
declare
  v_prod_id       LAB8_PRODUCT.P_CODE%type;
  v_prod_name     LAB8_PRODUCT.P_DESCRIPT%type;
  v_prod_quantity LAB8_PRODUCT.P_QOH%type;
  v_vend_id       LAB8_VENDOR.V_CODE%type;
  v_vend_name     LAB8_VENDOR.V_NAME%type;
  
  
    CURSOR v_prod_cursor IS SELECT P_CODE, P_DESCRIPT,P_QOH,
    V_CODE, V_NAME
    FROM LAB8_PRODUCT NATURAL JOIN LAB8_VENDOR WHERE P_QOH>10;
begin

dbms_output.put_line('Product Code         Product Desription                Quantity     Vendor Code     Vendor Name');
dbms_output.put_line('------------         ------------------                --------     -----------     -----------');
  open v_prod_cursor;
    loop
      fetch v_prod_cursor INTO v_prod_id, v_prod_name, v_prod_quantity,
      v_vend_id, v_vend_name;
      exit when v_prod_cursor%NOTFOUND;
      
      dbms_output.put_line(RPAD(v_prod_id, 20,' ')||RPAD(v_prod_name, 38,' ')
      ||RPAD(v_prod_quantity, 13,' ')||RPAD(v_vend_id, 13,' ')||RPAD(v_vend_name, 15,' '));
    end loop;
  close v_prod_cursor;

end;
/

4.set serveroutput on 
declare
  v_prod_id       LAB8_PRODUCT.P_CODE%type;
  v_prod_name     LAB8_PRODUCT.P_DESCRIPT%type;
  v_prod_quantity LAB8_PRODUCT.P_QOH%type;
  v_pmin          LAB8_PRODUCT.P_MIN%type;
  v_reorder       varchar2(3);
  
    CURSOR v_prod_cursor IS SELECT P_CODE, P_DESCRIPT,P_QOH,P_MIN
    FROM LAB8_PRODUCT;
begin

dbms_output.put_line('Product Code         Product Desription                Quantity     Reorder');
dbms_output.put_line('------------         ------------------                --------     -------');
  open v_prod_cursor;

    loop
      fetch v_prod_cursor INTO v_prod_id, v_prod_name, v_prod_quantity,v_pmin;
      exit when v_prod_cursor%NOTFOUND;
      
        if v_prod_quantity< 2*v_pmin then v_reorder := 'yes';
        else v_reorder :='no';
        end if;
    
      dbms_output.put_line(RPAD(v_prod_id, 20,' ')||RPAD(v_prod_name, 38,' ')
      ||RPAD(v_prod_quantity, 13,' ')||RPAD(v_reorder, 3,' '));
    end loop;
  close v_prod_cursor;

end;
/

5.set serveroutput on 
declare
  v_invoice     LAB8_INVOICE.INV_NUMBER%type;
  v_inv_date    LAB8_INVOICE.INV_DATE%type;
  v_total       LAB8_INVOICE.INV_TOTAL%type;
  v_inv_cus     LAB8_INVOICE.CUS_CODE%type;
  v_cus_balance LAB8_CUSTOMER.CUS_BALANCE%type;
  v_instruct    VARCHAR2(20);
  
  
    CURSOR v_prod_cursor IS SELECT INV_NUMBER,INV_DATE,INV_TOTAL,
    CUS_CODE,CUS_BALANCE from LAB8_INVOICE NATURAL JOIN LAB8_CUSTOMER order by CUS_CODE ;
begin

dbms_output.put_line('Invoice        Date          Total     Customer     Instructions');
dbms_output.put_line('-------        ----          -----     --------     ------------');
  open v_prod_cursor;

    loop
      fetch v_prod_cursor INTO v_invoice, v_inv_date,v_total,v_inv_cus,v_cus_balance;
      exit when v_prod_cursor%NOTFOUND;
      if v_cus_balance >400 then v_instruct := 'Hold Delivery';
      elsif v_cus_balance >=200 AND v_cus_balance<=400 then v_instruct := 'Cash on Delivery';
      else v_instruct:= 'Cash or Credit';
      end if;
    
      dbms_output.put_line(RPAD(v_invoice, 12,' ')||RPAD(v_inv_date, 17,' ')
      ||RPAD(v_total, 11,' ')||RPAD(v_inv_cus, 12,' ')||RPAD(v_instruct, 20,' '));
    end loop;
  close v_prod_cursor;

end;
/

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
