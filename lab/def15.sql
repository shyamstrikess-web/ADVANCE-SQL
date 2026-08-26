--Create table of employee with  EID, ENAME, DEPTNO,DEPTNAME, GENDER,AGE and BASICSAL and use cursor for loop
set serveroutput on
declare
    i number;
begin
for i IN (select EID,ENAME,DEPTNO,DEPTNAME,GENDER,AGE,BASICSAL from EMPLOYEE)
loop
    dbms_output.put_line('EMPLOYEE ID is: '|| i.EID);
    dbms_output.put_line('EMPLOYEE Name is: '|| i.ENAME);
    dbms_output.put_line('DEPARTMENT NUMBER is: '|| i.DEPTNO);
    dbms_output.put_line('DEPARTMENT NAME is: '|| i.DEPTNAME);
    dbms_output.put_line('EMPLOYEE GENDER is: '|| i.GENDER);
    dbms_output.put_line('EMPLOYEE BASICSAL is: '|| i.BASICSAL);
end loop;
end;
/
