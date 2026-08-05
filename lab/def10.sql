--program to insert data

set serveroutput on 
declare 

 EMPNUM		number(2); 
 EMPNAME 	char(25);                                           
 DET		number(3);                                     
 SAL		number(6);
begin
 
delete from emmp where emp_n=&empnum;
commit;
dbms_output.put_line('data delete');

end;
/