/* =========================================================
   Internship Task 3 - SQL Basics
   Tool: MySQL Workbench
   Dataset: retail_sales_dataset.csv
   Database: internship_task3
   Table: retail_sales_dataset
   ========================================================= */

USE internship_task3;

-- ---------------------------------------------------------
-- 1) BASIC CHECKS
-- ---------------------------------------------------------

-- Q1: View first 10 records
SELECT * 
FROM retail_sales_dataset
LIMIT 10;

-- Q2: Count total rows (transactions)
SELECT COUNT(*) AS total_rows
FROM retail_sales_dataset;

-- Q3: View all distinct product categories
SELECT DISTINCT `Product Category` AS product_category
FROM retail_sales_dataset;


-- ---------------------------------------------------------
-- 2) FILTERING (WHERE CLAUSE)
-- ---------------------------------------------------------

-- Q4: Transactions in Beauty category
SELECT *
FROM retail_sales_dataset
WHERE `Product Category` = 'Beauty';

-- Q5: Transactions with total amount greater than 500
SELECT *
FROM retail_sales_dataset
WHERE `Total Amount` > 500;

-- Q6: Electronics category with quantity >= 3
SELECT *
FROM retail_sales_dataset
WHERE `Product Category` = 'Electronics'
  AND `Quantity` >= 3;


-- ---------------------------------------------------------
-- 3) SORTING (ORDER BY)
-- ---------------------------------------------------------

-- Q7: Top 10 highest transactions by Total Amount
SELECT *
FROM retail_sales_dataset
ORDER BY `Total Amount` DESC
LIMIT 10;

-- Q8: Lowest 10 transactions by Total Amount
SELECT *
FROM retail_sales_dataset
ORDER BY `Total Amount` ASC
LIMIT 10;


-- ---------------------------------------------------------
-- 4) AGGREGATION (GROUP BY)
-- ---------------------------------------------------------

-- Q9: Category-wise total sales and transactions
SELECT `Product Category` AS product_category,
       COUNT(*) AS total_transactions,
       SUM(`Total Amount`) AS total_sales
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY total_sales DESC;

-- Q10: Gender-wise total revenue and avg transaction value
SELECT `Gender` AS gender,
       COUNT(*) AS total_transactions,
       ROUND(SUM(`Total Amount`), 2) AS total_revenue,
       ROUND(AVG(`Total Amount`), 2) AS avg_transaction_value
FROM retail_sales_dataset
GROUP BY `Gender`
ORDER BY total_revenue DESC;

-- Q11: Age-wise average spending
SELECT `Age` AS age,
       ROUND(AVG(`Total Amount`), 2) AS avg_spending
FROM retail_sales_dataset
GROUP BY `Age`
ORDER BY avg_spending DESC;


-- ---------------------------------------------------------
-- 5) HAVING CLAUSE
-- ---------------------------------------------------------

-- Q12: Categories having total sales greater than 150000
SELECT `Product Category` AS product_category,
       ROUND(SUM(`Total Amount`), 2) AS total_sales
FROM retail_sales_dataset
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) > 150000
ORDER BY total_sales DESC;


-- ---------------------------------------------------------
-- 6) BETWEEN (DATE RANGE)
-- ---------------------------------------------------------
-- NOTE: In this dataset Date is TEXT.
-- BETWEEN will work only if Date format is YYYY-MM-DD.
-- If not, this query may return 0 rows.

-- Q13: Transactions between two dates
SELECT *
FROM retail_sales_dataset
WHERE `Date` BETWEEN '2023-01-01' AND '2023-01-31';


-- ---------------------------------------------------------
-- 7) LIKE (PATTERN MATCHING)
-- ---------------------------------------------------------

-- Q14: Customer IDs starting with 'C'
SELECT *
FROM retail_sales_dataset
WHERE `Customer ID` LIKE 'C%';


-- ---------------------------------------------------------
-- 8) INTERVIEW TYPE QUERY
-- ---------------------------------------------------------

-- Q15: Top 5 customers by total spend
SELECT `Customer ID` AS customer_id,
       ROUND(SUM(`Total Amount`), 2) AS total_spent
FROM retail_sales_dataset
GROUP BY `Customer ID`
ORDER BY total_spent DESC
LIMIT 5;


-- ---------------------------------------------------------
-- 9) FINAL EXPORT QUERY (sales_summary.csv)
-- ---------------------------------------------------------

-- Q16: Sales Summary Report (EXPORT THIS RESULT AS CSV)
SELECT `Product Category` AS product_category,
       COUNT(*) AS total_transactions,
       SUM(`Quantity`) AS total_quantity_sold,
       ROUND(AVG(`Price per Unit`), 2) AS avg_price_per_unit,
       ROUND(SUM(`Total Amount`), 2) AS total_sales,
       ROUND(AVG(`Total Amount`), 2) AS avg_transaction_value
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY total_sales DESC;
