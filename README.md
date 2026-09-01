## Project Background

Walmart is a global retail corporation operating a chain of hypermarkets, discount department stores, and grocery stores across multiple branches and cities.

This project uses transactional sales data from Walmart's retail branches — covering invoices, product lines, customer demographics, payment methods, and profitability metrics — to uncover actionable insights that can inform business and operational decisions.

Insights and recommendations are provided on the following key areas:

- **Product Analysis:** Performance of product lines by revenue, quantity sold, and ratings.
- **Customer Analysis:** Purchasing behavior and profitability by customer type and gender.
- **Sales Analysis:** Revenue and profitability trends by branch, time, and product line.
- **Branch & City Comparisons:** Revenue and rating performance across branches and cities.

The original dataset can be found on Kaggle [here](https://www.kaggle.com/datasets/antaesterlin/walmart-commerce-data).

The SQL queries utilized to inspect and perform quality checks can be found [here](https://github.com/sakshyah-wq/Walmart-sales-eda-q1-2019/blob/main/data_quality_check.sql).

The SQL queries utilized to answer product-related business questions can be found [here](link-to-product_analysis.sql).

The SQL queries utilized to answer customer-related business questions can be found [here](link-to-customer_analysis.sql).

The SQL queries utilized to answer sales-related business questions can be found [here](link-to-sales_analysis.sql).

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

## Executive Summary

### Overview of Findings

This analysis of Walmart's sales transaction data across 3 branches and 6 product lines uncovered the following key insights:

- **Food and beverages is the top revenue driver** ($56,144.84), while **Electronic accessories moves the most volume** (971 units) — despite having the lowest average unit price among top performers, showing revenue and volume leadership don't align.
- **Fashion accessories commands the highest average unit price** ($57.15), while **Health and beauty is the weakest performer** on both revenue and volume.
- **Branch C is the strongest-performing location**, leading in gross profit across multiple product lines, particularly Food and beverages and Fashion accessories.

### Limitations

**Gross margin is flat at ~4.76% across every branch, product line, and customer segment.** This is very likely a **synthetic/dataset artifact** rather than a genuine business signal, meaning it may not capture real cost differences between branches, suppliers, or product lines that would exist in practice.

## Sales Trends

- **January is the strongest month** — $116,291.87 in revenue from 352 transactions, ahead of March ($109,455.51) and February ($97,219.37). The dataset only covers 3 months (Jan–Mar) — worth noting as a scope limitation; not enough to call a seasonal trend, just a snapshot.
- **Members bring in more total revenue** — $164,223.44 vs. $158,743.31 for Normal customers — but the gap is fairly narrow (~3.5%), so it's not a dramatic split.
- **Payment method has little to no effect on transaction size** — Cash, Credit card, and Ewallet average within a few dollars of each other, suggesting how customers pay doesn't meaningfully influence how much they spend.

## Product Performance

- **Food and beverages is the strongest overall performer**, leading in total revenue ($56,144.84) and also earning the highest average customer rating (7.11) — a rare case where revenue and satisfaction align.
- **Electronic accessories moves the most volume** (971 units) but has the lowest average unit price among top performers ($53.55), showing that high sales volume doesn't necessarily translate into the highest revenue.
- **Health and beauty is the weakest product line** across both revenue and volume.
- The most notable tension is with **Home and lifestyle**: it generates the **highest average gross income per transaction** ($16.03), suggesting the biggest basket sizes of any product line — yet it also has the **lowest average customer rating** (6.84).

## Customer Analysis

- **Average Order Value (AOV) is generally higher for Members than Normal customers in Branches A and B**, consistent with expected loyalty program behavior — but this pattern reverses slightly in **Branch C**, where Normal customers narrowly out-spend Members per order. Branch C also has the highest AOV overall for both customer types, reinforcing it as the top-performing branch, but suggesting the loyalty program's impact isn't consistent across all locations.
- **Gender meaningfully shapes category preference** — Health and beauty skews heavily male (62.27% of revenue), while Food and beverages skews heavily female (59.08%).
- **Member–Female is the most profitable customer segment** ($4,197.47 gross income, highest transaction count at 261), while **Member–Male is the least profitable** ($3,622.69).

 ## Recommendations

- **Double down on Food and beverages** — it's the only product line where revenue, ratings, and customer satisfaction all align. Consider expanding this category's shelf space, cross-promotions, or supplier partnerships.
- **Investigate Home and lifestyle's low rating despite high spend.** This combination is fragile — low ratings are often an early warning sign that shows up in a survey before it shows up in the sales numbers. Run customer feedback surveys or review complaint data to understand why customers are dissatisfied even as they spend the most per basket.
- **Study Branch C's playbook and replicate it** — it leads in revenue, AOV, and customer ratings, making it your best-performing branch across the board.
- **Strengthen member-exclusive perks** — Members bring in more total revenue, but the gap over Normal customers is narrow (~3.5%). Widening this gap would help justify continued investment in the loyalty program.
