-- Active: 1747447723202@@127.0.0.1@5432@my_db2

create table students(
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  age int NOT NULL,
  score INT NOT NULL ,
  department_id int REFERENCES departments(id),
)

crea