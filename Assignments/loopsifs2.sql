DECLARE
    FUNCTION is_prime(n IN NUMBER) RETURN BOOLEAN IS
        i NUMBER;
    BEGIN
        IF n < 2 THEN
            RETURN FALSE;
        END IF;
        FOR i IN 2..FLOOR(SQRT(n)) LOOP
            IF n MOD i = 0 THEN
                RETURN FALSE;
            END IF;
        END LOOP;
        RETURN TRUE;
    END;

BEGIN
    FOR num IN 1..1000 LOOP
        IF is_prime(num) THEN
            DBMS_OUTPUT.PUT_LINE(num || ' PRIME');
        ELSE
            DBMS_OUTPUT.PUT_LINE(num || ' NOT PRIME');
        END IF;
    END LOOP;
END;