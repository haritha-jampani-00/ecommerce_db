set search_path to public;

----Query 1: Select all columns and all rows from one table (5 points)
SELECT * FROM customer;	

----Query 2: Select five columns and all rows from one table (5 points)
SELECT order_id, customer_id, total_quantity, total_amount, order_status 
FROM orders;

----Query 3: Select all columns from all rows from one view (5 points)
SELECT * FROM OrderDetails;

----Query 4: Using a join on 2 tables, select all columns and all rows from the tables without the use of a Cartesian product (5 points)
SELECT * 
FROM customer c LEFT OUTER JOIN orders o
	ON c.customer_id = o.customer_id ;
	
----Query 5: Select and order data retrieved from one table (5 points)
SELECT * FROM orders
ORDER BY delivery_date ;

----Query 6: Using a join on 3 tables, select 5 columns from the 3 tables. Use syntax that would limit the output to 10 rows (5 points)
SELECT c.customer_id, c.cust_lname, o.order_id, o.total_amount, p.payment_status
FROM customer c INNER JOIN orders o ON c.customer_id = o.customer_id
            INNER JOIN payment p ON c.customer_id = p.customer_id
			limit 10;


----Query 7: Select distinct rows using joins on 3 tables (5 points)
SELECT DISTINCT *
FROM customer c INNER JOIN orders o ON c.customer_id = o.customer_id
            INNER JOIN payment p ON c.customer_id = p.customer_id ;

----Query 8: Use GROUP BY and HAVING in a select statement using one or more tables (5 points)
SELECT pr.product_id, pr.product_name, s.supplier_id, s.supplier_name, pr.product_price
FROM product pr INNER JOIN supplier s ON pr.product_id = s.product_id
GROUP BY pr.product_id, pr.product_name, s.supplier_id, s.supplier_name, pr.product_price
HAVING pr.product_price = '999.00' ;

----Query 9: Use IN clause to select data from one or more tables (5 points)
SELECT * FROM customer
WHERE customer_id IN ('1001', '1003', '1005');

----Query 10: Select length of one column from one table (use LENGTH function) (5 points)
SELECT LENGTH(cust_address) FROM customer; 


----Query 11: Delete one record from one table. Use select statements to demonstrate the table contents before and after the DELETE statement. Make sure you use ROLLBACK
----afterwards so that the data will not be physically removed (5 points)

-- Display data before deletion
SELECT * FROM Product;

-- Temporarily remove reference from Supplier
DELETE FROM Supplier WHERE Product_ID = '3003';
DELETE FROM Orders_Product WHERE Product_ID = '3003';

-- Delete the product
DELETE FROM Product WHERE Product_ID = '3003';

-- Display data after deletion
SELECT * FROM Product;


-- Rollback the transaction
ROLLBACK;


----Query 12: Update one record from one table. Use select statements to demonstrate the table contents before and after the UPDATE statement. Make sure you use ROLLBACK
----afterwards so that the data will not be physically removed (5 points)

SELECT * FROM supplier;

UPDATE supplier
SET supply_frequency = 'Monthly'
WHERE supplier_name = 'Apple Inc.';

SELECT * FROM supplier;
ROLLBACK;

--Advanced Query 1: Supplier Reliability Report
---This query generates a report on supplier reliability by comparing the estimated and actual delivery dates of products. It involves a sub-query to get the earliest order date per product.
SELECT 
    s.Supplier_Name,
    p.Product_Name,
    p.Estimated_Delivery_Date,
    MIN(o.Delivery_Date) AS Actual_Delivery_Date,
    CASE 
        WHEN MIN(o.Delivery_Date) <= p.Estimated_Delivery_Date THEN 'On Time'
        ELSE 'Delayed'
    END AS Delivery_Status
FROM Supplier s
JOIN Product p ON s.Product_ID = p.Product_ID
JOIN Orders_Product op ON p.Product_ID = op.Product_ID
JOIN Orders o ON op.Order_ID = o.Order_ID
GROUP BY s.Supplier_Name, p.Product_Name, p.Estimated_Delivery_Date
ORDER BY s.Supplier_Name, Delivery_Status;


--Advanced Query 2: Customer Spending Analysis by Payment Method
SELECT 
    c.cust_Fname || ' ' || c.cust_LName AS Customer_Name,
    p.Payment_Method,
    COUNT(*) AS Number_of_Orders,
    SUM(p.Payment_Amount) AS Total_Spent,
    CASE 
        WHEN SUM(p.Payment_Amount) > 500 THEN 'High Spender'
        WHEN SUM(p.Payment_Amount) BETWEEN 200 AND 500 THEN 'Medium Spender'
        ELSE 'Low Spender'
    END AS Spending_Category
FROM Payment p
JOIN Customer c ON p.Customer_ID = c.Customer_ID
GROUP BY c.cust_Fname, c.cust_LName, p.Payment_Method
ORDER BY Total_Spent DESC;

--Advanced Query3 with Subquery: Identifying High Spending Customers

SELECT 
    c.cust_Fname || ' ' || c.cust_LName AS Customer_Name,
    COUNT(p.Payment_ID) AS Number_of_Payments,
    SUM(p.Payment_Amount::numeric) AS Total_Spending
FROM Customer c
JOIN Payment p ON c.Customer_ID = p.Customer_ID
GROUP BY c.Customer_ID, c.cust_Fname, c.cust_LName
HAVING SUM(p.Payment_Amount::numeric) > (
    SELECT AVG(Total_Amount::numeric)
    FROM (
        SELECT 
            Customer_ID, 
            SUM(Payment_Amount::numeric) AS Total_Amount
        FROM Payment
        GROUP BY Customer_ID
    ) AS SubQuery
)
ORDER BY Total_Spending DESC;