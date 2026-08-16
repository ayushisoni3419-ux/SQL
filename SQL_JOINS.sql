-- SQL JOINs
-- Topics:
-- INNER JOIN
-- LEFT JOIN


-- ==========================================
-- 1. CREATE TABLES
-- ==========================================

CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    department_id INT,
    marks INT
);

CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(50)
);


-- ==========================================
-- 2. INSERT DATA
-- ==========================================

INSERT INTO students VALUES
(1, 'Ayushi', 101, 85),
(2, 'Rahul', 102, 72),
(3, 'Priya', 101, 91),
(4, 'Aman', 103, 68),
(5, 'Neha', 101, 78);

INSERT INTO departments VALUES
(101, 'CSE'),
(102, 'IT'),
(103, 'ECE'),
(104, 'ME');


-- ==========================================
-- 3. VIEW TABLES
-- ==========================================

SELECT * FROM students;

SELECT * FROM departments;


-- ==========================================
-- 4. INNER JOIN
-- Only matching rows from both tables
-- ==========================================

SELECT
    s.name,
    d.department_name
FROM students s
INNER JOIN departments d
ON s.department_id = d.department_id;


-- ==========================================
-- 5. LEFT JOIN
-- All students + matching department
-- ==========================================

SELECT
    s.name,
    d.department_name
FROM students s
LEFT JOIN departments d
ON s.department_id = d.department_id;


-- ==========================================
-- 6. INNER JOIN + WHERE
-- Students belonging to CSE
-- ==========================================

SELECT
    s.name,
    d.department_name
FROM students s
INNER JOIN departments d
ON s.department_id = d.department_id
WHERE d.department_name = 'CSE';


-- ==========================================
-- 7. LEFT JOIN
-- All students with marks and department
-- ==========================================

SELECT
    s.name,
    s.marks,
    d.department_name
FROM students s
LEFT JOIN departments d
ON s.department_id = d.department_id;


-- ==========================================
-- 8. LEFT JOIN + GROUP BY
-- Number of students in each department
-- Includes departments with zero students
-- ==========================================

SELECT
    d.department_name,
    COUNT(s.id) AS number_of_students
FROM departments d
LEFT JOIN students s
ON d.department_id = s.department_id
GROUP BY d.department_name;


-- ==========================================
-- 9. INNER JOIN + GROUP BY
-- Average marks in each department
-- ==========================================

SELECT
    d.department_name,
    AVG(s.marks) AS average_marks
FROM students s
INNER JOIN departments d
ON s.department_id = d.department_id
GROUP BY d.department_name;


-- ==========================================
-- 10. LEFT JOIN + GROUP BY + HAVING
-- Departments having more than 1 student
-- ==========================================

SELECT
    d.department_name,
    COUNT(s.id) AS number_of_students
FROM departments d
LEFT JOIN students s
ON d.department_id = s.department_id
GROUP BY d.department_name
HAVING COUNT(s.id) > 1;