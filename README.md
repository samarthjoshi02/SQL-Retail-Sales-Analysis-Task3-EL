# Internship Task 3 - SQL Basics (MySQL)

## 📌 Dataset Used
Retail Sales Dataset (`retail_sales_dataset.csv`)

## 🛠 Tool Used
MySQL Workbench

## 🗄 Database & Table
- Database: `internship_task3`
- Table: `retail_sales_dataset`

> Note: Dataset columns contain spaces (example: `Product Category`), so backticks are used in SQL queries.

---

## 📂 Files Included
- `queries_task3.sql` → Contains all Task 3 SQL queries
- `sales_summary.csv` → Exported summary output generated from GROUP BY query
- `README.md` → Explanation of queries and results

---

## ✅ Queries Covered (Task Requirements)

### 1) Basic SQL
- Display sample data
- Count total records
- Check distinct categories

### 2) Filtering (`WHERE`)
- Filter by category
- Filter by transaction amount
- Apply multiple filter conditions

### 3) Sorting (`ORDER BY`)
- Top transactions by amount
- Lowest transactions by amount

### 4) Aggregations (`GROUP BY`)
- Category-wise revenue
- Gender-wise revenue and average spending
- Age-wise average spending

### 5) `HAVING`
- Categories with sales above a specific threshold

### 6) `BETWEEN`
- Extract transactions for a date range (depends on date format)

### 7) `LIKE`
- Customer ID pattern searching

### 8) Interview Query
- Top 5 customers by total spend

---

## 📊 Exported Output (`sales_summary.csv`)
Generated using the final query:

```sql
SELECT `Product Category` AS product_category,
       COUNT(*) AS total_transactions,
       SUM(`Quantity`) AS total_quantity_sold,
       ROUND(AVG(`Price per Unit`), 2) AS avg_price_per_unit,
       ROUND(SUM(`Total Amount`), 2) AS total_sales,
       ROUND(AVG(`Total Amount`), 2) AS avg_transaction_value
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY total_sales DESC;
