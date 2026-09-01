----------------------------------------------------------Quality Control--------------------------------------------------------------------------

--Check for NULLs in Key Columns
SELECT 
SUM(CASE WHEN invoice_id IS NULL THEN 1 ELSE 0 END),
SUM(CASE WHEN payment_method IS NULL THEN 1 ELSE 0 END)
FROM [dbo].[WalmartSQL repository.]

--Date range of transactions
SELECT MIN(dtme) As Start_date,
MAX(dtme) as End_date
FROM [dbo].[WalmartSQL repository.]

--Check for duplicate invoice_id values
SELECT invoice_id, COUNT(*) AS duplicate_count
FROM [dbo].[WalmartSQL repository.]
GROUP BY invoice_id
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

--Check for zero or negative values in numeric fields
SELECT *
FROM [dbo].[WalmartSQL repository.]
WHERE quantity <= 0 
   OR unit_price <= 0 
   OR total <= 0 
   OR cogs <= 0 
   OR gross_income <= 0;
  
--Check for out-of-range rating values
SELECT MIN(rating) AS min_rating, MAX(rating) AS max_rating
FROM [dbo].[WalmartSQL repository.];

--Flag any ratings outside the expected 1-10 scale
SELECT *
FROM [dbo].[WalmartSQL repository.]
WHERE rating < 1 OR rating > 10;
