# Sales-Data-Warehouse-
A simple star schema-based data warehouse project for analyzing retail sales data. This project demonstrates dimensional modeling, SQL-based schema creation, and OLAP-style query examples.
Schema Design (Star Schema)

Fact Table:

Sales_Fact: Sales transactions including quantity, profit, discount, and sales amount.

Dimension Tables:

Customer_Dim: Info about customers (region, segment, etc.)

Product_Dim: Details of products including category and brand

Time_Dim: Date breakdown for time-based analysis

Store_Dim: Location-based info for retail stores

 Technologies Used

SQL (tested on MySQL and PostgreSQL syntax)

OLAP query design principles

Sample OLAP Queries

Total Sales by Region

Monthly Profit Trends

Top 5 Products by Sales

How to Use :

Clone the repository

Run the schema.sql script in your SQL engine

(Optional) Add sample data using sample_data.sql

Modify and experiment with queries

 Future Enhancements

Add ETL simulation scripts

Integrate with BI tools (e.g., Power BI, Tableau)

Add more real-world KPIs

 Author

Gandreti Joshi Phaneendra
joshiphaneendra@gmail.com
