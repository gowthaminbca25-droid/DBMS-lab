-- =========================================================================
-- TASK 1: CREATE TABLE
-- =========================================================================
-- Create the DEPARTMENT reference schema
CREATE TABLE DEPARTMENT (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Create the STUDENT schema with a Foreign Key mapping
CREATE TABLE STUDENT (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    marks INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id)
);

-- =========================================================================
-- TASK 2: ALTER TABLE
-- =========================================================================
-- Add a new column to store student email addresses
ALTER TABLE STUDENT 
ADD COLUMN email VARCHAR(100);

-- Modify an existing column constraint to increase character length
ALTER TABLE DEPARTMENT 
MODIFY COLUMN dept_name VARCHAR(100) NOT NULL;

-- View the updated table descriptions to verify structure shifts
DESCRIBE STUDENT;
DESCRIBE DEPARTMENT;

-- =========================================================================
-- TASK 3: DROP TABLE
-- =========================================================================
-- Create a temporary table to demonstrate drop mechanics
CREATE TABLE TEMP_DATA (
    temp_id INT PRIMARY KEY,
    notes TEXT
);

-- Drop the temporary table completely from the database instance
DROP TABLE TEMP_DATA;
