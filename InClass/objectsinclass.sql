-- Drop the dependent table and address_ty first to ensure it works
DROP TABLE people;
DROP TYPE address_ty;

-- Now, create or replace the UDT (User Defined Type)
CREATE OR REPLACE TYPE address_ty AS OBJECT (
    name VARCHAR2(30),
    address VARCHAR2(30),
    city VARCHAR2(30),
    state CHAR(2),
    zip CHAR(5)
);
/
-- Oracle requires a / at the end of the type definition

-- Next, recreate the table using the UDT
CREATE TABLE people (
    pid CHAR(5),
    address address_ty
);

-- Insert into the table
INSERT INTO people VALUES (
    'P001',
    address_ty('Person1', '123 Street', 'Test', 'UT', '84770')
);

-- Query to describe the table structure
SELECT column_name, data_type, data_length
FROM all_tab_columns
WHERE table_name = 'PEOPLE';

-- List the states in people
SELECT
    pid,
    p.address.state
FROM
    people p;
