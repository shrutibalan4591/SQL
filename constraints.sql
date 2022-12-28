-- Active: 1672082850870@@127.0.0.1@3306
CREATE DATABASE mydb;

USE mydb;



/*--------------------------------------------------------------------------------------*/
/* NOT NULL constraint */
CREATE TABLE tb1
(
    e_id INT(5) NOT NULL,
    e_name VARCHAR(20)
);
/* Try to enter values with empty e_no -> will show error */
INSERT INTO tb1 (e_id, e_name)
VALUES (1, 'Rahul'),
        (2, 'Nithin'),
        (NULL,'Athul'),
        (4, 'Akshay');



/*--------------------------------------------------------------------------------------*/
/* UNIQUE constraint */
DROP TABLE IF EXISTS tb1;
CREATE TABLE tb1
(
    e_id INT(5) UNIQUE,
    e_name VARCHAR(20)
);
/* Try to enter values with duplicate e_no -> will show error */
INSERT INTO tb1 (e_id, e_name)
VALUES (1, 'Rahul'),
        (2, 'Nithin'),
        (2,'Athul'),
        (4, 'Akshay');



/*--------------------------------------------------------------------------------------*/

/* PRIMARY KEY constraint */
/* PRIMARY KEY = NOT NULL + UNIQUE */
DROP TABLE IF EXISTS tb1;
CREATE TABLE tb1
(
    e_id INT(5) PRIMARY KEY,
    e_name VARCHAR(20)
);
/* Try to enter values with duplicate / empty e_no -> will show error */
INSERT INTO tb1 (e_id, e_name)
VALUES (1, 'Rahul'),
        (1, 'Nithin');
INSERT INTO tb1 (e_id, e_name)
VALUES (3,'Athul'),
       (NULL, 'Akshay');





/*--------------------------------------------------------------------------------------*/
/* Composite key constraint */
DROP TABLE IF EXISTS tb1;
CREATE TABLE tb1
(
    e_id INT(5),
    e_class VARCHAR(10),
    e_mark INT(5),
    PRIMARY KEY(e_id, e_class)
);
/* Try to enter values with duplicate / empty e_no -> will show error */
INSERT INTO tb1
VALUES (1, 'Maths', 25),
        (1, 'Maths', 35);           /* ERROR */
INSERT INTO tb1
VALUES (1,'Maths', 25),
       (1, 'Science', 30);            /* VALID */





/*--------------------------------------------------------------------------------------*/
/* FOREIGN KEY constraint */
DROP TABLE IF EXISTS tb1;

CREATE TABLE department
(
    d_id VARCHAR(5) PRIMARY KEY,
    d_name VARCHAR(20)
);
INSERT INTO department
VALUES ('D01', 'Sales'),
       ('D02', 'Operations'),
       ('D03', 'HR'),
       ('D04', 'IT');
SELECT *
FROM department;

CREATE TABLE employee
(
    e_id VARCHAR(5),
    e_dept VARCHAR(5),
    e_name VARCHAR(20),
    PRIMARY KEY(e_id, e_dept),
    FOREIGN KEY (e_dept) REFERENCES department(d_id)
);

INSERT INTO employee
VALUES ('E01', 'D04', 'Helen'),
       ('E02', 'D03', 'Daniel'),
       ('E03', 'D04', 'Archie'),
       ('E04', 'D02', 'Ryan'),
       ('E05', 'D01', 'Kingsley'),
       ('E06', 'D01', 'Sofia'),
       ('E07', 'D04', 'Rupert');

SELECT *
FROM employee;

/* Now try inserting values in employee with e_id value which is not in department table -> error */
INSERT INTO employee
VALUES ('E08', 'D05', 'Jude');
/* ERROR SHOWN WILL BE AS FOLLOWS :

Cannot add or update a child row: a foreign key constraint fails 
(`testdb`.`employee`, CONSTRAINT `employee_ibfk_1` 
FOREIGN KEY (`e_dept`) REFERENCES `department` (`d_id`))
*/



/* Now try deleting record from department -> will show error */
DELETE FROM department
WHERE d_id='D02';
/* ERROR SHOWN WILL BE AS FOLLOWS :

Cannot delete or update a parent row: 
a foreign key constraint fails (`testdb`.`employee`, CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`e_dept`) 
REFERENCES `department` (`d_id`))
*/



/*---------------------------------------------------------------------------------------*/
/* CHECK constraint */
CREATE TABLE class
(
    s_id INT(5) PRIMARY KEY,
    s_name VARCHAR(20),
    s_age INT(5) CHECK(s_age between 18 and 35)
);

INSERT INTO class
VALUES (101, 'Riya', 20),
       (102, 'Rishab', 19),
       (103, 'Rijwal', 10);         /* Shows error : Check constraint 'class_chk_1' is violated. */




/*---------------------------------------------------------------------------------------*/
/* DEFAULT constraint */
CREATE TABLE orders
(
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATETIME DEFAULT now()
);

INSERT INTO orders (order_id) VALUES ('ORDER101');
INSERT INTO orders (order_id) VALUES ('ORDER102');
INSERT INTO orders (order_id) VALUES ('ORDER103');


SELECT *
FROM orders;