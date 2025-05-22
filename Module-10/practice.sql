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
