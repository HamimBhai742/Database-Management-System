-- Active: 1747447723202@@127.0.0.1@5432@my_db

SELECT * FROM product;

SELECT * FROM product WHERE email is  NULL;
SELECT COALESCE(email, 'email not found'),product_price FROM product;

SELECT * FROM product WHERE product_qulity='Best' or product_qulity='Better';

SELECT * FROM product WHERE product_qulity IN ('Best', 'Better','onkbhalo');


SELECT * FROM product WHERE product_qulity NOT IN ('Best', 'Better','onkbhalo');

SELECT * FROM product WHERE product_contity BETWEEN 20 AND 100;

SELECT * FROM product WHERE product_name LIKE 'sm%';
SELECT * FROM product WHERE product_name ILIKE 'sm%';