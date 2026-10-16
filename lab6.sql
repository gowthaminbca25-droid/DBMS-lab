-- [A] SPECIAL OPERATORS (BETWEEN, IN, LIKE, IS NULL)
-- Pattern matching, set containment evaluation, and checking for missing data values

-- BETWEEN: Matches ranges inclusively
SELECT * FROM STUDENT WHERE marks BETWEEN 70 AND 90;

-- IN: Checks membership within a discrete list of options
SELECT * FROM STUDENT WHERE dept_id IN (1, 2);

-- LIKE: Pattern matching using wildcards (% matches any sequence of characters)
SELECT * FROM STUDENT WHERE student_name LIKE 'A%';

-- IS NULL / IS NOT NULL: Handles missing field values correctly
SELECT * FROM STUDENT WHERE dept_id IS NULL;


-- [B] SET OPERATIONS (UNION)
-- Combines the results of two SELECT queries into a single result set (removes duplicates)
SELECT student_name, 'High Performer' AS performance_tier 
FROM STUDENT 
WHERE marks >= 80

UNION

SELECT student_name, 'Needs Improvement' AS performance_tier 
FROM STUDENT 
WHERE marks < 80;
