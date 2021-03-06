-- 1.
-- List each country name where the population is larger than that of 'Russia'.
SELECT name
FROM world
WHERE population >
     (SELECT population
FROM world
WHERE name='Russia');


-- 2.
-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name
FROM world
WHERE gdp/population > (SELECT gdp/population
    FROM world
    WHERE name='United Kingdom')
    AND continent = 'Europe'


-- 3.
-- List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent
FROM world
WHERE continent IN( (Select continent
FROM world
WHERE name = 'Argentina'), (Select continent
FROM world
WHERE name = 'Australia'))
ORDER BY name;


-- 4.
-- Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name
FROM world
WHERE population >
     (SELECT population
    FROM world
    WHERE name='Canada') AND population < (SELECT population
    FROM world
    WHERE name='Poland')
;



-- 5.
-- Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
-- The format should be Name, Percentage for example:
-- name	percentage
-- Albania	3%
-- Andorra	0%
-- Austria	11%

SELECT name, CONCAT(ROUND(population/(SELECT population
    FROM world
    WHERE name = 'Germany')*100),'%') AS percentage
from world
WHERE continent = 'Europe';





-- _______________________________________________________________________________________________________________
-- To get a well rounded view of the important features of SQL you should move on to the next tutorial concerning aggregates.
-- To gain an absurdly detailed view of one insignificant feature of the language, read on.
-- We can use the word ALL to allow >= or > or < or <=to act over a list. For example, you can find the largest country in the world, by population with this query:
-- SELECT name
--   FROM world
--  WHERE population >= ALL(SELECT population
--                            FROM world
--                           WHERE population>0)
-- You need the condition population>0 in the sub-query as some countries have null for population.
-- ________________________________________________________________________________________________________________

-- 6.
-- Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name
FROM world
WHERE gdp > (SELECT MAX(gdp)
FROM world
WHERE continent='Europe');



-- 7.
-- Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, area
FROM world as w1
WHERE area = (SELECT max(area)
FROM world as w2
where w1.continent=w2.continent);




-- 8.
-- List each continent and the name of the country that comes first alphabetically.
SELECT continent, name
FROM world as w1
WHERE name = (SELECT min(name)
FROM world as w2
where w1.continent=w2.continent);





-- 9.
-- Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name, continent, population
FROM world
where continent not in (select distinct continent
from world
where population >25000000);







-- 10.
-- Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent
FROM world as w1
where w1.population/3 > (SELECT max(population)
FROM world as w2
where w1.continent=w2.continent and w1.population<>w2.population);




