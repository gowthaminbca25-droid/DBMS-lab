-- =========================================================================
-- [A] DROP & CREATE OPERATIONS (Data Definition Language - DDL)
-- =========================================================================

-- Drop the tables if they already exist to start with a clean slate
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS DEPARTMENT;

-- Recreate the DEPARTMENT table structure
CREATE TABLE DEPARTMENT (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Recreate the STUDENT table structure with a foreign key constraint
CREATE TABLE STUDENT (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id)
);


-- =========================================================================
-- [B] INSERT OPERATIONS (Data Manipulation Language - DML)
-- =========================================================================

-- Populate the DEPARTMENT table
INSERT INTO DEPARTMENT VALUES (1, 'CSE'); 
INSERT INTO DEPARTMENT VALUES (2, 'BBA');
INSERT INTO DEPARTMENT VALUES (3, 'BCom');

-- Populate the STUDENT table with active data records
INSERT INTO STUDENT VALUES (101, 'Anu', 85, 1);
INSERT INTO STUDENT VALUES (102, 'Ravi', 70, 2);
INSERT INTO STUDENT VALUES (103, 'Priya', 90, 1);
INSERT INTO STUDENT VALUES (104, 'Kiran', 60, NULL);

-- View initial table state before modifications
SELECT * FROM STUDENT;


-- =========================================================================
-- [C] UPDATE OPERATIONS (Data Manipulation Language - DML)
-- =========================================================================

-- Modify specific rows: Boost Ravi's marks by 5 points
UPDATE STUDENT 
SET marks = marks + 5 
WHERE student_id = 102;

-- Assign Kiran to the BCom department (dept_id = 3)
UPDATE STUDENT 
SET dept_id = 3 
WHERE student_name = 'Kiran';

-- View table state after updates
SELECT * FROM STUDENT;


-- =========================================================================
-- [D] DELETE OPERATIONS (Data Manipulation Language - DML)
-- =========================================================================

-- Remove a specific student record from the table
DELETE FROM STUDENT 
WHERE student_id = 104;

-- View final table state after deletion
SELECT * FROM STUDENT;
