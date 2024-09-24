/* BASIC
DECLARE
    CURSOR db IS
        SELECT TITLE_ID, TITLE_NAME, PRICE FROM TITLES;
BEGIN
    FOR rec in db LOOP
        DBMS_OUTPUT.PUT_LINE(rec.TITLE_ID || ' '|| rec.title_name || ' '|| REC.PRICE);
    END LOOP;
END;

*/
DECLARE
    CURSOR db IS
        SELECT
            TITLE_ID AS id,
            TITLE_NAME AS name,
            PUB_NAME as "Publisher",
            price
        FROM TITLES
        JOIN PUBLISHERS ON PUBLISHERS.PUB_ID = TITLES.PUB_ID;
    comment VARCHAR(30);
BEGIN
    FOR rec IN db LOOP
        comment := '  ';
        IF rec.price < 10 THEN
            comment := 'Cheap';
        ELSIF rec.price > 30 THEN
            comment := 'Expensive';
        ELSE
            comment := 'Moderate';
        END IF;
        DBMS_OUTPUT.PUT_LINE(rec.id || ' ' || rec.name || ' ' || rec."Publisher" || ' ' || comment);
    END LOOP;
END;