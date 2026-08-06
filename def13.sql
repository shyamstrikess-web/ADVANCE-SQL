--Write a PL/SQL block that uses a cursor attribute %ROWCOUNT to display the name, department and basic salary of the first 5 employees getting the highest basic salary. (Use Explicit Cursor)

set serveroutput on

declare

    Cursor s1 IS select * from employee order by basicsal desc;
    d employee%ROWTYPE;

begin

    open s1;

loop

fetch s1 INTO d;
exit when s1%ROWCOUNT > 3;
    
    dbms_output.put_line('Name: '||d.ename||'Department: '||d.deptno||' Salary: '||d.basicsal);
end loop;
    close s1;
end;
/