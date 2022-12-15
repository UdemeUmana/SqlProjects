Insert Into emp_sal VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000);

USE new_db;

#Displaying only firstname And LastName
SELECT FirstName,LaastName
FROM emp_data;

#Finding the highest Paid salary 
SELECT MAX(Salary)
FROM emp_sal;

#Finding the lowest paid salary 
SELECT MIN(Salary)
FROM emp_sal;

#Finding the number of rows in a column
SELECT COUNT(EmployeeId)
FROM emp_data;

#Finding the Average salary from the salary column and rounding it to become a whole number
SELECT ROUND(AVG(Salary))
FROM emp_sal;

Select *
FROM emp_data
Where Age > 30 OR Gender = 'F';

select *
from emp_data
where FirstName In ('Udeme','Michael');


#USING JOINS,UNION,CASE,HAVING
#USING JOINS
SELECT warehouse_data.EmployeeID ,warehouse_data.FirstName,LaastName
FROM emp_data
JOIN warehouse_data
ON  emp_data.EmployeeId = warehouse_data.EmployeeId;

#USING UNION
SELECT EmployeeID,FirstName,LaastName
FROM emp_data
UNION ALL
SELECT EmployeeID,FirstName,LastName
FROM warehouse_data;

CREATE TABLE warehouse_data(
EmployeeId int,
FirstName varchar(50),
LastName varchar(50));

INSERT INTO warehouse_data values
(1011,'Uwana','Albert'),
(1012,'Kufre','Ubong'),
(1013,'Emem','Iniobong');

select * from warehouse_data;

#USING CASE 
SELECT emp_data.EMployeeId,FirstName,Jobtitle,Salary,
	CASE
		WHEN jobtitle ='Salesman' THEN round(Salary+(salary * .2))
		WHEN jobtitle = 'HR' THEN round(salary+(salary*1.5))
        WHEN jobtitle =  'Accountant' THEN round(salary+(Salary*1.2))
        ELSE round(Salary+(salary *1))
	END as Sal_Description
FROM emp_data
JOIN emp_sal
ON emp_data.EmployeeId = emp_sal.EmployeeId;
    
#Using the HAVING CLAUSE
select Jobtitle,round(AVG(salary)) as avg_sal
FROM emp_data
JOIN emp_sal
ON emp_data.EmployeeId = emp_sal.EmployeeId
GROUP by Jobtitle
HAVING avg_sal> 50000;

#USING PARTITION BY
SELECT Firstname,laastname,gender, count(gender) over (partition by gender)
from emp_data;

select * from emp_data;
UPDATE emp_data
SET age = 19,Gender = 'M'
WHERE emp_data.EmployeeID = 1002;

SET SQL_SAFE_UPDATES = 0;
use new_db;

#Using the ADDDATE FUNCTION (YEAR,DAY,MONTH)
SELECT ADDDATE("2022-10-12", INTERVAL 10 YEAR) as Date;

#Using the current date functon
SELECT CURRENT_DATE();

#using current time
SELECT CURRENT_TIME();

#USING CURRENT TIMESTAMP
SELECT current_timestamp();

#USING NOW
SELECT NOW();

use new_db;
#CTE
WITH employees as (
	SELECT FirstName,LaastName,age,salary,gender
	from emp_data
    join emp_sal
    on emp_data.employeeid = emp_sal.employeeid

)
select *, avg(salary) as avgsal
from employees;

#Using string functions
USE new_db;
CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
);

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired');

#Using trim
SELECT EmployeeId, LTRIM(EmployeeID)
FROM EmployeeErrors;

#Using the replace
SELECT LastName, replace(lastname, '- Fired',"")
FROM EmployeeErrors;

#Using concat
SELECT concat(Firstname," ",lastname)
FROM EmployeeErrors;

#Using substring
SELECT substring(Firstname,1,3)
FROM EmployeeErrors;

USE new_db;

call new_procedure();

#USING SUBQUERY
SELECT EmployeeId,salary,(SELECT round(AVG(Salary)) FROM emp_sal) as Avgsal
FROM emp_sal; 

#using partition by
Select gender, salary,round(avg(salary) over ())
from emp_data
join emp_sal
on emp_data.Employeeid = emp_sal.Employeeid;

#using subquery in from
select a.employeeid,avgsal
from (SELECT EmployeeId,salary,avg(salary) over() as avgsal from emp_sal) a;

#using subquery in where
select employeeid,jobtitle,salary
from emp_sal
WHERE employeeid in (
	select employeeid
    from emp_data
    where age>30
);


SELECT Employeeid,Firstname,age
FROM emp_data
WHERE employeeid in (
select employeeid
from emp_sal
where age>30
);

CREATE DATABASE projects_db;






