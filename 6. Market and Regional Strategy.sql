-- Market and Regional Strategy

-- Performance of market segments

-- Market with low penetration but high potential
-- Low penetration: few sales, low revenue, or fewer customers compared to others
-- High potential: despite low current performance, the market has favorable conditions for growth

WITH market_summary AS (
    SELECT 
        Market,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit,
        COUNT(DISTINCT "Order ID") AS Total_Orders,
        SUM(Profit) * 1.0 / NULLIF(SUM(Sales), 0) AS Profit_per_Sale,
        SUM(Profit) * 1.0 / NULLIF(COUNT(DISTINCT "Order ID"), 0) AS Profit_per_Order
    FROM `fashioncosmetics.skincare_sales_analysis.sales`
    GROUP BY Market
)

SELECT *
FROM market_summary
WHERE 
    Total_Sales < (SELECT AVG(Total_Sales) FROM market_summary)
    AND Total_Orders < (SELECT AVG(Total_Orders) FROM market_summary)
    AND Profit_per_Order > (SELECT AVG(Profit_per_Order) FROM market_summary);