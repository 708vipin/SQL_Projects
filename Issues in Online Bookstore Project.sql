/*1. Loading the csv file into MySQL
I was using COPY which is not used in MySQL, Instead LOAD DATA INFILE is used*/

/*2. For importing data I was using, 
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Books.csv' INTO TABLE Books
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\\n'
IGNORE 1 ROWS; 
When I was using this code, only the header rows appeared, rest other rows showed NULL.
SOLUTION CODE: 
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Books.csv' INTO TABLE Books
FIELDS TERMINATED BY ','
IGNORE 1 ROWS; 
*/

/*3. When I used the query 
SELECT * FROM Customers WHERE Country = "Canada";
the result I was getting is, just the header row and the NULL values in the second row and nothing else.
Solution query - 
SELECT * FROM Customers WHERE Country LIKE '%Canada%';*/


/*4. When I used the query 
SELECT * FROM Orders WHERE Order_Date BETWEEN 1/11/2023 AND 30/11/2023;
the result I was getting is, just the header row and the NULL values in the second row and nothing else.
Solution query - 
SELECT * FROM Orders WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';
Reason - MySQL accepts the date in the format 'yyyy-mm-dd' Only*/
