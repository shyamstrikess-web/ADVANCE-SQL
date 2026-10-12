-- Write a trigger that restricts the entry of records in the EMP table if the salary is greater than Rs 50000. 
create or replace trigger def2
before insert on emp_sal1
for each row
begin
   if :new.salary > 50000 then
      raise_application_error(-20010, 'You cannot enter salary above 50000.');
   end if;
end def2;
/