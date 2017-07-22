--lab7 Lnr7605 COMP325-01
1.SELECT * from LAB7_PRODUCT where P_PRICE <10
UNION
SELECT * from LAB7_PRODUCT where P_PRICE > 50;

2.SELECT * from LAB7_PRODUCT where P_PRICE <10 
intersect
select * from LAB7_PRODUCT where V_CODE = 21225;

3.SELECT * from LAB7_PRODUCT where P_PRICE <10 
minus
select * from LAB7_PRODUCT where V_CODE = 21225;

4.select V_CODE, V_STATE, V_NAME  from LAB7_US_VENDOR where V_STATE  like 'T%'
UNION
select V_CODE, V_STATE, V_NAME  from LAB7_US_VENDOR where V_STATE like 'U%'
union
select V_CODE, V_COUNTRY, V_NAME  from LAB7_INT_VENDOR where V_COUNTRY like 'T%'
UNION
select V_CODE, V_COUNTRY, V_NAME  from LAB7_INT_VENDOR where V_COUNTRY  like 'U%';

5.select V_CODE, V_STATE, V_NAME  from LAB7_US_VENDOR where V_ORDER = 'N'
UNION
select V_CODE, V_STATE, V_NAME  from LAB7_US_VENDOR where V_STATE not like 'U%'
union
select V_CODE, V_COUNTRY, V_NAME  from LAB7_INT_VENDOR where V_ORDER = 'N'
UNION
select V_CODE, V_COUNTRY, V_NAME  from LAB7_INT_VENDOR where V_COUNTRY  not like 'U%';

6.select P_CODE,P_DESCRIPT, P_PRICE, P_CATEGORY,
CASE
  WHEN P_CATEGORY = 1 then 'Premium'
  WHEN P_CATEGORY = 2 then 'Standard'
  else 'Economy'
END 
as Quality
from LAB7_PRODUCT;

7.
select P_CODE,P_DESCRIPT, P_PRICE, P_CATEGORY,
CASE
  WHEN P_CATEGORY = 1 AND P_PRICE <50 then 'Best Value' 
  WHEN P_CATEGORY = 2 AND P_PRICE <50 OR P_CATEGORY = 1 
  and P_PRICE > 50 then 'Good Value'
  else 'Economy'
END 
as Quality
from LAB7_PRODUCT;

8.select P_CODE,P_DESCRIPT, P_PRICE, P_CATEGORY,
CASE
  WHEN P_CATEGORY = 1 then 
  CASE
    when P_PRICE > 50 then 'HIGH'
    when P_PRICE <= 50 then 'MED'
  END
  WHEN P_CATEGORY = 2 then
    CASE
      when P_PRICE >30 then 'HIGH'
      when P_PRICE BETWEEN 10 and 30 then 'MED'
      when P_PRICE <10 then 'LOW'
    END
  else
    case
      when P_PRICE >40 then 'HIGH'
      else 'LOW'
   end
END 
as value
from LAB7_PRODUCT;

9.
SELECT sum(P_PRICE), COUNT(P_PRICE),min(P_PRICE),MAX(P_PRICE)
FROM LAB7_PRODUCT group by P_CATEGORY order by P_CATEGORY;

10.SELECT sum(P_PRICE), COUNT(P_PRICE),min(P_PRICE),MAX(P_PRICE)
FROM LAB7_PRODUCT group by ROLLUP(P_CATEGORY)ORDER BY P_CATEGORY;

11.SSELECT V_CODE, P_CATEGORY, avg(P_QOH)
FROM LAB7_PRODUCT group by ROLLUP(P_CATEGORY, V_CODE) ORDER BY P_CATEGORY;

12.SELECT V_CODE, P_CATEGORY, sum(P_QOH)
FROM LAB7_PRODUCT group by cube(P_CATEGORY, V_CODE) ORDER BY P_CATEGORY, V_CODE;
