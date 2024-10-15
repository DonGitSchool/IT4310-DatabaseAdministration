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


/* Cross Tabulation */
SELECT
    c.custID AS "Customer",
    c.custName AS "Name",
    (SELECT COALESCE(SUM(t2.amount), 0.00) FROM transactions t2 WHERE t2.custID = c.custID AND (SYSDATE - t2.transDate) < 30) AS "Current",
    (SELECT COALESCE(SUM(t2.amount), 0.00) FROM transactions t2 WHERE t2.custID = c.custID AND (SYSDATE - t2.transDate) BETWEEN 31 AND 60) AS "31-60 Days",
    (SELECT COALESCE(SUM(t2.amount), 0.00) FROM transactions t2 WHERE t2.custID = c.custID AND (SYSDATE - t2.transDate) BETWEEN 61 AND 90) AS "61-90 Days",
    (SELECT COALESCE(SUM(t2.amount), 0.00) FROM transactions t2 WHERE t2.custID = c.custID AND (SYSDATE - t2.transDate) > 90) AS "91+ Days",
    (SELECT COALESCE(SUM(t2.amount), 0.00) FROM transactions t2 WHERE t2.custID = c.custID) AS "Total"
FROM
    customers c
GROUP BY
    c.custID, c.custName
UNION ALL
SELECT
    'Totals' AS "Customer",
    NULL AS "Name",
    (SELECT COALESCE(SUM(t.amount), 0.00) FROM transactions t WHERE (SYSDATE - t.transDate) <= 30) AS "Current",
    (SELECT COALESCE(SUM(t.amount), 0.00) FROM transactions t WHERE (SYSDATE - t.transDate) BETWEEN 31 AND 60) AS "31-60 Days",
    (SELECT COALESCE(SUM(t.amount), 0.00) FROM transactions t WHERE (SYSDATE - t.transDate) BETWEEN 61 AND 90) AS "61-90 Days",
    (SELECT COALESCE(SUM(t.amount), 0.00) FROM transactions t WHERE (SYSDATE - t.transDate) > 90) AS "91+ Days",
    (SELECT COALESCE(SUM(t.amount), 0.00) FROM transactions t) AS "Total"
FROM
    dual;
