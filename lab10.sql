-- Create the audit log table first to support the log triggers
DROP TABLE IF EXISTS STUDENT_LOG;
CREATE TABLE STUDENT_LOG (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    action_performed VARCHAR(50),
    old_marks INT,
    new_marks INT,
    action_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

-- [A] BEFORE INSERT: Check if input marks fall outside acceptable ranges (0-100)
CREATE TRIGGER Before_Student_Insert
BEFORE INSERT ON STUDENT
FOR EACH ROW
BEGIN
    IF NEW.marks < 0 OR NEW.marks > 100 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Validation Error: Score entries must stay within 0 to 100 bounds.';
    END IF;
END //

-- [B] AFTER INSERT: Add a new entry to the logging archive
CREATE TRIGGER After_Student_Insert
AFTER INSERT ON STUDENT
FOR EACH ROW
BEGIN
    INSERT INTO STUDENT_LOG (student_id, action_performed, old_marks, new_marks)
    VALUES (NEW.student_id, 'INSERT RECORD', NULL, NEW.marks);
END //

-- [C] BEFORE UPDATE: Blocks modifications moving data beyond bounds
CREATE TRIGGER Before_Student_Update
BEFORE UPDATE ON STUDENT
FOR EACH ROW
BEGIN
    IF NEW.marks < 0 OR NEW.marks > 100 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Validation Error: Altered marks must stay within 0 to 100 bounds.';
    END IF;
END //

-- [D] AFTER UPDATE: Logs historical records tracking performance score variations
CREATE TRIGGER After_Student_Update
AFTER UPDATE ON STUDENT
FOR EACH ROW
BEGIN
    INSERT INTO STUDENT_LOG (student_id, action_performed, old_marks, new_marks)
    VALUES (OLD.student_id, 'UPDATE RECORD', OLD.marks, NEW.marks);
END //

-- [E] BEFORE DELETE: Blocks clearing out elite scores (> 95)
CREATE TRIGGER Before_Student_Delete
BEFORE DELETE ON STUDENT
FOR EACH ROW
BEGIN
    IF OLD.marks > 95 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Validation Error: Administrative protection blocks deleting elite student scores.';
    END IF;
END //

-- [F] AFTER DELETE: Tracks system deletion items in log table
CREATE TRIGGER After_Student_Delete
AFTER DELETE ON STUDENT
FOR EACH ROW
BEGIN
    INSERT INTO STUDENT_LOG (student_id, action_performed, old_marks, new_marks)
    VALUES (OLD.student_id, 'DELETE RECORD', OLD.marks, NULL);
END //

DELIMITER ;
