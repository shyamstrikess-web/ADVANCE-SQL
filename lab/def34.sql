-- Write a function that returns the square of the given number. Execute the function using a separate PL/SQL block and on the command line. 

create or replace function fun_square(x in number)Return number
is
	answer number;
begin
	answer:=x * x;
	return answer;
end fun_Square;
/