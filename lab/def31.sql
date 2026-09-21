-- Write a simple procedure without any parameter that shows a user defined message on the screen. Call the procedure using a separate PL/SQL block and on the command line. 
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE show_welcome_message AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Welcome to PL/SQL Programming!');
END show_welcome_message;
/
BEGIN
    show_welcome_message;
END;
/