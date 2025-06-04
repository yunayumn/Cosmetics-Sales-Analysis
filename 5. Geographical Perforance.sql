-- Geographical Performance

-- Country, state, and city with the highest and lowest sales performance

-- Country

SELECT
  country,
  SUM(sales) AS sales_country,
  SUM(profit) AS profit_country,
  (SUM(profit))/(SUM(sales)) AS margin_country,
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`
GROUP BY country
ORDER BY sales_country DESC;

-- State

SELECT
  country,
  state,
  SUM(sales) AS sales_state,
  SUM(profit) AS profit_state,
  (SUM(profit))/(SUM(sales)) AS margin_state
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`
GROUP BY country, state
ORDER BY sales_state DESC;

-- City

SELECT
  country,
  state,
  city,
  SUM(sales) AS sales_city,
  SUM(profit) AS profit_city,
  (SUM(profit))/(SUM(sales)) AS margin_city
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`
GROUP BY country, state, city
ORDER BY sales_city DESC;

-- Regional trends in product preferences and profitability

-- Regional product preferences

SELECT
  region,
  category,
  SUM(sales) AS sales_category
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`
GROUP BY
  region, category
QUALIFY
  ROW_NUMBER() OVER (
    PARTITION BY region
    ORDER BY SUM(sales) DESC
  ) = 1
ORDER BY
  region,
  sales_category DESC;

-- Regional product profitability

SELECT
  region,
  SUM(sales) AS sales_region,
  SUM(profit) AS profit_region,
  (SUM(profit))/(SUM(sales)) AS margin_region,
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`
GROUP BY region
ORDER BY profit_region DESC;

-- Country product performance

SELECT
  country,
  category,
  SUM(sales) AS sales_category
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`
GROUP BY
  country, category
QUALIFY
  ROW_NUMBER() OVER (
    PARTITION BY country
    ORDER BY SUM(sales) DESC
  ) = 1
ORDER BY
  country;