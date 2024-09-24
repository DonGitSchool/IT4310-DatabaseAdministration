DECLARE
    is_prime BOOLEAN;
BEGIN
    FOR num IN 1..10 LOOP
        is_prime := TRUE;
        IF num <= 1 THEN
            is_prime := FALSE;
        ELSE
            FOR i IN 2..10 LOOP
                IF MOD(num, i) = 0 AND num != i THEN
                    is_prime := FALSE;
                    EXIT;
                END IF;
            END LOOP;
        END IF;
        
        IF is_prime THEN
            DBMS_OUTPUT.PUT_LINE(num || ' PRIME');
        ELSE
            DBMS_OUTPUT.PUT_LINE(num || ' NOT PRIME');
        END IF;
    END LOOP;
END;