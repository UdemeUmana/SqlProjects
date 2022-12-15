#Using  SELECT,FROM,WHERE,GROUP BY,ORDER BY


USE new_db;

#DISPLAYING ALL THE ROWS AND COLUMN IN THE MOVIES TABLE
SELECT *
FROM movies;

#SELECTING THE GENRE,YEAR AND COUNTRY COLUMN
SELECT Genre,Year,country
from movies;

#USING THE WHERE CLAUSE TO FIND THE GENRE AND YEAR COLUMN FOR A SPECIFIC COUNTRY
SELECT genre,year,country
FROM movies
WHERE country= 'United Kingdom';

#USING THE WHERE CLAUSE TO FIND GENRE AND YEAR COLUMN FOR ALL THE COUNTRIES EXCEPT THE UNITED KINGDOM
SELECT genre,year,country
from movies
Where country <> 'United Kingdom';

#USING THE IN CLAUSE IN THE WHERE COMMAND 
SELECT genre,year
FROM movies
WHERE year in (1980,1981);

#Using the LIKE clause
SELECT Name,year,rating
FROM movies
WHERE rating like 'p%';

#Using the groupby clause
SELECT name,genre,year
FROM movies
WHERE country <>'United Kingdom'
GROUP BY genre;

#USING THE ORDER BY
SELECT name,genre,year,rating
FROM movies
WHERE country <>'United Kingdom'
GROUP BY rating
ORDER BY rating desc;

#Using the count clause
SELECT COUNT(genre)
from movies;

#using temporary table
CREATE TEMPORARY TABLE temp_table(
	Employeeid int,
    FirstName varchar(50),
    LastName varchar(50)
);

SELECT *
FROM warehouse_data


