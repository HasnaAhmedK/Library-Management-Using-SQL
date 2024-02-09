CREATE DATABASE LIBRARY;
USE LIBRARY;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(250),
    Contact_no VARCHAR(20)
);


CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(100),
    Salary INT,
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);


CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(250),
    Reg_date DATE
);


CREATE TABLE  IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);


CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(250),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);


CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(250),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);


INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, '456 Marine Beach, Kochi', '123-456-7890'),
(2, 105, '345 Gandhi Nagar, Chennai', '789-012-3456'),
(3, 109, '123 Beach Road, Calicut', '987-654-3210');


INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(101, 'Ramesh Sharma', 'Manager', 60000, 1),
(102, 'Suresh Singh', 'Assistant Manager', 50000, 1),
(103, 'Priya Patel', 'Librarian', 45000, 1),
(104, 'Deepak Verma', 'Clerk', 40000, 1),
(105, 'Neha Sharma', 'Manager', 55000, 2),
(106, 'Rajesh Singh', 'Assistant Manager', 48000, 2),
(107, 'Geeta Verma', 'Librarian', 42000, 2),
(108, 'Amit Kumar', 'Clerk', 38000, 2),
(109, 'Priya Menon', 'Manager', 60000, 3),
(110, 'Rohan Nair', 'Assistant Manager', 52000, 3),
(111,'Rahul Nair','Librarian', 43000, 3),
(112, 'Anjali Pillai', 'Clerk', 40000, 3);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1, 'Anita Gupta', '123 ABC Colony, Mumbai', '2021-05-15'),
(2, 'Amit Kumar', '456 XYZ Street, Delhi', '2020-11-20'),
(3, 'Pooja Sharma', '789 PQR Nagar, Bangalore', '2022-03-10'),
(4, 'Arun Gupta', '456 Rampura, Jaipur', '2023-07-25'),
(5, 'Rajni Patel', '789 Chitrakoot Nagar, Kolkata', '2023-09-12'),
(6, 'Sanjay Das', '012 Sindhi Nagar, New Delhi', '2022-12-30'),
(7, 'Deepa Nair', '123 Coconut Grove, Kochi', '2023-05-18'),
(8, 'Akhil Menon', '456 Tea Estates, Munnar', '2023-08-20');


INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
(123456789, 'Sapiens: A Brief History of Humankind', 'History', 50.00, 'yes', 'Yuval Noah Harari', 'HarperCollins'),
(234567890, 'Ikigai: The Japanese Secret to a Long and Happy Life', 'Self-Help', 45.00, 'yes', 'Héctor García and Francesc Miralles', 'Penguin Random House'),
(345678901, 'The God of Small Things', 'Fiction', 60.00, 'yes', 'Arundhati Roy', 'HarperCollins'),
(456789012, 'Goat Days', 'Biography', 55.00, 'yes', 'Benyamin', 'Penguin Books');


INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 1, 'Sapiens: A Brief History of Humankind', '2023-01-05', 123456789),
(2, 2, 'Ikigai: The Japanese Secret to a Long and Happy Life', '2023-02-10', 234567890),
(3, 3, 'The God of Small Things', '2023-03-15', 345678901),
(4, 4, 'Goat Days', '2023-04-20', 456789012),
(5, 5, 'The God of Small Things', '2023-05-25', 345678901),
(6, 6, 'Sapiens: A Brief History of Humankind', '2023-06-30', 123456789),
(7, 7, 'The God of Small Things', '2023-06-10', 345678901),
(8, 8, 'Ikigai: The Japanese Secret to a Long and Happy Life', '2023-07-15', 234567890),
(9, 6, 'Goat Days', '2023-08-20', 456789012);


INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 1, 'Sapiens: A Brief History of Humankind', '2023-02-05', 123456789),
(2, 2, 'Ikigai: The Japanese Secret to a Long and Happy Life', '2023-03-10', 234567890),
(3, 6, 'Sapiens: A Brief History of Humankind', '2023-07-30', 123456789),
(4, 7, 'The God of Small Things', '2023-07-10', 345678901),
(5, 6, 'Goat Days', '2023-09-20', 456789012);

-- 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_price FROM Books WHERE STATUS='Yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Issued_Book_name,Issue_Id FROM IssueStatus;

-- 4. Display the total count of books in each category.
SELECT Category,COUNT(*) FROM Books GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name,Position,Salary FROM Employee WHERE Salary>'50000';

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name FROM Customer WHERE Reg_date<2022-01-01 AND Customer_id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(Emp_name) FROM Employee GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
SELECT Customer.Customer_id, Customer.Customer_name 
FROM Customer 
JOIN IssueStatus ON Customer.Customer_id = IssueStatus.Issued_cust 
WHERE YEAR(IssueStatus.Issue_date) = '2023' 
AND MONTH(IssueStatus.Issue_date) = '06';

-- 9. Retrieve book_title from book table containing history.
SELECT Book_title FROM Books WHERE Category = 'History';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no,COUNT(*) AS Employee_Count FROM Employee GROUP BY Branch_no HAVING Employee_count>5;