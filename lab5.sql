-- [A] ARITHMETIC OPERATORS (+, -, *, /, %)
-- Modifying numeric fields inline to simulate value distributions
SELECT 
    student_id,
    student_name,
    marks,
    (marks + 5) AS boosted_marks,                      -- Addition
    (marks - 10) AS penalized_marks,                   -- Subtraction
    (marks * 1.10) AS projected_inflated_marks,        -- Multiplication
    (marks / 2) AS scaled_half_marks,                  -- Division
    (marks % 3) AS remainder_marks                     -- Modulo / Remainder
FROM STUDENT;

-- [B] COMPARISON OPERATORS (=, !=, <, >, <=, >=)
-- Filtering entities by matching exact values or boundary limits
SELECT student_id, student_name, marks 
FROM STUDENT 
WHERE marks >= 75;                                      -- Returns rows matching condition

-- [C] LOGICAL OPERATORS (AND, OR, NOT)
-- Combining distinct conditional expressions together
SELECT student_id, student_name, marks, dept_id 
FROM STUDENT 
WHERE (dept_id = 1 AND marks > 80)                     -- Chained intersection constraints
   OR (NOT student_name = 'Ravi');                    -- Logical inversion constraint
