DECLARE
    FUNCTION get_sal(p_id IN empsales.emp_id%TYPE) RETURN NUMBER IS
        v_sales empsales.sales%TYPE := NULL;
    BEGIN
        BEGIN
            SELECT sales INTO v_sales
            FROM empsales
            WHERE emp_id = p_id;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RETURN NULL;
        END;
        RETURN v_sales;
    END;

BEGIN
    DBMS_OUTPUT.PUT_LINE('E01 - ' || get_sal('E01'));
    DBMS_OUTPUT.PUT_LINE('E99 - ' || get_sal('E99'));
END;