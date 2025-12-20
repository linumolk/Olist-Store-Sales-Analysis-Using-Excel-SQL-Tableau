CREATE DATABASE olist_store;

USE olist_store;

-- TABLE CREATION

-- 1.OLIST CUSTOMER DATASET

CREATE TABLE `cleaned_olist_customer` (
  `Customer_Id` VARCHAR (50),
  `Customer_Unique_Id` VARCHAR (50) ,
  `Customer_Zip_Code_Prefix` VARCHAR (15) , 
  `Customer_City` VARCHAR (50) ,
  `Customer_State` VARCHAR (50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_olist_customer.csv'
INTO TABLE cleaned_olist_customer
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- 2. OLIST GEOLOCATION DATASET

CREATE TABLE `cleaned_olist_geolocation` (
  `Geolocation_Zip_Code_Prefix` VARCHAR (50) NOT NULL,
  `Geolocation_Lat` DECIMAL (9,6) ,
  `Geolocation_Lng` DECIMAL (9,6),
  `Geolocation_City` VARCHAR (50),
  `Geolocation_State` VARCHAR (50)
) ;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_olist_geolocation.csv'
INTO TABLE cleaned_olist_geolocation
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- 3. OLIST ORDER ITEMS DATASET

CREATE TABLE `cleaned_olist_order_items` (
  `Order_Id` VARCHAR (50) ,
  `Order_Item_Id` INT,
  `Product_Id` VARCHAR (50),
  `Seller_Id` VARCHAR (50),
  `Shipping_Limit_Date` VARCHAR (30) ,
  `Price` DECIMAL (10,2) ,
  `Freight_Value` DECIMAL (10,2) ,
  `Total_Price` DECIMAL (10,2)
) ;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_olist_order_items.csv'
INTO TABLE cleaned_olist_order_items
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 4. OLIST ORDER PAYMENTS DATASET

CREATE TABLE `cleaned_olist_order_payments` (
  `Order_Id` VARCHAR (50),
  `Payment_Sequential` INT ,
  `Payment Type` VARCHAR (20),
  `Payment_Installments` INT ,
  `Payment_Value` DECIMAL (10,2)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_olist_order_payments.csv'
INTO TABLE cleaned_olist_order_payments
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 5. OLIST ORDERS DATASET

CREATE TABLE `cleaned_olist_orders` (
  `Order_Id` VARCHAR (50),
  `Customer_Id` VARCHAR (50),
  `Order_Status` VARCHAR (20) NULL,
  `Order_Purchase_Timestamp` VARCHAR (50) NULL,
  `Order_Approved_At` VARCHAR (50) NULL,
  `Order_Delivered_Carrier_Date` VARCHAR (50) NULL,
  `Order_Delivered_Customer_Date` VARCHAR (50) NULL,
  `Order_Estimated_Delivery_Date` VARCHAR (50) NULL,
  `Order_purchased_Year` INT NULL,
  `Purchased_Month` VARCHAR (20) NULL,
  `Purchased_Day` VARCHAR (20) NULL,
  `weekday_num` INT NULL,
  `weekday / weekend` VARCHAR (20) NULL,
  `Delivery_Duration` INT NULL);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_olist_orders.csv'
INTO TABLE cleaned_olist_orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 6. OLIST PRODUCTS DATASET

CREATE TABLE `cleaned_olist_products` (
  `Product_Id` VARCHAR (50),
  `Product_Category_Name` VARCHAR (50),
  `Product_Name_Length` INT,
  `Product_Description_Length` INT ,
  `Product_Photos_Qty` INT ,
  `Product_Weight_G` INT ,
  `Product_Length_Cm` INT ,
  `Product_Height_Cm` INT ,
  `Product_Width_Cm` INT 
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_olist_products.csv'
INTO TABLE cleaned_olist_products
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 7. OLIST SELLERS DATASET

CREATE TABLE `cleaned_olist_sellers` (
  `Seller_Id` VARCHAR (50),
  `Seller_Zip_Code_Prefix` VARCHAR (50),
  `Seller_City` VARCHAR (50),
  `Seller_State` VARCHAR (50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_olist_sellers.csv'
INTO TABLE cleaned_olist_sellers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 8. OLIST ORDER REVIEWS DATASET

CREATE TABLE `cleaned_order_reviews` (
  `Review_Id` VARCHAR (50),
  `Order_Id` VARCHAR (50),
  `Review_Score` INT ,
  `Review_Creation_Date` VARCHAR (50),
  `Review_Answer_Date` VARCHAR(50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_order_reviews.csv'
INTO TABLE cleaned_order_reviews
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 9. OLIST PRODUCT CATEGORY NAME ENGLISH TRANSLATION DATASET

CREATE TABLE `cleaned_prod_category_name_trans` (
  `Product Category Name` VARCHAR (50),
  `Product Category Name English` VARCHAR (50)
) ;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_prod_category_name_trans.csv'
INTO TABLE cleaned_prod_category_name_trans
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- ENSURED ALL ROWS HAVE BEEN IMPORTED

SELECT count(*) FROM `cleaned_olist_customer`;
SELECT count(*) FROM `cleaned_olist_geolocation`;
SELECT count(*) FROM `cleaned_olist_order_items`;
SELECT count(*) FROM `cleaned_olist_order_payments`;
SELECT count(*) FROM `cleaned_olist_orders`;
SELECT count(*) FROM `cleaned_olist_products`;
SELECT count(*) FROM `cleaned_olist_sellers`;
SELECT count(*) FROM `cleaned_order_reviews`;
SELECT count(*) FROM `cleaned_prod_category_name_trans`;


-- DEFINED PRIMARY KEYS 

ALTER TABLE `cleaned_olist_customer` ADD PRIMARY KEY (`Customer_Id`);

ALTER TABlE `cleaned_olist_orders` ADD PRIMARY KEY (`Order_Id`);

ALTER TABLE `cleaned_olist_products` ADD PRIMARY KEY (`Product_Id`);

ALTER TABLE `cleaned_olist_sellers` ADD PRIMARY KEY  (`Seller_Id`);

ALTER TABLE `cleaned_prod_category_name_trans` ADD PRIMARY KEY (`Product Category Name`);


-- ENSURED ALL ROWS OF FOREIGN KEY EXISTS IN PRIMARY KEY

-- Olist_Order_Reviews <-> Olist_Orders (Order_Id)

SELECT DISTINCT Order_Id
FROM cleaned_order_reviews
WHERE cleaned_order_reviews.Order_Id
NOT IN (SELECT Order_Id FROM cleaned_olist_orders);

-- Olist_Order_Payments <-> Olist_Orders (Order_Id)

SELECT DISTINCT Order_Id
FROM cleaned_olist_order_payments
WHERE cleaned_olist_order_payments.Order_Id
NOT IN (SELECT Order_Id FROM cleaned_olist_orders);

-- Olist_Order_Items <-> Olist_Orders (Order_Id)

SELECT DISTINCT Order_Id
FROM cleaned_olist_order_items
WHERE cleaned_olist_order_items.Order_Id
NOT IN (SELECT Order_Id FROM cleaned_olist_orders);


-- Olist_Order_Items <-> Olist_Products (Product_Id)

SELECT DISTINCT cleaned_olist_order_items.Product_Id
FROM cleaned_olist_order_items
WHERE cleaned_olist_order_items.Product_Id
NOT IN (SELECT Product_Id FROM cleaned_olist_products);

-- DELETED Missing Product_Ids from Table Order_Items

DELETE FROM `cleaned_olist_order_items` WHERE `Product_Id` NOT IN 
(SELECT Product_Id FROM cleaned_olist_products);


-- Olist_products <-> Product_category_Name_Eng_Translation (Product_Category_Name)

SELECT DISTINCT `Product_Category_Name`
FROM cleaned_olist_products
WHERE `Product_Category_Name`
NOT IN (SELECT `Product Category Name` FROM `cleaned_prod_category_name_trans`);


-- INSERTED Missing Product Category Name from Table Olist Products to Prod_Category_Name_translation

INSERT INTO `cleaned_prod_category_name_trans` (`Product Category Name`, `Product Category Name English`)
VALUES 
('Pc Gamer', 'Pc Gamer'),
('Portateis Cozinha E Preparadores De Alimentos', 'Kitchen Laptops and Food Preparers');


-- DEFINED FOREIGN KEYS

-- Olist_Orders <-> Olist_Customer (Customer_Id)

ALTER TABLE `cleaned_olist_orders` ADD CONSTRAINT  fk_cust_id FOREIGN KEY (`Customer_Id`)
REFERENCES `cleaned_olist_customer`(`Customer_Id`);

-- Olist_Order_Reviews <-> Olist_Orders (Order_Id)

ALTER TABLE `cleaned_order_reviews` ADD CONSTRAINT  fk_ord_id FOREIGN KEY (`Order_Id`)
REFERENCES `cleaned_olist_orders`(`Order_Id`);

-- Olist_Order_Payments <-> Olist_Orders (Order_Id)

ALTER TABLE `cleaned_olist_order_payments` ADD CONSTRAINT fk_ord_id_ord_payments FOREIGN KEY (`Order_Id`)
REFERENCES  `cleaned_olist_orders`(`Order_Id`);

-- Olist_Order_Items <-> Olist_Orders (Order_Id)

ALTER TABLE `cleaned_olist_order_items` ADD CONSTRAINT fk_ord_id_ord_items FOREIGN KEY (`Order_Id`)
REFERENCES  `cleaned_olist_orders`(`Order_Id`);

-- Olist_Sellers <-> Olist_Order_Items (Seller_Id)

ALTER TABLE `cleaned_olist_order_items` ADD CONSTRAINT fk_seller_id FOREIGN KEY (`Seller_Id`)
REFERENCES `cleaned_olist_sellers` (`Seller_Id`);

-- Olist_Order_Items <-> Olist_Products (Product_Id)

ALTER TABLE `cleaned_olist_order_items` ADD CONSTRAINT fk_prod_id_ord_items FOREIGN KEY (`Product_Id`)
REFERENCES `cleaned_olist_products` (`Product_Id`);

-- Olist_products <-> Product_category_Name_Eng_Translation (Product_Category_Name)
  
ALTER TABLE `cleaned_olist_products` ADD CONSTRAINT fk_prod_name FOREIGN KEY (`Product_Category_Name`)
REFERENCES `cleaned_prod_category_name_trans` (`Product Category Name`);


-- MODIFIED DATA TYPES OF DATES TO SQL FORMRAT

-- Table : Olist_Order_Items

-- Column : Shipping_Limit_Date
UPDATE `cleaned_olist_order_items`
SET `Shipping_Limit_Date` = STR_TO_DATE(`Shipping_Limit_Date`, '%d-%m-%Y %H:%i');

ALTER TABLE `cleaned_olist_order_items`
MODIFY COLUMN `Shipping_Limit_Date` DATETIME;

 -- Table : Olist_Orders
 
-- Column : Order_Purchase_Timestamp
UPDATE `cleaned_olist_orders`
SET `Order_Purchase_Timestamp` = STR_TO_DATE(`Order_Purchase_Timestamp`, '%d-%m-%Y %H:%i');

ALTER TABLE `cleaned_olist_orders`
MODIFY COLUMN `Order_Purchase_Timestamp` DATETIME;


-- Column : Order_Approved_At

UPDATE cleaned_olist_orders 
SET Order_Approved_At = NULL 
WHERE Order_Approved_At = '';

UPDATE `cleaned_olist_orders`
SET `Order_Approved_At` = STR_TO_DATE(`Order_Approved_At`, '%d-%m-%Y %H:%i')
WHERE `Order_Approved_At` IS NOT NULL;

ALTER TABLE `cleaned_olist_orders`
MODIFY COLUMN `Order_Approved_At` DATETIME;


-- Column : Order_Delivered_Carrier_Date

UPDATE cleaned_olist_orders 
SET `Order_Delivered_Carrier_Date` = NULL 
WHERE `Order_Delivered_Carrier_Date` = '';

UPDATE `cleaned_olist_orders`
SET `Order_Delivered_Carrier_Date` = STR_TO_DATE(`Order_Delivered_Carrier_Date`, '%d-%m-%Y %H:%i');

ALTER TABLE `cleaned_olist_orders`
MODIFY COLUMN `Order_Delivered_Carrier_Date` DATETIME;


-- Column : Order_Delivered_Customer_Date

UPDATE cleaned_olist_orders 
SET `Order_Delivered_Customer_Date`  = NULL 
WHERE `Order_Delivered_Customer_Date`  = '';

UPDATE `cleaned_olist_orders`
SET `Order_Delivered_Customer_Date` = STR_TO_DATE(`Order_Delivered_Customer_Date`, '%d-%m-%Y %H:%i');

ALTER TABLE `cleaned_olist_orders`
MODIFY COLUMN `Order_Delivered_Customer_Date` DATETIME;

-- Column : Order_Estimated_Delivery_Date
UPDATE `cleaned_olist_orders`
SET `Order_Estimated_Delivery_Date` = STR_TO_DATE(`Order_Estimated_Delivery_Date`, '%d-%m-%Y');

ALTER TABLE `cleaned_olist_orders`
MODIFY COLUMN `Order_Estimated_Delivery_Date` DATE;


-- EXPLORATORY DATA ANALYSIS

-- KPIs

-- 1. Weekday Vs Weekend (order_purchase_timestamp) Payment Statistics.

SELECT o.`Weekday / Weekend` , SUM(`Payment_Value`) AS Total_Payment
FROM `cleaned_olist_orders` AS o JOIN `cleaned_olist_order_payments` AS op
ON o.Order_Id = op.Order_Id 
GROUP BY o.`Weekday / Weekend`;

-- 2. Number of Orders with review score 5 and payment type as credit card.

SELECT r.`Review_Score`, op.`Payment Type`, COUNT(r.Order_Id) AS No_of_Orders
FROM `cleaned_order_reviews` AS r 
JOIN `cleaned_olist_order_payments` AS op
ON r.Order_Id = op.Order_Id
WHERE r.`Review_Score` = 5 AND op.`Payment Type` = 'Credit Card';

-- 3. Average number of days taken for order_delivered_customer_date for pet_shop.

SELECT p.`Product_Category_Name` AS Product_Category ,
AVG(o.`Delivery_Duration`) AS AVG_No_of_Days
FROM `cleaned_olist_products` AS p
JOIN `cleaned_olist_order_items` AS oi
ON oi.Product_Id = p.Product_Id
JOIN `cleaned_olist_orders` AS o
ON o.Order_Id = oi.Order_Id
WHERE p.`Product_Category_Name` = "Pet Shop";

-- 4. Average price and payment values from customers of sao paulo city

SELECT c.`Customer_City`, AVG(oi.Price) AS AVG_Price , 
AVG(op.Payment_Value) AS AVG_Payment_Value
FROM`cleaned_olist_customer` AS c
JOIN`cleaned_olist_orders` AS o
ON c.Customer_Id = o.Customer_Id
JOIN`cleaned_olist_order_items` AS oi
ON o.Order_Id = oi.Order_Id
JOIN `cleaned_olist_order_payments` AS op
ON oi.Order_Id = op.Order_Id
WHERE c.`Customer_City` = "Sao Paulo";


-- 5. Relationship between shipping days 
-- (order_delivered_customer_date - order_purchase_timestamp) Vs review scores.

-- Impact of Review on delivery duration

SELECT o.Delivery_Duration AS `Delivey_Duration (Days)`, r.Review_Score
FROM `cleaned_order_reviews` AS r 
JOIN `cleaned_olist_orders` AS o 
ON o.Order_Id = r.Order_Id
GROUP BY o.`Delivery_Duration`, r.`Review_Score`
ORDER BY r.Review_Score DESC;

-- OLIST OVERALL PERFORMANCE 

-- 6. Total Number of Orders, Total Sales, Average Sales and Average Review Score

SELECT COUNT(o.Order_Id)AS Total_Orders, SUM(op.Payment_Value) AS Total_Sales, 
AVG(op.Payment_Value) AS Average_Sales, AVG(r.Review_Score) AS Average_Review_Score
FROM `cleaned_olist_order_payments` AS op
JOIN `cleaned_order_reviews` AS r
ON op.Order_Id = r.Order_Id
JOIN cleaned_olist_orders AS o
ON o.Order_Id = r.Order_Id
WHERE o.Order_Status NOT IN ("created");


-- OLIST SALES AND ORDER TREND OVER TIME

-- 7. Days with highest order count

SELECT Purchased_Day , COUNT(Order_Id) AS Order_Count
FROM cleaned_olist_orders AS o
GROUP BY  Purchased_Day
ORDER BY COUNT(Order_Id) DESC;


-- 8. Sales Performance in Each Month

SELECT o.`Purchased_Month` AS Months, SUM(op.`Payment_Value`) AS Total_Sales 
FROM `cleaned_olist_orders` AS o
JOIN `cleaned_olist_order_payments` AS op
ON o.Order_Id = op.Order_Id
GROUP BY o.`Purchased_Month`
ORDER BY Total_Sales DESC;

-- 9. Year Wise Total Sales

SELECT o.`Order_purchased_Year` AS `Year`, SUM(op.`Payment_Value`) AS Total_Sales
FROM `cleaned_olist_orders` AS o
JOIN `cleaned_olist_order_payments` AS op
ON op.Order_Id = o.Order_Id
GROUP BY `Year` ORDER BY Total_Sales DESC;


-- ORDER STATUS 

-- 10. Order Count by Order Status

SELECT Order_Status, COUNT(Order_Status) AS `Count` 
FROM `cleaned_olist_orders`
GROUP BY Order_Status 
ORDER BY COUNT(Order_Status) DESC;

-- 11. Year Wise Order Count and Cancellation Trend

SELECT `Order_purchased_Year` As `Year`, COUNT(Order_Id) AS Order_Count,
SUM(Order_Status = 'canceled') AS Canceled_Orders, 
SUM(Order_Status = "Canceled") * 100 / COUNT(Order_Id) AS Cancellation_Rate
FROM cleaned_olist_orders
GROUP BY `Year`
ORDER BY COUNT(Order_Id) DESC ;

-- OLIST PRODUCTS PERFORMANCE 

-- 12. Top 5 and Bottom 5 Products by Order Count

SELECT pt.`Product Category Name English` AS `Top 5 Products`, 
COUNT(oi.Order_Id) AS Total_Orders,
RANK () OVER (ORDER BY SUM(op.`Payment_Value`) DESC ) AS `Rank`
FROM `cleaned_prod_category_name_trans` AS pt
JOIN `cleaned_olist_products` AS p 
ON pt.`Product Category Name` = p.`Product_Category_Name`
JOIN `cleaned_olist_order_items` AS oi
ON p.Product_Id = oi.Product_Id 
JOIN `cleaned_olist_order_payments` AS op
ON op.Order_Id = oi.Order_Id
GROUP BY `Top 5 Products`
ORDER BY SUM(op.`Payment_Value`) DESC LIMIT 5;

-- Bottom 5 Products

SELECT pt.`Product Category Name English` AS `Bottom 5 Products`, 
COUNT(oi.Order_Id),
RANK () OVER (ORDER BY SUM(op.`Payment_Value`) ASC ) AS `Rank`
FROM `cleaned_prod_category_name_trans` AS pt
JOIN `cleaned_olist_products` AS p 
ON pt.`Product Category Name` = p.`Product_Category_Name`
JOIN `cleaned_olist_order_items` AS oi
ON p.Product_Id = oi.Product_Id 
JOIN `cleaned_olist_order_payments` AS op
ON op.Order_Id = oi.Order_Id
GROUP BY `Bottom 5 Products`
ORDER BY SUM(op.`Payment_Value`) ASC LIMIT 5;

-- 13. Most Ordered Product and their Average review score 

SELECT  pt.`Product Category Name English` AS Products, 
COUNT(o.Order_Id) AS Order_Count,
AVG (R.review_Score) AS Review_Score
FROM `cleaned_prod_category_name_trans` AS pt
JOIN `cleaned_olist_products` AS p 
ON pt.`Product Category Name` = p.`Product_Category_Name`
JOIN `cleaned_olist_order_items` AS oi
ON oi.Product_Id = p.Product_Id
JOIN `cleaned_olist_orders` AS o
ON oi.Order_Id = o.Order_Id
JOIN `cleaned_order_reviews` AS r
ON r.Order_Id = o.Order_Id
GROUP BY  pt.`Product Category Name English` ORDER BY Order_Count DESC;

-- 14. Products having High Review Score .

 SELECT pt.`Product Category Name English` AS Products, r.Review_Score AS Review_Score,
 COUNT(r.Review_Score) AS Review_Count
 FROM `cleaned_prod_category_name_trans` AS pt
 JOIN `cleaned_olist_products` p
 ON pt.`Product Category Name` = p.`Product_Category_Name`
 JOIN `cleaned_olist_order_items` AS oi
 ON oi.Product_Id = p.Product_Id
 JOIN `cleaned_order_reviews` AS r
 ON r.Order_Id = oi.Order_Id
 WHERE Review_Score >= 4 
 GROUP BY Products, Review_Score
 ORDER BY r.Review_Score DESC, Review_Count ;

-- CUSTOMER BEHAVIOUR

-- 15. Most preferred Payment Type by the customers

SELECT `Payment Type`, COUNT(Order_Id) AS Count
FROM `cleaned_olist_order_payments`
GROUP BY `Payment Type` 
ORDER BY Count DESC;

-- 16. Customers with more than 1 Order and the Product

SELECT c.Customer_Unique_Id AS Customer_Id, COUNT(DISTINCT o.Order_Id) AS Order_Count, 
pt.`Product Category Name English` AS Product
FROM `cleaned_prod_category_name_trans` AS pt
JOIN `cleaned_olist_products` p
ON pt.`Product Category Name` = p.`Product_Category_Name`
JOIN `cleaned_olist_order_items` AS oi
ON oi.Product_Id = p.Product_Id
JOIN `cleaned_olist_orders` AS o
ON o.Order_Id = oi.Order_Id
JOIN `cleaned_olist_customer` AS c
ON c.Customer_Id = o.Customer_Id
GROUP BY c.Customer_Unique_Id, Product
HAVING Order_Count > 1
ORDER BY Order_Count DESC;


-- 17. Top 10 City with High Customer Density and their Sales Performance


SELECT c.`Customer_City` AS Top_10_Cities, 
COUNT(c.Customer_Unique_Id) AS Customer_Count,
SUM(op.`Payment_Value`) AS Total_Sales,
RANK() OVER (ORDER BY SUM(op.`Payment_Value`) DESC) AS `Rank`
FROM `cleaned_olist_customer` AS c
JOIN `cleaned_olist_orders` AS o
ON c.Customer_Id = o.Customer_Id
JOIN `cleaned_olist_order_payments` AS op
ON op.Order_Id = o.Order_Id
GROUP BY c.`Customer_City` ORDER BY Total_Sales DESC LIMIT 10;

-- OLIST SELLER AND THEIR PRODUCT

-- 18. Top 10 Sellers and their Products with Highest Sales
 
SELECT s.Seller_Id AS Seller_Id, pt.`Product Category Name English` AS Product,
SUM(Total_Price) AS Total_Sales,
RANK () OVER (ORDER BY SUM(Total_Price) DESC) AS `Rank`
FROM `cleaned_prod_category_name_trans` AS pt
JOIN `cleaned_olist_products` AS p 
ON pt.`Product Category Name` = p.`Product_Category_Name`
JOIN `cleaned_olist_order_items` AS oi
ON p.Product_id = oi.Product_Id
JOIN `cleaned_olist_sellers` AS s
ON s.Seller_Id = oi.Seller_Id
GROUP BY Seller_Id, Product ORDER BY Total_Sales DESC LIMIT 10;


