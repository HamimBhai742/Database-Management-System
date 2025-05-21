-- Active: 1747447723202@@127.0.0.1@5432@my_db
SELECT max(salary) FROM employees INNER JOIN departments USING(department_id) WHERE department_name = 'HR';

SELECT * FROM employees WHERE salary>(SELECT max(salary) FROM employees INNER JOIN departments USING(department_id) WHERE department_name = 'HR');