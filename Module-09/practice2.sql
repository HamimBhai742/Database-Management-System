-- Active: 1747447723202@@127.0.0.1@5432@my_db

--create coustomer table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20) NOT NULL,
    address TEXT NOT NULL
);

--insert data into customer table
-- Inserting sample data into the customers table
INSERT INTO customers (first_name, last_name, email, phone, address) VALUES
( 'Hamim', 'Ahmed', 'hamim@example.com', '01710000001', 'Dhaka, Bangladesh'),
('Sarah', 'Khan', 'sarah@example.com', '01710000002', 'Chattogram, Bangladesh'),
('Rafi', 'Hasan', 'rafi@example.com', '01710000003', 'Rajshahi, Bangladesh'),
('Nadia', 'Begum', 'nadia@gmail.com', '01710000004', 'Sylhet, Bangladesh'),
('Arif', 'Rahman', 'arif@gmail.com', '01710000005', 'Khulna, Bangladesh'),
('Tania', 'Sultana', 'tania@info.com', '01710000006', 'Barisal, Bangladesh');

select * from customers;

--create orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Inserting sample data into the orders table
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(6, '2020-01-05', 100.50);

SELECT * FROM orders;

--Find customers who have placed more than 2 orders and calculate the total amount spent by     each of these customers.

select count(*) as coustomer_order, sum(total_amount) as total_cost from orders group by customer_id having count(*) >2;

--Find the total amount of orders placed each month in the year 2022.
select extract(month from order_date::date) as order_pr_month,sum(total_amount) from orders WHERE extract(year from order_date::date) = 2021 group by order_pr_month;