-- DBMS LAB SHEET 5: SQL JOINS

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

CREATE TABLE IF NOT EXISTS Join_Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Join_Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Dept_ID INT
);
CREATE TABLE IF NOT EXISTS Join_Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Dept_ID INT NULL,
    Course_ID INT NULL
);
CREATE TABLE IF NOT EXISTS Join_Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department_ID INT NULL,
    Manager_ID INT NULL,
    Salary DECIMAL(10,2)
);

-- Sample data. If you rerun the script, duplicate primary-key errors may occur.
INSERT INTO Join_Department VALUES
(1, 'CSE', 'Roorkee'),
(2, 'IT', 'Delhi'),
(3, 'AI ML', 'Dehradun'),
(4, 'Mechanical', 'Haridwar');

INSERT INTO Join_Course VALUES
(101, 'Computer Science', 1),
(102, 'Information Technology', 2),
(103, 'Artificial Intelligence', 3),
(104, 'Data Science', 3);

INSERT INTO Join_Student VALUES
(1, 'Rahul', 1, 101),
(2, 'Priya', 3, 103),
(3, 'Aman', 1, 101),
(4, 'Neha', 2, 102),
(5, 'Karan', NULL, NULL);

INSERT INTO Join_Employee VALUES
(201, 'Amit', 1, NULL, 70000),
(202, 'Neha', 1, 201, 50000),
(203, 'Rohan', 2, 201, 60000),
(204, 'Priya', 3, 202, 45000);

-- Q1. INNER JOIN between Student and Department
SELECT s.Student_Name, d.Dept_Name
FROM Join_Student s
INNER JOIN Join_Department d ON s.Dept_ID = d.Dept_ID;

-- Q2. Student names with department names
SELECT s.Student_Name, d.Dept_Name
FROM Join_Student s
INNER JOIN Join_Department d ON s.Dept_ID = d.Dept_ID;

-- Q3. Employee names with department names
SELECT e.Emp_Name, d.Dept_Name
FROM Join_Employee e
INNER JOIN Join_Department d ON e.Department_ID = d.Dept_ID;

-- Q4. Students with course details
SELECT s.Student_Name, c.Course_Name
FROM Join_Student s
INNER JOIN Join_Course c ON s.Course_ID = c.Course_ID;

-- Q5. Students in a particular department (CSE)
SELECT s.Student_Name, d.Dept_Name
FROM Join_Student s
INNER JOIN Join_Department d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_Name = 'CSE';

-- Q6. LEFT OUTER JOIN
SELECT s.Student_Name, d.Dept_Name
FROM Join_Student s
LEFT JOIN Join_Department d ON s.Dept_ID = d.Dept_ID;

-- Q7. All students, including those without a matching department
SELECT s.Student_Name, d.Dept_Name
FROM Join_Student s
LEFT JOIN Join_Department d ON s.Dept_ID = d.Dept_ID;

-- Q8. RIGHT OUTER JOIN
SELECT s.Student_Name, d.Dept_Name
FROM Join_Student s
RIGHT JOIN Join_Department d ON s.Dept_ID = d.Dept_ID;

-- Q9. All departments, including departments with no students
SELECT d.Dept_Name, s.Student_Name
FROM Join_Department d
LEFT JOIN Join_Student s ON d.Dept_ID = s.Dept_ID;

-- Q10. Students not assigned to any department
SELECT s.Student_ID, s.Student_Name
FROM Join_Student s
LEFT JOIN Join_Department d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_ID IS NULL;

-- Q11. Departments having no students
SELECT d.Dept_ID, d.Dept_Name
FROM Join_Department d
LEFT JOIN Join_Student s ON d.Dept_ID = s.Dept_ID
WHERE s.Student_ID IS NULL;

-- Q12. FULL OUTER JOIN workaround in MySQL (LEFT JOIN + unmatched RIGHT-side rows)
SELECT s.Student_Name, d.Dept_Name
FROM Join_Student s
LEFT JOIN Join_Department d ON s.Dept_ID = d.Dept_ID
UNION
SELECT s.Student_Name, d.Dept_Name
FROM Join_Student s
RIGHT JOIN Join_Department d ON s.Dept_ID = d.Dept_ID;

-- Q13. CROSS JOIN between Student and Course
SELECT s.Student_Name, c.Course_Name
FROM Join_Student s
CROSS JOIN Join_Course c;

-- Q14. Number of possible Student-Course combinations
SELECT COUNT(*) AS Possible_Combinations
FROM Join_Student
CROSS JOIN Join_Course;

-- Q15. NATURAL JOIN between two suitable tables (shared column: Dept_ID)
SELECT Student_Name, Dept_Name
FROM Join_Student
NATURAL JOIN Join_Department;

-- Q16. Compare NATURAL JOIN and INNER JOIN
SELECT Student_Name, Dept_Name
FROM Join_Student
NATURAL JOIN Join_Department;

SELECT s.Student_Name, d.Dept_Name
FROM Join_Student s
INNER JOIN Join_Department d ON s.Dept_ID = d.Dept_ID;

-- Q17. SELF JOIN on Employee to show employee-manager relationships
SELECT e.Emp_Name AS Employee, m.Emp_Name AS Manager
FROM Join_Employee e
LEFT JOIN Join_Employee m ON e.Manager_ID = m.Emp_ID;

-- Q18. Employees along with their managers
SELECT e.Emp_Name AS Employee_Name, m.Emp_Name AS Manager_Name
FROM Join_Employee e
LEFT JOIN Join_Employee m ON e.Manager_ID = m.Emp_ID;

-- Q19. Join three tables: Student, Department and Course
SELECT s.Student_Name, d.Dept_Name, c.Course_Name
FROM Join_Student s
LEFT JOIN Join_Department d ON s.Dept_ID = d.Dept_ID
LEFT JOIN Join_Course c ON s.Course_ID = c.Course_ID;

-- Q20. Student name, course name and department name
SELECT s.Student_Name, c.Course_Name, d.Dept_Name
FROM Join_Student s
LEFT JOIN Join_Course c ON s.Course_ID = c.Course_ID
LEFT JOIN Join_Department d ON s.Dept_ID = d.Dept_ID;

-- Q21. Employees whose salary is greater than their department average
SELECT e.Emp_Name, d.Dept_Name, e.Salary
FROM Join_Employee e
JOIN Join_Department d ON e.Department_ID = d.Dept_ID
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Join_Employee e2
    WHERE e2.Department_ID = e.Department_ID
);

-- Q22. Department having the maximum number of students
SELECT d.Dept_ID, d.Dept_Name, COUNT(s.Student_ID) AS Student_Count
FROM Join_Department d
LEFT JOIN Join_Student s ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name
HAVING COUNT(s.Student_ID) = (
    SELECT MAX(student_counts.student_count)
    FROM (
        SELECT COUNT(s2.Student_ID) AS student_count
        FROM Join_Department d2
        LEFT JOIN Join_Student s2 ON d2.Dept_ID = s2.Dept_ID
        GROUP BY d2.Dept_ID
    ) AS student_counts
);

-- Q23. Departments and total number of students in each
SELECT d.Dept_Name, COUNT(s.Student_ID) AS Total_Students
FROM Join_Department d
LEFT JOIN Join_Student s ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name;

-- Q24. Courses and number of students enrolled in each course
SELECT c.Course_Name, COUNT(s.Student_ID) AS Enrolled_Students
FROM Join_Course c
LEFT JOIN Join_Student s ON c.Course_ID = s.Course_ID
GROUP BY c.Course_ID, c.Course_Name;

-- Q25. Student-department-course report using joins, GROUP BY and aggregates
SELECT d.Dept_Name, c.Course_Name,
       COUNT(s.Student_ID) AS Total_Students
FROM Join_Department d
LEFT JOIN Join_Course c ON d.Dept_ID = c.Dept_ID
LEFT JOIN Join_Student s ON c.Course_ID = s.Course_ID
GROUP BY d.Dept_ID, d.Dept_Name, c.Course_ID, c.Course_Name
ORDER BY d.Dept_Name, c.Course_Name;
