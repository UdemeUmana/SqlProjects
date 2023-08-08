

-- This project contains datasets that were developed from scratch by me. My main objective of this project was to used data to answer real life business problems. The database consists of the following files: Customer_data,Employee_data, job_info, order, product ,sales stored procedures, functions and a view. 



#Geting top 21 rows from the order and product table for observation
SELECT * FROM customer_data as cu
JOIN `order` as od ON cu.Cust_id= od.cust_id
JOIN product as pr ON od.Prod_id = pr.Prod_id
JOIN sales as sa ON pr.Prod_id = sa.Prod_id
LIMIT 21;



#Your company is having a layoff and your boss tells you to layoff any staff without a degree
#Finding the names,jobtitle,degree of employees that do not have a degree
SELECT em.first_name,em.last_name,degree, jb.Jobtitle,
count(Jobtitle) OVER (partition by Jobtitle) as jb1
FROM employee_data as em
JOIN job_info as jb
ON em.Emp_id = jb.Emp_id
WHERE jb.DEGREE = 'No';

#Finding the product with the highest number of sales
SELECT pd.Product_name,Max(total) as mx_total
FROM product pd
JOIN sales sa
ON pd.Prod_id = sa.Prod_id
GROUP BY Product_name
ORDER BY mx_total desc;

#Creating a store procedure to get the price of a product using the prod_code
DELIMITER $$
CREATE PROCEDURE get_price(IN id VARCHAR(25))
BEGIN
	SELECT PRICE
	FROM product
    WHERE Prod_code = Id;
END $$
DELIMITER ;
#Inputing a prod_code to get the price of a product
call udy_express.`Get price`('PD121');

#My boss asks me to create a database where customers emails of customers who subscribed to be receiving weekly newsletters are stored 
#Reason for using view is so that each time a customer signs up on the on the customer table and resgisters for a weekly newsletter it is automatically added to the subscribers_table
	#Creating a view to store a list of customers names and their emails
	CREATE VIEW Subscribers_email AS
	SELECT concat(F_name," ",l_name) as Fullname,Gmail
	FROM customer_data;
    
#Displaying the data from the subscribers_table
	SELECT *
	FROM subscribers_email;



#In the month of march the company had a problem with the price software and it over charged people that placed orders in march
#Writing a subquery to find the names of people that purchased a particular product in the month of march
SELECT Cust_id,F_name,L_name
FROM customer_data as cu
WHERE cust_id IN 
(SELECT cust_id
FROM `order`
WHERE order_date BETWEEN '2022-03-01 00:00:00' AND '2022-03-31 00:00:00');


#Business analysts and customer_care has done well in their jobs and your boss asks you to add 0.4 dollars raise to their salary and give the resta 0.3 raise
#Writing a case statement to calculate a raise for employees based on their jobtitles
SELECT em.First_name,em.last_name,jb.salary,jb.jobtitle,
CASE
	WHEN jb.jobtitle = 'Customer care' THEN Salary + (salary*.8)
    WHEN jb.jobtitle = 'Business Analyst' THEN Salary +( salary*.6)
    ELSE Salary +( salary*.3)
END AS salary_after_raise
FROM employee_data em
join Job_info jb
ON em.emp_id =jb.emp_id;

#Creating a stored procedure to take input a customer username and password and output the customers information
Delimiter $$
CREATE PROCEDURE User_login( IN username1 varchar(25), IN `password1` varchar(25))
BEGIN
	SELECT Cust_id,F_name,L_name,Gmail,Phone_number
    FROM Customer_data
    WHERE username = username1 AND `password` = `Password1`;
    
END $$
Delimiter ;

#A user inputting his login deatils
call udy_express.User_login('James12', 'James12@Smith1');

#Finding the job title with less than 3 people working in their department.
#The manager realised that some department are short staff and wants you to find the jobtitle with less than 3 people working so that he can hire more people to work in that department
SELECT jobtitle,COUNT(jobtitle) as jbt
FROM job_info
GROUP BY jobtitle
HAVING jbt <3;

#Frequently used query
#Writing a with statement to store the cust_id,customers_name,gmail etc
WITH CustomerOrder_CTE as (SELECT cu.Cust_id,ord.customer_name ,cu.gmail,ord.country,ord.Order_date
FROM customer_data as cu
JOIN `order` as ord
ON cu.cust_id = ord.cust_id)



#Using the with statement to find the country with the highest number of customers in the month of february
SELECT country,count(cust_id) as number_of_customer
FROM CustomerOrder_CTE
WHERE order_date BETWEEN '2022-01-12 00:00:00' AND '2022-02-20 00:00:00' 
GROUP BY country;


#Writing a function to format a Nigerian phone number inputed with it's country code
DELIMITER $$
CREATE FUNCTION `format_phone_number`(phone_number VARCHAR(13)) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  SET phone_number = REGEXP_REPLACE(phone_number, '[^0-9]+', ''); -- Remove non-numeric characters
  IF LENGTH(phone_number) = 13 AND LEFT(phone_number, 3) = '234' 
  THEN -- If it's a +234 number, format it as "01234567890"
   SET phone_number = CONCAT('0', LEFT(RIGHT(phone_number, 10), 4), RIGHT(phone_number, 6));
  END IF;
  RETURN phone_number;
END $$
DELIMITER ;

