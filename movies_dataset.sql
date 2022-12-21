#DISPLAYING ALL THE CONTENT IN THE MOVIES TABLE 
USE projects_db;
SELECT *
FROM movies;

#Finding the year with the highest votes
SELECT year,sum(votes)
from movies
group by year
order by 2 desc;

#FINDING THE COUNTRY WITH THE HIGHEST BUDGET
SELECT country,sum(budget) as highest_budget
from movies;


#FINDING THE COMPANY WITH THE HIGHEST GROSS
SELECT company, sum(gross) highest_gross
FROM movies;

#Finding the genre with the highest votes
SELECT genre,sum(votes)
FROM movies
group by genre
order by 2 desc;

