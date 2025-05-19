-- Active: 1747447723202@@127.0.0.1@5432@my_db
SHOW timeZone;

SELECT now()::time;

SELECT current_date;

SELECT current_time;

SELECT age(now(), '2004-10-20'::date);

SELECT to_char(now(), 'DD-MM-YY HH:MI:SS');

SELECT extract(month from '2004-10-20'::date);

SELECT CURRENT_DATE + INTERVAL '1 year'