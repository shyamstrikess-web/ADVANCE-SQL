--Write a PL/SQL block which displays the gross salary of employees as per user input EID. (Consider an EMP table with EID, EName, Deptno, Deptname Gender, Age, BasicSal) with appropriate data types.) Gross_Salary: BASICSAL + (DA + HRA + Medical) – PF. Rules: HRA = 15% of basic, DA = 50% of basic, Medical = Rs. 500, PF = 10% of basic. 

DECLARE

    TYPE num_array IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    
    l_numbers num_array;
    l_temp    NUMBER;
BEGIN
  
    l_numbers(1) := 45;
    l_numbers(2) := 12;
    l_numbers(3) := 89;
    l_numbers(4) := 2;
    l_numbers(5) := 34;


    FOR i IN 1..l_numbers.COUNT - 1 LOOP
        FOR j IN i + 1..l_numbers.COUNT LOOP
            IF l_numbers(i) > l_numbers(j) THEN

                l_temp       := l_numbers(i);
                l_numbers(i) := l_numbers(j);
                l_numbers(j) := l_temp;
            END IF;
        END LOOP;
    END LOOP;


    DBMS_OUTPUT.PUT_LINE('Sorted Associative Array:');
    FOR i IN 1..l_numbers.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(l_numbers(i));
    END LOOP;
END;
/
