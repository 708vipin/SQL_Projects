/*SQL Sub Queries- Is an inner query or a nested query, involves 2 SELECT statements. Can be used with SELECT, FROM, WHERE - WHERE is most popular.*/
/*Q - Get names of all students who scored more than class average. */
USE college;
SELECT * FROM student;
UPDATE student SET marks = 92 WHERE rollno = 105;
SELECT AVG(marks) FROM student;
SELECT name, marks FROM student WHERE marks > 87.6667;
/*Write the above statement using Subquery*/
SELECT name, marks FROM student WHERE marks > (SELECT AVG(marks) FROM student);

/*Find the names of all students with even roll numbers.*/
SELECT rollno FROM student WHERE rollno MOD 2 = 0;

/*Find the names and rollno of students with even roll numbers using Sub query*/
SELECT name, rollno FROM student WHERE rollno IN ( SELECT rollno FROM student WHERE rollno MOD 2 = 0);
SELECT * FROM student;

/*Find the students of Delhi*/
SELECT name, marks FROM student WHERE city="Delhi";


/*Find their max marks using the sub query - Example using the FROM sub query */
/*It is mandatory to alias when we write sub query using FROM*/
SELECT max(marks) FROM (SELECT name, marks FROM student WHERE city="Delhi") AS Delhi_temp_table;

/*Using SQL Sub queries with SELECT- Just for demonstration not used frequently*/
SELECT ( SELECT max(marks) FROM student), name FROM student;

/*MySQL Views- A view is a virtual table based on the result of an SQL statement.*/
CREATE VIEW view1 AS  SELECT rollno, name, marks FROM student;
SELECT * FROM view1 WHERE marks>90;