/*
    Name: <Full Name>
    
    Assignment 6
*/

--------------------------------------------------------------------------------
/*				                 Banking DDL           		  		          */
--------------------------------------------------------------------------------
-- DROP DATABASE IF EXISTS banking; -- To delete all tables and procedures, and functions
-- CREATE DATABASE banking; -- create a new database
-- use banking; -- activate it

CREATE OR REPLACE TABLE branch (
    branch_name varchar(256) NOT NULL UNIQUE,
    branch_city varchar(256) NOT NULL,
    assets FLOAT NOT NULL DEFAULT 0,
    CONSTRAINT branch_pkey PRIMARY KEY (branch_name)
);

CREATE TABLE customer (
    cust_ID BIGINT NOT NULL UNIQUE,
    customer_name varchar(256) NOT NULL,
    customer_street varchar(256) NOT NULL,
    customer_city varchar(256) NOT NULL,
    CONSTRAINT customer_pkey PRIMARY KEY (cust_ID)
);

CREATE TABLE loan (
    loan_number BIGINT NOT NULL UNIQUE,
    branch_name varchar(256) NOT NULL,
    amount FLOAT NOT NULL,
    CONSTRAINT loan_pkey PRIMARY KEY (loan_number),
    CONSTRAINT loan_chk CHECK (amount>0),
    CONSTRAINT loan_fkey FOREIGN KEY (branch_name) REFERENCES branch(branch_name) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE borrower (
    cust_ID BIGINT NOT NULL,
    loan_number BIGINT NOT NULL,
    CONSTRAINT borrower_pkey PRIMARY KEY (cust_ID, loan_number),
    CONSTRAINT borrower_cust_fkey FOREIGN KEY (cust_ID) REFERENCES customer(cust_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT borrower_loan_fkey FOREIGN KEY (loan_number) REFERENCES loan(loan_number) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE account (
    account_number BIGINT NOT NULL UNIQUE,
    branch_name varchar(256) NOT NULL,
    balance FLOAT NOT NULL DEFAULT 0,
    CONSTRAINT account_pkey PRIMARY KEY (account_number),
    CONSTRAINT account_fkey FOREIGN KEY (branch_name) REFERENCES branch(branch_name) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE depositor (
    cust_ID BIGINT NOT NULL,
    account_number BIGINT NOT NULL,
    CONSTRAINT depositor_pkey PRIMARY KEY (cust_ID, account_number)
);

-- Insert Values into branch --

INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('Brooklyn Bank','Brooklyn','2506789.00');

INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('First Bank of Brooklyn','Brooklyn','4738291.00');

INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('Brooklyn Bridge Bank','Brooklyn','3216549.00');

INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('Bronx Federal Credit Union','Bronx','1425365.00');

INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('Big Bronx Bank','Bronx','5632897.00');

INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('Upper East Federal Credit Union','Manhatten','9385274.00');

INSERT INTO branch (branch_name, branch_city, assets)
VALUES ('Yonkahs Bankahs','Yonkers','2356967.00');

-- Insert Values into customer --

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('12345', 'Billy Boi', '123 Easy Street', 'Bronx');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('54321', 'Teddy Tiger', '56 East Baltimore Road', 'Brooklyn');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('98524', 'Betty Bench', '123 Easy Street', 'Bronx');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('24357', 'Walter Halter', '67 Stupid Street', 'Brooklyn');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('73194', 'Wendy Winks', '78 Gold Street', 'Harrison');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('74185', 'Lauren Lawn', '3 Gravy Avenue', 'Yonkers');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('95124', 'Peter Pretender', '85 West Fourth Road', 'Manhattan');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('86753', 'Susan Sits', '123 Easy Street', 'Bronx');

INSERT INTO customer (cust_ID, customer_name, customer_street, customer_city)
VALUES ('77776', 'Hank Handles', '2 Ford Drive', 'Harrison');

-- Insert Values into loan

INSERT INTO loan (loan_number, branch_name, amount)
VALUES ('462882645', 'Brooklyn Bridge Bank', '7500.00');

INSERT INTO loan (loan_number, branch_name, amount)
VALUES ('888512347', 'Bronx Federal Credit Union', '11500.00');

INSERT INTO loan (loan_number, branch_name, amount)
VALUES ('646469321', 'Upper East Federal Credit Union', '8550.00');

INSERT INTO loan (loan_number, branch_name, amount)
VALUES ('774485962', 'Yonkahs Bankahs', '2000.00');

INSERT INTO loan (loan_number, branch_name, amount)
VALUES ('919137375', 'Brooklyn Bank', '5000.00');

-- Insert Values into borrower

INSERT INTO borrower (cust_ID, loan_number)
VALUES ('54321','888512347');

INSERT INTO borrower (cust_ID, loan_number)
VALUES ('95124','888512347');

INSERT INTO borrower (cust_ID, loan_number)
VALUES ('24357','919137375');

INSERT INTO borrower (cust_ID, loan_number)
VALUES ('77776','462882645');

INSERT INTO borrower (cust_ID, loan_number)
VALUES ('98524','774485962');

-- Insert Values into account

INSERT INTO account (account_number, branch_name, balance)
VALUES ('142375689', 'First Bank of Brooklyn', '2003.64');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('741852963', 'Yonkahs Bankahs', '5263.23');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('159263487', 'Brooklyn Bank', '1425.98');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('963852741', 'Upper East Federal Credit Union', '2598.36');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('846275315', 'Brooklyn Bridge Bank', '688.12');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('258258963', 'Bronx Federal Credit Union', '3256.21');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('232154689', 'Big Bronx Bank', '4152.87');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('222456197', 'Bronx Federal Credit Union', '1234.56');

INSERT INTO account (account_number, branch_name, balance)
VALUES ('774436581', 'Brooklyn Bank', '8259.34');

-- Insert Values into depositor

INSERT INTO depositor (cust_ID, account_number)
VALUES ('77776', '774436581');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('24357', '222456197');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('86753', '232154689');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('74185', '258258963');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('12345', '142375689');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('73194', '741852963');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('12345', '846275315');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('77776', '963852741');

INSERT INTO depositor (cust_ID, account_number)
VALUES ('12345', '159263487');

--------------------------------------------------------------------------------
/*				                  Question 1           		  		          */
--------------------------------------------------------------------------------

CREATE FUNCTION LastName_DOB_monthlyPayment (
    P FLOAT,
    APR FLOAT,
    years FLOAT
)
RETURNS FLOAT
language plpgsql
as
$$
DECLARE 
i FLOAT;
A FLOAT;
n FLOAT;
BEGIN
    i := APR / 12;
    n := 12 * years;
    A := P * ( i + ( i / ( POWER(1+i, n) - 1 ) ) );

    RETURN A;
END;
$$

--------------------------------------------------------------------------------
/*				                  Question 2           		  		          */
--------------------------------------------------------------------------------

    ------------------------------- Part (a) ------------------------------

SELECT customer.cust_ID, customer.customer_name
FROM customer
LEFT JOIN depositor -- join all rows even for rows that doesn't exist in both tables
ON depositor.cust_ID = customer.cust_ID
INNER JOIN borrower -- join all rows that exists in both tables only
ON borrower.cust_ID = customer.cust_ID
WHERE
depositor.cust_ID IS NULL -- not a depositor
GROUP BY customer.cust_ID; -- return one instance only for each ID

-- SELECT cust_ID, customer_name
-- FROM customer
-- WHERE cust_ID NOT IN 
-- (
--     SELECT cust_ID FROM depositor
-- )
-- AND cust_ID IN
-- (
--     SELECT cust_ID FROM borrower
-- )
-- GROUP BY customer.cust_ID; -- return one instance only for each ID

    ------------------------------- Part (b) ------------------------------

SELECT c1.cust_ID, c1.customer_name FROM customer c1, customer c2 -- two selctions, c1 and c2 are variables names
WHERE c2.cust_ID = '12345'
AND c1.customer_city = c2.customer_city 
AND c1.customer_street = c2.customer_street;

-- SELECT  cust_ID, customer_name
-- FROM customer
-- WHERE customer_street IN
-- (
--     SELECT customer_street FROM customer WHERE cust_ID = '12345'
-- )
-- AND customer_city IN
-- (
--     SELECT customer_city FROM customer WHERE cust_ID = '12345'
-- );

    ------------------------------- Part (c) ------------------------------

SELECT branch.branch_name
FROM branch
INNER JOIN account -- join all rows that exists in both tables only
ON branch.branch_name = account.branch_name
INNER JOIN depositor -- join all rows that exists in three tables only
ON depositor.account_number = account.account_number
INNER JOIN customer -- join all rows that exists in four tables only
ON customer.cust_ID = depositor.cust_ID
WHERE
customer.customer_city = 'Harrison';

    ------------------------------- Part (d) ------------------------------

SELECT customer.*
FROM customer
INNER JOIN depositor
ON depositor.cust_ID = customer.cust_ID
INNER JOIN account
ON depositor.account_number = account.account_number
INNER JOIN branch
ON branch.branch_name = account.branch_name
WHERE
branch.branch_city = 'Brooklyn'
GROUP BY customer.cust_ID; -- return one instance only for each ID

--------------------------------------------------------------------------------
/*				                  Question 3           		  		          */
--------------------------------------------------------------------------------

CREATE FUNCTION LastName_DOB_monthlyPayment ()
RETURNS trigger
language plpgsql
as
$$
DECLARE 
BEGIN
    DELETE FROM depositor WHERE account_number = old.account_number;
    RETURN NEW;
END;
$$

CREATE TRIGGER LastName_DOB_bankTrigger BEFORE DELETE ON account 
FOR EACH ROW EXECUTE FUNCTION LastName_DOB_monthlyPayment();

--------------------------------------------------------------------------------
/*				                  Question 4           		  		          */
--------------------------------------------------------------------------------

-- USE university

CREATE TABLE instructor_course_nums (
    ID			varchar(5),
    name		varchar(20) NOT NULL,
    tot_courses INT NOT NULL DEFAULT 0,
    CONSTRAINT course_nums_pkey PRIMARY KEY (ID),
    CONSTRAINT tot_courses_chk CHECK (tot_courses>=0),
    CONSTRAINT course_nums_fkey1 FOREIGN KEY (ID) REFERENCES instructor (ID) ON DELETE NO ACTION ON UPDATE CASCADE
);


CREATE PROCEDURE LastName_DOB_insCourseNumsProc(
    instr_ID varchar(5)
)
language plpgsql
as
$$
DECLARE
nums INT;
instr_name varchar(20);
BEGIN
    nums := (SELECT COUNT(ID) FROM teaches WHERE ID = instr_ID);

    instr_name := (SELECT name FROM instructor WHERE ID = instr_ID LIMIT 1);

    INSERT INTO instructor_course_nums (ID, name, tot_courses)
    VALUES (instr_ID, instr_name, nums) 
    ON CONFLICT (id) DO UPDATE 
	SET tot_courses=nums;
END;
$$