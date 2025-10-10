
IF OBJECT_ID('student') IS NULL
BEGIN
    CREATE TABLE student(
        id INT NOT NULL,
        name NVARCHAR(100) NOT NULL,
        sname NVARCHAR(MAX) NULL
    );
END

SELECT * FROM student;

INSERT INTO student
VALUES
    (5, 'Aziz', NULL)
