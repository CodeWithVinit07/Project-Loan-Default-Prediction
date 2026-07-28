-- Q1. How many total loans has the bank issued?

SELECT COUNT(Loan_ID) FROM loan_data;

-- avg loan amount
SELECT AVG(Loan_Amount) as avg_loan FROM loan_data;


-- Customers by education

SELECT Education, 
COUNT(Loan_ID) AS Total_CS FROM loan_data
GROUP BY Education;


-- Customers by employment type

SELECT Employment_Type, 
COUNT(*) FROM loan_data
GROUP BY Employment_Type;


-- Customers by marital status


SELECT Marital_Status,
COUNT(*) FROM loan_data
GROUP BY Marital_Status;


-- Customers by loan purpose

SELECT Loan_purpose, 
COUNT(*) FROM loan_data
GROUP BY Loan_purpose;


-- Average credit score of defaulters vs non-defaulters

SELECT
    Default_A,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Credit_Score), 2) AS Avg_Credit_Score
FROM loan_data
GROUP BY Default_A;


-- Default rate by education

SELECT Education, 
COUNT(*) AS Total_Customers, 
SUM(Default_A) AS Total_Defaults, 
ROUND(SUM(Default_A) * 100.0 / COUNT(*), 2) AS Default_Rate
FROM loan_data
GROUP BY Education
ORDER BY Default_Rate DESC;


-- Default rate by employment type


SELECT Employment_type, 
COUNT(*) AS Total_Customers,
SUM(Default_A) AS Total_Defaults, 
ROUND(SUM(Default_A) * 100.0 / COUNT(*), 2) AS Default_Rate
FROM loan_data
GROUP BY Employment_type
ORDER BY Default_Rate DESC;


-- Default rate by loan purpose

SELECT Loan_Purpose, 
Count(*) AS Total_Customers, 
SUM(Default_A) AS Total_Defaults, 
ROUND(SUM(Default_A * 100.0) / COUNT(*), 2) AS Default_Rate 
FROM loan_data
GROUP BY Loan_Purpose 
ORDER BY Default_Rate;

-- Default rate by loan term

SELECT Loan_Term,
COUNT(*) AS Total_Customers, 
SUM(Default_A) AS Total_Defaults, 
ROUND(SUM(Default_A) * 100.0 / COUNT(*), 2) AS Default_Rate
FROM loan_data
GROUP BY Loan_Term
ORDER BY Default_Rate DESC;


-- Average income of defaulters vs non-defaulters

SELECT
    CASE
        WHEN Default_A = 1 THEN 'Defaulters'
        ELSE 'Non-Defaulters'
    END AS Customer_Status,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Income), 2) AS Average_Income
FROM loan_data
GROUP BY Default_A;


-- Q2. How many customers defaulted on their loans?

SELECT COUNT(Loan_ID) as default_cs FROM loan_data
WHERE Default_A = 1;


-- Average loan amount by employment type

SELECT Employment_Type, 
avg(Loan_Amount) AS avg_loan 
FROM loan_data
GROUP BY Employment_Type;


-- Q3. What is the overall loan default percentage?

SELECT COUNT(*) AS Total_Loans, 
SUM(default_A) AS Total_Defaults, 
ROUND(SUM(default_A) * 100.0 / COUNT(*), 2) AS Default_Percentage
FROM loan_data;


-- Average loan amount by education

SELECT Education, 
AVG(Loan_Amount) AS avg_loan
FROM loan_data
GROUP BY Education;

-- Average loan amount by education

SELECT Education, 
AVG(Loan_Amount) AS avg_loan
FROM loan_data
GROUP BY Education;


-- Top 10 highest loan amounts

SELECT Loan_Amount
FROM loan_data
ORDER BY Loan_Amount DESC
LIMIT 10;


-- Top 10 highest income customers

SELECT Income
FROM loan_data
ORDER BY Loan_Amount DESC
LIMIT 10;









