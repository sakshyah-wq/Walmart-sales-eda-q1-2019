------------------------------------------------------Customer Analysis----------------------------------------------------------

--1.Between Member vs. Normal customer types — does one spend more on average than the other?
SELECT customer_type,AVG(total)
FROM [dbo].[WalmartSQL repository.]
GROUP BY customer_type

--2.Does gender influence purchasing behavior across product lines also show % revenue share by gender within each product line?
SELECT 
    product_line,gender,total_revenue,transaction_count,avg_spend_per_transaction,
    ROUND(
        total_revenue * 100.0 / SUM(total_revenue) OVER (PARTITION BY product_line), 
        2
    ) AS pct_revenue_share
FROM (SELECT product_line,gender,
        COUNT(invoice_id)      AS transaction_count,
        SUM(total)              AS total_revenue,
        AVG(total)               AS avg_spend_per_transaction
    FROM [dbo].[WalmartSQL repository.]
    GROUP BY product_line, gender
) AS gender_summary
ORDER BY product_line, gender;

--3.Which customer segment is most profitable, not just highest-spending?
SELECT customer_type,gender,
AVG(gross_margin_pct)as gross_margin,
SUM(gross_income)as total_gross_income,
COUNT(invoice_id) AS transaction_count
FROM [dbo].[WalmartSQL repository.]
    GROUP BY customer_type, gender
     
--4.How does customer satisfaction (rating) vary by segment, branch, and product line?
SELECT customer_type,branch,product_line,
    COUNT(rating) AS transaction_count,
    AVG(rating) AS avg_rating,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating
FROM [dbo].[WalmartSQL repository.]
GROUP BY customer_type, branch, product_line
ORDER BY avg_rating ASC;

--5.Do payment method preferences differ by customer type or gender?
SELECT customer_type,gender,payment_method,
    COUNT(*) AS transaction_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY customer_type, gender), 
        2
    ) AS pct_within_segment
FROM [dbo].[WalmartSQL repository.]
GROUP BY customer_type, gender, payment_method
ORDER BY customer_type, gender, transaction_count DESC;

--6.When do different customer segments shop, and does timing affect spend?
SELECT customer_type,time_of_day,sum(gross_income)
FROM [dbo].[WalmartSQL repository.]
GROUP BY customer_type,time_of_day

--7.What is the gender distrubution per branch?
SELECT branch,gender, count(*) as Number_gender
FROM [dbo].[WalmartSQL repository.]
GROUP BY branch,gender
order by branch

--8.Which time of the day do customers give most ratings?
SELECT time_of_day,count(*) as Total_ratings
FROM [dbo].[WalmartSQL repository.]
GROUP BY time_of_day
ORDER BY count(*)DESC 

--9.Which branch has the best average rating?
SELECT branch,AVG(rating) as avg_rating
FROM [dbo].[WalmartSQL repository.]
GROUP BY branch
