use hrdb;


create table Company(
CompanyID int,
CompanyName varchar(45),
Street varchar(45),
City varchar(45),
State varchar(45),
Zip varchar(45));
insert into Company values
(12,'brown','khau gali','ahmedabad','gujarat',345678),
(13,'wound','pau gali','vadodara','gujarat',356788),
(14,'bound','chau gali','surat','gujarat',567848),
(15,'pound','bhau gali','rajkot','gujarat',789569),
(16,'ims','14 acres','bhuj','gujarat',456789);
select*from Company;
create table Contact(
ContactID int,
CompanyID int,
FirstName varchar(45),
LastName varchar(45),
Street varchar(45),
City varchar(45),
State varchar(20),
Zip varchar(10),
IsMain boolean,
Email varchar(45),
Phone varchar(12));
insert into Contact values
(21,12,'jeh','purohit','khau gali','ahmedabad','gujarat',345678,true,'raj.01@gmail.com',1234567890),
(22,13,'seema','pandya','pau gali','vadodara','gujarat',356788,true,'mansi.02@gmail.com',2345678901),
(23,14,'shakshi','patel','chau gali','surat','gujarat',567848,true,'shreya.03@gmail.com',3456789012),
(24,15,'kabir','dave','bhau gali','rajkot','gujarat',789569,true,'rutvi.04@gmail.com',4567890123),
(25,16,'shesha','maheshwari','14 acres','bhuj','gujarat',456789,true,'kedar.05@gmail.com',5678901234);
select*from Contact;

create table ContactEmployee(
ContactEmployeeID int,
ContactID int,
EmployeeID int,
ContactDate date,
Description varchar(100));
insert into ContactEmployee values
(31,21,41,'2000-01-01','no description required'),
(32,22,42,'2001-01-01','no description required'),
(33,23,43,'2002-01-01','no description required'),
(34,24,44,'2003-01-01','no description required'),
(35,25,45,'2004-01-01','no description required');
select*from Contactemployee;
create table Employee(
EmployeeID int,
FirstName varchar(45),
LastName varchar(45),
Salary decimal(10.2),
HireDate date,
JobTitle varchar(25),
Email varchar(45),
phone varchar(12));
insert into Employee values
(41,'raj','purohit',10000,'1994-01-01','webdeveloper','raj.01@gmail.com',1234567890),
(42,'mansi','pandya',20000,'1995-01-01','ux','mansi.02@gmail.com',2345678901),
(43,'shreya','patel',30000,'1996-01-01','cyber','shreya.03@gmail.com',3456789012),
(44,'rutvi','dave',40000,'1997-01-01','analyst','rutvi.04@gmail.com',4567890123),
(45,'kedar','maheshwari',50000,'1998-01-01','ca','kedar.05@gmail.com',5678901234);
select*from Employee;

-- 4) In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800

update Employee
set phone = 6758493019
where FirstName = 'raj';

-- 5) In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters” .

update Company
set CompanyName = 'Blue'
where CompanyName = 'Brown';

-- 6) In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee (one statement).
-- HINT: Use the primary key of the ContactEmployee table to specify the correct record to remove

DELETE FROM ContactEmployee
WHERE ContactID = (SELECT ContactID FROM ContactEmployee 
                          WHERE EmployeeID = (SELECT EmployeeID FROM Employee WHERE FirstName = 'raj') 
                          AND ContactID = (SELECT EmployeeID FROM Employee WHERE FirstName = 'mansi') );

-- 7) Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). 
-- Run the SQL SELECT query in MySQL Workbench. Copy the results below as well. 

SELECT DISTINCT
    e.FirstName, e.LastName
FROM
    Employee e
        JOIN
    ContactEmployee ce ON e.EmployeeID = ce.EmployeeID
        JOIN
    Contact c ON ce.ContactID = c.ContactID
        JOIN
    Company co ON c.CompanyID = co.CompanyID
WHERE
    co.CompanyName = 'Brown';

-- 8) What is the significance of “%” and “_” operators in the LIKE statement? 
-- % (Percent Sign) :  Matches zero, one, or multiple characters.
-- Use: When you want to search for a pattern that can have any number of characters in that position.
--  _ (Underscore): Matches exactly one single character.
-- Use: When you want to search for a pattern with one unknown character in a specific position.

-- 9) Explain normalization in the context of databases. 
-- Normalization is the process of organizing data in a database to reduce data redundancy and improve data integrity.
-- Normalization breaks a large table into smaller related tables and uses foreign keys to link them.
-- 1NF (First Normal Form)	Ensures each column contains atomic (indivisible) values, and each record is unique.
-- 2NF (Second Normal Form)	Achieves 1NF and removes partial dependency (non-key columns depend on the whole primary key).
-- 3NF (Third Normal Form)	Achieves 2NF and removes transitive dependency (non-key columns depending on other non-key columns).
-- Benefits of Normalization: - Less duplicate data , Easier data updates, Better consistency ,Saves storage (in many cases)

-- 10) What does a join in MySQL mean? 
-- A JOIN in MySQL is used to combine rows from two or more tables based on a related column between them (usually a foreign key).
-- Purpose of JOIN: To retrieve related data stored in different tables.
-- Types of JOINs:
-- INNER JOIN	Returns only matching rows from both tables.
-- LEFT JOIN	Returns all rows from the left table, and matched rows from the right table.
-- RIGHT JOIN	Returns all rows from the right table, and matched rows from the left table.
-- FULL JOIN	Returns all rows when there is a match in either table (not supported directly in MySQL, can be simulated).

-- 11) What do you understand about DDL, DCL, and DML in MySQL? 
-- DDL – Data Definition Language
-- Used to define or modify the structure of database objects like tables, schemas, etc.
-- Commands:
-- CREATE – Create tables or databases
-- ALTER – Modify existing structure
-- DROP – Delete tables or databases
-- TRUNCATE – Remove all data from a table (structure remains)
-- DML – Data Manipulation Language
-- Used to manage data inside tables (insert, update, delete).
-- Commands:
-- SELECT – Retrieve data
-- INSERT – Add new data
-- UPDATE – Modify existing data
-- DELETE – Remove data
-- DCL – Data Control Language
-- Used to control access to data in the database.
-- Commands:
-- GRANT – Give user access rights
-- REVOKE – Remove access rights








                          
                          





