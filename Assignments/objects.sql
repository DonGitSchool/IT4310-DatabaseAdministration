-- Drop the dependent tables
DROP TABLE professor;
DROP TABLE student;

-- Drop the user-defined type
DROP TYPE address_ty;
-- Create or replace the user-defined type
CREATE OR REPLACE TYPE address_ty AS OBJECT (
    name VARCHAR2(30),
    address VARCHAR2(30),
    city VARCHAR2(30),
    state CHAR(2),
    zip CHAR(5)
);
/

-- Create the professor table
CREATE TABLE professor(
    pid CHAR(5),
    address address_ty,
    salary NUMBER(8, 2)
);

-- Create the student table
CREATE TABLE student(
    sid CHAR(5),
    address address_ty,
    gpa NUMBER(3, 2)
);

-- Insert some test records in professor
INSERT INTO professor VALUES (
    'P001',
    address_ty('Prof1', '456 Avenue', 'CityA', 'CA', '90001'),
    75000
);

INSERT INTO professor VALUES (
    'P002',
    address_ty('Prof2', '789 Boulevard', 'CityB', 'NY', '10001'),
    85000
);

-- Insert some test records in student
INSERT INTO student VALUES (
    'S001',
    address_ty('Student1', '123 Street', 'CityC', 'TX', '73301'),
    3.5
);

INSERT INTO student VALUES (
    'S002',
    address_ty('Student2', '321 Road', 'CityD', 'FL', '33101'),
    3.8
);

-- List pid, zip from professor
SELECT
    pid,
    p.address.zip
FROM
    professor p;

-- List sid, city from student
SELECT
    sid,
    s.address.city
FROM
    student s;
