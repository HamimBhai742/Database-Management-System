-- Active: 1747447723202@@127.0.0.1@5432@my_db

SELECT * from employees;

create view hire_year_emp
 as
  select extract(year from hire_date::date) from employees;

  SELECT * from hire_year_emp;