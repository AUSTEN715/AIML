-- SELECT @@autocommit;
-- SET autocommit = 0;

-- CREATE DATABASE prime;
-- USE prime;

-- CREATE TABLE accounts (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(50),
--     balance DECIMAL(10, 2)
-- );

-- INSERT INTO accounts (name, balance) VALUES
-- ('Adam', 500.00),
-- ('Bob', 300.00),
-- ('Charlie', 1000.00);


-- transactions
-- START TRANSACTION;

-- UPDATE accounts SET balance = balance - 50 WHERE id = 1;
-- UPDATE accounts SET balance = balance + 50 WHERE id = 2;

-- COMMIT;


-- START TRANSACTION;

-- UPDATE accounts SET balance = balance - 50 WHERE id = 1;
-- COMMIT;
-- UPDATE accounts SET balance = balance + 50 WHERE id = 2;

-- ROLLBACK;



START TRANSACTION;

UPDATE accounts SET balance = balance + 1000 WHERE id = 1;
SAVEPOINT after_wallet_topup;

UPDATE accounts SET balance = balance + 10 WHERE id = 2;

-- error
ROLLBACK TO after_wallet_topup;

COMMIT;

SELECT * FROM accounts;





-- Join

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Alice', 'Mumbai'),
(2, 'Bob', 'Delhi'),
(3, 'Charlie', 'Bangalore'),
(4, 'David', 'Mumbai');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT
);

INSERT INTO orders VALUES
(101, 1, 500),
(102, 1, 900),
(103, 2, 300),
(104, 5, 700);

SELECT * FROM customers;
SELECT * FROM orders;

-- inner join
SELECT c.customer_id, order_id, c.name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;


-- left join
SELECT *
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;


-- right join
SELECT *
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;


-- outer join
SELECT *
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
UNION
SELECT *
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;


-- cross join
SELECT *
FROM customers
CROSS JOIN orders;


-- self join
SELECT *
FROM customers as A
JOIN customers as B
ON A.customer_id = B.customer_id;


-- Problem 
-- Left exclusive
-- Its like if there is no like relation to the other table its exclusive
SELECT *
FROM customers as c
LEFT JOIN orders as o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;


-- Sub-query
-- with WHERE
SELECT *
FROM orders
WHERE amount > (
	SELECT AVG(amount)
    FROM orders
);

-- with SELECT
SELECT name,
	(	SELECT COUNT(*)
		FROM orders o
        WHERE o.customer_id = c.customer_id
    ) AS order_count
FROM customers c;


-- with FROM
SELECT summary.customer_id, summary.avg_amount
FROM (	
		SELECT 
			customer_id,
			AVG(amount) AS avg_amount
		FROM orders
        GROUP BY customer_id
    ) AS summary;

-- FROM → needs a table.
-- WHERE amount > (...) → needs one value.
-- WHERE id IN (...) → needs a list of values.
-- SELECT (...) → needs one value to display as a column.


-- Views --> 

CREATE VIEW view1 AS 
SELECT customer_id, name FROM customers;

SELECT * FROM view1;


CREATE VIEW view2 AS 
SELECT c.customer_id, order_id, c.name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT * FROM view2;

DROP VIEW view1;



-- Indexes --> makes retrival faster
CREATE TABLE accountsSecond (
    account_id INT PRIMARY KEY,
    name VARCHAR(50),
    balance DECIMAL(10, 2),
    branch VARCHAR(50)
);

INSERT INTO accountsSecond VALUES
(1, 'Adam', 500.00, 'Mumbai'),
(2, 'Bob', 300.00, 'Delhi'),
(3, 'Charlie', 700.00, 'Bangalore'),
(4, 'David', 1000.00, 'Noida');

SELECT * FROM accountsSecond;

CREATE INDEX idx_branch ON accountsSecond(branch);

SHOW INDEX FROM accountsSecond;

-- makes this faster
SELECT *
FROM accountsSecond
WHERE branch = "Mumbai";



-- both combination must be unique value
CREATE INDEX idx_2 ON accountsSecond(branch, balance);

SHOW INDEX FROM accountsSecond;

DROP INDEX idx_2 ON accountsSecond;




-- Stored Procedures --> function
SELECT * FROM accountsSecond;

DELIMITER $$

CREATE PROCEDURE check_balance(IN acc_id INT)
BEGIN
	SELECT balance 
	FROM accountsSecond
    WHERE account_id = acc_id;
END $$

DELIMITER ;

CALL check_balance(2);

DROP PROCEDURE IF EXISTS check_balance;

DELIMITER $$

CREATE PROCEDURE check_balance(IN acc_id INT, OUT bal DECIMAL(10, 2) )
BEGIN
	SELECT balance INTO bal
	FROM accountsSecond
    WHERE account_id = acc_id;
END $$

DELIMITER ;

CALL check_balance(2, @balance);
SELECT @balance;



