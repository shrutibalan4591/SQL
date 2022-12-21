/* Create a table */
DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
                        empid int PRIMARY KEY,
                        name varchar(50),
                        dept varchar(50),
                        salary int
                      );
		
/* Insert data into table */
INSERT INTO employee (empid, name, dept, salary)
VALUES (1001, 'Harry Potter', 'Dept A', 50000), (1002, 'Ron Weasley', 'Dept B', 45000),
       (1003, 'Hermione Granger', 'Dept C', 70000), (1004, 'Neville LongBottom', 'Dept B', 35000),
       (1005, 'Luna Lovegood', 'Dept A', 47000), (1006, 'Ginny Weasley', 'Dept D', 60000),
       (1007, 'Draco Malfoy', 'Dept B', 40000), (1008, 'Severus Snape', 'Dept C', 68000);
	   
/* Read the data in the table */
SELECT *
FROM employee;

/* Read selected columns from a table */
# Read only certain columns
SELECT empid, dept
FROM employee;

/* Read top 5 rows in the table */
SELECT *
FROM employee
LIMIT 4;



/* --------------Conditional expression--------------------- */
/* Read employee data for employees who are working in Dept B */
SELECT *
FROM employee
WHERE dept='Dept B';

/* Read employee data hose salary is 40000 and below */
SELECT *
FROM employee
WHERE salary<=40000;



/* --------------Multiple conditions : AND, OR----------------*/
/* Read employee data whose department is Dept B and salary is above 40000 */
SELECT *
FROM employee
WHERE dept='Dept B' AND salary>40000;

/* Read employee data whose department is Dept C or salary is less than 40000 */
SELECT *
FROM employee
WHERE dept='Dept C' OR salary<40000;



/*----------------BETWEEN clause------------------------*/
/*Read employee data whose salary is between 40000 and 50000 */
SELECT *
FROM employee
WHERE salary BETWEEN 40000 AND 50000;


/*-----------Aggregation of data : SUM, MIN, MAX-------------*/
/* Find sum of salary */
SELECT SUM(salary) AS total_salary
FROM employee;

/* Find maximum of salary */
SELECT MAX(salary) AS max_salary
FROM employee;

/* Find minimum of salary */
SELECT MIN(salary) AS min_salary
FROM employee;

/*------------ORDERing of data---------------------*/
/*Order data in 'employee' table by salary (ascending order default) */
SELECT *
FROM employee
ORDER BY salary;

/*Order data in 'employee' table by salary (descending order) */
SELECT *
FROM employee
ORDER BY salary desc;



/*----------GROUPing od data-------------------*/
/* Find sum of salary of employees of each department */
SELECT dept, SUM(salary) AS total_salary
FROM employee
GROUP BY dept;

/* Find sum of salary of employees of each department, order by total salary */
SELECT dept, SUM(salary) AS total_salary
FROM employee
GROUP BY dept
ORDER BY total_salary;



/* ----------------Matching from a list of items------------------ */
/* Find employee data of employess who work in dept A, D */
SELECT *
FROM employee
WHERE dept IN ('Dept A', 'Dept D');

/* -----------Pattern matching : LIKE ---------------------*/
/* Select employees who name start with 'H' */
SELECT empid, name
FROM employee
WHERE name LIKE 'H%';
	  
/*Select employees who name ends with 'ley' */
SELECT empid, name
FROM employee
WHERE name LIKE '%ley';

/* Select employees who name has 'G' */
SELECT empid, name
FROM employee
WHERE name LIKE '%G%';	  



/* -----------Adding, deleting, modifying columns -----------------*/
/* Add column 'location_id' */
ALTER TABLE employee
ADD location_id varchar(20),
ADD salary_group varchar(20);

/* Drop column 'location_id' */
ALTER TABLE employee
DROP location_id,
DROP salary_group;



/* -------------------Categorization : CASE ------------------------*/
SELECT empid, salary,
CASE WHEN salary<40000 THEN 'Under 40k'
     WHEN salary<50000 THEN 'Under 50k'
     ELSE '50k +'
   END AS salary_group
FROM employee;



/* ------------------Joining  or more tables : JOIN ---------------------- */
CREATE TABLE geo (
                  geoid varchar(4) PRIMARY KEY NOT NULL,
                  geo varchar(20),
                  region varchar(20)
                 );
				 
				 
INSERT INTO geo 
      VALUES ('G1','India','APAC'),
             ('G2','USA','Americas'),
             ('G3','Canada','Americas'),
             ('G4','New Zealand','APAC'),
             ('G5','Australia','APAC'),
             ('G6','UK','Europe');
			 

			 CREATE TABLE people (
                      salesperson varchar(20) PRIMARY KEY,
                      spid varchar(6) NOT NULL,
                      team varchar(20),
                      location varchar(20)
                    );

INSERT INTO people 
      VALUES ('Barr Faughny','SP01','Yummies','Hyderabad'),
							('Dennison Crosswaite','SP02','Yummies','Hyderabad'),
							('Gunar Cockshoot','SP03','Yummies','Hyderabad'),
							('Wilone O''Kielt','SP04','Delish','Hyderabad'),
							('Gigi Bohling','SP05','Delish','Hyderabad'),
							('Curtice Advani','SP06','Delish','Hyderabad'),
							('Kaine Padly','SP07','Delish','Hyderabad'),
							('Ches Bonnell','SP08','','Hyderabad'),
							('Andria Kimpton','SP09','Jucies','Hyderabad'),
							('Brien Boise','SP10','Jucies','Wellington'),
							('Husein Augar','SP11','Yummies','Wellington'),
							('Karlen McCaffrey','SP12','Yummies','Wellington'),
							('Jan Morforth','SP13','Delish','Wellington'),
							('Dotty Strutley','SP14','Delish','Wellington'),
							('Kelci Walkden','SP15','Yummies','Wellington'),
							('Marney O''Breen','SP16','Jucies','Wellington'),
							('Rafaelita Blaksland','SP17','','Wellington'),
							('Madelene Upcott','SP18','Jucies','Wellington'),
							('Beverie Moffet','SP19','Jucies','Seattle'),
							('Oby Sorrel','SP20','Jucies','Seattle'),
							('Mallorie Waber','SP21','','Seattle'),
							('Jehu Rudeforth','SP22','','Seattle'),
							('Van Tuxwell','SP23','Yummies','Seattle'),
							('Roddy Speechley','SP24','Delish','Seattle'),
							('Camilla Castle','SP25','Delish','Seattle'),
							('Janene Hairsine','SP26','Delish','Paris'),
							('Niall Selesnick','SP27','Jucies','Paris'),
							('Ebonee Roxburgh','SP28','','Paris'),
							('Zach Polon','SP29','Yummies','Paris'),
							('Orton Livick','SP30','Yummies','Paris'),
							('Gray Seamon','SP31','Delish','Paris'),
							('Benny Karolovsky','SP32','Jucies','Paris'),
							('Dyna Doucette','SP33','Jucies','Paris');
							
							
CREATE TABLE products (
                        pid varchar(6) NOT NULL PRIMARY KEY,
                        product varchar(20),
                        category varchar(20),
                        size varchar(10),
                        cost_per_box float DEFAULT NULL
                      );

INSERT INTO products 
      VALUES ('P01','Milk Bars','Bars','LARGE',1.52),
							  ('P02','50% Dark Bites','Bites','LARGE',2.57),
							  ('P03','Almond Choco','Bars','LARGE',9.6),
							  ('P04','Raspberry Choco','Bars','LARGE',4.09),
							  ('P05','Mint Chip Choco','Bars','LARGE',1.54),
							  ('P06','Eclairs','Bites','LARGE',2.24),
							  ('P07','Drinking Coco','Other','LARGE',1.62),
							  ('P08','99% Dark & Pure','Bars','LARGE',2.47),
							  ('P09','Orange Choco','Bars','LARGE',7.14),
							  ('P10','Spicy Special Slims','Bites','LARGE',5.79),
							  ('P11','After Nines','Bites','LARGE',4.43),
							  ('P12','Fruit & Nut Bars','Bars','LARGE',1.58),
							  ('P13','85% Dark Bars','Bars','SMALL',0.64),
							  ('P14','White Choc','Other','SMALL',0.16),
							  ('P15','Baker''s Choco Chips','Bars','SMALL',3.4),
							  ('P16','Organic Choco Syrup','Other','SMALL',1.47),
							  ('P17','Caramel Stuffed Bars','Bars','SMALL',0.54),
							  ('P18','Manuka Honey Choco','Other','SMALL',4.75),
							  ('P19','70% Dark Bites','Bites','SMALL',4.97),
							  ('P20','Smooth Sliky Salty','Bars','SMALL',2.97),
							  ('P21','Choco Coated Almonds','Bites','SMALL',6.17),
							  ('P22','Peanut Butter Cubes','Bites','SMALL',3.57);


CREATE TABLE sales (
                    spid varchar(6),
                    geoid varchar(6),
                    pid varchar(6),
                    saleDate timestamp DEFAULT NULL,
                    amount int DEFAULT NULL,
                    customers int DEFAULT NULL,
                    boxes int DEFAULT NULL
                   );

INSERT INTO sales 
      VALUES ('SP01','G4','P04','2021-01-01 00:00:00',8414,276,495), ('SP02','G3','P14','2021-01-01 00:00:00',532,317,54),
             ('SP12','G2','P08','2021-01-01 00:00:00',5376,178,269), ('SP01','G4','P15','2021-01-01 00:00:00',259,32,22),
             ('SP19','G2','P18','2021-01-01 00:00:00',5530,4,179), ('SP17','G1','P13','2021-01-01 00:00:00',2184,63,122),
             ('SP20','G6','P04','2021-01-01 00:00:00',1057,295,71),('SP14','G5','P16','2021-01-01 00:00:00',1036,370,37),
             ('SP10','G5','P17','2021-01-01 00:00:00',4039,536,176),('SP06','G4','P01','2021-01-01 00:00:00',12894,115,478),
             ('SP18','G2','P01','2021-01-01 00:00:00',4669,121,180),('SP04','G4','P16','2021-01-01 00:00:00',6377,184,246),
             ('SP22','G3','P05','2021-01-01 00:00:00',4599,106,256),('SP22','G2','P09','2021-01-01 00:00:00',2751,228,251),
             ('SP10','G1','P06','2021-01-01 00:00:00',15596,32,975),('SP06','G1','P11','2021-01-01 00:00:00',8561,111,330),
             ('SP25','G6','P05','2021-01-01 00:00:00',14273,335,752),('SP02','G4','P13','2021-01-01 00:00:00',2506,99,148),
             ('SP19','G3','P10','2021-01-01 00:00:00',2387,134,89),('SP09','G2','P07','2021-01-01 00:00:00',7553,67,280),
             ('SP22','G4','P22','2021-01-01 00:00:00',3409,93,171),('SP15','G2','P22','2021-01-01 00:00:00',3878,24,216),
             ('SP12','G2','P04','2021-01-01 00:00:00',3052,76,204),('SP18','G2','P21','2021-01-04 00:00:00',19229,64,1013),
             ('SP15','G6','P21','2021-01-04 00:00:00',1988,179,95),('SP12','G6','P09','2021-01-04 00:00:00',147,9,11),
             ('SP20','G6','P12','2021-01-04 00:00:00',2401,407,134),('SP11','G2','P17','2021-01-04 00:00:00',2814,296,94),
             ('SP06','G6','P17','2021-01-04 00:00:00',5390,61,216),('SP23','G3','P02','2021-01-04 00:00:00',3920,16,262),
             ('SP19','G3','P19','2021-01-04 00:00:00',7539,502,943),('SP23','G1','P16','2021-01-05 00:00:00',17248,163,664),
             ('SP18','G6','P03','2021-01-05 00:00:00',1176,152,66),('SP17','G5','P13','2021-01-05 00:00:00',9730,361,573),
             ('SP16','G4','P13','2021-01-05 00:00:00',2226,129,140),('SP18','G6','P12','2021-01-05 00:00:00',7063,250,643),
             ('SP07','G4','P11','2021-01-05 00:00:00',7399,420,275),('SP04','G2','P09','2021-01-05 00:00:00',4284,230,306),
             ('SP07','G4','P04','2021-01-05 00:00:00',4865,168,271),('SP06','G4','P19','2021-01-05 00:00:00',3780,111,315),
             ('SP13','G1','P09','2021-01-05 00:00:00',3059,484,279),('SP11','G6','P11','2021-01-05 00:00:00',6622,57,276),
             ('SP04','G1','P20','2021-01-06 00:00:00',644,116,34),('SP08','G1','P11','2021-01-06 00:00:00',4935,87,171),
             ('SP13','G6','P22','2021-01-06 00:00:00',7182,29,378),('SP09','G5','P09','2021-01-06 00:00:00',539,10,77),
             ('SP20','G6','P19','2021-01-06 00:00:00',637,79,91),('SP07','G2','P15','2021-01-06 00:00:00',1470,57,184),
             ('SP10','G2','P13','2021-01-06 00:00:00',1442,108,61),('SP11','G2','P20','2021-01-06 00:00:00',9023,224,564),
             ('SP03','G6','P01','2021-01-06 00:00:00',2709,27,101),('SP19','G3','P21','2021-01-07 00:00:00',5733,193,338),
             ('SP05','G3','P02','2021-01-07 00:00:00',10451,155,1307),('SP18','G1','P18','2021-01-07 00:00:00',11228,236,388),
             ('SP15','G6','P17','2021-01-07 00:00:00',3073,137,129),('SP09','G5','P13','2021-01-07 00:00:00',5467,109,288),
             ('SP08','G2','P20','2021-01-07 00:00:00',4067,272,226),('SP02','G1','P05','2021-01-08 00:00:00',2814,69,149),
             ('SP24','G4','P17','2021-01-08 00:00:00',2716,299,105),('SP22','G5','P09','2021-01-08 00:00:00',3570,61,325);
							  

/* Display the name of the top 5 salesperson, and the total amount he/she made through sales */
SELECT p.salesperson, SUM(s.amount) AS total_amount
FROM sales s JOIN people p
			 ON s.spid=p.spid
GROUP BY p.salesperson
ORDER BY total_amount DESC
LIMIT 5;


/* Display the name of the top 5 salespersons, country and the total number of customers they served */
SELECT p.spid, p.salesperson, g.geoid, g.geo, SUM(s.customers) AS total_customers_served
FROM sales s JOIN people p ON s.spid=p.spid
             JOIN geo g ON s.geoid=g.geoid
GROUP BY p.salesperson, g.geoid, g.geo
ORDER BY total_customers_served DESC
LIMIT 5;


/* Find the top 5 products that were sold and in which country */
SELECT pr.product, g.geo, SUM(boxes) AS total_units_sold
FROM sales s JOIN products pr ON s.pid=pr.pid
             JOIN geo g on s.geoid=g.geoid
GROUP BY pr.product, g.geo
ORDER BY total_units_sold DESC
LIMIT 5;

/* Find the minimum and maximum number of units sold for each product */
SELECT pr.pid, pr.product, MIN(s.boxes) AS min_units_sold, MAX(boxes) AS max_units_sold
FROM sales s JOIN products pr ON s.pid=pr.pid
GROUP BY pr.pid
ORDER BY pr.pid;



/* ----------------JOIN and Subqueries -----------------------*/
Find the products whose sales did not show any traction, ie, there wasnt any increase or decrease in the sales
SELECT pid, product, min_units_sold, max_units_sold
FROM (
      SELECT pr.pid, pr.product, MIN(s.boxes) AS min_units_sold, MAX(boxes) AS max_units_sold
      FROM sales s JOIN products pr ON s.pid=pr.pid
      GROUP BY pr.pid
      ORDER BY pr.pid
     ) AS min_max_sold
WHERE min_units_sold=max_units_sold
ORDER BY pid;