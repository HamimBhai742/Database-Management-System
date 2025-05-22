-- Active: 1747447723202@@127.0.0.1@5432@my_db


--create new table for deleted users
create table deleted_users
(
    id serial primary key,
    name varchar(25),
    email varchar(50),
    deleted_at timestamp
    );

SELECT * FROM deleted_users;
--create trigger function
create or replace function delete_user()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO deleted_users (name, email, deleted_at)
    VALUES (OLD.name, OLD.email, now());
    RETURN OLD;
END;
$$

--create trigger

create or replace TRIGGER save_deleted_user
BEFORE DELETE
ON users
FOR EACH ROW
EXECUTE FUNCTION delete_user();

--delete user
delete from users where id=5;

EXPLAIN ANALYSE
select * from  employees WHERE employee_id=5;

CREATE INDEX idx_employee_id
ON employees(employee_id);
SELECT * FROM deleted_users;
SHOW data_directory;

