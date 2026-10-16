-- [A] GROUP BY: Count number of students in each department
SELECT dept_id, COUNT(student_id) AS total_students
FROM STUDENT
WHERE dept_id IS NOT NULL
GROUP BY dept_id;

-- [B] GROUP BY with HAVING: Find average marks per department, filtering for averages > 75
SELECT dept_id, AVG(marks) AS average_marks
FROM STUDENT
WHERE dept_id IS NOT NULL
GROUP BY dept_id
HAVING AVG(marks) > 75;

-- [C] ORDER BY: Sort all students by marks in descending order (highest first)
SELECT student_id, student_name, marks
FROM STUDENT
ORDER BY marks DESC;

-- [D] Combining GROUP BY, HAVING, and ORDER BY together
SELECT dept_id, AVG(marks) AS average_marks
FROM STUDENT
WHERE dept_id IS NOT NULL
GROUP BY dept_id
HAVING COUNT(student_id) >= 2
ORDER BY average_marks DESC;

