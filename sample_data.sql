-- Sample Data for Sales Data Warehouse

-- Customer Dimension
INSERT INTO Customer_Dim (Customer_ID, Customer_Name, Segment, Country, Region)
VALUES
(1, 'Alice Smith', 'Consumer', 'India', 'South'),
(2, 'Bob Johnson', 'Corporate', 'India', 'West'),
(3, 'Charlie Brown', 'Home Office', 'India', 'East');

-- Product Dimension
INSERT INTO Product_Dim (Product_ID, Product_Name, Category, Sub_Category, Brand)
VALUES
(101, 'Dell Inspiron 15', 'Technology', 'Laptops', 'Dell'),
(102, 'HP LaserJet Pro', 'Technology', 'Printers', 'HP'),
(103, 'Office Chair', 'Furniture', 'Chairs', 'UrbanWood');

-- Time Dimension
INSERT INTO Time_Dim (Time_ID, Date, Day, Month, Quarter, Year)
VALUES
(1001, '2025-01-15', 15, 1, 1, 2025),
(1002, '2025-02-12', 12, 2, 1, 2025),
(1003, '2025-03-05', 5, 3, 1, 2025);

-- Store Dimension
INSERT INTO Store_Dim (Store_ID, Store_Name, City, State, Country)
VALUES
(201, 'Vizag Central', 'Visakhapatnam', 'Andhra Pradesh', 'India'),
(202, 'Mumbai Mart', 'Mumbai', 'Maharashtra', 'India');

-- Sales Fact
INSERT INTO Sales_Fact (Sales_ID, Customer_ID, Product_ID, Time_ID, Store_ID, Sales_Amount, Quantity, Discount, Profit)
VALUES
(5001, 1, 101, 1001, 201, 55000.00, 1, 5.00, 8000.00),
(5002, 2, 102, 1002, 202, 18000.00, 2, 10.00, 2500.00),
(5003, 3, 103, 1003, 201, 7000.00, 1, 0.00, 1200.00);
