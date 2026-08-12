-- SQL Aggregate Functions
-- Topics:
-- GROUP BY, COUNT(), SUM(), AVG(), MIN(), MAX(), HAVING


-- 1. Create Table
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    branch VARCHAR(20),
    marks INT,
    city VARCHAR(30)
);


-- 2. Insert Data
INSERT INTO students VALUES
(1, 'Ayushi', 'CSE', 85, 'Indore'),
(2, 'Rahul', 'CSE', 72, 'Bhopal'),
(3, 'Priya', 'IT', 91, 'Indore'),
(4, 'Aman', 'ECE', 68, 'Delhi'),
(5, 'Neha', 'CSE', 78, 'Indore'),
(6, 'Rohan', 'IT', 88, 'Bhopal');


-- 3. GROUP BY
-- Display each branch
SELECT branch
FROM students
GROUP BY branch;


-- 4. COUNT()
-- Count total number of students
SELECT COUNT(*) AS total_students
FROM students;


-- Count students in each branch
SELECT branch, COUNT(*) AS student_count
FROM students
GROUP BY branch;


-- 5. SUM()
-- Total marks
SELECT SUM(marks) AS total_marks
FROM students;


-- Total marks in each branch
SELECT branch, SUM(marks) AS total_marks
FROM students
GROUP BY branch;


-- 6. AVG()
-- Average marks
SELECT AVG(marks) AS average_marks
FROM students;


-- Average marks in each branch
SELECT branch, AVG(marks) AS average_marks
FROM students
GROUP BY branch;


-- 7. MIN()
-- Lowest marks
SELECT MIN(marks) AS minimum_marks
FROM students;


-- Lowest marks in each branch
SELECT branch, MIN(marks) AS minimum_marks
FROM students
GROUP BY branch;


-- 8. MAX()
-- Highest marks
SELECT MAX(marks) AS maximum_marks
FROM students;


-- Highest marks in each branch
SELECT branch, MAX(marks) AS maximum_marks
FROM students
GROUP BY branch;


-- 9. HAVING
-- Display branches having more than 1 student
SELECT branch, COUNT(*) AS student_count
FROM students
GROUP BY branch
HAVING COUNT(*) > 1;


-- 10. HAVING with AVG()
-- Display branches having average marks greater than 80
SELECT branch, AVG(marks) AS average_marks
FROM students
GROUP BY branch
HAVING AVG(marks) > 80;


-- 11. WHERE + GROUP BY + HAVING
-- Consider students scoring above 70,
-- group them by branch,
-- and display branches whose average is above 80.
SELECT branch, AVG(marks) AS average_marks
FROM students
WHERE marks > 70
GROUP BY branch
HAVING AVG(marks) > 80;