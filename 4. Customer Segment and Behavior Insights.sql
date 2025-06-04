-- Customer Segment & Behavior Insights

-- Customer segment with highest sales and profit

SELECT
  DISTINCT(segment),
  COUNT(segment) AS segment_count,
  SUM(sales) AS sales_segment,
  ROUND(100 * SUM(sales) / SUM(SUM(sales)) OVER (), 2) AS sales_percentage,
  SUM(profit) AS profit_segment,
  AVG(quantity) AS avg_qty,
  AVG(discount) AS avg_discount,
  (SUM(profit))/(SUM(sales)) AS margin_segment
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`
GROUP BY segment;

-- Discount analysis (how much of the customers from each segments use and don't use discounts)

SELECT
  segment,
  SUM(CASE WHEN discount > 0 THEN 1 ELSE 0 END) AS purchases_with_discount,
  SUM(CASE WHEN discount = 0 THEN 1 ELSE 0 END) AS purchases_without_discount,
  (SUM(CASE WHEN discount > 0 THEN 1 ELSE 0 END))/(COUNT(segment)) AS discount_percentage
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`
GROUP BY
  segment;

-- Looking for customers who are repeat buyers (customer_id appear more than once), sorted by the total profit of all their purchases

SELECT 
    customer_id,
    segment,
    market,
    COUNT(DISTINCT order_id) AS order_count,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(AVG(sales), 2) AS avg_sales_per_order
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`
GROUP BY customer_id, segment, market
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY total_profit DESC;

-- Lifetime value of customers from each segment (CLV = total profit per customer)

WITH customer_clv AS (
    SELECT 
        customer_id,
        segment,
        SUM(profit) AS CLV
    FROM `fashioncosmetics.skincare_sales_analysis.sales`
    GROUP BY customer_id, segment
)

SELECT 
    segment,
    COUNT(*) AS customer_count,
    ROUND(AVG(CLV), 2) AS avg_CLV_per_customer,
    ROUND(SUM(CLV), 2) AS total_CLV_for_segment
FROM customer_clv
GROUP BY segment
ORDER BY avg_CLV_per_customer DESC;