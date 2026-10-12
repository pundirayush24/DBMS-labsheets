-- DBMS LAB SHEET 1: DDL COMMANDS
-- Topics: CREATE, ALTER, DROP, constraints

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- Q1. Create a database named CollegeDB
-- Database created above.

-- Q2. Create Student table
CREATE TABLE Student (
    Student_ID INT,
    Name VARCHAR(50),
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

-- Q3. Create Employee table
CREATE TABLE Employee (
    Emp_ID INT,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- Q4. Create Department table
CREATE TABLE Department (
    Dept_ID INT,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

-- Q5. Create Product table
CREATE TABLE Product (
    Product_ID INT,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT
);

-- Q6. Create Customer table
CREATE TABLE Customer (
    Customer_ID INT,
    Customer_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- Q7. Create Course table
CREATE TABLE Course (
    Course_ID INT,
    Course_Name VARCHAR(100),
    Duration VARCHAR(50),
    Fees DECIMAL(10,2)
);

-- Q8. Create Faculty table
CREATE TABLE Faculty (
    Faculty_ID INT,
    Faculty_Name VARCHAR(50),
    Subject VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- Q9. Create Library table
CREATE TABLE Library (
    Book_ID INT,
    Book_Name VARCHAR(100),
    Author VARCHAR(100),
    Price DECIMAL(10,2)
);

-- Q10. Department table with Dept_ID as Primary Key
CREATE TABLE Department_Q10 (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

-- Q11. Student table with Student_ID as Primary Key and Name NOT NULL
CREATE TABLE Student_Q11 (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

-- Q12. Employee table with UNIQUE constraint on Email
CREATE TABLE Employee_Q12 (
    Emp_ID INT,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Email VARCHAR(100) UNIQUE
);

-- Q13. Product table with CHECK constraint Price > 0
CREATE TABLE Product_Q13 (
    Product_ID INT,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2) CHECK (Price > 0),
    Quantity INT
);

-- Q14. Add Email column to Student
ALTER TABLE Student ADD COLUMN Email VARCHAR(100);

-- Q15. Add Phone column to Student
ALTER TABLE Student ADD COLUMN Phone VARCHAR(15);

-- Q16. Modify the size of Name column
ALTER TABLE Student MODIFY COLUMN Name VARCHAR(100);

-- Q17. Rename Student table to Student_Details
RENAME TABLE Student TO Student_Details;

-- Q18. Rename City column to Address
ALTER TABLE Student_Details RENAME COLUMN City TO Address;

-- Q19. Add a Salary column to Employee
-- Employee already has Salary from Q3, so add a second salary-related column
-- to demonstrate ALTER without a duplicate-column error.
ALTER TABLE Employee ADD COLUMN Salary_Bonus DECIMAL(10,2);

-- Q20. Drop Phone column from Student_Details
ALTER TABLE Student_Details DROP COLUMN Phone;

-- Q21. Drop Email column from Student_Details
ALTER TABLE Student_Details DROP COLUMN Email;

-- Q22. Remove all records from a table using TRUNCATE
TRUNCATE TABLE Student_Details;

-- Q23. Drop Course table
DROP TABLE Course;

-- Q24. Drop Customer table
DROP TABLE Customer;

-- Q25. Complete Student table using PRIMARY KEY, NOT NULL, UNIQUE, CHECK;
-- then demonstrate ALTER and DROP operations.
CREATE TABLE Student_Q25 (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 18),
    Course VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Student_Q25 (Student_ID, Name, Email, Age, Course, City)
VALUES
(1, 'Rahul', 'rahul@example.com', 20, 'CSE', 'Roorkee'),
(2, 'Priya', 'priya@example.com', 21, 'AI ML', 'Delhi');

SELECT * FROM Student_Q25;

ALTER TABLE Student_Q25 ADD COLUMN Phone VARCHAR(15);
DESCRIBE Student_Q25;

ALTER TABLE Student_Q25 DROP COLUMN Phone;
DESCRIBE Student_Q25;
