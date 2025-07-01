CREATE DATABASE IF NOT EXISTS college;
USE college;
CREATE TABLE student (
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student (rollno, name, marks, grade, city) VALUES
 (101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "Farah", 82, "B", "Delhi");


/* SELLECT */ 
SELECT * FROM student; 
SELECT city FROM student;
SELECT DISTINCT city FROM student;

/* WHERE CLAUSE */ 
/* OPERATORS IN WHERE */
/* +, -, Divide, *, mod(Remainder) */
/*<,<=,>,>=, AND, OR, NOT, IN, BETWEEN (inclusive), ALL, LIKE, ANY*/
/*BITWISE OPERATORS - &(AND), |(OR)*/
SELECT marks FROM student WHERE marks > 80;
SELECT city FROM student WHERE city = "Delhi";
SELECT grade FROM student WHERE grade = "A";
SELECT name FROM student WHERE marks > 80;
SELECT * FROM student WHERE marks > 80 AND city = "MUMBAI";
SELECT * FROM student WHERE marks > 80 OR city = "MUMBAI";
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student WHERE city IN ("Delhi", "Mumbai");
SELECT * FROM student WHERE city NOT IN ("Delhi", "Mumbai");

/* LIMIT Caluse */
SELECT * FROM student WHERE marks > 80 LIMIT 3;

/* Order By Clause */
SELECT * FROM student ORDER BY marks ASC;
SELECT * FROM student ORDER BY marks DESC LIMIT 3;

/* Aggregate Functions - COUNT(), MAX(), MIN(), SUM(), AVG()*/
SELECT MAX(marks) FROM student;
SELECT MIN(marks) FROM student;
SELECT AVG(marks) FROM student;
SELECT COUNT(name) FROM student;

/* GROUP BY CLAUSE */
SELECT(city), name, COUNT(rollno) FROM student GROUP BY city, name;

/* Practice Q - Write the Query to find avg marks in each city in ascending order. */
SELECT city, AVG(marks) FROM student GROUP BY city ORDER BY AVG(marks);

/* Query to find the number students as per grade */
SELECT grade, count(rollno) FROM student GROUP BY grade;


/* HAVING Clause - Count no. of students in each city where max marks cross 90 */
SELECT city, count(name) FROM student GROUP BY city HAVING max(marks)>90;

/* GENERAL ORDER
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
 */
 
/*Table related Queries - UPDATE, DELETE*/

/*UPDATE Query*/
UPDATE student SET grade = "O" WHERE grade = "A" ;

/*Safe mode is on - Turn off the safe mode*/
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM student;

/*Change the marks of emanuel to 82*/
UPDATE student SET marks = 82 where rollno = 105;
SELECT * FROM student;

UPDATE student SET grade = "B" WHERE rollno = 105;
SELECT * FROM student;

/*Write a query to increase the marks of all students by 1*/
UPDATE student SET marks = marks + 1;
SELECT * FROM student;

/*DELETE Query*/
/*Write a query to delete the data of students whose marks are less than 80*/
DELETE FROM student WHERE marks <80;
SELECT * FROM student;

/*Insert the deleted data*/
INSERT INTO student VALUES  (101, "anil", 79, "C", "Pune");
SELECT * FROM student;

/*Revisiting Foreign Key*/
/*Cascading for FK - ON DELETE CASCADE & ON UPDATE CASCADE - To reflect the changes made in one table to another table*/
/*Create two tables - dept & teacher*/

CREATE TABLE dept (
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO dept
VALUES
(101, "ENGLISH"),
(102, "IT");

UPDATE dept SET id = 103 WHERE id = 102;

SELECT * FROM dept;

CREATE TABLE teacher (
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

INSERT INTO teacher
VALUES
(101, "Adam", 101),
(102, "Eve", 102);

SELECT * FROM teacher;

/*Table Related Queries - ALTER (used to change the schema)*/

/*Using Alter to Add Column*/
ALTER TABLE student ADD COLUMN age INT;
SELECT * FROM student;

/*Using Alter to Drop Column*/
ALTER TABLE student DROP COLUMN age;
SELECT * FROM student;

/*Using Alter to Rename Table*/
ALTER TABLE student RENAME TO stu;
ALTER TABLE stu RENAME TO student;

/*Using Alter to Change (Rename) Column*/
ALTER TABLE student CHANGE age stu_age INT;

/*Using Alter to Modify Column (modify datatype/constraint) */
ALTER TABLE student ADD COLUMN age INT NOT NULL DEFAULT 19;
SELECT * FROM student;
ALTER TABLE student MODIFY COLUMN age VARCHAR(2);

/*TRUNCATE Query - Used to delete table's data*/
/*Diff between DROP & TRUNCATE : DROP deletes the table, TRUNCATE delets the table data*/


/*Q: a. Change the name of column "name" to "full_name" 
      b. Delete all students who scored marks less than 80
      c. Delete the column for grades.alter
      */
      
      ALTER TABLE student CHANGE name full_name VARCHAR(50);
      SELECT * FROM student;
      
    DELETE FROM student WHERE marks<80;
    SELECT * FROM student;
    
    ALTER TABLE student DROP COLUMN grade;
    
    /*JOINS in SQL - INNER JOINS & OUTER JOINS*/
    
    /*INNER JOINS - Returns records that have matching values in both tables.*/ 
    
