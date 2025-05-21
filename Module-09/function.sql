-- Active: 1747447723202@@127.0.0.1@5432@my_db

 SELECT * FROM employees;

 create function avg_salary_emp()
 RETURNS INT
 LANGUAGE SQL
 as
 $$
SELECT avg(salary) from employees;
 $$

 SELECT avg_salary_emp();

  create function delete_emp()
 RETURNS void
 LANGUAGE SQL
 as
 $$
DELETE FROM employees WHERE employee_id=30;
 $$

  SELECT delete_emp();

   create function delete_emp_by_id(p_emp_id INT)
 RETURNS void
 LANGUAGE SQL
 as
 $$
DELETE from employees WHERE employee_id=p_emp_id;
 $$

 SELECT delete_emp_by_id(29);