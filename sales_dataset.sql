#Finding the total number of sales
SELECT *,round(NA_Sales+EU_Sales+JP_Sales+Other_Sales+Global_Sales,2) total_sales
FROM vgsales;

#Finding the genre with the highest number of sales
SELECT genre,round(NA_Sales+EU_Sales+JP_Sales+Other_Sales+Global_Sales,2) total_sales
FROM vgsales
group by genre
order by total_sales desc;

#Finding the year with the highest number of sales
SELECT Year ,round(NA_Sales+EU_Sales+JP_Sales+Other_Sales+Global_Sales,2) total_sales
FROM vgsales
group by year
Order by total_sales desc;

#Finding the publisher with the highest number of sales
SELECT publisher ,round(NA_Sales+EU_Sales+JP_Sales+Other_Sales+Global_Sales,2) total_sales
FROM vgsales
group by publisher
Order by total_sales desc;
