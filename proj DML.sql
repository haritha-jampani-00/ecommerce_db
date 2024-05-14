set search_path to public;

-- Insert a new customer record
INSERT INTO Customer (Customer_ID, cust_Fname, cust_LName, Phone_no, cust_Email, cust_Address,created_by, date_created, modified_by,date_modified)
VALUES 
    (NEXTVAL('Customer_id_seq'), 'John', 'Doe', '1234567890', 'john.doe@example.com', '123 Main Street', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Customer_id_seq'), 'Jane', 'Smith', '2345678901', 'jane.smith@example.com', '234 Oak Avenue', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Customer_id_seq'), 'Alice', 'Johnson', '3456789012', 'alice.johnson@example.com', '345 Pine Road', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Customer_id_seq'), 'Bob', 'Brown', '4567890123', 'bob.brown@example.com', '456 Maple Lane', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Customer_id_seq'), 'Charlie', 'Davis', '5678901234', 'charlie.davis@example.com', '567 Cedar Blvd', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
	(NEXTVAL('Customer_id_seq'), 'Alex', 'Bay', '3456486012', 'alex.bay@example.com', '346 Pine Road', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Customer_id_seq'), 'Cobb', 'Brown', '4567894893', 'cobb.brown@example.com', '456 Mappleson Lane', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Customer_id_seq'), 'Sophie', 'Hightower', '5482101234', 'sophie.hightower@example.com', '567 Cedarpine Blvd', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
	(NEXTVAL('Customer_id_seq'), 'Cobber', 'Bron', '4567894823', 'cobber.bron@example.com', '456 Map Lane', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Customer_id_seq'), 'Slesha', 'Higher', '9162101234', 'slesha.higher@example.com', '567 Cedarpine Dr', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE);


select * from Customer;

-- Insert a new order record
INSERT INTO Orders (Order_ID, Customer_ID, Total_Quantity, Total_Amount, Order_Status, Payment_Status, Delivery_Date, Shipping_Address,created_by,date_created,modified_by,date_modified)
VALUES 
    (NEXTVAL('Order_id_seq'), '1001', 2, 100.00, 'Pending', 'Unpaid', '2023-10-31', '123 Main Street', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Order_id_seq'), '1003', 3, 200.00, 'Delivered', 'Paid', '2023-12-18', '234 Oak Avenue', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Order_id_seq'), '1005', 5, 50.00, 'Processing', 'Unpaid', NULL, '345 Pine Road', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Order_id_seq'), '1007', 7, 500.00, 'Delivered', 'Paid', '2023-12-15', '456 Maple Lane', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Order_id_seq'), '1009', 9, 75.00, 'Shipped', 'Paid', '2023-12-22', '567 Cedar Blvd', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
	(NEXTVAL('Order_id_seq'), '1011', 2, 100.00, 'Pending', 'Unpaid', '2023-10-31', '1253 Main Street', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Order_id_seq'), '1009', 3, 200.00, 'Delivered', 'Unpaid', '2023-12-18', '2314 Oaks Avenue', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Order_id_seq'), '1015', 5, 50.00, 'Processing', 'Unpaid', NULL, '3445 Pine Road', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Order_id_seq'), '1017', 7, 500.00, 'Delivered', 'Paid', '2023-12-15', '4596 Maple Lane', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Order_id_seq'), '1013', 9, 75.00, 'Shipped', 'Paid', '2023-12-22', '5367 Cedarcone Blvd', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE);

select * from Orders;

-- Insert a new product record
INSERT INTO Product (Product_ID, Inventory_Status, Product_Name, Description, Estimated_Delivery_Date, Product_price,created_by,date_created,modified_by,date_modified)
VALUES 
    (NEXTVAL('Product_id_seq'), 'In Stock', 'Apple iPhone 14 Pro', 'The latest iPhone from Apple', '2023-11-04', 999.00, 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Product_id_seq'), 'In Stock', 'Widget A', 'A useful widget', '2023-12-25', 25.00, 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Product_id_seq'), 'Out of Stock', 'Gadget B', 'An interesting gadget', '2024-01-05', 40.00, 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Product_id_seq'), 'In Stock', 'Tool C', 'A durable tool', '2023-12-30', 15.00, 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Product_id_seq'), 'In Stock', 'Appliance D', 'An essential appliance', '2023-12-20', 100.00, 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
	(NEXTVAL('Product_id_seq'), 'In Stock', 'Apple iPhone 13 Pro', 'iPhone from Apple', '2023-11-04', 999.00, 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Product_id_seq'), 'In Stock', 'Kids book', 'A writing book for kids', '2023-12-25', 25.00, 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Product_id_seq'), 'Out of Stock', 'Story book', 'An interesting story book', '2024-01-05', 40.00, 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Product_id_seq'), 'In Stock', 'Spanner kit', 'A mechanical tool', '2023-12-30', 15.00, 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Product_id_seq'), 'In Stock', 'Drone', 'A remote control gadget', '2023-12-20', 100.00, 'admin', CURRENT_DATE, 'admin', CURRENT_DATE);
	
select * from Product;

-- Insert a new supplier record
INSERT INTO Supplier (Supplier_ID, Product_ID, Supplier_Name, supplier_phone_no, Supply_Frequency, Supplying_Since, created_by, date_created, modified_by, date_modified)
VALUES 
    (NEXTVAL('Supplier_id_seq'), '3001', 'Apple Inc.', '8001234566', 'Monthly', '2010-01-01', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Supplier_id_seq'), '3003', 'Acme Corp', '8001234567', 'Monthly', '2018-01-01', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Supplier_id_seq'), '3005', 'Globex Inc', '8002345678', 'Weekly', '2019-05-15', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Supplier_id_seq'), '3007', 'Soylent Corp', '8003456789', 'Bi-Weekly', '2020-06-20', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Supplier_id_seq'), '3009', 'Initech LLC', '8004567890', 'Quarterly', '2018-07-30', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
	(NEXTVAL('Supplier_id_seq'), '3011', 'Apple Inc.', '8001234576', 'Monthly', '2010-01-01', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Supplier_id_seq'), '3015', 'SR Publication', '8001234777', 'Monthly', '2018-01-01', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Supplier_id_seq'), '3013', 'Shipping and Co', '8002346378', 'Weekly', '2019-05-15', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Supplier_id_seq'), '3017', 'Hard Corp', '8003126789', 'Bi-Weekly', '2020-06-20', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Supplier_id_seq'), '3019', 'Intel LLC', '9104567890', 'Quarterly', '2018-07-30', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE);

select * from Supplier;

-- Insert a new payment record
INSERT INTO Payment (Payment_ID, Customer_ID, Payment_Method, Time_Stamp, payment_Amount, Payment_Status, created_by, date_created, modified_by, date_modified)
VALUES 
    (NEXTVAL('Payment_id_seq'), '1001', 'Credit Card', '2023-10-31 17:18:50', 100.00, 'Paid', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Payment_id_seq'), '1003', 'Visa', '2023-11-01 10:00:00', 200.00, 'Unpaid', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Payment_id_seq'), '1005', 'MasterCard', '2023-11-02 11:00:00', 50.00, 'Paid', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Payment_id_seq'), '1007', 'PayPal', '2023-11-03 12:00:00', 500.00, 'Unpaid', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Payment_id_seq'), '1009', 'Visa', '2023-11-04 13:00:00', 275.00, 'Paid', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
	(NEXTVAL('Payment_id_seq'), '1011', 'Credit Card', '2023-01-31 17:18:50', 100.00, 'Paid', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Payment_id_seq'), '1013', 'Visa', '2023-12-01 10:00:00', 75.00, 'Unpaid', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Payment_id_seq'), '1015', 'MasterCard', '2023-11-02 11:00:00', 50.00, 'Paid', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Payment_id_seq'), '1017', 'PayPal', '2023-11-03 12:00:00', 500.00, 'Unpaid', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    (NEXTVAL('Payment_id_seq'), '1019', 'Visa', '2023-11-04 13:00:00', 0.00, 'Paid', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE);

select * from Payment;

--Insert into order_product table 
INSERT INTO Orders_Product (Order_ID, Product_ID, Quantity, Product_Price, Product_Category, created_by, date_created, modified_by, date_modified)
VALUES 
    ('2001', '3001', 2, 25.00, 'Electronics', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE), 
    ('2003', '3019', 1, 100.00, 'Electronics', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    ('2005', '3013', 2, 25.00, 'HouseHold', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE), 
    ('2007', '3019', 2, 100.00, 'Appliances', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    ('2009', '3003', 3, 25.00, 'Technology', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
	('2001', '3013', 2, 25.00, 'Electronics', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE), 
    ('2003', '3009', 1, 100.00, 'Electronics', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    ('2007', '3009', 1, 100.00, 'Hardware', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),  
    ('2007', '3003', 4, 25.00, 'Appliances', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    ('2007', '3013', 4, 25.00, 'Appliances', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
	('2013', '3019', 2, 100.00, 'Technology', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    ('2015', '3013', 2, 25.00, 'Appliances', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
	('2017', '3019', 5, 100.00, 'Technology', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    ('2019', '3013', 3, 25.00, 'Appliances', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE),
    ('2011', '3019', 1, 100.00, 'Technology', 'admin', CURRENT_DATE, 'admin', CURRENT_DATE);


select * from Orders_Product;