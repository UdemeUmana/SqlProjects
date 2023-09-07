-- Viewing the data
SELECT * FROM retail_sales_dataset;

-- Renaming the total_amount column to Revenue
ALTER TABLE retail_sales_dataset
RENAME total_amount TO Revenue;

-- Reanming the price_per_unit column to unit price
ALTER TABLE retail_sales_dataset
RENAME price_per_unit TO Unit_price;

--Finding the product category with the highest revenue
SELECT
	product_category,
	SUM(revenue) AS total_revenue
FROM retail_sales_dataset
GROUP BY product_category
ORDER BY total_revenue DESC;

--Finding the correlation between the product generating the highest revenue and the average revenue
SELECT
	product_category,
	SUM(revenue) AS total_revenue,
	ROUND(AVG(revenue),2) AS avg_revenue
FROM retail_sales_dataset
GROUP BY product_category
ORDER BY total_revenue DESC,avg_revenue DESC;

--Average age of customers based on their gender
SELECT
	Gender,
	ROUND(AVG(age)) AS avg_age
FROM retail_sales_dataset
GROUP BY Gender;

--Finding the average price using over()
SELECT
product_category,
gender,
Unit_price,
ROUND(AVG(unit_price) OVER()) AS avg_price
FROM retail_sales_dataset;

--Finding the percental difference from the average price
SELECT
product_category,
gender,
Unit_price,
ROUND(AVG(unit_price) OVER()) AS avg_price,
ROUND((unit_price / AVG(unit_price) OVER() -1) * 100) as diff_from_avg_price
FROM retail_sales_dataset;

-- Giving a discount based on the goods quantity and unit price
SELECT
unit_price,
quantity,
CASE 
	WHEN unit_price = 500 AND Quantity >= 2 THEN '25% discount'
	WHEN unit_price >= 300 AND Quantity >= 2 THEN '35% discount'
	WHEN unit_price = 500 AND Quantity = 1 THEN '20% discount'
	ELSE '10% discount'
END AS discount
FROM retail_sales_dataset
ORDER BY Unit_price DESC, Quantity DESC;

--Finding the sum of revenue and unit price by product category
SELECT 
	Product_category,
	SUM(revenue) AS total_revenue,
	SUM(unit_price) AS unit_price
FROM retail_sales_dataset
GROUP BY product_category;

--Finding the total number of buyers filtering based on a certain conditions (Qauantity $ unit_price)
SELECT 
d.discount,
COUNT(*) AS total_number
FROM (SELECT
	unit_price,
	quantity,
	CASE 
		WHEN unit_price = 500 AND Quantity >= 2 THEN '25% discount'
	WHEN unit_price >= 300 AND Quantity >= 2 THEN '35% discount'
	WHEN unit_price = 500 AND Quantity = 1 THEN '20% discount'
	ELSE '10% discount'
	END AS discount
	FROM retail_sales_dataset
	ORDER BY Unit_price DESC, Quantity DESC) AS d
GROUP BY d.discount
ORDER BY total_number DESC;

-- Performing basic quartile calculation on the age column

SELECT
(COUNT(age) *1)/4 as a_25th_percentile,
(COUNT(age) *2)/4 as a_50th_percentile,
(COUNT(age) *3)/4 as a_75th_percentile
FROM retail_sales_dataset;

--Finding the median
SELECT
age,
ROW_NUMBER() OVER (ORDER BY age ASC)
FROM retail_sales_dataset;


