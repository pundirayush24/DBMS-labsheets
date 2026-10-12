-- DBMS LAB SHEET 3: SQL FUNCTIONS

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

CREATE TABLE IF NOT EXISTS Student_Functions (
    Student_ID INT,
    Name VARCHAR(50),
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Employee_Functions (
    Emp_ID INT,
    Emp_Name VARCHAR(50),
    Salary DECIMAL(10,2),
    Joining_Date DATE
);

INSERT INTO Student_Functions VALUES
(1, 'Rahul Sharma', 'Rahul', 'Sharma'),
(2, 'Priya Verma', 'Priya', 'Verma'),
(3, 'Aman Singh', 'Aman', 'Singh');

INSERT INTO Employee_Functions VALUES
(101, 'Amit', 40500.75, '2022-04-15'),
(102, 'Neha', 35600.40, '2023-07-10'),
(103, 'Rohan', 52000.90, '2021-01-20');

-- A. NUMBER FUNCTIONS

-- Q1. ABS()
SELECT ABS(-25) AS Absolute_Value;

-- Q2. ROUND()
SELECT ROUND(123.4567, 2) AS Rounded_Value;

-- Q3. CEIL() and FLOOR()
SELECT CEIL(12.3) AS Ceiling_Value, FLOOR(12.9) AS Floor_Value;

-- Q4. MOD()
SELECT MOD(17, 5) AS Remainder;

-- Q5. Rounded salary of employees
SELECT Emp_Name, Salary, ROUND(Salary) AS Rounded_Salary
FROM Employee_Functions;

-- B. AGGREGATE FUNCTIONS

-- Q6. Count students
SELECT COUNT(*) AS Total_Students FROM Student_Functions;

-- Q7. Total salary
SELECT SUM(Salary) AS Total_Salary FROM Employee_Functions;

-- Q8. Average salary
SELECT AVG(Salary) AS Average_Salary FROM Employee_Functions;

-- Q9. Highest salary
SELECT MAX(Salary) AS Highest_Salary FROM Employee_Functions;

-- Q10. Lowest salary
SELECT MIN(Salary) AS Lowest_Salary FROM Employee_Functions;

-- C. CHARACTER FUNCTIONS

-- Q11. UPPER()
SELECT Name, UPPER(Name) AS Uppercase_Name FROM Student_Functions;

-- Q12. LOWER()
SELECT Name, LOWER(Name) AS Lowercase_Name FROM Student_Functions;

-- Q13. LENGTH()
SELECT Name, LENGTH(Name) AS Name_Length FROM Student_Functions;

-- Q14. CONCAT()
SELECT First_Name, Last_Name,
       CONCAT(First_Name, ' ', Last_Name) AS Full_Name
FROM Student_Functions;

-- Q15. SUBSTRING()
SELECT Name, SUBSTRING(Name, 1, 5) AS First_Five_Characters
FROM Student_Functions;

-- D. CONVERSION FUNCTIONS

-- Q16. Convert a number into a string
SELECT CAST(12345 AS CHAR) AS Number_As_String;

-- Q17. Convert a string into a number
SELECT CAST('456.78' AS DECIMAL(10,2)) AS String_As_Number;

-- Q18. Convert a date to a different format
SELECT DATE_FORMAT('2026-10-11', '%d-%m-%Y') AS Formatted_Date;

-- Q19. Demonstrate CAST()
SELECT CAST('2026-10-11' AS DATE) AS Converted_Date,
       CAST(99.75 AS SIGNED) AS Converted_Integer;

-- Q20. Demonstrate CONVERT() in MySQL
SELECT CONVERT('123.45', DECIMAL(10,2)) AS Converted_Number;

-- E. DATE FUNCTIONS

-- Q21. Current date
SELECT CURDATE() AS Current_Date;

-- Q22. Extract year, month and day
SELECT YEAR(Joining_Date) AS Joining_Year,
       MONTH(Joining_Date) AS Joining_Month,
       DAY(Joining_Date) AS Joining_Day
FROM Employee_Functions;

-- Q23. Difference between two dates
SELECT DATEDIFF('2026-10-11', '2026-01-01') AS Difference_In_Days;

-- Q24. Add days to a date
SELECT DATE_ADD('2026-10-11', INTERVAL 10 DAY) AS Date_After_10_Days;

-- Q25. Display joining dates in required format
SELECT Emp_Name, Joining_Date,
       DATE_FORMAT(Joining_Date, '%d-%m-%Y') AS Formatted_Joining_Date
FROM Employee_Functions;
