/* ==========================================================================
   DATABASE & TABLE SETUP
   ========================================================================== */
CREATE DATABASE IF NOT EXISTS supermarket_analysis;
USE supermarket_analysis;

-- Creating the primary table based on the raw SuperMarket Analysis dataset
CREATE TABLE IF NOT EXISTS supermarket_sales (
    `Invoice ID` VARCHAR(50) PRIMARY KEY,
    `Branch` VARCHAR(10),
    `City` VARCHAR(50),
    `Customer type` VARCHAR(20),
    `Gender` VARCHAR(10),
    `Product line` VARCHAR(50),
    `Unit price` DECIMAL(10, 2),
    `Quantity` INT,
    `Tax 5%` DECIMAL(10, 4),
    `Sales` DECIMAL(10, 4),
    `Date` VARCHAR(20),
    `Time` VARCHAR(20),
    `Payment` VARCHAR(20),
    `cogs` DECIMAL(10, 2),
    `gross margin percentage` DECIMAL(10, 9),
    `gross income` DECIMAL(10, 4),
    `Rating` DECIMAL(3, 1)
);

/* ==========================================================================
   ANALYTICAL VIEWS (AS PROVIDED IN CSV OUTPUTS)
   ========================================================================== */

-- 1. VIEW: City Revenue
-- Purpose: High-level overview of which city generates the most cash.
CREATE OR REPLACE VIEW vw_city_revenue AS
SELECT 
    `City`, 
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM supermarket_sales
GROUP BY `City`
ORDER BY total_revenue DESC;

-- 2. VIEW: Branch Performance
-- Purpose: Analyzing efficiency at the branch level.
CREATE OR REPLACE VIEW vw_branch_performance AS
SELECT 
    `Branch`, 
    `City`, 
    ROUND(SUM(`Sales`), 2) AS branch_revenue,
    COUNT(*) AS total_transactions,
    ROUND(AVG(`Sales`), 2) AS avg_transaction_value
FROM supermarket_sales
GROUP BY `Branch`, `City`
ORDER BY branch_revenue DESC;

-- 3. VIEW: Payment Performance
-- Purpose: Understanding customer payment preferences and their revenue contribution.
CREATE OR REPLACE VIEW vw_payment_performance AS
SELECT 
    `Payment`, 
    COUNT(*) AS total_transactions,
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM supermarket_sales
GROUP BY `Payment`
ORDER BY total_transactions DESC;

-- 4. VIEW: Sales Velocity
-- Purpose: Calculating "Revenue per Unit" (Sales Velocity) per City.
CREATE OR REPLACE VIEW vw_sales_velocity AS
SELECT 
    `City`, 
    ROUND(SUM(`Sales`) / SUM(`Quantity`), 2) AS sales_velocity
FROM supermarket_sales
GROUP BY `City`
ORDER BY sales_velocity DESC;

-- 5. VIEW: Executive KPIs
-- Purpose: The "One-Stop" view for leadership to see Revenue, Velocity, ATV, and Ratings.
CREATE OR REPLACE VIEW vw_executive_kpis AS
SELECT 
    `City`, 
    ROUND(SUM(`Sales`), 2) AS total_revenue,
    ROUND(SUM(`Sales`) / SUM(`Quantity`), 2) AS sales_velocity,
    ROUND(AVG(`Sales`), 2) AS avg_transaction_value,
    ROUND(AVG(`Rating`), 2) AS avg_customer_rating
FROM supermarket_sales
GROUP BY `City`
ORDER BY total_revenue DESC;

-- 6. VIEW: Underperforming Cities
-- Purpose: Identifying cities that fall below the average city revenue for intervention.
CREATE OR REPLACE VIEW vw_underperforming_cities AS
SELECT 
    `City`, 
    ROUND(SUM(`Sales`), 2) AS total_revenue
FROM supermarket_sales
GROUP BY `City`
HAVING total_revenue < (
    SELECT AVG(city_total) 
    FROM (SELECT SUM(`Sales`) AS city_total FROM supermarket_sales GROUP BY `City`) AS sub
)
ORDER BY total_revenue ASC;

/* ==========================================================================
   VERIFICATION QUERIES
   ========================================================================== */
-- Run these to check if your data matches the Excel/CSV outputs
SELECT * FROM vw_executive_kpis;
SELECT * FROM vw_sales_velocity;