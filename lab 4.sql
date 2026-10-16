-- [A] CONVERSION FUNCTIONS
-- Convert character data, format numbers to strings, or cast values to explicit types
SELECT 
    student_id,
    student_name,
    CAST(marks AS CHAR) AS marks_as_text,               -- CAST: Changes data type explicitly
    CONVERT(student_id, CHAR) AS id_as_text            -- CONVERT: Alternative type mapping
FROM STUDENT;

-- [B] DATE FUNCTIONS
-- Working with current system timers and generating date intervals
SELECT 
    student_id,
    student_name,
    NOW() AS current_system_time,                      -- NOW: Returns current date & time
    CURDATE() AS current_date_only,                    -- CURDATE: Returns only the date
    YEAR(CURDATE()) AS current_calendar_year,          -- YEAR: Extracts the year numerical part
    DATE_ADD(CURDATE(), INTERVAL 7 DAY) AS deadline   -- DATE_ADD: Calculates future milestone date
FROM STUDENT;
