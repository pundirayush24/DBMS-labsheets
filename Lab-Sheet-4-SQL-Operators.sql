-- DBMS LAB SHEET 4: SQL OPERATORS

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

CREATE TABLE IF NOT EXISTS Operator_Student (
    Student_ID INT,
    Name VARCHAR(50),
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Operator_Employee (
    Emp_ID INT,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Email VARCHAR(100) NULL
);
CREATE TABLE IF NOT EXISTS Operator_Product (
    Product_ID INT,
    Product_Name VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT
);

INSERT INTO Operator_Student VALUES
(1, 'Rahul', 20, 'CSE', 'Roorkee'),
(2, 'Priya', 21, 'AI ML', 'Delhi'),
(3, 'Aman', 19, 'CSE', 'Meerut'),
(4, 'Neha', 22, 'IT', 'Dehradun');

INSERT INTO Operator_Employee VALUES
(101, 'Amit', 'IT', 45000, 'amit@example.com'),
(102, 'Neha', 'HR', 35000, NULL),
(103, 'Rohan', 'Finance', 55000, 'rohan@example.com');

INSERT INTO Operator_Product VALUES
(1, 'Laptop', 45000, 2),
(2, 'Mouse', 500, 10),
(3, 'Keyboard', 1200, 0);

-- ARITHMETIC OPERATORS

-- Q1. Addition
SELECT 10 + 5 AS Addition;

-- Q2. Subtraction
SELECT 10 - 5 AS Subtraction;

-- Q3. Multiplication
SELECT 10 * 5 AS Multiplication;

-- Q4. Division
SELECT 10 / 5 AS Division;

-- Q5. Total amount = Price * Quantity
SELECT Product_Name, Price, Quantity,
       Price * Quantity AS Total_Amount
FROM Operator_Product;

-- LOGICAL OPERATORS

-- Q6. AND
SELECT * FROM Operator_Student
WHERE Course = 'CSE' AND City = 'Roorkee';

-- Q7. OR
SELECT * FROM Operator_Student
WHERE City = 'Delhi' OR City = 'Meerut';

-- Q8. NOT
SELECT * FROM Operator_Student
WHERE NOT Course = 'CSE';

-- Q9. Students in a specific course AND city
SELECT * FROM Operator_Student
WHERE Course = 'CSE' AND City = 'Roorkee';

-- Q10. Employees belonging to either of two departments
SELECT * FROM Operator_Employee
WHERE Department = 'IT' OR Department = 'HR';

-- COMPARISON OPERATORS

-- Q11. Equal to (=)
SELECT * FROM Operator_Student WHERE City = 'Delhi';

-- Q12. Greater than (>)
SELECT * FROM Operator_Employee WHERE Salary > 40000;

-- Q13. Less than (<)
SELECT * FROM Operator_Student WHERE Age < 21;

-- Q14. Greater than or equal and less than or equal
SELECT * FROM Operator_Employee WHERE Salary >= 35000 AND Salary <= 50000;

-- Q15. Not equal to (<> or !=)
SELECT * FROM Operator_Student WHERE Course <> 'CSE';
-- Alternative: SELECT * FROM Operator_Student WHERE Course != 'CSE';

-- SPECIAL OPERATORS

-- Q16. BETWEEN
SELECT * FROM Operator_Employee WHERE Salary BETWEEN 35000 AND 50000;

-- Q17. IN
SELECT * FROM Operator_Student WHERE City IN ('Delhi', 'Roorkee');

-- Q18. NOT IN
SELECT * FROM Operator_Student WHERE City NOT IN ('Delhi', 'Roorkee');

-- Q19. LIKE: names beginning with a particular letter
SELECT * FROM Operator_Student WHERE Name LIKE 'A%';

-- Q20. IS NULL and IS NOT NULL
SELECT * FROM Operator_Employee WHERE Email IS NULL;
SELECT * FROM Operator_Employee WHERE Email IS NOT NULL;

-- SET OPERATIONS

-- Q21. UNION removes duplicates
SELECT City AS Place FROM Operator_Student
UNION
SELECT Department AS Place FROM Operator_Employee;

-- Q22. UNION ALL keeps duplicates
SELECT City AS Place FROM Operator_Student
UNION ALL
SELECT Department AS Place FROM Operator_Employee;

-- Q23. INTERSECT concept in MySQL: use DISTINCT + EXISTS
SELECT DISTINCT s.City
FROM Operator_Student s
WHERE EXISTS (
    SELECT 1 FROM Operator_Student s2
    WHERE s2.Course = 'CSE' AND s2.City = s.City
);

-- Q24. EXCEPT/MINUS concept in MySQL: use NOT EXISTS
SELECT DISTINCT s.City
FROM Operator_Student s
WHERE NOT EXISTS (
    SELECT 1 FROM Operator_Employee e
    WHERE e.Department = s.City
);

-- Q25. Combine arithmetic, logical, comparison and special operators
SELECT Product_Name, Price, Quantity, Price * Quantity AS Total_Amount
FROM Operator_Product
WHERE Price >= 500
  AND Quantity BETWEEN 1 AND 10
  AND Product_Name LIKE '%o%';
