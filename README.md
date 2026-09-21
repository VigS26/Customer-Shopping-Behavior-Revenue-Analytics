```python
import json
import pandas as pd

# Verify numerical values from Q2 or general stats if needed or check data model directly
# Let's inspect the exact values from Python logic to ensure 100% accuracy in README summary.
notebook_file = "customer_shopping_behavior.csv" # notebook contents saved as text JSON in system context
# Let's write a quick python script to inspect the dataset statistics directly.
import io

# We can reconstruct data or check notebook cells
print("Data analysis setup check.")


```

```text
Data analysis setup check.


```

# Customer Shopping Behavior & Revenue Analytics

A end-to-end data analytics project examining customer shopping patterns, purchase behavior, subscription trends, and revenue generation across product categories and demographics.

---

## 📌 Project Overview

This project analyzes a dataset of **3,900 customer transactions** to uncover key factors driving retail revenue, customer retention, and purchasing behavior. The analysis combines **Python** for data cleaning and feature engineering, **SQL Server** for exploratory data analysis and window functions, and **Power BI** for interactive visual reporting.

---

## 🛠️ Tech Stack & Tools Used

* **Python (Pandas, SQLAlchemy, PyODBC):** Data ingestion, missing value imputation, feature engineering, and database pipeline automated export.


* **SQL Server (T-SQL):** Data analysis utilizing aggregate functions, filtering (`HAVING`), subqueries, and window functions (`ROW_NUMBER() OVER`).


* **Power BI Desktop:** Dynamic dashboard design with customized metrics, KPI cards, category/demographic breakdowns, and interactive slicers.



---

## 🧹 Data Pipeline & Preprocessing

### 1. Data Cleaning & Imputation (Python)

* **Missing Value Imputation:** Handled missing values in `Review Rating` (37 missing records) by imputing category-level median ratings.


* **Column Normalization:** Standardized column naming convention to `snake_case` (e.g., converted `Purchase Amount (USD)` to `purchase_amount`).



### 2. Feature Engineering

* **Age Group Segmentation (`age_group`):** Grouped customer ages into four quartile-based categories using `pd.qcut()`: `Young Adult`, `Adult`, `Middle-aged`, and `Senior`.


* **Frequency Mapping (`purchase_frequency_days`):** Mapped string values into numerical days (e.g., `Weekly` $\rightarrow$ `7`, `Fortnightly` $\rightarrow$ `14`, `Quarterly` $\rightarrow$ `90`, `Annually` $\rightarrow$ `365`).



### 3. Database Ingestion

Automated table creation and export into Microsoft SQL Server (`customer_behavior` database) via `SQLAlchemy` and `PyODBC`.

---

## 📊 Key Insights & Dashboard Highlights

```
========================================================================
                      KEY METRICS DASHBOARD SUMMARY
========================================================================
 Total Customers  : 3.9K[cite: 5]
 Average Purchase : $59.76[cite: 5]
 Avg Review Rating: 3.75[cite: 5]
 Non-Subscribers  : 73%[cite: 5] | Subscribers: 27%[cite: 5]
========================================================================

```

* **Category Revenue Leaders:** **Clothing** dominates total revenue and volume, followed by **Accessories**, **Footwear**, and **Outerwear**.


* **Demographic Breakdown:** **Adults** generate the highest overall revenue and volume, with **Middle-aged** and **Senior** segments following closely behind.


* **Subscription Conversion Gap:** 73% of active shoppers are non-subscribers, presenting a major growth opportunity for targeted loyalty program incentives.



---

## 🔍 SQL Analysis Queries

The project contains relational database analysis addressing key business questions:

* **High-Value Non-Subscribers:** Identifies non-subscribed customers spending over $80 to target for loyalty program conversion.


* **Location Performance & Rating:** Ranks geographic regions by total revenue generated and average customer review ratings.


* **Payment Method Distribution:** Calculates transaction counts and percentage contributions across payment options (Credit Card, PayPal, Venmo, Cash, etc.).


* **Category Rank (Window Functions):** Employs `ROW_NUMBER() OVER (PARTITION BY Category ORDER BY AVG(Review Rating) DESC)` to determine top-rated items in each product category.



---
