CREATE DATABASE Seera;
USE Seera;
# Customer table
CREATE TABLE customer(ID int primary key, `First Name` varchar(30), `Last Name` varchar(30), Address varchar(50), 
City varchar(30), State varchar(30), `Zip Code` varchar(10), `Phone Number` varchar(25), Email varchar(50), Birthdate varchar(25));

-- Inserting data into the customer table
INSERT INTO customer (ID, `First Name`, `Last Name`, Address, City, State, `Zip Code`, `Phone Number`, Email, Birthdate)
VALUES
(1, 'John', 'Smith', '123 Main St', 'Anytown', 'CA', '12345', '555-555-1212', 'john.smith@email.com', '1980-01-01'),
(2, 'Jane', 'Doe', '456 Second St', 'Anytown', 'CA', '12345', NULL, 'jane.doe@email.com', '1990-02-02'),
(3, 'John', 'Smith', '789 Third St', 'Othertown', 'NY', '67890', '555-555-1212', NULL, '03-12-1987'),
(4, 'Bob', 'Johnson', '234 Fourth St', 'Othertown', 'NY', '67890', '555-555-1212', 'bob.johnson@example.com', '1985-04-04'),
(5, 'Sarah', 'Lee', '567 Fifth St', 'Thirdtown', 'FL', '45678', '555-555-1212', 'sarah.lee@invalidemail', NULL),
(6, 'David', 'Kim', '890 Sixth St', 'Fourthtown', 'TX', '34567', '555-555-1212', 'david.kim@email.com', '1995-06-06'),
(7, 'John', 'Smith', '123 Main St', 'Anytown', 'CA', NULL, '555-555-1212', 'john.smith@example.com', '1980-01-01'),
(8, 'Jane', 'Doe', '456 Second St', 'Anytown', 'CA', '12345', '555-555-1212', 'jane.doe@invalidemail', '02-02-1990'),
(9, 'John', 'Smith', '789 Third St', 'Othertown', NULL, '67890', '555-555-1212', 'john.smith@email.com', '1975-03-03'),
(10, 'Bob', 'Johnson', '234 Fourth St', 'Othertown', 'NY', NULL, '555-555-1212', 'bob.johnson@example.com', '1985-04-04');

########################## Task ##############################
# Validation queries

#1 Check for duplicate values
SELECT * FROM customer
WHERE (`First Name`, `Last Name`, Address, City, State, `Zip Code`, `Phone Number` , Email, Birthdate) IN (
    SELECT `First Name`, `Last Name`, Address, City, State, `Zip Code`, `Phone Number` , Email, Birthdate
    FROM customer
    GROUP BY `First Name`, `Last Name`, Address, City, State, `Zip Code`, `Phone Number` , Email, Birthdate
    HAVING COUNT(*) > 1
);

#2 Check for null values
SELECT * FROM customer
WHERE `First Name` IS NULL OR `Last Name` IS NULL
OR Address IS NULL OR City IS NULL OR State IS NULL
OR `Zip Code` IS NULL OR `Phone Number` IS NULL OR Email IS NULL OR Birthdate IS NULL;

#3 Check for invalid Email Addresses
SELECT ID, Email FROM customer
WHERE Email NOT LIKE '%@%.%';

#4 Check for invalid birthdate format 
SELECT ID, Birthdate FROM customer
WHERE Birthdate NOT LIKE 'YYYY-MM-DD';

#5 Check for dubplicate phone numbers
SELECT `Phone Number`, COUNT(*) as `Total customers`
FROM customer
GROUP BY `Phone Number`
HAVING COUNT(*) > 1;

#6 Check for duplicate emails
SELECT Email, count(*) as `Total customers`
FROM customer
GROUP BY Email
HAVING count(*) > 1;