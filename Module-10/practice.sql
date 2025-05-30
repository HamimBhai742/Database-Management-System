-- Active: 1747447723202@@127.0.0.1@5432@my_db2

create table students(
  id serial PRIMARY KEY,
  name varchar(100) ,
  age int ,
  score INT  ,
  department_id int REFERENCES departments(id)
);

create table departments(
  id serial PRIMARY KEY,
  name char(4)
);

create table course_enrollments(
  id serial PRIMARY KEY,
  student_id int REFERENCES students(id),
  course_title varchar(100) NOT NULL,
  enrollment_date date
);
insert into departments (name) values

('CSE'),
('EEE'),
('ME'),
('CE'),
('CHE'),
('CHE'),
('CE'),
('ME'),
('EEE'),
('CSE'),
('CSE'),
('EEE'),
('CHE'),
('CE'),
('ME'),
('CSE'),
('CHE'),
('CE'),
('EEE'),
('CSE'),
('CHE'),
('CE'),
('ME'),
('CSE'),
('CHE'),
('CE'),
('EEE'),
('CSE'),
('CHE'),
('CE'),
('ENG'),
('ME');
insert into students (name, age, score, department_id) values
('John Doe', 20, 85, 1),
('Jane Smith', 22, 90, 2),
('Alice Johnson', 19, 78, 3),
('Bob Brown', 21, 88, 4),
('Charlie Davis', 23, 92, 5),
('David Wilson', 20, 80, 6),
('Eva Green', 22, 95, 7),
('Frank White', 19, 75, 8),
('Grace Lee', 21, 89, 9),
('Hannah Kim', 23, 91, 10),
('Ian Brown', 20, 84, 1),
('Jack Black', 22, 87, 6),
('Kathy Green', 19, 79, 3),
('Liam White', 21, 86, 5),
('Mia Davis', 23, 93, 5),
('Noah Johnson', 20, 82, 6),
('Olivia Smith', 22, 94, 7),
('Paul Wilson', 19, 76, 8),
('Quinn Brown', 21, 90, 10),
('Riley Lee', 23, 96, 10)
,('Sophia Kim', 20, 81, 1),
('Thomas Green', 22, 88, 2),
('Uma White', 19, 77, 2),
('Violet Davis', 21, 85, 4),
('William Johnson', 23, 97, 5),
('Xander Smith', 20, 83, 6),
('Yara Brown', 22, 89, 7),
('Zoe Lee', 19, 74, 8)
;
insert into course_enrollments (student_id, course_title, enrollment_date) values
(1, 'Database Systems', '2023-01-15'),
(2, 'Data Structures', '2023-02-20'),
(3, 'Operating Systems', '2023-03-10'),
(4, 'Computer Networks', '2023-04-05'),
(5, 'Software Engineering', '2023-05-12'),
(6, 'Web Development', '2023-06-18'),
(7, 'Machine Learning', '2023-07-25'),
(8, 'Artificial Intelligence', '2023-08-30'),
(9, 'Cybersecurity', '2023-09-15'),
(10, 'Cloud Computing', '2023-10-20'),
(1, 'Database Systems', '2023-01-15'),
(2, 'Data Structures', '2023-02-20'),
(3, 'Operating Systems', '2023-03-10'),
(4, 'Computer Networks', '2023-04-05'),
(5, 'Software Engineering', '2023-05-12'),
(6, 'Web Development', '2023-06-18'),
(7, 'Machine Learning', '2023-07-25'),
(8, 'Artificial Intelligence', '2023-08-30'),
(9, 'Cybersecurity', NULL),
(10, 'Cloud Computing', '2023-10-20'),
(1, 'Database Systems', '2023-01-15'),
(2, 'Data Structures', NULL),
(3, 'Operating Systems', '2023-03-10'),
(4, 'Computer Networks', '2023-04-05'),
(5, 'Software Engineering', '2023-05-12'),
(6, 'Web Development', NULL),
(7, 'Machine Learning', '2023-07-25'),
(8, 'Artificial Intelligence', '2023-08-30'),
(9, 'Cybersecurity', NULL),
(10, 'Cloud Computing', NULL);

--Retrieve all students who scored higher than the average score
select * from students;
select * from students where score>(select round(avg(score)) from students
);

--Find students whose age is greater than the average age of all students.

select * from students where age > (
select round(avg(age)) from students);

--Get names of students who are enrolled in any course (use IN with subquery).

select name from students s WHERE s.id IN (select student_id from course_enrollments
);

--Retrieve departments with at least one student scoring above 90 (use EXISTS).

SELECT * FROM departments d WHERE EXISTS (
  SELECT 1 FROM students s WHERE s.department_id = d.id AND s.score > 90
);

--Create a view to show each student’s name, department, and score.

create view students_view
as
SELECT name,department_id,score FROM students;

SELECT * FROM students_view;

--Create a view that lists all students enrolled in any course with the enrollment date.

create view enrolled_students_view_1
as
SELECT name, course_title,enrollment_date
FROM students
JOIN course_enrollments  USING(id) WHERE enrollment_date is NOT NULL;
SELECT * FROM enrolled_students_view_1;

--Create a function that takes a student's score and returns a grade (e.g., A, B, C, F).
create or replace function get_grade(p_score INT)
returns varchar(2)
LANGUAGE plpgsql
as
$$
BEGIN
  IF p_score >= 90 THEN
    RETURN 'A';
  ELSIF p_score >= 80 THEN
    RETURN 'B';
  ELSIF p_score >= 70 THEN
    RETURN 'C';
  ELSE
    RETURN 'F';
  END IF;
END;
$$

SELECT get_grade(55);

--Create a function that returns the full name and department of a student by ID

create or REPLACE Function getStudentInfo(p_id int)
RETURNS TABLE
(
  name varchar(100),
  department_id INT
)
LANGUAGE plpgsql
AS
$$
BEGIN
RETURN QUERY
SELECT s.name,s.department_id from students s WHERE s.id = p_id;
END
$$
SELECT * from  getStudentInfo(7);


--Write a stored procedure to update a student's department.
CREATE OR REPLACE PROCEDURE update_student_department(p_id INT, p_department_id INT)
LANGUAGE plpgsql
AS
$$
BEGIN
UPDATE students
SET department_id=p_department_id WHERE id = p_id;
END
$$

CALL update_student_department(1, 2);

SELECT * FROM students;


--Write a procedure to delete students who haven't enrolled in any course.

create or replace procedure delete_students_without_enrollment()
LANGUAGE plpgsql
AS
$$
BEGIN
DELETE FROM students
WHERE id NOT IN (SELECT DISTINCT student_id FROM course_enrollments);
END
$$

CALL delete_students_without_enrollment();
SELECT * FROM students;
SELECT * FROM course_enrollments;

--update course_enrollments set enrollment_date = NULL where student_id = 1;

CREATE OR REPLACE PROCEDURE update_course_enrollment(p_id INT, p_student_id INT)
LANGUAGE plpgsql
AS
$$
BEGIN
UPDATE course_enrollments
SET student_id=p_student_id WHERE id = p_id;
END
$$


--create table for enrollment logs
CREATE Table logs_enrollment
(
  course_title varchar(100) NOT NULL,
  created_at timestamp DEFAULT now()
);
--Create a trigger that automatically logs enrollment when a student is added to course_enrollments.
CREATE OR REPLACE FUNCTION log_enrollment()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN
  INSERT INTO logs_enrollment ( course_title, created_at)
  VALUES (NEW.course_title,now());
  RETURN NEW;
END;
$$

CREATE TRIGGER enrollment_trigger
AFTER INSERT ON course_enrollments
FOR EACH ROW
EXECUTE FUNCTION log_enrollment();
--Insert a new student and trigger the enrollment log.
INSERT INTO course_enrollments (student_id, course_title, enrollment_date)
VALUES (1, 'Database Systems', '2023-01-15');

SELECT * FROM logs_enrollment;

--Add a trigger that sets the score to 0 if a new student record is added without a score.

CREATE OR REPLACE FUNCTION set_default_score()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN
  IF NEW.score IS NULL THEN
    NEW.score := 0;
  END IF;
  RETURN NEW;
END;
$$

--create tigger
CREATE or REPLACE TRIGGER set_score_trigger
BEFORE INSERT ON students
FOR EACH ROW
EXECUTE FUNCTION set_default_score();
--Insert a new student without a score to test the trigger.

INSERT INTO students (name, age, department_id, score)
VALUES ('Test Student 3', 21, 1,46);

--Add an index to the score column in the students table.

CREATE INDEX idx_student_score
ON students(score);


EXPLAIN ANALYSE
SELECT score FROM students ;

--Add a composite index on student_id and enrolled_on in the course_enrollments table.

CREATE INDEX idx_student_enrollment
ON course_enrollments(student_id, enrollment_date);

--Compare query performance with and without indexes using EXPLAIN.



EXPLAIN ANALYSE
SELECT student_id, enrollment_date FROM course_enrollments;