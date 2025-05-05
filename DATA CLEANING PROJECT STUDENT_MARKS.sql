CREATE DATABASE students_marks;

USE students_marks;

SELECT *
FROM students_marks;

CREATE TABLE students_marks_staging
LIKE students_marks;

INSERT INTO students_marks_staging
SELECT *
FROM students_marks;

SELECT *
FROM students_marks_staging;

ALTER TABLE students_marks_staging
DROP COLUMN Email,
DROP COLUMN Midterm_score,
DROP COLUMN Final_score,
DROP COLUMN Assignments_Avg, 
DROP COLUMN Quizzes_Avg, 
DROP COLUMN Participation_Score, 
DROP COLUMN Projects_Score, 
DROP COLUMN Internet_Access_at_Home;

ALTER TABLE students_marks_staging
ADD COLUMN `Name` text;

SET SQL_SAFE_UPDATES=0;

UPDATE students_marks_staging
SET `Name` = concat(First_Name, " ", Last_Name);

SELECT *
FROM students_marks_staging;

ALTER TABLE students_marks_staging
DROP COLUMN First_Name,
DROP COLUMN Last_Name;

ALTER TABLE students_marks_staging 
ADD COLUMN Attendance TEXT,
ADD COLUMN Score TEXT,
ADD COLUMN Study_Hour_Range TEXT,
ADD COLUMN Stress_Level TEXT,
ADD COLUMN Sleep_Hours TEXT
;

UPDATE students_marks_staging
SET Score =
CASE 
    WHEN Total_Score <= 60 THEN '50-60'
    WHEN Total_Score <= 70 THEN '60-70'
    WHEN Total_Score <= 80 THEN '70-80'
    WHEN Total_Score <= 90 THEN '80-90'
    WHEN Total_Score <= 100 THEN '90-100'
    END
;


UPDATE students_marks_staging
SET Attendance =
CASE
    WHEN `Attendance (%)`<= 60 THEN '50-60'
    WHEN`Attendance (%)`<= 70 THEN '60-70'
    WHEN`Attendance (%)`<= 80 THEN '70-80'
    WHEN`Attendance (%)`<= 90 THEN '80-90'
    WHEN`Attendance (%)`<= 100 THEN '90-100'
    END
;

UPDATE students_marks_staging
SET Stress_Level = 
CASE
    WHEN `Stress_Level (1-10)` <=5 THEN '0-5'
    WHEN `Stress_Level (1-10)` <=10 THEN '5-10'
    END
;
SELECT * 
FROM students_marks_staging;

ALTER TABLE students_marks_staging
ADD COLUMN`Extracurricular`TEXT,
ADD COLUMN`Parent_education`TEXT,
ADD COLUMN `Family_Income` TEXT;


ALTER TABLE students_marks_staging
DROP COLUMN`Attendance (%)`,
DROP COLUMN `Stress_Level (1-10)`;

UPDATE students_marks_staging
SET Extracurricular = Extracurricular_Activities,
 Parent_education = Parent_Education_Level,
 Family_Income = Family_Income_Level;
 
 ALTER TABLE students_marks_staging
 DROP COLUMN Extracurricular_Activities,
 DROP COLUMN Parent_Education_Level,
 DROP COLUMN Family_Income_Level;
 
 SELECT * FROM 
 students_marks_staging;