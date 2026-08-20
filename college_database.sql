
-- 1. CREATE TABLES

CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    department_name TEXT NOT NULL
);
CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT NOT NULL,
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    department_id INTEGER,
    cgpa REAL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 2. INSERT DEPARTMENTS

INSERT INTO departments (department_id, department_name)
VALUES
(1, 'Computer Science'),
(2, 'Information Science'),
(3, 'Electronics'),
(4, 'Mechanical');


-- 3. INSERT COURSES

INSERT INTO courses (course_id, course_name, department_id)
VALUES
(101, 'Database Management Systems', 1),
(102, 'Data Structures', 1),
(103, 'Web Development', 2),
(104, 'Computer Networks', 2),
(105, 'Digital Electronics', 3),
(106, 'Thermodynamics', 4);

-- 4. INSERT 10 STUDENTS

INSERT INTO students (id, name, age, department_id, cgpa)
VALUES
(1, 'Rahul', 19, 1, 8.7),
(2, 'Priya', 20, 2, 9.1),
(3, 'Arjun', 19, 1, 7.8),
(4, 'Sneha', 20, 3, 8.5),
(5, 'Rohan', 19, 2, 8.2),
(6, 'Ananya', 21, 1, 9.3),
(7, 'Vikram', 20, 4, 7.5),
(8, 'Neha', 19, 3, 8.9),
(9, 'Karan', 20, 2, 7.9),
(10, 'Isha', 19, 1, 8.4);

-- 5. BASIC QUERIES
-- Retrieve all columns for all students
SELECT * FROM students;
-- Retrieve only student names and CGPAs
SELECT name, cgpa FROM students;
-- Students with CGPA greater than 8.0
SELECT * FROM students
WHERE cgpa > 8.0;

-- 6. AGGREGATE FUNCTIONS
-- Total number of students
SELECT COUNT(*) AS total_students
FROM students;

-- Average CGPA
SELECT AVG(cgpa) AS average_cgpa
FROM students;

-- Highest CGPA
SELECT MAX(cgpa) AS highest_cgpa
FROM students;

-- Lowest CGPA
SELECT MIN(cgpa) AS lowest_cgpa
FROM students;

-- Sum of all CGPAs
SELECT SUM(cgpa) AS total_cgpa
FROM students;

-- 7. GROUP BY QUERIES
-- Count students in each department
SELECT d.department_name, COUNT(s.id) AS student_count
FROM departments d
LEFT JOIN students s
ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name;

-- Average CGPA by department
SELECT d.department_name, AVG(s.cgpa) AS average_cgpa
FROM departments d
LEFT JOIN students s
ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name;


-- 8. OPTIONAL JOIN QUERY

-- Display students with their department names
SELECT
    s.id,
    s.name,
    s.age,
    d.department_name,
    s.cgpa
FROM students s
JOIN departments d
ON s.department_id = d.department_id;