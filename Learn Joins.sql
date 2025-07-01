CREATE DATABASE LEARN_JOINS;
USE LEARN_JOINS; 

CREATE TABLE students (
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO students (id, name) VALUES
(101, "adam"),
(102, "bob"),
(103, "casey");

SELECT * FROM students;

CREATE TABLE course (
id INT PRIMARY KEY,
course VARCHAR(50)
);

INSERT INTO course (id, course) VALUES 
(102, "english"),
(105, "math"),
(103, "science"),
(107, "computer science");
SELECT * FROM course;

/*Performing INNER JOIN*/
SELECT * FROM students INNER JOIN course ON students.id = course.id;

/*Write the same query as above using alias */
SELECT * FROM students AS s INNER JOIN course AS c ON s.id = c.id;

/*Performing Left Join - Returns all records form the left table, and the matched records form the right table.*/
SELECT * FROM students as s LEFT JOIN course AS c ON s.id = c.id;

/*Performing Right Join - Returns all records form the Right table, and the matched records form the Left table.*/
SELECT * FROM students as s RIGHT JOIN course AS c ON s.id = c.id;

/*Performing Full Join - Returns all records when there is a match in either left or right table.*/
SELECT * FROM students as s RIGHT JOIN course AS c ON s.id = c.id
UNION
SELECT * FROM students as s LEFT JOIN course AS c ON s.id = c.id;

/*Performing Right Exclusive Join.*/
SELECT * FROM students as s RIGHT JOIN course AS c ON s.id = c.id WHERE s.id is NULL;

/*Performing Left Exclusive Join.*/
SELECT * FROM students as s LEFT JOIN course AS c ON s.id = c.id WHERE c.id is NULL;

/*As a homework write a query for UNION of Left Exclusive Joins and Right Exclusive Joins*/

/*SELF Join - It is a regular join bu the table is joined with itself.*/

CREATE TABLE employee (
id INT PRIMARY KEY,
name VARCHAR(50),
manager_id int
);

INSERT INTO employee (id, name, manager_id)
VALUES
(101, "Adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104, "donald", 103);

SELECT * FROM employee;

SELECT a.name AS manager_name, b.name FROM employee as a JOIN employee AS b ON a.id = b.manager_id; 

/*UNION - 3 conditions - every SELECT should have same no. of columns, columns must have similar data types, columns in every SELECT should be in same order*/
/*UNION - give distinct values, UNIONALL - allows duplicate values.*/
SELECT name FROM employee UNION SELECT name from employee;
SELECT name FROM employee UNION ALL SELECT name from employee;

