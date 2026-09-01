## Project Background

Walmart is a global retail corporation operating a chain of hypermarkets, discount department stores, and grocery stores across multiple branches and cities.

This project uses transactional sales data from Walmart's retail branches — covering invoices, product lines, customer demographics, payment methods, and profitability metrics — to uncover actionable insights that can inform business and operational decisions.

Insights and recommendations are provided on the following key areas:

- **Product Analysis:** Performance of product lines by revenue, quantity sold, and ratings.
- **Customer Analysis:** Purchasing behavior and profitability by customer type and gender.
- **Sales Analysis:** Revenue and profitability trends by branch, time, and product line.
- **Branch & City Comparisons:** Revenue and rating performance across branches and cities.

## Data Structure
The dataset consists of a single table, `WalmartSQL repository`, with the following columns:

| Column Name        | Data Type     |
|---------------------|---------------|
| **invoice_id**       | nvarchar      |
| **branch**           | nvarchar      |
| **city**             | nvarchar      |
| **customer_type**    | nvarchar      |
| **gender**           | nvarchar      |
| **product_line**     | nvarchar      |
| **unit_price**       | float         |
| **quantity**         | tinyint       |
| **vat**              | float         |
| **total**            | float         |
| **dtme**             | datetime(7)   |
| **tme**              | time(7)       |
| **payment_method**   | nvarchar      |
| **cogs**             | float         |
| **gross_margin_pct** | float         |
| **gross_income**     | float         |
| **rating**           | float         |
| **time_of_day**      | nvarchar      |
| **day_name**         | nvarchar      |
| **month_name**       | nvarchar      |
