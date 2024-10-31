/* 1. WAQ to get second highest salary from the employee table */
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee); --This makes it the max but the second most :)

/* 2. WAQ to get details of all employees who are working in 'New Delhi' */
SELECT e.*, c.Name AS CityName
FROM Employee e
JOIN City c ON e.CityId = c.Id
WHERE c.Name = 'New Delhi';

/* 3. WAQ to get last record from the Employee table */
SELECT *
FROM Employee
ORDER BY Id DESC LIMIT 1;

/* 4. WAQ to get Number of employees in Each Department */
SELECT Department, COUNT(*) AS NumberOfEmployees
FROM Employee
GROUP BY Department;

/* 5. WAQ to Create table and Copy all data from another table */
DROP TABLE IF EXISTS EmployeeCopy;
CREATE TABLE EmployeeCopy AS
SELECT *
FROM Employee;

-- Check if the table has been created and data has been copied
SELECT * FROM EmployeeCopy;

/* 6. WAQ to display sum of salary from Employee based on department */
SELECT Department, SUM(Salary) AS TotalSalary
FROM Employee
GROUP BY Department;

/* 7. WAQ to get 3rd highest salary from the Employee table */
SELECT MIN(salary) AS ThirdHighestSalary
FROM (
    SELECT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 3
) AS TopSalaries; --Grabs the Top 3 then gets the lowest of them

/* 8. WAQ to find Employee whose name starts with 's' */
SELECT *
FROM Employee
WHERE Name LIKE 'S%';

/* 9. WAQ to add new Column(DOB) in the Employee table */
ALTER TABLE Employee
ADD DOB DATE;

/* Check if the column has been added */
SELECT * FROM Employee;

/* 10. WAQ to drop DOB column from Employee table */
ALTER TABLE Employee
DROP COLUMN DOB;

/* Check if the column has been dropped */
SELECT * FROM Employee;