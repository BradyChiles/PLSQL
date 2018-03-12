/*
Brady Chiles
Assignment 1-1
5/28/17
*/

--Query 1 (1-1 problem 2)

SELECT idProduct, productname, price, active, type, idDepartment, stock
  FROM bb_product;
  
--Query 2 (1-1 problem 3)

SELECT idShopper, b.idBasket, b.orderplaced, b.dtordered, b.dtcreated
  FROM bb_shopper s INNER JOIN bb_basket b
    USING (idShopper);
 
 --Query 3 (1-1 problem 3)
 
SELECT idProduct, p.productname, pc.categoryname, pd.optionname
  FROM bb_product p INNER JOIN bb_productoption
    USING (idProduct)
      INNER JOIN bb_productoptiondetail pd
        USING (idOption)
          INNER JOIN bb_productoptioncategory pc
            USING (idOptioncategory);


--Independent--

--Query 4 (1-1 problem 1)

SELECT DISTINCT idProduct "Product ID"
  FROM bb_product p INNER JOIN bb_basketitem bi
    USING (idproduct)
      ORDER BY idProduct;
      
--Query 5 (1-1 problrm 2 *Modified per problem 3)

SELECT s.lastname, b.idbasket, bi.idproduct, p.productname, p.description
  FROM bb_shopper s INNER JOIN bb_basket b ON s.idshopper = b.idshopper
  INNER JOIN bb_basketitem bi ON b.idbasket = bi.idbasket
  INNER JOIN bb_product p ON bi.idproduct = p.idproduct;
    
  
  
SELECT s.lastname, b.idbasket, bi.idproduct, p.productname, p.description
  FROM bb_shopper s, bb_basket b, bb_basketitem bi, bb_product p
    WHERE s.idshopper = b.idshopper
      AND b.idbasket = bi.idbasket
        AND p.idproduct = bi.idproduct;
  
--Query 6 (1-1 problem 4)

SELECT idbasket, idshopper, TO_CHAR(dtcreated, 'MONTH DD, YYYY') "Date"
  FROM bb_basket
    WHERE dtcreated LIKE '%-FEB-12';

--Query 7 (1-1 problem 5  *Modified for problem 6)
SELECT idproduct "Product ID", SUM(quantity) "Quantity"
  FROM bb_basketitem 
    HAVING SUM(quantity) < 3
      GROUP BY idproduct;
      
--Query 8 (1-1 problem 7)

SELECT idproduct, productname, price
  FROM bb_product
    WHERE price > (SELECT AVG(price)
                      FROM bb_product);
                      
--Create Table 1 (1-1 Problem 8)
DROP TABLE contacts;
create table contacts(
  con_id number(4),
  company_name varchar2(30) NOT NULL,
  email varchar2(30),
  last_date date DEFAULT SYSDATE,
  con_cnt number(3),
    CONSTRAINT contacts_con_id_pk PRIMARY KEY (con_id),
    CONSTRAINT contacts_con_cnt_ck CHECK (con_cnt > 0)
);

--Inserting Data (1-1 problem 9)

INSERT INTO contacts
  VALUES(1478, 'BChiles Inc.', 'bchiles@bchiles.com', '01-DEC-89', 789);
  
INSERT INTO contacts
  VALUES(7895, 'BradyC Inc.', 'bradyc@bradyc.com', DEFAULT, 478);

COMMIT;

--Altering Input (1-1 problem 10)

SAVEPOINT ONE;

SELECT *
  FROM contacts;

UPDATE contacts
  SET last_date = '25-AUG-99'
  WHERE con_id = 1478;
  
COMMIT;  

SELECT *
  FROM contacts;
  
ROLLBACK TO ONE;

  
