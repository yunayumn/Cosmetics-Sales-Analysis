**Cosmetics Sales and Profit Analysis**

_Key Insights Analysis_

**Business Problems**

**1. Sales & Profitability Analysis**

- Which product categories and subcategories generate the highest and lowest sales and profit margins?
- Which products or product lines are underperforming despite high sales volumes?

**2. Customer Insights and Behavior**

- How are the buying patterns of customers?
- Which customer segments (Consumer, Corporate, Home Office) are contributing the most to sales and profit?

**3. Geographical Performance**

- Which countries, states, or cities have the highest and lowest sales performance?
- Are there regional trends (e.g., Asia vs. Europe) in product preferences or profitability?

**Exploratory Data Analysis (EDA)**

This dataset has 13.799 entries of sales and profit data throughout the year of 2022. The definition for all column is as follows:
1. **Row ID** – A unique identifier for each row entry in the dataset.
2. **Order ID** – The unique code representing each specific customer order.
3. **Order Date** – The date when the order was placed.
4. **Customer ID** – A unique identifier for the customer who placed the order.
5. **Segment** – The type of customer (e.g., Consumer, Corporate, or Home Office).
6. **City** – The city where the customer is located.
7. **State** – The state or administrative region of the customer.
8. **Country** – The country where the order was shipped.
9. **Country latitude** – The geographic latitude of the country (used for mapping).
10. **Country longitude** – The geographic longitude of the country (used for mapping).
11. **Region** – The broader geographical region (e.g., Eastern Asia, South America).
12. **Market** – The business market grouping (e.g., Europe, LATAM, Asia Pacific).
13. **Subcategory** – The specific type of skincare product (e.g., bath oils, creams).
14. **Category** – The broader product group the item belongs to (e.g., Body care).
15. **Product** – The specific name or description of the product sold.
16. **Quantity** – The number of units sold for that product in the order.
17. **Sales** – The revenue earned from the sale before applying costs or discounts.
18. **Discount** – The percentage of discount applied to the product.
19. **Profit** – The profit made from the sale after deducting costs and discounts.

A dashboard is also made for this dataset to make analyzing numbers of sales, profit, quantity sold, unique orders, and unique customers easier. This is especially done to share the dataset to potential stakeholders.

[![Cosmetics Sales and Profit Dashboard](https://public.tableau.com/static/images/Co/CosmeticsSalesandProfit/Dashboard/1.png)](https://public.tableau.com/app/profile/yuna.sinaga/viz/CosmeticsSalesandProfit/Dashboard)

- **Total Sales:** The company generated a total of $1,770,790.00 in sales.
- **Total Profit:** A total profit of $318,671.89 was achieved.
- **Total Quantity Sold:** 75,362 units of products were sold.
- **Total Unique Orders:** There were 6,883 unique orders placed.
- **Total Unique Customers:** The business served 6,113 unique customers.

**Data Pre-processing**

The dataset was found to be complete with no missing values and duplicate rows, indicating clean transactional records. Initial inspection showed that **order_date** was an **object** type and was converted to datetime for time-series analysis. Categorical columns like **segment, city, state, country, region, market, subcategory, category,** and **product** were identified as **object** types and required normalization. Text-based categorical columns were normalized to the title case to ensure consistency (e.g., 'Face Care' instead of 'face care' or 'FACE CARE').

**Results**

**1. Sales and Profitability Analysis**

**Sales and Profitability by Category**
 
- **Body Care** leads in both sales ($746,249) and profit ($180,537).
- **Home And Accessories** has high sales ($332,778) but shows a loss in profit (-$17,189.10), indicating potential issues with pricing, discounts, or cost management in this category.
- **Make Up** and **Face Care** are strong profit drivers. Hair Care has decent sales but relatively low profit.
- _Insight:_ Body Care is the clear revenue and profit driver. Addressing the profitability of the 'Home And Accessories' and 'Hair Care' categories should be a priority.

**2. Customer Insights and Behavior**
  
**Customer Buying Patterns**

- **Average Sales Per Order:** On average, each order brings in $257.27 in sales.
- **Average Profit Per Order:** Each order yields an average profit of $46.30.
- **Average Quantity Per Order:** Customers purchase approximately 10.95 units per order.
- **Average Sales Per Customer:** Each unique customer contributes an average of $289.68 in sales.
- **Average Profit Per Customer:** The average profit generated per customer is $52.13.
- **Average Quantity Per Customer:** Each customer purchases about 12.33 units.
- _Insight:_ These averages provide a benchmark for evaluating individual order and customer value. Strategies to increase average order value (AOV) and customer lifetime value (CLTV) could be explored.

**Customer Segments**

- **Corporate** customers generate the highest sales ($1,041,340) and profit ($169,682).
- The **consumer** segment follows with significant sales ($584,075) and profit ($120,507).
- **Self-Employed** is the smallest segment in terms of both sales and profit.
- _Insight:_ The Corporate segment is the most lucrative. Focusing on strategies to retain and grow the Corporate customer base, as well as optimizing offerings for Consumer and Self-Employed segments, would be beneficial.

**3. Geographical Performance**
  
**Top Performing Countries**

- **Sales:** United States ($362,452), Australia ($103,010), France ($95,320), Mexico ($90,751), and China ($78,083).
- **Profit:** United States ($62,660.40), Mexico ($25,248), France ($25,038.60), China ($23,415.10), and Germany ($19,925.20).
- **Quantity:** United States (14,449), France (4,389), Australia (4,385), Mexico (4,156), and Germany (3,127).
- _Insight: _ The United States is a dominant market across all metrics. Mexico shows strong profit performance relative to its sales ranking. France and Australia also contribute significantly.

**Top Performing Regions**

- **Sales:** Central America ($203,419), Western Europe ($198,076), Western US ($123,449), Oceania ($117,498), and South America ($116,130).
- **Profit:** Western Europe ($49,006.20), Central America ($43,657.10), Eastern Asia ($27,619.80), Southern Asia ($25,140.30), and Western US ($24,479.80).
- **Quantity:** Central America (9,129), Western Europe (8,881), Oceania (5,114), South America (4,729), and Western US (4,520).
- _Insight:_ Central America and Western Europe are key regions for sales, profit, and quantity. While Oceania and South America are strong in sales and quantity, their profit figures may need further investigation for profitability.
