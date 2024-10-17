CREATE TABLE redflame.Payroll (
    Dept NUMBER,
    Manager VARCHAR2(1),
    Name VARCHAR2(50),
    Birthdate DATE,
    Salary NUMBER
);

INSERT INTO redflame.Payroll (Dept, Manager, Name, Birthdate, Salary) VALUES (1, 'Y', 'BOB', TO_DATE('01/01/81', 'MM/DD/YY'), 50000);
INSERT INTO redflame.Payroll (Dept, Manager, Name, Birthdate, Salary) VALUES (1, 'N', 'BILL', TO_DATE('02/02/82', 'MM/DD/YY'), 40000);
INSERT INTO redflame.Payroll (Dept, Manager, Name, Birthdate, Salary) VALUES (1, 'N', 'BOYD', TO_DATE('03/03/83', 'MM/DD/YY'), 70000);
INSERT INTO redflame.Payroll (Dept, Manager, Name, Birthdate, Salary) VALUES (2, 'Y', 'JIM', TO_DATE('04/04/84', 'MM/DD/YY'), 40000);
INSERT INTO redflame.Payroll (Dept, Manager, Name, Birthdate, Salary) VALUES (2, 'N', 'JANET', TO_DATE('05/05/85', 'MM/DD/YY'), 50000);
INSERT INTO redflame.Payroll (Dept, Manager, Name, Birthdate, Salary) VALUES (2, 'N', 'JACK', TO_DATE('06/06/86', 'MM/DD/YY'), 60000);
INSERT INTO redflame.Payroll (Dept, Manager, Name, Birthdate, Salary) VALUES (3, 'Y', 'MARY', TO_DATE('07/07/87', 'MM/DD/YY'), 50000);
INSERT INTO redflame.Payroll (Dept, Manager, Name, Birthdate, Salary) VALUES (3, 'N', 'MARTHA', TO_DATE('08/08/88', 'MM/DD/YY'), 70000);
INSERT INTO redflame.Payroll (Dept, Manager, Name, Birthdate, Salary) VALUES (3, 'N', 'MARTY', TO_DATE('09/09/89', 'MM/DD/YY'), 90000);

CREATE OR REPLACE VIEW redflame.dept1_view AS
SELECT Dept, Manager, Name, Birthdate FROM redflame.Payroll WHERE Dept = 1;

CREATE OR REPLACE VIEW redflame.dept2_view AS
SELECT Dept, Manager, Name, Birthdate FROM redflame.Payroll WHERE Dept = 2;

CREATE OR REPLACE VIEW redflame.dept3_view AS
SELECT Dept, Manager, Name, Birthdate FROM redflame.Payroll WHERE Dept = 3;

CREATE OR REPLACE VIEW redflame.dept1_manager_view AS
SELECT * FROM redflame.Payroll WHERE Dept = 1;

CREATE OR REPLACE VIEW redflame.dept2_manager_view AS
SELECT * FROM redflame.Payroll WHERE Dept = 2;

CREATE OR REPLACE VIEW redflame.dept3_manager_view AS
SELECT * FROM redflame.Payroll WHERE Dept = 3;

-- For members of each department
GRANT SELECT ON redflame.dept1_view TO BILL;
GRANT SELECT ON redflame.dept1_view TO BOYD;
GRANT SELECT ON redflame.dept2_view TO JANET;
GRANT SELECT ON redflame.dept2_view TO JACK;
GRANT SELECT ON redflame.dept3_view TO MARTHA;
GRANT SELECT ON redflame.dept3_view TO MARTY;

-- For department managers
GRANT SELECT ON redflame.dept1_manager_view TO BOB;
GRANT SELECT ON redflame.dept2_manager_view TO JIM;
GRANT SELECT ON redflame.dept3_manager_view TO MARY;

-- Marty should see all data
GRANT SELECT ON redflame.Payroll TO marty;

-- Mary has admin rights
GRANT ALL PRIVILEGES ON redflame.Payroll TO mary;

-- Martha can see all data but change only Birthdates
GRANT SELECT ON redflame.Payroll TO martha;
GRANT UPDATE (Birthdate) ON redflame.Payroll TO martha;

-- Grant SELECT privilege directly to Bob on the Payroll table, also a revoke
GRANT SELECT ON redflame.Payroll TO bob;
REVOKE SELECT ON redflame.Payroll FROM bob;