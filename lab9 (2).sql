DELIMITER //

-- [A] Basic Procedure (Read operation)
CREATE PROCEDURE GetAllStudents()
BEGIN
    SELECT S.student_id, S.student_name, S.marks, D.dept_name 
    FROM STUDENT S
    LEFT JOIN DEPARTMENT D ON S.dept_id = D.dept_id;
END //

-- [B] Procedure for INSERT (Create operation)
CREATE PROCEDURE InsertStudent(
    IN p_id INT, 
    IN p_name VARCHAR(50), 
    IN p_marks INT, 
    IN p_dept INT
)
BEGIN
    INSERT INTO STUDENT (student_id, student_name, marks, dept_id) 
    VALUES (p_id, p_name, p_marks, p_dept);
END //

-- [C] Procedure for UPDATE (Update operation)
CREATE PROCEDURE UpdateStudentMarks(
    IN p_id INT, 
    IN p_new_marks INT
)
BEGIN
    UPDATE STUDENT 
    SET marks = p_new_marks 
    WHERE student_id = p_id;
END //

-- [D] Procedure for DELETE (Delete operation)
CREATE PROCEDURE DeleteStudent(
    IN p_id INT    
)
BEGIN
    DELETE FROM STUDENT 
    WHERE student_id = p_id;
END //

DELIMITER ;
