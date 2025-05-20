-- Active: 1747447723202@@127.0.0.1@5432@my_db
CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_year INT,
    country VARCHAR(100) NOT NULL
);

-- Insert values into the Authors table
INSERT INTO Authors (name, birth_year, country)
VALUES
('George Orwell', 1903, 'UK'),
('J.K. Rowling', 1965, 'UK'),
('Isaac Asimov', 1920, 'Russia'),
('Mark Twain', 1835, 'USA'),
('Harper Lee', 1926, 'USA');

select country,count(*) from authors GROUP BY country;

drop table authors;

CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT REFERENCES Authors(author_id),
    category VARCHAR(50),
    published_year INT,
    copies_available INT
);

-- Insert values into the Books table
INSERT INTO Books (title, author_id, category, published_year, copies_available)
VALUES
('1984', 1, 'Dystopian', 1949, 5),
('Animal Farm', 1, 'Political Satire', 1945, 3),
('Harry Potter and the Philosopher''s Stone', 2, 'Fantasy', 1997, 7),
('Harry Potter and the Chamber of Secrets', 2, 'Fantasy', 1998, 6),
('Foundation', 3, 'Science Fiction', 1951, 4),
('The Adventures of Tom Sawyer', 4, 'Adventure', 1876, 8),
('To Kill a Mockingbird', 5, 'Fiction', 1960, 10);

select * from books;

--The Members table tracks information about library members, including their names, unique email addresses, and membership dates. This structure is fundamental for managing user access to library resources. The member_id serves as a unique identifier for each member.
CREATE TABLE Members (
    member_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    membership_date DATE
);

-- Insert values into the Members table
INSERT INTO Members (name, email, membership_date)
VALUES
('Alice Johnson', 'alice.johnson@example.com', '2023-01-15'),
('Bob Smith', 'bob.smith@example.com', '2023-02-10'),
('Charlie Brown', 'charlie.brown@example.com', '2023-03-05'),
('Diana Prince', 'diana.prince@example.com', '2023-04-20'),
('Edward Stark', 'edward.stark@example.com', '2023-05-25');

--The Borrowings table records transactions where members borrow books. It includes details such as the book and member IDs, borrowing dates, and return dates. This table is used for tracking the borrowing activity within the library, allowing for queries that can analyze borrowing patterns, overdue items, and member engagement.
CREATE TABLE Borrowings (
    borrowing_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES Books(book_id),
    member_id INT REFERENCES Members(member_id),
    borrowed_date DATE,
    return_date DATE
);

-- Insert values into the Borrowings table
INSERT INTO Borrowings (book_id, member_id, borrowed_date, return_date)
VALUES
(1, 1, '2023-07-10', '2023-07-20'),
(3, 2, '2023-06-15', '2023-06-25'),
(5, 3, '2023-08-05', NULL),
(7, 4, '2023-09-01', '2023-09-15'),
(2, 5, '2023-09-10', NULL);

--find all books
select * from books;

--Find the title and category of all books published in 2020.
select title,category from books where published_year = 1951;

--List all authors from the USA.

select * from authors where country = 'USA';

-- Insert a new book into the Books table.
INSERT INTO Books ( title, author_id, category, published_year, copies_available)
VALUES ( 'The Pragmatic Programmer', 1, 'Programming', 1999, 5);

--Find all members who joined in the year 2023.

select * from members WHERE extract(year from membership_date::date) = 2023;

--Update the number of copies available for a specific book.
update books set copies_available = 10 where book_id = 8;

--Delete a book from the Books table.
delete from books where book_id = 8;

--Find all books in the ‘Fiction’ category

select * from books where category = 'Fiction';

--Display the name and email of all members
select name,email from members;

--Count how many books are available in the 'History' category
select count(*) from books where category= 'History';

--Find the title of the book borrowed by the member with ID 3
select title,member_id,book_id from books INNER JOIN Borrowings USING(book_id) where member_id = 5;

--Display the name and borrowed_date of all members who borrowed a book in January 2023
select name,borrowed_date from Borrowings INNER JOIN members USING(member_id) where extract(month from borrowed_date::date) = 1 and extract(year from borrowed_date::date) = 2023;


-- List all books authored by 'George Orwell'


select title from books INNER JOIN authors USING(author_id) where name = 'George Orwell';

--Find all authors who were born before 1950.
select name from authors where authors.birth_year <1950;

-- Insert a new author into the Authors table.
INSERT INTO Authors ( name, birth_year, country)
VALUES ('Isaac Asimov', 1920, 'Russia');

--Display the total number of members.
select count(*) from members;

--Show all borrowings that have not been returned yet.
select * from borrowings where borrowings.return_date is null;

-- List all unique categories of books in the library.
select DISTINCT category from books;

--Find the number of books available for each category
select category,count(*) from books GROUP BY category;

--Display the name of the member who borrowed the book titled '1984'
SELECT name from books INNER JOIN borrowings USING(book_id) INNER JOIN members USING(member_id) WHERE title = '1984' ;

--Find the total number of books borrowed by each member.
select member_id,count(*) from  borrowings GROUP BY member_id;