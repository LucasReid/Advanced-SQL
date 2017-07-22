--lab 10 lnr7605 COMP325
--class notes
------------------------------------------------
--create or replace trigger TRG_sync_prod_count
--before insert on Product 
--for each row
--begin
--update vendor set v_prod_count = v_prod_count +1 WHERE v_code= :New.v_code;
------------------------------------------------
1.
set serveroutput on
create or replace PROCEDURE PRC_new_invoice(p_new_iNum in NUMBER, p_new_cCod in NUMBER)
as
begin
  INSERT INTO LAB8_INVOICE (INV_NUMBER, CUS_CODE, INV_DATE, INV_SUBTOTAL, INV_TAX, INV_TOTAL)
  VALUES (p_new_iNum, p_new_cCod, SYSDATE, 0,0,0);
end;
/

2.
set serveroutput on
create or replace PROCEDURE PRC_new_line_Item(p_invNum in NUMBER,p_lineItem in NUMBER,
p_pCode in VARCHAR2, p_quantity in NUMBER)
as
begin
  insert into LAB8_LINE (INV_NUMBER, LINE_NUMBER, P_CODE,LINE_UNITS,LINE_PRICE,LINE_TOTAL)
  values(p_invNum, p_lineItem,p_pCode, p_quantity,0,0);
end;
/

3.set serveroutput on
create or replace TRIGGER TRG_alter_prod
after INSERT or UPDATE of P_MIN,P_QOH
ON LAB8_PRODUCT 
begin 
  UPDATE LAB8_PRODUCT set Reorder = 'no';
  UPDATE LAB8_PRODUCT set Reorder = 'Yes'where P_QOH<(2*P_MIN) or P_QOH <10;
 
end;
/

4.set serveroutput on
create or replace TRIGGER TRG_alter_prod
after INSERT or UPDATE of P_QOH
ON LAB8_PRODUCT 
begin 
  update LAB8_PRODUCT set P_DISCOUNT =.05 where P_QOH >=50 AND P_DISCOUNT = 0;
  update LAB8_PRODUCT set P_DISCOUNT = P_DISCOUNT *2 
    where P_QOH > 50 and P_DISCOUNT<.5;
    
  update LAB8_PRODUCT set P_DISCOUNT = .5 where P_DISCOUNT>.5;
end;
/

5.set serveroutput on
create or replace TRIGGER TRG_Update_Line_Invoice
before INSERT 
ON LAB8_LINE
for each row
begin 


end;
/
