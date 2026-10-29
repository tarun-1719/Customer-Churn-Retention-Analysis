-- ============================================================
-- CUSTOMER CHURN & RETENTION ANALYSIS
-- ============================================================
-- Database: customer_churn_db
-- Tool: MySQL Workbench
-- Author: Tarun Singh
-- Dataset: IBM Telco Customer Churn Dataset
-- ============================================================


-- ============================================================
-- PROJECT OVERVIEW
-- ============================================================

-- This project analyzes customer churn behavior for a
-- telecommunications company using customer demographic,
-- service, contract, payment, tenure, and billing data.
--
-- The objective is to identify customer segments with higher
-- churn risk, understand the factors associated with customer
-- churn, and analyze the potential revenue impact of churn.
--
-- The cleaned dataset was prepared in Excel and then imported
-- into MySQL for structured data analysis using SQL queries.
--
-- The analysis covers customer churn patterns across:
-- • Contract type
-- • Payment method
-- • Tenure groups
-- • Internet service
-- • Monthly charges
-- • Total charges
-- • Customer value
-- • High-risk customers
--
-- The final insights will be used to support customer retention
-- strategies and will later be visualized through an interactive
-- Power BI dashboard.


-- ============================================================
-- PROJECT WORKFLOW
-- ============================================================

-- 1. Data Cleaning & Preparation → Excel
-- 2. Database Creation → MySQL
-- 3. Table Creation → MySQL
-- 4. Data Import → Cleaned CSV
-- 5. Data Validation → SQL
-- 6. Exploratory Analysis → SQL
-- 7. Business Questions → SQL
-- 8. Business Insights → SQL
-- 9. Interactive Dashboard → Power BI
-- 10. Project Documentation → GitHub


-- ============================================================
-- PROJECT OBJECTIVE
-- ============================================================

-- Analyze customer churn behavior and identify:
--
-- 1. Overall churn rate
-- 2. Churn by contract type
-- 3. Churn by payment method
-- 4. Churn by tenure group
-- 5. Churn by internet service
-- 6. Revenue-related churn patterns
-- 7. High-risk customer segments
-- 8. Customer value and churn relationship
-- 9. Revenue at risk from high-risk customers
-- 10. Key customer segments requiring retention strategies


-- ============================================================
-- 1. DATABASE CREATION
-- ============================================================

-- Create database for the Customer Churn & Retention Analysis

CREATE DATABASE customer_churn_db;

-- Select the database for further operations

USE customer_churn_db;

-- ============================================================
-- 2. TABLE CREATION
-- ============================================================

-- Create table according to the final cleaned CSV dataset

CREATE TABLE customer_churn (

    customerID VARCHAR(20),
    gender VARCHAR(10),
    SeniorCitizen VARCHAR(10),
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(30),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(10),
    TenureGroup VARCHAR(30),
    MonthlyChargeGroup VARCHAR(20),
    TotalChargeGroup VARCHAR(20),
    HighRiskCustomer VARCHAR(10),
    CustomerValue VARCHAR(20),
    ChurnFlag INT

);


-- ============================================================
-- 3. DATA IMPORT
-- ============================================================

-- Import the cleaned CSV dataset into the customer_churn table.
--
-- CSV File:
-- Telco_Customer_Churn_Cleaned.csv
--
-- The CSV contains 27 columns prepared during the
-- data cleaning and feature creation process in Excel.
--
-- Data will be imported using:
-- MySQL Workbench → Table Data Import Wizard

-- ============================================================
-- 4. DATA VALIDATION
-- ============================================================

-- Check total number of customers

SELECT COUNT(*) AS total_customers
FROM customer_churn;


-- Preview first 10 records

SELECT *
FROM customer_churn
LIMIT 10;


-- Check table structure and data types

DESCRIBE customer_churn;


-- Check unique values in Churn column

SELECT DISTINCT Churn
FROM customer_churn;


-- Check duplicate customer IDs

SELECT
    customerID,
    COUNT(*) AS duplicate_count
FROM customer_churn
GROUP BY customerID
HAVING COUNT(*) > 1;

-- ============================================================
-- 5. DATA QUALITY CHECKS
-- ============================================================

-- ============================================================
-- Check NULL values in all columns
-- ============================================================

SELECT
    COUNT(*) AS total_rows,
    SUM(customerID IS NULL) AS customerID_nulls,
    SUM(gender IS NULL) AS gender_nulls,
    SUM(SeniorCitizen IS NULL) AS SeniorCitizen_nulls,
    SUM(Partner IS NULL) AS Partner_nulls,
    SUM(Dependents IS NULL) AS Dependents_nulls,
    SUM(tenure IS NULL) AS tenure_nulls,
    SUM(PhoneService IS NULL) AS PhoneService_nulls,
    SUM(MultipleLines IS NULL) AS MultipleLines_nulls,
    SUM(InternetService IS NULL) AS InternetService_nulls,
    SUM(OnlineSecurity IS NULL) AS OnlineSecurity_nulls,
    SUM(OnlineBackup IS NULL) AS OnlineBackup_nulls,
    SUM(DeviceProtection IS NULL) AS DeviceProtection_nulls,
    SUM(TechSupport IS NULL) AS TechSupport_nulls,
    SUM(StreamingTV IS NULL) AS StreamingTV_nulls,
    SUM(StreamingMovies IS NULL) AS StreamingMovies_nulls,
    SUM(Contract IS NULL) AS Contract_nulls,
    SUM(PaperlessBilling IS NULL) AS PaperlessBilling_nulls,
    SUM(PaymentMethod IS NULL) AS PaymentMethod_nulls,
    SUM(MonthlyCharges IS NULL) AS MonthlyCharges_nulls,
    SUM(TotalCharges IS NULL) AS TotalCharges_nulls,
    SUM(Churn IS NULL) AS Churn_nulls,
    SUM(TenureGroup IS NULL) AS TenureGroup_nulls,
    SUM(MonthlyChargeGroup IS NULL) AS MonthlyChargeGroup_nulls,
    SUM(TotalChargeGroup IS NULL) AS TotalChargeGroup_nulls,
    SUM(HighRiskCustomer IS NULL) AS HighRiskCustomer_nulls,
    SUM(CustomerValue IS NULL) AS CustomerValue_nulls,
    SUM(ChurnFlag IS NULL) AS ChurnFlag_nulls
FROM customer_churn;


-- ============================================================
-- Check blank / empty string values
-- ============================================================

SELECT
    SUM(customerID = '') AS customerID_blank,
    SUM(gender = '') AS gender_blank,
    SUM(Partner = '') AS Partner_blank,
    SUM(Dependents = '') AS Dependents_blank,
    SUM(PhoneService = '') AS PhoneService_blank,
    SUM(MultipleLines = '') AS MultipleLines_blank,
    SUM(InternetService = '') AS InternetService_blank,
    SUM(Contract = '') AS Contract_blank,
    SUM(PaymentMethod = '') AS PaymentMethod_blank,
    SUM(Churn = '') AS Churn_blank
FROM customer_churn;


-- ============================================================
-- 6. CATEGORICAL VALUES VALIDATION
-- ============================================================

-- Gender
SELECT DISTINCT gender
FROM customer_churn;

-- Contract
SELECT DISTINCT Contract
FROM customer_churn;

-- Internet Service
SELECT DISTINCT InternetService
FROM customer_churn;

-- Payment Method
SELECT DISTINCT PaymentMethod
FROM customer_churn;

-- Churn
SELECT DISTINCT Churn
FROM customer_churn;

-- Senior Citizen
SELECT DISTINCT SeniorCitizen
FROM customer_churn;


-- ============================================================
-- 7. NUMERIC DATA VALIDATION
-- ============================================================

-- Check minimum and maximum values

SELECT
    MIN(tenure) AS min_tenure,
    MAX(tenure) AS max_tenure,
    MIN(MonthlyCharges) AS min_monthly_charges,
    MAX(MonthlyCharges) AS max_monthly_charges,
    MIN(TotalCharges) AS min_total_charges,
    MAX(TotalCharges) AS max_total_charges
FROM customer_churn;


-- Check for negative values

SELECT *
FROM customer_churn
WHERE tenure < 0
   OR MonthlyCharges < 0
   OR TotalCharges < 0;
   
   
-- ============================================================
-- 8. BUSINESS ANALYSIS
-- ============================================================

-- Q1. What is the overall customer churn rate?

SELECT
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn;

-- ============================================================
-- Q2. What is the churn rate by contract type?
-- ============================================================

SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

-- ============================================================
-- Q3. Which contract type has the highest churn rate?
-- ============================================================

SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

-- ============================================================
-- Q4. What is the churn rate by Payment Method?
-- ============================================================

SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

-- ============================================================
-- Q5. What is the churn rate by Tenure Group?
-- ============================================================

SELECT
    TenureGroup,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY TenureGroup
ORDER BY churn_rate DESC;

-- ============================================================
-- Q6. What is the churn rate by Monthly Charge Group?
-- ============================================================

SELECT
    MonthlyChargeGroup,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY MonthlyChargeGroup
ORDER BY churn_rate DESC;

-- ============================================================
-- Q7. What is the churn rate by Customer Value?
-- ============================================================

SELECT
    CustomerValue,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY CustomerValue
ORDER BY churn_rate DESC;

-- ============================================================
-- Q8. What is the churn rate by Online Security?
-- ============================================================

SELECT
    OnlineSecurity,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY OnlineSecurity
ORDER BY churn_rate DESC;

-- ============================================================
-- Q9. What is the churn rate by Tech Support?
-- ============================================================

SELECT
    TechSupport,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY TechSupport
ORDER BY churn_rate DESC;

-- ============================================================
-- Q10. What is the churn rate by Payment Method and Contract?
-- ============================================================

SELECT
    PaymentMethod,
    Contract,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY PaymentMethod, Contract
ORDER BY churn_rate DESC;

-- ============================================================
-- Q11. How much revenue is lost due to customer churn?
-- ============================================================

SELECT
    SUM(TotalCharges) AS total_lost_revenue
FROM customer_churn
WHERE Churn = 'Yes';

-- ============================================================
-- Q12. What is the average total charge of churned customers?
-- ============================================================

SELECT
    COUNT(*) AS churned_customers,
    ROUND(AVG(TotalCharges), 2) AS avg_total_charges
FROM customer_churn
WHERE Churn = 'Yes';

-- ============================================================
-- Q13. What is the average monthly charge by churn status?
-- ============================================================

SELECT
    Churn,
    COUNT(*) AS total_customers,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
FROM customer_churn
GROUP BY Churn
ORDER BY avg_monthly_charge DESC;

-- ============================================================
-- Q14. Which tenure group generates the highest revenue?
-- ============================================================

SELECT
    TenureGroup,
    COUNT(*) AS total_customers,
    ROUND(SUM(TotalCharges), 2) AS total_revenue,
    ROUND(AVG(TotalCharges), 2) AS avg_customer_revenue
FROM customer_churn
GROUP BY TenureGroup
ORDER BY total_revenue DESC;


-- ============================================================
-- Q15. How many customers are classified as High Risk?
-- ============================================================

SELECT
    HighRiskCustomer,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer_churn),
        2
    ) AS customer_percentage
FROM customer_churn
GROUP BY HighRiskCustomer
ORDER BY total_customers DESC;

-- ============================================================
-- Q16. What is the churn rate among High Risk Customers?
-- ============================================================

SELECT
    HighRiskCustomer,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(
        SUM(ChurnFlag) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY HighRiskCustomer
ORDER BY churn_rate DESC;


-- ============================================================
-- Q17. What is the churn rate by Dependents?
-- ============================================================

SELECT
    Dependents,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(
        SUM(ChurnFlag) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY Dependents
ORDER BY churn_rate DESC;

-- ============================================================
-- Q18. What is the churn rate by Partner status?
-- ============================================================

SELECT
    Partner,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(
        SUM(ChurnFlag) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY Partner
ORDER BY churn_rate DESC;

-- ============================================================
-- Q19. What is the churn rate by Gender?
-- ============================================================

SELECT
    gender,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(
        SUM(ChurnFlag) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY gender
ORDER BY churn_rate DESC;

-- ============================================================
-- Q20. What is the churn rate by Senior Citizen status?
-- ============================================================

SELECT
    SeniorCitizen,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(
        SUM(ChurnFlag) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY SeniorCitizen
ORDER BY churn_rate DESC;

-- ============================================================
-- Q21. Which customer segment has the highest churn rate?
-- ============================================================

SELECT
    Contract,
    InternetService,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(
        SUM(ChurnFlag) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY Contract, InternetService
ORDER BY churn_rate DESC;

-- ============================================================
-- Q22. Which Contract + Tenure Group has the highest churn rate?
-- ============================================================

SELECT
    Contract,
    TenureGroup,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(
        SUM(ChurnFlag) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY Contract, TenureGroup
ORDER BY churn_rate DESC;

-- ============================================================
-- Q23. Which customer segments have the highest revenue loss?
-- ============================================================

SELECT
    Contract,
    InternetService,
    COUNT(*) AS churned_customers,
    ROUND(SUM(TotalCharges), 2) AS revenue_loss
FROM customer_churn
WHERE Churn = 'Yes'
GROUP BY Contract, InternetService
ORDER BY revenue_loss DESC;

-- ============================================================
-- Q24. What percentage of total revenue is lost due to churn?
-- ============================================================

SELECT
    ROUND(SUM(CASE
        WHEN Churn = 'Yes' THEN TotalCharges
        ELSE 0
    END), 2) AS churned_revenue,

    ROUND(SUM(TotalCharges), 2) AS total_revenue,

    ROUND(
        SUM(CASE
            WHEN Churn = 'Yes' THEN TotalCharges
            ELSE 0
        END) * 100.0 / SUM(TotalCharges),
        2
    ) AS revenue_loss_percentage
FROM customer_churn;


-- ============================================================
-- Q25. Who are the top 10 high-value churned customers?
-- ============================================================

SELECT
    customerID,
    Contract,
    InternetService,
    tenure,
    MonthlyCharges,
    TotalCharges,
    CustomerValue,
    HighRiskCustomer
FROM customer_churn
WHERE Churn = 'Yes'
  AND CustomerValue = 'High'
ORDER BY TotalCharges DESC
LIMIT 10;

-- ============================================================
-- Q26. Which services are associated with lower churn?
-- ============================================================

SELECT
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(
        SUM(ChurnFlag) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport
ORDER BY churn_rate ASC;

-- ============================================================
-- Q27. Which customer segment has the highest monthly charges?
-- ============================================================

SELECT
    Contract,
    InternetService,
    COUNT(*) AS total_customers,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge,
    ROUND(MAX(MonthlyCharges), 2) AS highest_monthly_charge
FROM customer_churn
GROUP BY Contract, InternetService
ORDER BY avg_monthly_charge DESC;

-- ============================================================
-- Q28. What is the average tenure of churned vs retained customers?
-- ============================================================

SELECT
    Churn,
    COUNT(*) AS total_customers,
    ROUND(AVG(tenure), 2) AS avg_tenure_months
FROM customer_churn
GROUP BY Churn
ORDER BY avg_tenure_months ASC;

-- ============================================================
-- Q29. Rank customer segments by churn rate
-- ============================================================

SELECT
    Contract,
    InternetService,
    total_customers,
    churned_customers,
    churn_rate,
    RANK() OVER (ORDER BY churn_rate DESC) AS churn_rank
FROM (
    SELECT
        Contract,
        InternetService,
        COUNT(*) AS total_customers,
        SUM(ChurnFlag) AS churned_customers,
        ROUND(
            SUM(ChurnFlag) * 100.0 / COUNT(*),
            2
        ) AS churn_rate
    FROM customer_churn
    GROUP BY Contract, InternetService
) AS segment_analysis
ORDER BY churn_rank;


-- ============================================================
-- Q30. Create a Power BI-ready SQL View
-- ============================================================

CREATE OR REPLACE VIEW churn_analysis_view AS
SELECT
    customerID,
    gender,
    SeniorCitizen,
    Partner,
    Dependents,
    tenure,
    TenureGroup,
    PhoneService,
    MultipleLines,
    InternetService,
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport,
    StreamingTV,
    StreamingMovies,
    Contract,
    PaperlessBilling,
    PaymentMethod,
    MonthlyCharges,
    MonthlyChargeGroup,
    TotalCharges,
    TotalChargeGroup,
    HighRiskCustomer,
    CustomerValue,
    Churn,
    ChurnFlag
FROM customer_churn;


SELECT *
FROM churn_analysis_view
LIMIT 10;