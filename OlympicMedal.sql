#In this SQL code, I'm querying a database that's holding OlympicMedal data to answer questions about the data.

#Display all the rows and columns in your dataset

-- WHICH COUNTRY HAS WON THE MOST MEDALS
select NOC,count(medal) as CountMedal
from  olympicdatamedal
group by noc
order by CountMedal desc;

-- WHICH COUNTRY HAS WON THE MOST GOLD
select noc,count(medal) as CountMedal
from olympicdatamedal
where medal = 'Gold'
group by noc
order by CountMedal desc;
-- WHICH COUNTRY HAS WON THE MOST MOST SILVER, AND MOST BRONZE
select noc,count(medal) as CountMedal
from olympicdatamedal
where medal = 'Silver'
group by noc
order by CountMedal desc;

-- WHICH COUNTRY HAS WON THE MOST BRONZE
select noc,count(medal) as CountMedal
from olympicdatamedal
where medal = 'Bronze'
group by noc
order by CountMedal desc;

-- IN WHICH EDITION (I.E. YEAR) WAS THE MOST GOLD WON, WHO WON THE MOST GOLD IN THE YEAR
select concat(AthleteLastName, ' ',AthleteFirstName ) AS FullName,Edition, count(Edition) as CountEdition
from olympicdatamedal
where medal = 'Gold'
group by Edition
order by CountEdition desc;

-- WHICH CITY HAS STAGED THE OLYMPICS MOST, IF ANY
select city, count(city) as CountCity
from olympicdatamedal
group by city
order by CountCity desc;

-- HAVE WOMEN WON MORE MEDALS THAN MEN?
select Gender,medal,count(medal) as CountGender
from olympicdatamedal
group by gender
order by CountGender desc;

-- WHICH DISCIPLINE HAS MEN WON THE MOST
select discipline,count(Discipline)
from olympicdatamedal
where Gender = 'Men'
group by Discipline
order by count(Discipline) desc;

-- WHICH DISCIPLINE HAS WOMEN WON THE MOST
select discipline,count(Discipline)
from olympicdatamedal
where Gender = 'women'
group by Discipline
order by count(Discipline) desc;















