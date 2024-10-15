/*Drop tables before running*/
DROP TABLE customers;
DROP TABLE transactions;

/*Create Tables*/
CREATE TABLE customers(
    custID VARCHAR2(7),
    custName VARCHAR2(30)
);
CREATE TABLE transactions(
    custid VARCHAR2(7),
    transDate DATE,
    amount DECIMAL(10,2)
);

/* Insert Customer Records */
INSERT INTO customers VALUES ('AAA0010', 'Merv');
INSERT INTO customers VALUES ('BBB0020', 'Mary');
INSERT INTO customers VALUES ('CCC0030', 'Martha');

/* Insert Transaction Records */
INSERT INTO transactions VALUES ('AAA0010', DATE '2024-09-15', 100.00);
INSERT INTO transactions VALUES ('BBB0020', DATE '2024-08-15', 200.00);
INSERT INTO transactions VALUES ('AAA0010', DATE '2024-08-14', 10.00);
INSERT INTO transactions VALUES ('BBB0020', DATE '2024-08-15', 300.00);
INSERT INTO transactions VALUES ('AAA0010', DATE '2024-08-15', 400.00);
INSERT INTO transactions VALUES ('CCC0030', DATE '2024-01-01', 500.00);
INSERT INTO transactions VALUES ('BBB0020', DATE '2024-07-15', 600.00);
INSERT INTO transactions VALUES ('BBB0020', DATE '2021-06-15', 20.00);

/* Selects to show tables */
SELECT * FROM customers;
SELECT custID AS "Customer", TO_CHAR(transDate, 'MM-DD-YYYY') AS "Date", amount /*Changes date to the version wanted*/
FROM transactions;
/*https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/TO_CHAR-datetime.html*/

/* Cross Tabulation */
WITH CustomerTransactions AS (
    SELECT
        c.custID,
        c.custName,
        t.amount,
        SYSDATE - t.transDate AS days_diff
    FROM
        customers c
    LEFT JOIN
        transactions t ON c.custID = t.custID
)
SELECT
    custID AS "Customer",
    custName AS "Name",
    CAST(SUM(CASE WHEN days_diff <= 30 THEN amount ELSE 0 END) AS DECIMAL(10,2)) AS "Current",
    CAST(SUM(CASE WHEN days_diff BETWEEN 31 AND 60 THEN amount ELSE 0 END) AS DECIMAL(10,2)) AS "31-60 Days",
    CAST(SUM(CASE WHEN days_diff BETWEEN 61 AND 90 THEN amount ELSE 0 END) AS DECIMAL(10,2)) AS "61-90 Days",
    CAST(SUM(CASE WHEN days_diff > 90 THEN amount ELSE 0 END) AS DECIMAL(10,2)) AS "91+ Days",
    CAST(SUM(amount) AS DECIMAL(10, 2)) AS "Total"
FROM
    CustomerTransactions
GROUP BY
    custID, custName
UNION ALL
SELECT
    'Totals' AS "Customer",
    NULL AS "Name",
    CAST(SUM(CASE WHEN days_diff <= 30 THEN amount END) AS DECIMAL(10,2)) AS "Current",
    CAST(SUM(CASE WHEN days_diff BETWEEN 31 AND 60 THEN amount END) AS DECIMAL(10,2)) AS "31-60 Days",
    CAST(SUM(CASE WHEN days_diff BETWEEN 61 AND 90 THEN amount END) AS DECIMAL(10,2)) AS "61-90 Days",
    CAST(SUM(CASE WHEN days_diff > 90 THEN amount END) AS DECIMAL(10,2)) AS "91+ Days",
    CAST(SUM(amount) AS DECIMAL(10,2)) AS "Total"
FROM
    CustomerTransactions;

/*Personal notes
  With: defines temportaty relation such as making the customer transaction table
  https://www.geeksforgeeks.org/sql-with-clause/
  CASE WHEN is same as Python IF ELSE (Can exclude the else for just if)
  https://www.w3schools.com/sql/sql_case.asp
  Pivot: Transforms Rows Into Columns, Scrapped this for now
  https://www.sqlservertutorial.net/sql-server-basics/sql-server-pivot/
  set auto total
  Cast: converts into another form
  https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver16
 */