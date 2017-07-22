1.
	0 SELECT STATEMENT    Cost = 14                                                 
	1   HASH JOIN    Cost = 1                                                       
	2     TABLE ACCESS FULL ALBUM TABLE Cost = 1                                    
	3     TABLE ACCESS FULL TRACK TABLE Cost = 2     

2.
a).
	0 SELECT STATEMENT    Cost = 18                                                 
	1   HASH JOIN RIGHT SEMI   Cost = 1                                             
	2     TABLE ACCESS FULL PLAYLISTTRACK TABLE Cost = 1                            
	3     TABLE ACCESS FULL TRACK TABLE Cost = 2                                    
b).
	0 SELECT STATEMENT    Cost = 19                                                 
	1   HASH UNIQUE   Cost = 1                                                      
	2     HASH JOIN RIGHT SEMI   Cost = 1                                           
	3       TABLE ACCESS FULL PLAYLISTTRACK TABLE Cost = 1                          
	4       TABLE ACCESS FULL TRACK TABLE Cost = 2                                  
3.
	0 SELECT STATEMENT    Cost = 18                                                 
	1   HASH JOIN RIGHT SEMI   Cost = 1                                             
	2     TABLE ACCESS FULL PLAYLISTTRACK TABLE Cost = 1                            
	3     TABLE ACCESS FULL TRACK TABLE Cost = 2 
4.
a).
	0 SELECT STATEMENT    Cost = 12                                                 
	1   HASH GROUP BY   Cost = 1                                                    
	2     TABLE ACCESS FULL TRACK TABLE Cost = 1                                    
b).	
	0 SELECT STATEMENT    Cost = 2                                                  
	1   HASH GROUP BY   Cost = 1                                                    
	2     TABLE ACCESS FULL TRACK TABLE Cost = 1                                    
	3       INDEX RANGE SCAN IND_Q4A_LNR7605 INDEX Cost = 1                         
	2     INLIST ITERATOR                                                           	
	3       INDEX RANGE SCAN IND_Q4A_LNR7605 INDEX Cost = 1                         
	1   SORT GROUP BY NOSORT   Cost = 1                                             
	2     TABLE ACCESS FULL TRACK TABLE Cost = 1                                    
	3       INDEX RANGE SCAN IND_Q4A_LNR7605 INDEX Cost = 1                         
	2     INLIST ITERATOR                                                           
	3       INDEX RANGE SCAN IND_Q4A_LNR7605 INDEX Cost = 1                         

	 22 rows selected 


5.	
a).
	0 SELECT STATEMENT    Cost = 3                                                  
	1   SORT AGGREGATE                                                              
	2     TABLE ACCESS FULL INVOICE TABLE Cost = 1                                  
b).
	0 SELECT STATEMENT    Cost = 3                                                  
	1   SORT AGGREGATE                                                              
	2     TABLE ACCESS FULL INVOICE TABLE Cost = 1                                  
c).
	0 SELECT STATEMENT    Cost = 3                                                  
	1   SORT AGGREGATE                                                              
	2     TABLE ACCESS FULL INVOICE TABLE Cost = 1                                  
d).
	0 SELECT STATEMENT    Cost = 3                                                  
	1   SORT AGGREGATE                                                              
	2     TABLE ACCESS FULL INVOICE TABLE Cost = 1                                  
6.
CREATE TYPE student AS OBJECT(
  first_name  varchar2(25),
  last_name   varchar2(25),
  ssn         number,
  total_credits number,
  quality_points  number,
  major varchar2(25)
);
/
create type body t_student as member function compute_gpa
return number
is 
v_student_gpa   number;
begin
    SELECT quality_points / total_credits INTO v_student_gpa from studenttable;
    return v_student_gpa;
    
  end;
end;
/
create table studentTable(studentID integer primary key, student t_student);





















