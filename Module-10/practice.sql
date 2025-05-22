-- Active: 1747447723202@@127.0.0.1@5432@my_db2

create table students(
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  age int NOT NULL,
  score INT NOT NULL ,
  department_id int REFERENCES departments(id)
);

create table departments(
  id serial PRIMARY KEY,
  name char(4) NOT NULL
);

create table course_enrollments(
  id serial PRIMARY KEY,
  student_id int REFERENCES students(id),
  course_title varchar(100) NOT NULL,
  enrollment_date date NOT NULL
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