--Q1. High-Value Non-Subscribers

SELECT [Customer ID], [Item Purchased], [Purchase Amount (USD)]
FROM dbo.customer
WHERE [Subscription Status] = 'No' AND [Purchase Amount (USD)] > 80;

-- Q2. Location Performance
SELECT 
    [Location],
    SUM([Purchase Amount (USD)]) AS Total_Revenue,
    ROUND(AVG([Review Rating]), 2) AS Avg_Rating
FROM dbo.customer
GROUP BY [Location]
HAVING COUNT([Customer ID]) >= 5
ORDER BY Total_Revenue DESC;

-- Q3. Payment Method Distribution
SELECT 
    [Payment Method],
    COUNT(*) AS total_orders,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS percentage_contribution
FROM dbo.customer
GROUP BY [Payment Method]
ORDER BY total_orders DESC;

-- Q4. Shipping Cost Impact
SELECT 
    [Shipping Type],
    [Discount Applied],
    ROUND(AVG([Purchase Amount (USD)]), 2) AS Average_Purchase_Amount
FROM dbo.customer
WHERE [Shipping Type] IN ('Standard', 'Express')
GROUP BY [Shipping Type], [Discount Applied]
ORDER BY [Shipping Type], [Discount Applied];

-- Q5. Frequently Returned or Low-Rated Items
SELECT 
    [Item Purchased], 
    ROUND(AVG([Review Rating]), 2) AS Avg_Rating,
    COUNT([Customer ID]) AS Total_Purchases
FROM dbo.customer
GROUP BY [Item Purchased]
HAVING AVG([Review Rating]) < 4
   AND COUNT([Customer ID]) >= 3
ORDER BY Avg_Rating ASC;

-- Q6. High-Spend Groups (HAVING Practice)
SELECT 
    [Category],
    ROUND(AVG([Purchase Amount (USD)]), 2) AS Average_Purchase_Amount
FROM dbo.customer
GROUP BY [Category]
HAVING AVG([Purchase Amount (USD)]) > 50
ORDER BY [Category];

-- Q7. Frequent Shoppers (HAVING with COUNT)

SELECT [Payment Method], COUNT([Customer ID]) AS total_transaction_count
FROM dbo.customer
GROUP BY [Payment Method]
HAVING COUNT([Customer ID]) > 500
ORDER BY [Payment Method];

-- Q8. Subscriptions by Location (GROUP BY Multiple Columns)

SELECT [Location], [Subscription Status], (SUM([Purchase Amount (USD)])) AS Total_Revenue
FROM dbo.customer
GROUP BY [Location], [Subscription Status]

-- Q9. Top Rated Items per Category (ROW_NUMBER() Window Function)

-- Q9. Top Rated Items per Category
WITH RankedItems AS (
    SELECT 
        [Category],
        [Item Purchased],
        ROUND(AVG([Review Rating]), 2) AS Avg_Rating,
        ROW_NUMBER() OVER (
            PARTITION BY [Category] 
            ORDER BY AVG([Review Rating]) DESC
        ) AS item_rank
    FROM dbo.customer
    GROUP BY [Category], [Item Purchased]
)
SELECT 
    [Category],
    [Item Purchased],
    Avg_Rating
FROM RankedItems
WHERE item_rank = 1
ORDER BY [Category];

-- Q10. Above-Average Spend Threshold
SELECT 
    [Customer ID],
    [Item Purchased],
    [Purchase Amount (USD)]
FROM dbo.customer
WHERE [Purchase Amount (USD)] > (
    SELECT AVG([Purchase Amount (USD)]) 
    FROM dbo.customer
)
ORDER BY [Purchase Amount (USD)] DESC;