-- Sales Data Warehouse Project (Star Schema Model)

-- 1. Customer Dimension Table
CREATE TABLE Customer_Dim (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Segment VARCHAR(50),
    Country VARCHAR(50),
    Region VARCHAR(50),
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Product Dimension Table
CREATE TABLE Product_Dim (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Brand VARCHAR(50),
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Time Dimension Table
CREATE TABLE Time_Dim (
    Time_ID INT PRIMARY KEY,
    Date DATE NOT NULL,
    Day INT,
    Month INT,
    Quarter INT,
    Year INT
);

-- 4. Store Dimension Table (Optional for multi-location)
CREATE TABLE Store_Dim (
    Store_ID INT PRIMARY KEY,
    Store_Name VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50)
);

-- 5. Sales Fact Table
CREATE TABLE Sales_Fact (
    Sales_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Time_ID INT,
    Store_ID INT,
    Sales_Amount DECIMAL(12,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(12,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Dim(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product_Dim(Product_ID),
    FOREIGN KEY (Time_ID) REFERENCES Time_Dim(Time_ID),
    FOREIGN KEY (Store_ID) REFERENCES Store_Dim(Store_ID)
);

-- Sample OLAP Query 1: Total Sales by Region
SELECT d.Region, ROUND(SUM(f.Sales_Amount), 2) AS Total_Sales
FROM Sales_Fact f
JOIN Customer_Dim d ON f.Customer_ID = d.Customer_ID
GROUP BY d.Region
ORDER BY Total_Sales DESC;

-- Sample OLAP Query 2: Monthly Profit Trend
SELECT CONCAT(t.Month, '-', t.Year) AS Month_Year, ROUND(SUM(f.Profit), 2) AS Monthly_Profit
FROM Sales_Fact f
JOIN Time_Dim t ON f.Time_ID = t.Time_ID
GROUP BY t.Year, t.Month
ORDER BY t.Year, t.Month;

-- Sample OLAP Query 3: Top 5 Products by Sales
SELECT p.Product_Name, ROUND(SUM(f.Sales_Amount), 2) AS Total_Sales
FROM Sales_Fact f
JOIN Product_Dim p ON f.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Sales DESC
LIMIT 5;
