set search_path to public;

-- Tables
DROP TABLE  IF EXISTS Orders_Product;
DROP TABLE  IF EXISTS Customer;
DROP TABLE  IF EXISTS Orders;
DROP TABLE  IF EXISTS Product;
DROP TABLE  IF EXISTS Supplier;
DROP TABLE  IF EXISTS Payment;


-- Creating Tables

-- Create Customer table
CREATE TABLE Customer (
    Customer_ID VARCHAR(10) PRIMARY KEY,
    cust_Fname VARCHAR(50),
    cust_LName VARCHAR(50),
    Phone_no VARCHAR(11),
    cust_Email VARCHAR(50),
    cust_Address VARCHAR(50)
);

-- Create Order table
CREATE TABLE Orders (
    Order_ID VARCHAR(10) PRIMARY KEY,
    Customer_ID VARCHAR(10),
    Total_Quantity INTEGER,
    Total_Amount VARCHAR(10),
    Order_Status VARCHAR(20),
    Payment_Status VARCHAR(20),
    Delivery_Date DATE,
    Shipping_Address VARCHAR(50),
	FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Create Product table
CREATE TABLE Product (
    Product_ID VARCHAR(10) PRIMARY KEY,
    Inventory_Status VARCHAR(50),
    Product_Name VARCHAR(50),
    Description VARCHAR(50),
    Estimated_Delivery_Date DATE,
    Product_Price VARCHAR(10)
);

-- Create Order_Product table for the M:N relationship
CREATE TABLE Orders_Product (
    Order_ID VARCHAR(10),
    Product_ID VARCHAR(10),
    Quantity INTEGER,
    Product_Price VARCHAR(10),
    Product_Category VARCHAR(20),
	FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

-- Create Supplier table (Weak Entity)
CREATE TABLE Supplier (
    Supplier_ID VARCHAR(10) PRIMARY KEY,
    Product_ID VARCHAR(10),
    Supplier_Name VARCHAR(50),
    Supplier_Phone_no VARCHAR(11),
    Supply_Frequency VARCHAR(20),
    Supplying_Since DATE,
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

-- Create Payment table (Weak Entity)
CREATE TABLE Payment (
    Payment_ID VARCHAR(10) PRIMARY KEY,
    Customer_ID VARCHAR(10),
    Payment_Method VARCHAR(50),
    Time_Stamp TIMESTAMP,
    Payment_Amount INTEGER,
    Payment_Status VARCHAR(50),
	FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);


-- Dropping Sequences 
DROP SEQUENCE IF EXISTS Customer_id_seq;
DROP SEQUENCE IF EXISTS Order_id_seq;
DROP SEQUENCE IF EXISTS Product_id_seq;
DROP SEQUENCE IF EXISTS Supplier_id_seq;
DROP SEQUENCE IF EXISTS Payment_id_seq;


-- Creating Sequences for Student, Course, Hod and Teacher tables.
CREATE SEQUENCE Customer_id_seq
start with 1000
increment by 1
NO MAXVALUE
MINVALUE 1000;

CREATE SEQUENCE Order_id_seq
start with 2000
increment by 1
NO MAXVALUE
MINVALUE 2000;

CREATE SEQUENCE Product_id_seq
start with 3000
increment by 1
NO MAXVALUE
MINVALUE 3000;

CREATE SEQUENCE Supplier_id_seq
start with 4000
increment by 1
NO MAXVALUE
MINVALUE 4000;

CREATE SEQUENCE Payment_id_seq
start with 5000
increment by 1
NO MAXVALUE
MINVALUE 5000;



-- Dropping Triggers and Trigger Functions
DROP TRIGGER IF EXISTS Customer_id_auto_increment_trigger on Customer;
DROP FUNCTION IF EXISTS Customer_id_auto_increment;

DROP TRIGGER IF EXISTS Order_id_auto_increment_trigger on Orders;
DROP FUNCTION IF EXISTS Order_id_auto_increment;

DROP TRIGGER IF EXISTS Product_id_auto_increment_trigger on Product;
DROP FUNCTION IF EXISTS Product_id_auto_increment;

DROP TRIGGER IF EXISTS Supplier_id_auto_increment_trigger on Supplier;
DROP FUNCTION IF EXISTS Supplier_id_auto_increment;

DROP TRIGGER IF EXISTS Payment_id_auto_increment_trigger on Payment;
DROP FUNCTION IF EXISTS Payment_id_auto_increment;



-- Creating Trigger and Trigger Function for Customer Table
CREATE OR REPLACE FUNCTION Customer_id_auto_increment()
RETURNS TRIGGER AS $$
BEGIN
  NEW.Customer_ID = NEXTVAL('Customer_id_seq');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER Customer_id_auto_increment_trigger
BEFORE INSERT ON Customer
FOR EACH ROW
EXECUTE FUNCTION Customer_id_auto_increment();


-- Creating Trigger and Trigger Function for Order Table
CREATE OR REPLACE FUNCTION Order_id_auto_increment()
RETURNS TRIGGER AS $$
BEGIN
  NEW.Order_ID = NEXTVAL('Order_id_seq');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER Order_id_auto_increment_trigger
BEFORE INSERT ON Orders
FOR EACH ROW
EXECUTE FUNCTION Order_id_auto_increment();


-- Creating Trigger and Trigger Function for Product Table
CREATE OR REPLACE FUNCTION Product_id_auto_increment()
RETURNS TRIGGER AS $$
BEGIN
  NEW.Product_ID = NEXTVAL('Product_id_seq');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER Product_id_auto_increment_trigger
BEFORE INSERT ON Product
FOR EACH ROW
EXECUTE FUNCTION Product_id_auto_increment();


-- Creating Trigger and Trigger Function for Supplier Table
CREATE OR REPLACE FUNCTION Supplier_id_auto_increment()
RETURNS TRIGGER AS $$
BEGIN
  NEW.Supplier_ID = NEXTVAL('Supplier_id_seq');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER Supplier_id_auto_increment_trigger
BEFORE INSERT ON Supplier
FOR EACH ROW
EXECUTE FUNCTION Supplier_id_auto_increment();


-- Creating Trigger and Trigger Function for Payment Table
CREATE OR REPLACE FUNCTION Payment_id_auto_increment()
RETURNS TRIGGER AS $$
BEGIN
  NEW.Payment_ID = NEXTVAL('Payment_id_seq');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER Payment_id_auto_increment_trigger
BEFORE INSERT ON Payment
FOR EACH ROW
EXECUTE FUNCTION Payment_id_auto_increment();


-- Dropping View
DROP VIEW IF EXISTS OrderDetails;



-- Creating view
CREATE OR REPLACE VIEW OrderDetails AS
SELECT
    o.Order_ID,
    c.cust_Fname || ' ' || c.cust_LName AS Customer_Name,
    p.Product_Name,
    op.Quantity,
    op.Product_Price
FROM Orders o
JOIN Customer c ON o.Customer_ID = c.Customer_ID
JOIN Orders_Product op ON o.Order_ID = op.Order_ID
JOIN Product p ON op.Product_ID = p.Product_ID;

---Alter Tables by adding Audit Columns
ALTER TABLE Customer 
ADD COLUMN created_by VARCHAR(30),
ADD COLUMN date_created DATE,
ADD COLUMN modified_by VARCHAR(30),
ADD COLUMN date_modified DATE;


ALTER TABLE Orders 
ADD COLUMN created_by VARCHAR(30),
ADD COLUMN date_created DATE,
ADD COLUMN modified_by VARCHAR(30),
ADD COLUMN date_modified DATE;


ALTER TABLE Product 
ADD COLUMN created_by VARCHAR(30),
ADD COLUMN date_created DATE,
ADD COLUMN modified_by VARCHAR(30),
ADD COLUMN date_modified DATE;


ALTER TABLE Orders_Product 
ADD COLUMN created_by VARCHAR(30),
ADD COLUMN date_created DATE,
ADD COLUMN modified_by VARCHAR(30),
ADD COLUMN date_modified DATE;


ALTER TABLE Supplier 
ADD COLUMN created_by VARCHAR(30),
ADD COLUMN date_created DATE,
ADD COLUMN modified_by VARCHAR(30),
ADD COLUMN date_modified DATE;


ALTER TABLE Payment 
ADD COLUMN created_by VARCHAR(30),
ADD COLUMN date_created DATE,
ADD COLUMN modified_by VARCHAR(30),
ADD COLUMN date_modified DATE;
