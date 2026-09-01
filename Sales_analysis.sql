-------------------------------------------------------Sales Analysis------------------------------------------------------

--1. Which city generates the most revenue, and is that driven by volume or basket size?
SELECT city,
count(invoice_id) as Volume, 
AVG(total) as avg_spend,
sum(total) as Transactions
FROM [dbo].[WalmartSQL repository.]
GROUP BY city

--2.What are the sales trends by month and day of week?
SELECT month_name,
    COUNT(invoice_id)  AS transaction_count,
    SUM(total) AS total_revenue,
    AVG(total) AS avg_spend_per_transaction
FROM [dbo].[WalmartSQL repository.]
GROUP BY month_name
ORDER BY total_revenue DESC;

SELECT 
    day_name,
    COUNT(invoice_id)  AS transaction_count,
    SUM(total)           AS total_revenue,
    AVG(total)            AS avg_spend_per_transaction
FROM [dbo].[WalmartSQL repository.]
GROUP BY day_name
ORDER BY total_revenue DESC;

--3.What time of day drives the most revenue, and does it vary by branch?
SELECT time_of_day,branch,SUM(total) AS total_revenue
FROM [dbo].[WalmartSQL repository.]
GROUP BY time_of_day,branch
ORDER BY total_revenue DESC

--4.Which product lines are the top revenue and volume drivers?
SELECT product_line,SUM(quantity) as Volume,
ROUND(SUM(total),2)as total_revenue,
ROUND(AVG(unit_price),2) as avg_unit_price 
FROM [dbo].[WalmartSQL repository.]
GROUP BY product_line
ORDER BY SUM(total) DESC

--5.How does profitability (COGS vs revenue) vary across branches and product lines?
SELECT branch, product_line, 
sum(cogs) as total_cogs,
SUM(total) as revenue,
SUM(gross_income) AS gross_profit
FROM [dbo].[WalmartSQL repository.]
GROUP BY product_line,branch
ORDER BY SUM(cogs) DESC, SUM(cogs+gross_income) desc

--6.Does payment method choice affect average transaction value?
SELECT payment_method,
avg(total) as average_transaction_value
FROM [dbo].[WalmartSQL repository.]
GROUP BY payment_method
ORDER BY avg(total) DESC

--7.Which customer type brings the most revenue?
SELECT customer_type,
SUM(total) as total_revenue 
FROM [dbo].[WalmartSQL repository.]
GROUP BY customer_type
ORDER BY SUM(total)DESC
