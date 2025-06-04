-- Data Cleaning

-- Standardization of column names with multiple words

ALTER TABLE
  `fashioncosmetics.skincare_sales_analysis.sales`
RENAME COLUMN `Row ID` to row_id,
RENAME COLUMN `Order ID` to order_id,
RENAME COLUMN `Order Date` to order_date,
RENAME COLUMN `Customer ID` to customer_id,
RENAME COLUMN `Country latitude` to country_latitude,
RENAME COLUMN `Country longitude` to country_longitude;

-- Standardization of column names with a single word to a temporary name

ALTER TABLE
  `fashioncosmetics.skincare_sales_analysis.sales`
RENAME COLUMN `Segment` to temp_segment,
RENAME COLUMN `City` to temp_city,
RENAME COLUMN `State` to temp_state,
RENAME COLUMN `Country` to temp_country,
RENAME COLUMN `Region` to temp_region,
RENAME COLUMN `Market` to temp_market,
RENAME COLUMN `Subcategory` to temp_subcategory,
RENAME COLUMN `Category` to temp_category,
RENAME COLUMN `Product` to temp_product,
RENAME COLUMN `Quantity` to temp_quantity,
RENAME COLUMN `Sales` to temp_sales,
RENAME COLUMN `Discount` to temp_discount,
RENAME COLUMN `Profit` to temp_profit;

-- Standardization of single-worded column names

ALTER TABLE
  `fashioncosmetics.skincare_sales_analysis.sales`
RENAME COLUMN `temp_segment` to segment,
RENAME COLUMN `temp_city` to city,
RENAME COLUMN `temp_state` to state,
RENAME COLUMN `temp_country` to country,
RENAME COLUMN `temp_region` to region,
RENAME COLUMN `temp_market` to market,
RENAME COLUMN `temp_subcategory` to subcategory,
RENAME COLUMN `temp_category` to category,
RENAME COLUMN `temp_product` to product,
RENAME COLUMN `temp_quantity` to quantity,
RENAME COLUMN `temp_sales` to sales,
RENAME COLUMN `temp_discount` to discount,
RENAME COLUMN `temp_profit` to profit;

-- Change date format from string to date

SELECT
  CAST(order_date AS DATE) AS order_date
FROM
  `fashioncosmetics.skincare_sales_analysis.sales`