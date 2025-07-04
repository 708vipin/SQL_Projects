CREATE DATABASE Online_Bookstore;
USE Online_Bookstore;

/*Creating table named "Books"*/
CREATE TABLE Books (
Book_ID SERIAL PRIMARY KEY,
Title VARCHAR(100),
Author VARCHAR(100),
Genre VARCHAR(50),
Published_Year INT,
Price NUMERIC(10,2),
Stock INT 
);

/*Creating table named "Customers"*/
CREATE TABLE Customers (
Customer_ID SERIAL PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100),
Phone VARCHAR (15),
City VARCHAR (50),
Country VARCHAR (150)
);

/*Creating table named "Orders"*/
CREATE TABLE Orders (
Order_ID SERIAL PRIMARY KEY,
Customer_ID INT REFERENCES Customers(Customer_ID),
Book_ID INT REFERENCES Books(Book_ID),
Order_Date DATE,
Quantity INT,
Total_Amount NUMERIC (10,2)
);

SELECT * FROM Books;
/*Import Data into Books Table*/
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Books.csv' INTO TABLE Books
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;


/*Problem: When I imported data using the command 
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Books.csv' INTO TABLE Books
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\\n'
IGNORE 1 ROWS;
 Only the first header row of the table got imported But when I removed these two lines, ENCLOSED BY '"'
LINES TERMINATED BY '\\n', the Whole table got imported - An IMPORTANT LEARNING Indeed. */


/*Command to see the path in which the file should be stored for MySQL to retrieve it.*/
SHOW VARIABLES LIKE 'secure_file_priv';

/*Import Data into Customers Table*/
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Customers.csv' INTO TABLE Customers
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;


/*Import Data into Orders Table*/
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Orders.csv' INTO TABLE Orders
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

/*Checking if data has been successfully imported in our Books, Customers & Orders Table*/
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

/*1. Retrieve all books in the "Fiction" genre.*/
SELECT * FROM Books WHERE genre = "Fiction";

/*2. Find the books published after the year 1950*/
SELECT * FROM Books WHERE Published_Year>1950;

/*3. List all customers from the Canada.*/
SELECT * FROM Customers WHERE Country LIKE '%Canada%';

/*4. Show Orders placed in November 2023.*/
SELECT * FROM Orders WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

/*5. Retrieve the total stock of books available.*/
SELECT SUM(Stock) FROM Books;

/*6. Find the details of the most expensive book.*/
SELECT * FROM Books ORDER BY Price DESC LIMIT 1;

/*7. Show all customers who ordered more than 1 quantity of a book.*/
SELECT * FROM Orders WHERE Quantity > 1;

/*8. Retrieve all the orders where the total amount exceeds $20.*/
SELECT * FROM Orders WHERE Total_Amount > 20;

/*9. List all genres available in the Books table.*/
SELECT  DISTINCT Genre FROM Books;

/*10. Find the books with the lowest stock.*/
SELECT * FROM Books ORDER BY Stock ASC LIMIT 3;

/*11. Calculate the total revenue generated from all the orders.*/
SELECT SUM(Total_Amount) FROM Orders;


/*Advanced Queries*/

/*1. Retrieve the total number of books sold for each genre.*/
SELECT B.Genre, SUM(O.Quantity)
FROM Books AS B
JOIN Orders AS O ON B.Book_ID = O.Book_ID
GROUP BY B.Genre;


/*2. Find the average price of books in the "Fantasy genre".*/
SELECT AVG(Price)
FROM Books WHERE Genre = "Fantasy" ;


/*3. List customers who have placed at least 2 orders.*/
SELECT C.Name, O.Quantity 
FROM Customers AS C 
JOIN Orders AS O ON C.Customer_ID = O.Customer_ID WHERE Quantity>1;


/*4. Find the most frequently ordered book.*/
SELECT O.Book_ID, B.Title, COUNT(O.Order_ID) AS Order_Count
FROM Books AS B
JOIN Orders AS O ON B.Book_ID = O.Book_ID
GROUP BY B.Title, O.Book_ID
ORDER BY Order_Count DESC ;


/*5. Show the top 3 most expensive books of "Fantasy" genre.*/
SELECT * FROM Books WHERE Genre = "Fantasy"
ORDER BY Price DESC LIMIT 3;


/*6. Retrieve the total quantity of books sold by each author.*/
SELECT B.Author, SUM(O.Quantity) AS Total_Books_Sold
FROM Books AS B
JOIN Orders AS O ON B.Book_ID = O.Book_ID
GROUP BY B.Author;


/*7.List the cities where customers who spent over $30 are located.*/
SELECT DISTINCT C.City, O.Total_Amount
FROM Customers AS C
JOIN Orders AS O ON C.Customer_ID = O.Customer_ID WHERE Total_Amount>30;


/*8. Find the customer who spent the most on orders.*/
SELECT C.Name, C.Customer_ID, SUM(O.Total_Amount) AS Total_Spent
FROM Customers AS C
JOIN Orders AS O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Name, C.Customer_ID
ORDER BY Total_Spent DESC LIMIT 1;


/*9. Calculate the stock remaining after fulfilling all orders.*/
SELECT B.Book_ID, B.Title, B.Stock, COALESCE(SUM(O.Quantity),0) AS Order_Quantity,
B.Stock - COALESCE(SUM(O.Quantity),0) AS Remaining_Quantity
FROM Books AS B
LEFT JOIN Orders AS O ON B.Book_ID = O.Book_ID
GROUP BY B.Book_ID;