-- lucas Reid Lab9;
1.create or replace procedure PRC_Prod_Quantity(v_n IN number)
as
  v_prod_id       LAB8_PRODUCT.P_CODE%type;
  v_prod_name     LAB8_PRODUCT.P_DESCRIPT%type;
  v_prod_quantity LAB8_PRODUCT.P_QOH%type;            
  
    CURSOR v_prod_cursor IS SELECT P_CODE, P_DESCRIPT,P_QOH FROM LAB8_PRODUCT WHERE P_QOH>v_n;
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

2.create or replace procedure PRC_Prod_Surcharge(p_surcharge IN number,p_balance IN number)
as
  
      v_CUS_BALANCE   LAB8_CUSTOMER.CUS_BALANCE%type;
      
begin
UPDATE LAB8_CUSTOMER SET CUS_BALANCE= CUS_BALANCE + CUS_BALANCE*p_surcharge/100 
WHERE CUS_BALANCE>p_balance;

end;
/


3.set serveroutput on
create or replace procedure PRC_DELETE_FUNCTION(p_vendor_code IN number)
as
    v_vend_code   LAB8_VENDOR.V_CODE%type;
    v_prod_code   LAB8_PRODUCT.P_CODE%type;
    
    CURSOR v_prod_cursor IS SELECT V_CODE, P_CODE
    FROM LAB8_PRODUCT where V_CODE IS NOT null;
begin
  open v_prod_cursor;
    loop
      fetch v_prod_cursor INTO v_vend_code, v_prod_code;
      
      exit when v_prod_cursor%NOTFOUND; 
        if p_vendor_code = v_vend_code then
 
          delete from LAB8_LINE where P_CODE = v_prod_code;
          delete from LAB8_PRODUCT where P_CODE = v_prod_code;
        end if;
    end loop;
  close v_prod_cursor;
end;
/

4.set serveroutput on
create or replace procedure PRC_INVOICE_COUNT(p_cus_code in number, 
p_inv_date in DATE, p_total in number)
as

  v_cusCode     LAB8_INVOICE.CUS_CODE%type;
  v_invDate     LAB8_INVOICE.INV_DATE%type;
  v_total       LAB8_INVOICE.INV_TOTAL%type;
  v_count       int; 

      cursor v_invCurs is SELECT CUS_CODE, INV_DATE, INV_TOTAL FROM LAB8_INVOICE where
      p_inv_date<=INV_DATE AND p_total <= INV_TOTAL AND p_cus_code = CUS_CODE;
begin
    open v_invCurs;
    v_count := 0;
      loop
        fetch v_invCurs INTO v_cusCode, v_invDate, v_total;
        exit when v_invCurs%NOTFOUND;    
        v_count := v_count+1;
          dbms_output.put_line(v_cusCode||' '||v_invDate||' '||v_total); 
      end loop; 
      dbms_output.put_line('Invoices matching criteria: '||v_count);
    close v_invCurs;
end;
/

5.
--calculate permutation of n && k
set severoutput on
create or replace procedure PCR_PERMUTATIONS(v_n in number, v_k in number)
as
  v_finalN        int;
  v_finalK        int;
  v_finalValue    int;
--v_n the number being permutated
--v_k the number of permutations
begin
if v_n<v_k then 
dbms_output.put_line('Please make the first variable greater than the second.');
end if;
  v_finalN:= FTN_nFACT(v_n);
  v_finalK:= FTN_kFACT(v_n, v_k);
  v_finalValue:= v_finalN / v_finalK;
  dbms_output.put_line(v_finalValue);
end;
/
--calculate n!
set serveroutput on
create or replace function FTN_nFACT(v_n in number)
return number
as
v_finalN    int;
v_count     int;
begin
v_finalN :=1;
  for v_count in 1..v_n LOOP
  v_finalN:=v_finalN*(v_count);
  end loop;
  return v_finalN;
end;
/
--calculate (n-k)!
set serveroutput on
create or replace function FTN_kFACT(v_n in number, v_k in number)
return number
as
v_finalK  int;
v_count   int;
v_index   int;
begin
v_finalK :=1;
v_index := v_n - v_k;
for v_count in 1..v_index loop
v_finalK := v_finalK*(v_count);
end loop;
return v_finalK;
end;
/


















