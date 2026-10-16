-- =========================================================================
-- PRE-REQUISITE: Populate Reference Rows (Parent Table)
-- =========================================================================
INSERT INTO DEPARTMENT VALUES (1, 'CSE'); 
INSERT INTO DEPARTMENT VALUES (2, 'BBA');
INSERT INTO DEPARTMENT VALUES (3, 'BCom');

-- =========================================================================
-- TASK 1: INSERT COMMAND
-- =========================================================================
-- Populate the STUDENT table matching the database snapshot
INSERT INTO STUDENT (student_id, student_name, marks, dept_id, email) VALUES 
(101, 'Anu', 85, 1, 'anu@univ.edu'),
(102, 'Ravi', 70, 2, 'ravi@univ.edu'),
(103, 'Priya', 90, 1, 'priya@univ.edu'),
(104, 'Kiran', 60, NULL, 'kiran@univ.edu');

-- View table status post-insertion
SELECT student_id, student_name, marks, dept_id FROM STUDENT;

-- =========================================================================
-- TASK 2: UPDATE COMMAND
-- =========================================================================
-- Modify Ravi's marks by boosting them by 5 points
UPDATE STUDENT 
SET marks = marks + 5 
WHERE student_id = 102;

-- Assign Kiran to the 'BCom' department (dept_id = 3)
UPDATE STUDENT 
SET dept_id = 3 
WHERE student_name = 'Kiran';

-- View table status post-update operations
SELECT student_id, student_name, marks, dept_id FROM STUDENT;

-- =========================================================================
-- TASK 3: DELETE COMMAND
-- =========================================================================
-- Remove a specific record based on a key condition
DELETE FROM STUDENT 
WHERE student_id = 104;

-- View final dataset after row exclusion
SELECT student_id, student_name, marks, dept_id FROM STUDENT;
