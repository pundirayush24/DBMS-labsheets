-- DBMS LAB SHEET 2: DML COMMANDS
-- Topics: INSERT, UPDATE, DELETE

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

CREATE TABLE IF NOT EXISTS Student (
    Student_ID INT,
    Name VARCHAR(100),
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Employee (
    Emp_ID INT,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Salary_Bonus DECIMAL(10,2) NULL
);
CREATE TABLE IF NOT EXISTS Department (
    Dept_ID INT,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Product (
    Product_ID INT,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT
);
CREATE TABLE IF NOT EXISTS Customer (
    Customer_ID INT,
    Customer_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);
CREATE TABLE IF NOT EXISTS Course (
    Course_ID INT,
    Course_Name VARCHAR(100),
    Duration VARCHAR(50),
    Fees DECIMAL(10,2)
);

-- Q1. Insert one record into Student
INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (1, 'Rahul', 20, 'CSE', 'Roorkee');

-- Q2. Insert five student records using separate INSERT statements
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (2, 'Aman', 21, 'AI ML', 'Delhi');
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (3, 'Priya', 19, 'CSE', 'Meerut');
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (4, 'Neha', 22, 'IT', 'Dehradun');
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (5, 'Rohit', 20, 'AI ML', 'Haridwar');
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (6, 'Simran', 21, 'CSE', 'Meerut');

-- Q3. Insert multiple records using one statement
INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES
(7, 'Karan', 20, 'IT', 'Delhi'),
(8, 'Anjali', 19, 'CSE', 'Roorkee');

-- Q4. Insert records into Employee
INSERT INTO Employee (Emp_ID, Emp_Name, Department, Salary, Salary_Bonus)
VALUES
(101, 'Amit', 'IT', 40000, NULL),
(102, 'Neha', 'HR', 35000, NULL);

-- Q5. Insert records into Department
INSERT INTO Department (Dept_ID, Dept_Name, Location)
VALUES
(1, 'IT', 'Delhi'),
(2, 'HR', 'Roorkee'),
(3, 'CSE', 'Dehradun');

-- Q6. Insert records into Product
INSERT INTO Product (Product_ID, Product_Name, Price, Quantity)
VALUES
(1, 'Laptop', 45000, 10),
(2, 'Mouse', 500, 20),
(3, 'Keyboard', 1000, 0);

-- Q7. Insert records into Customer
INSERT INTO Customer (Customer_ID, Customer_Name, Email, Phone)
VALUES
(1, 'Rahul', 'rahul@example.com', '9876543210'),
(2, 'Priya', 'priya@example.com', '9876543211');

-- Q8. Insert records into Course
INSERT INTO Course (Course_ID, Course_Name, Duration, Fees)
VALUES
(1, 'BTech CSE', '4 Years', 120000),
(2, 'BTech AI ML', '4 Years', 130000);

-- Q9. Insert a student record with values for all columns
INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (9, 'Vikas', 20, 'CSE', 'Roorkee');

-- Q10. Insert a student by specifying selected columns
INSERT INTO Student (Student_ID, Name, Course)
VALUES (10, 'Pooja', 'AI ML');

-- Q11. Update the city of a particular student
UPDATE Student SET City = 'Delhi' WHERE Student_ID = 1;

-- Q12. Update the salary of a particular employee
UPDATE Employee SET Salary = 50000 WHERE Emp_ID = 101;

-- Q13. Increase salary of all employees by 10%
UPDATE Employee SET Salary = Salary * 1.10;

-- Q14. Increase price of all products by 5%
UPDATE Product SET Price = Price * 1.05;

-- Q15. Change the course of a particular student
UPDATE Student SET Course = 'AI ML' WHERE Student_ID = 2;

-- Q16. Update the department of an employee
UPDATE Employee SET Department = 'Finance' WHERE Emp_ID = 102;

-- Q17. Update all students from Meerut to Delhi
UPDATE Student SET City = 'Delhi' WHERE City = 'Meerut';

-- Q18. Update fees of a particular course
UPDATE Course SET Fees = 140000 WHERE Course_ID = 2;

-- Q19. Update multiple columns of a student simultaneously
UPDATE Student SET Age = 21, City = 'Haridwar' WHERE Student_ID = 3;

-- Q20. Delete a particular student using Student_ID
DELETE FROM Student WHERE Student_ID = 10;

-- Q21. Delete students belonging to a particular city
DELETE FROM Student WHERE City = 'Haridwar';

-- Q22. Delete employees whose salary is below 30000
DELETE FROM Employee WHERE Salary < 30000;

-- Q23. Delete products whose quantity is zero
DELETE FROM Product WHERE Quantity = 0;

-- Q24. Delete records using multiple conditions (AND/OR)
DELETE FROM Student
WHERE (Age < 20 AND Course = 'CSE') OR City = 'Dehradun';

-- Q25. Complete INSERT, UPDATE, DELETE sequence and display after each
INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (11, 'TestStudent', 20, 'CSE', 'Roorkee');
SELECT * FROM Student WHERE Student_ID = 11;

UPDATE Student SET City = 'Delhi', Age = 21 WHERE Student_ID = 11;
SELECT * FROM Student WHERE Student_ID = 11;

DELETE FROM Student WHERE Student_ID = 11;
SELECT * FROM Student WHERE Student_ID = 11;
