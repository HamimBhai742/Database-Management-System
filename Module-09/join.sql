-- Active: 1747447723202@@127.0.0.1@5432@my_db
SELECT * FROM users;

SELECT * FROM post;

SELECT title, content, name, email, age from users JOIN post on users.id=post.user_id;

SELECT title, content, name, email, age from post JOIN users on post.user_id=users.id;

SELECT title, content, name, email, age from  users LEFT JOIN post on users.id=post.user_id;

SELECT title, content, name, email, age from  post LEFT JOIN users on post.user_id=users.id;

SELECT title, content, name, email, age from  users RIGHT JOIN post on users.id=post.user_id;


SELECT title, content, name, email, age from  post RIGHT JOIN users on post.user_id=users.id;
