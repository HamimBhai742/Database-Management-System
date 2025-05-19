-- Active: 1747447723202@@127.0.0.1@5432@my_db
create table users(
  id serial PRIMARY KEY,
name VARCHAR(30) NOT NULL,
email VARCHAR(25) UNIQUE NOT NULL,
age INTEGER check(age >= 18));

insert into users(name,email,age) values
('beby','er@gmail.com',28),
('breeby','ewr@gmail.com',23),
('brreby','re@gmail.com',32),
('rerbeby','wr@gmail.com',32),
('rer','krewaku@gmail.com',92);

select * from users;

SELECT * FROM post;
create table post(
  id serial PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  content TEXT NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
  );

  insert into post(title,content,user_id) values
  ('my second post in facebook form dhaka','this is my second post and its my new job from facebook. i am a new facebook user from dhaka',4),
  ('my first post in facebook form dhaka','this is my first post and its my new job from facebook. i am a new facebook user from dhaka',4),
  ('my third post in facebook form dhaka','this is my third post and its my new job from facebook. i am a new facebook user from dhaka',7),
  ('my fourth post in facebook form dhaka','this is my fourth post and its my new job from facebook. i am a new facebook user from dhaka',5),
  ('my fifth post in facebook form dhaka','this is my fifth post and its my new job from facebook. i am a new facebook user from dhaka',5);
  ('my third post in facebook form dhaka','this is my third post and its my new job from facebook. i am a new facebook user from dhaka',7),
  ('my fourth post in facebook form dhaka','this is my fourth post and its my new job from facebook. i am a new facebook user from dhaka',1),
  ('my fifth post in facebook form dhaka','this is my fifth post and its my new job from facebook. i am a new facebook user from dhaka',7);

  SELECT * FROM post where user_id=3;

DROP TABLE post;
DROP TABLE users;
SELECT * FROM users;
SELECT * FROM post;
delete from users where id=7;