-- Exploratory Data Analysis

-- Checking data head

SELECT
  *
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`
LIMIT 5;

-- Checking size of dataset

SELECT
  COUNT(*)
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`;

-- Univariate analysis of category

SELECT
  *,
  ROUND((cfreq/SUM(cfreq) OVER())*100,2) AS cpercentage
FROM
  (SELECT Category,COUNT(Category) AS cfreq
  FROM `fashioncosmetics.skincare_sales_analysis.sales`
  GROUP BY Category
  ORDER BY cfreq DESC
  ) t;

-- Univariate analysis of subcategory

SELECT
  *,
  ROUND((sfreq/SUM(sfreq) OVER())*100,2) AS spercentage
FROM
  (SELECT Subcategory,COUNT(Subcategory) AS sfreq
  FROM `fashioncosmetics.skincare_sales_analysis.sales`
  GROUP BY Subcategory
  ORDER BY sfreq DESC
  ) t;