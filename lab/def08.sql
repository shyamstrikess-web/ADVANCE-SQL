--sort array in ascending order

DECLARE
    -- Define an associative array type
    TYPE num_array IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    
    l_numbers num_array;
    l_temp    NUMBER;
BEGIN
    -- Initialize array elements
    l_numbers(1) := 45;
    l_numbers(2) := 12;
    l_numbers(3) := 89;
    l_numbers(4) := 2;
    l_numbers(5) := 34;

    -- Bubble Sort algorithm
    FOR i IN 1..l_numbers.COUNT - 1 LOOP
        FOR j IN i + 1..l_numbers.COUNT LOOP
            IF l_numbers(i) > l_numbers(j) THEN
                -- Swap values
                l_temp       := l_numbers(i);
                l_numbers(i) := l_numbers(j);
                l_numbers(j) := l_temp;
            END IF;
        END LOOP;
    END LOOP;

    -- Display the sorted elements
    DBMS_OUTPUT.PUT_LINE('Sorted Associative Array:');
    FOR i IN 1..l_numbers.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(l_numbers(i));
    END LOOP;
END;
/