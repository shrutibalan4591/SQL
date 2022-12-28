/* List available database */
SHOW DATABASES;

/* Create database */
CREATE DATABASE testdb;

/*Use database testdb */
USE testdb;


/* Create tables A and B with same column names with same datatypes */
CREATE TABLE A (
  num INT(3),
  var VARCHAR(10)
);
CREATE TABLE B (
  num INT(3),
  var VARCHAR(10)
);


/* Insert values in A and B */
INSERT INTO A (num, var) VALUES (22, 'shruti'),
								(24, 'nithin'),
								(33, 'deepthi'),
								(27, 'athul');

INSERT INTO B (num, var) VALUES (25, 'reshma'),
								(24, 'nithin'),
								(35, 'rijwal'),
								(27, 'athul');								
SHOW TABLES;


/* Show data in A and B */
SELECT * 
FROM A;     
SELECT *
FROM B;

/* UNION of A and B */
SELECT num FROM A
UNION
SELECT num FROM B;


/* UNION ALL of A and B */
SELECT num FROM A
UNION ALL
SELECT num FROM B;
