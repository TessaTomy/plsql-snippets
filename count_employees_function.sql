CREATE OR REPLACE FUNCTION countEmp(d VARCHAR2)
RETURN NUMBER
IS
    n NUMBER;
BEGIN
    SELECT COUNT(*) INTO n
    FROM employee
    WHERE dept = d;
    RETURN n;
END;
/

SELECT countEmp('cs') FROM dual;
