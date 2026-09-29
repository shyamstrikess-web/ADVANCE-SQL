-- Write a function that returns the balance for a given account number. 

create or replace function fun_balance (xacno in number) Return number is mybalance number;

begin
	select balance INTO mybalance from account where ACNO=xacno;

return mybalance;
end fun_balance;
/

/*
to show output call function like this

	-- Test cases using the provided data:
SELECT fun_balance(1001) AS balance FROM dual; -- Returns 2500.5
SELECT fun_balance(1002) AS balance FROM dual; -- Returns 10500
SELECT fun_balance(1003) AS balance FROM dual; -- Returns 750.25
SELECT fun_balance(1004) AS balance FROM dual; -- Returns 0
*/  