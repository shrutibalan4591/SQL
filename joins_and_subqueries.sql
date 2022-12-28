SHOW DATABASES;
USE testdb;

select * from sales limit 10;
select * from geo;

/* Inner Join example */
SELECT s.SPID, s.Amount, g.Geo
FROM sales s INNER JOIN geo g 
             ON s.GeoID=g.GeoID
LIMIT 10;

/* Alternative */
SELECT s.SPID, s.Amount, g.Geo
FROM sales s JOIN geo g 
             ON s.GeoID=g.GeoID
LIMIT 10;

/*----------------------------------------------------------------*/
/* Left Oter Join */
SELECT *
FROM A a LEFT OUTER JOIN B b 
         ON a.num=b.num;


/*----------------------------------------------------------------*/
/* Right Outer Join */
SELECT *
FROM A a Right OUTER JOIN B b 
         ON a.num=b.num;


/*----------------------------------------------------------------*/
/* --------------------------Subqueries-------------------------- */

/* Example : Display products whose cost per box is lesser than that of product P02 (2.57) */
SELECT *
FROM products
WHERE Cost_per_box < (SELECT Cost_per_box
                      FROM products
                      WHERE PID='P02');


/* Example : Display second highest sales amount */
SELECT MAX(Amount)
FROM sales
WHERE Amount < (SELECT MAX(Amount) 
                FROM sales);                    
/* Example : Display second highest sales amount (Another logic) */
SELECT MIN(Amount)
FROM (SELECT Amount
      FROM sales
      ORDER BY Amount DESC
      LIMIT 2) AS sub_tbl;


/* Example : Display the 10th largest sales amount  */
SELECT MIN(Amount)
FROM (SELECT Amount
      FROM sales
      ORDER BY Amount DESC
      LIMIT 10) AS sub_tbl;

/* Nested subqueries */
/* Example : Display all the sales made by the sales person who made the highest sales on any day */
SELECT SPID, Amount
FROM sales
WHERE SPID = (SELECT SPID
              FROM sales
              WHERE Amount=(SELECT MAX(Amount)
                            FROM sales))
ORDER BY Amount DESC;


/* Example : Display sales information on products whose category is that of the product 
   which made the highest sales any day */
SELECT * FROM sales
WHERE PID IN (SELECT PID 
            FROM products 
            WHERE Category = (SELECT Category 
                            FROM products 
                            WHERE PID = (SELECT PID 
                                        FROM sales 
                                        WHERE Amount = (SELECT MAX(Amount) 
                                                        FROM sales))));   


          