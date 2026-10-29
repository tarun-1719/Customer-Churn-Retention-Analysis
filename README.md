# 📊 Customer Churn & Retention Analysis Using SQL

**Analyzing customer behavior, churn patterns, and retention opportunities using MySQL.**

## 📌 Project Overview

Customer churn is a major challenge for subscription-based businesses. Understanding why customers leave helps businesses improve retention, identify high-risk customers, and make data-driven decisions.

This project analyzes the **IBM Telco Customer Churn dataset** using MySQL to explore customer churn patterns, subscription behavior, customer segmentation, and revenue-related metrics.

## 🎯 Project Objectives

- Analyze overall customer churn and retention patterns.
- Identify customer segments with higher churn rates.
- Examine the relationship between contracts, payment methods, and churn.
- Analyze customer tenure and monthly charges.
- Identify high-risk customers using derived customer attributes.
- Generate actionable insights through SQL queries.

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| MySQL 8.0 | Data analysis and querying |
| MySQL Workbench | SQL development and execution |
| SQL | Data validation, aggregation, segmentation, and analysis |
| GitHub | Project documentation and version control |

## 📂 Dataset

**Dataset:** IBM Telco Customer Churn

The dataset contains customer information, subscribed services, contract details, billing information, tenure, and churn status.

- Total records: **7,043 customers**
- Source: [IBM Telco Customer Churn Dataset — Kaggle](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)

## 🔍 Project Workflow

1. **Data Preparation** — Prepared the cleaned customer dataset for SQL analysis.
2. **Database Setup** — Created the `customer_churn_db` database and imported the customer data.
3. **Data Validation** — Checked record counts, missing values, churn categories, and duplicate customer IDs.
4. **Feature Engineering** — Used additional customer segments and churn-related flags for analysis.
5. **Exploratory Analysis** — Executed SQL queries to analyze churn, contracts, tenure, billing, and customer risk.
6. **Business Insights** — Used query results to explore customer retention opportunities.

## 📈 Key Analysis Areas

- **Churn Analysis:** Customer churn counts and churn rates.
- **Contract Analysis:** Churn patterns across contract types.
- **Customer Segmentation:** Analysis by tenure and customer attributes.
- **Billing Analysis:** Monthly charges and total charges.
- **Payment Analysis:** Customer churn across payment methods.
- **High-Risk Customers:** Analysis using derived risk categories.
- **Data Quality Checks:** Validation of records, missing values, and duplicate IDs.

## 💻 SQL Skills Demonstrated

- `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`
- Conditional logic using `CASE WHEN`
- Filtering with `HAVING`
- Common Table Expressions (CTEs)
- Subqueries
- Joins, where applicable
- Views
- Data quality and validation queries
- Business-focused analytical queries

## 📁 Project Structure

```text
Customer-Churn-Retention-Analysis/
│
├── README.md
│
├── sql/
│   └── customer_churn_analysis.sql
│
├── docs/
│   ├── data_dictionary.md
│   └── business_questions.md
│
└── screenshots/
    ├── database_validation.png
    └── churn_analysis.png
```

*Note: Screenshots and documentation files will be added as they are prepared.*

## 💡 Business Value

This analysis can help businesses understand customer churn behavior, recognize customer segments that may need attention, and investigate potential retention opportunities.

The findings can support data-driven decisions related to customer experience, subscription strategies, and retention planning.

## 👨‍💻 Author

**Tarun Singh**

Aspiring Data Analyst | SQL | Excel | Power BI | Python

- [GitHub](https://github.com/)

---

*This project was created for data analytics learning and portfolio development using a publicly available dataset.*
