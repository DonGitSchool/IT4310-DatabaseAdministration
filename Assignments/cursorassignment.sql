DECLARE
    CURSOR cur_emps IS
        SELECT s.emp_id, NVL(e.emp_name, '???') AS emp_name, s.sales
        FROM empsales s
        LEFT JOIN employees e ON s.emp_id = e.emp_id;
    v_comment VARCHAR2(20);

BEGIN
    FOR v_emp_record IN cur_emps LOOP
        IF v_emp_record.sales <= 400 THEN
            v_comment := 'Poor Sales';
        ELSIF v_emp_record.sales <= 600 THEN
            v_comment := 'Average Sales';
        ELSE
            v_comment := 'Great Sales';
        END IF;
        DBMS_OUTPUT.PUT_LINE(v_emp_record.emp_id || ' - ' || v_emp_record.emp_name || ' ' || v_emp_record.sales || ' ' || v_comment);
    END LOOP;
END;