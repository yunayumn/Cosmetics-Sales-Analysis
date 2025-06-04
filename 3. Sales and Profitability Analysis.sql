-- Sales & Profitability Analysis

-- Highest to lowest sales and profit margin by subcategory

SELECT
  subcategory,
  SUM(sales) AS sales_subcategory,
  SUM(profit) AS profit_subcategory,
  (SUM(profit))/(SUM(sales)) AS margin_subcategory
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`
GROUP BY subcategory
ORDER BY margin_subcategory DESC;

-- Highest to lowest sales and profit margin by category

SELECT
  category,
  SUM(sales) AS sales_category,
  SUM(profit) AS profit_category,
  (SUM(profit))/SUM(sales) AS margin_category
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`
GROUP BY category
ORDER BY margin_category DESC;

-- Analyzing why the category Home and Accessories have negative margin results

SELECT
  product,
  subcategory,
  quantity,
  sales,
  discount,
  profit
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`
WHERE
  category = 'Home and Accessories';

-- Underperforming product and product lines

-- Pulling product data with high sales volume (over the average value) while also having negative profit
SELECT
  product,
  SUM(sales) AS sales_product,
  SUM(profit) AS profit_product,
  (SELECT
    AVG(sales)
  FROM `fashioncosmetics.skincare_sales_analysis.sales`) AS avg_product_sales
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`
WHERE
  sales >= (SELECT AVG(sales)
            FROM `fashioncosmetics.skincare_sales_analysis.sales`)
  AND profit < 0
GROUP BY product
ORDER BY sales_product DESC, profit_product ASC;

-- Underperforming products with profit margin of less than 20%
SELECT
  product,
  SUM(sales) AS sales_product,
  SUM(profit) AS profit_product,
  (SUM(profit))/(SUM(sales)) AS margin_product
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`
GROUP BY product
HAVING
  (SUM(profit))/(SUM(sales)) > 0
  AND (SUM(profit))/(SUM(sales)) < 0.20
ORDER BY sales_product DESC;