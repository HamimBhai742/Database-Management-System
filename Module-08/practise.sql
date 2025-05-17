-- Active: 1747447723202@@127.0.0.1@5432@my_db
-- create new table for studnet
CREATE Table students(
  id serial PRIMARY KEY,
  roll INTEGER UNIQUE,
  name VARCHAR(30),
  age INTEGER,
  department CHAR(4),
  score INTEGER,
  status VARCHAR(10),
  last_login date
)

--add new column for students table
ALTER Table students ADD COLUMN email VARCHAR(25);

--rename email column to student_email
ALTER Table students RENAME COLUMN email to student_email;

--add uniqe constraint for student_email
ALTER Table students ADD constraint student_email_uniqe UNIQUE(student_email);

--create a new table for corses
create table corses(
  c_id serial,
  c_price INTEGER,
  c_name VARCHAR(30)
)

--ad primary key for corses table
alter table corses add constraint c_id_primary_key PRIMARY KEY(c_id);

-- drop a column from corses table
alter table corses drop column c_price;

-- insert data into students table
INSERT INTO students(roll,name,age,department,score,status,last_login) VALUES

( 115, 'md rafiqur', 24, 'CSE', NULL, 'passed', '2029-10-01'),
( 116, 'md rafiqur', 25, 'CSE', NULL, 'passed', '2030-10-01'),
( 117, 'md rafiqur', 26, 'CSE', NULL, 'passed', '2031-10-01'),
( 118, 'md rafiqur', 27, 'CSE', NULL, 'passed', '2032-10-01'),
( 119, 'md rafiqur', 28, 'CSE', NULL, 'passed', '2033-10-01'),
( 120, 'md rafiqur', 29, 'CSE', NULL, 'passed', '2034-10-01');

-- find all students
SELECT * FROM students;
-- find all students who have a score greater than 80 and not null
select * from students where score>80 and score is not null;

--Use the NOT operator to exclude students from a specific department.
SELECT * FROM students WHERE NOT department = 'CSE';

--find all  students whose names start with ‘A’ using LIKE and ILIKE.
--like is case sensitive
-- ilike is case insensitive
select * from students WHERE name LIKE 'm%';

--find all students between age 18 and 25;
select * from students WHERE age BETWEEN 18 AND 25;

--using IN for a specific set of roll numbers.
select * from students WHERE roll IN (101, 102, 103) ;

--Count how many students exist in the students table.

select count(*) from students;

--find the average score of students in a specific department

select avg(score)as ce_student_score  from students WHERE department = 'CE';

--get maximum and minimum age of students

select min(age) as min_student_age from students;
select max(age) as max_student_age from students;

--Update the status of students who scored less than 50 to 'failed'.
update students set status = 'failed' WHERE score < 50 OR score IS NULL;
update students set status = 'passed' WHERE score >= 50 AND score IS NOT NULL;
SELECT * FROM students;
--Delete students who have not logged in since last year.
DELETE FROM students WHERE last_login < '2024-01-01';

--Use LIMIT and OFFSET to fetch the second page of results (5 per page).
SELECT * FROM students LIMIT 5 OFFSET 5*2;