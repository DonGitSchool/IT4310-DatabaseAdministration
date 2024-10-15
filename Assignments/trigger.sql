-- Clean up
DROP TABLE IF EXISTS prospects;
DROP TABLE IF EXISTS marketing_log;
DROP TRIGGER IF EXISTS updmarketing;

-- Create the prospects table
CREATE TABLE prospects (
    id CHAR(10),
    name VARCHAR(30),
    phone VARCHAR(20)
);

-- Create the log table
CREATE TABLE marketing_log (
    xuser VARCHAR(30),
    xtimestamp TIMESTAMP(0),
    xdesc VARCHAR(30)
);

--Triggers

--Trigger for update
CREATE OR REPLACE TRIGGER updmarketing
BEFORE UPDATE ON prospects
FOR EACH ROW
BEGIN
    INSERT INTO marketing_log (xuser, xtimestamp, xdesc)
    VALUES (USER, SYSTIMESTAMP, 'Update OLD Record: ' || :OLD.id);
    
    INSERT INTO marketing_log (xuser, xtimestamp, xdesc)
    VALUES (USER, SYSTIMESTAMP, 'Update NEW Record: ' || :NEW.id);
END;
/

--Trigger for delete
CREATE OR REPLACE TRIGGER delmarketing
BEFORE DELETE ON prospects
FOR EACH ROW
BEGIN
    INSERT INTO marketing_log (xuser, xtimestamp, xdesc)
    VALUES (USER, SYSTIMESTAMP, 'Delete Record: ' || :OLD.id);
END;
/

-- Trigger for insert
CREATE OR REPLACE TRIGGER insmarketing
BEFORE INSERT ON prospects
FOR EACH ROW
BEGIN
    INSERT INTO marketing_log (xuser, xtimestamp, xdesc)
    VALUES (USER, SYSTIMESTAMP, 'Insert Record: ' || :NEW.id);
END;
/


--Insert, delete, and update records

--Insert records
INSERT INTO prospects (id, name, phone) VALUES ('001', 'John Doe', '123-456-7890');
INSERT INTO prospects (id, name, phone) VALUES ('002', 'Jane Smith', '987-654-3210');

--Update record
UPDATE prospects SET name = 'John A. Doe' WHERE id = '001';

--Delete record
DELETE FROM prospects WHERE id = '002';

--Verify works
SELECT * FROM marketing_log;
