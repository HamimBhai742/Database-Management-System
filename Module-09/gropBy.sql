-- Active: 1747447723202@@127.0.0.1@5432@my_db

SELECT * FROM students;

SELECT age FROM students GROUP BY age HAVING age >22;

SELECT age,count(*) FROM students GROUP BY age ;

--last lgin
SELECT extract(year from last_login) as last_login_year, count(*) FROM students GROUP BY last_login_year;