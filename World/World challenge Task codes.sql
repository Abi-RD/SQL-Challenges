USE world;

SELECT COUNT(Name) FROM city WHERE CountryCode = 'USA';
SELECT COUNT(*) FROM city WHERE CountryCode = 'USA';

SELECT Name FROM country WHERE LifeExpectancy IS NOT NULL ORDER BY LifeExpectancy DESC LIMIT 1;

-- SELECT city.name FROM country 
-- LEFT JOIN city ON country.capital = city.id WHERE country.Name = 'Spain';

select * from country where Name = 'Spain';

-- SELECT cl.language FROM country c LEFT JOIN countrylanguage cl ON c.code = cl.countrycode WHERE c.region = 'Southeast Asia';

# Q4. Using JOIN ... ON, find the capital city of Spain.-- 
SELECT city.name FROM country 
LEFT JOIN city ON country.capital = city.id WHERE country.Name = 'Spain';

# Q5. Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.-- 
SELECT cl.language FROM country c 
LEFT JOIN countrylanguage cl ON c.code = cl.countrycode WHERE c.region = 'Southeast Asia';

SELECT COUNT(city.Name) FROM city 
JOIN country ON country.Code = city.CountryCode WHERE country.Code = 'CHN';

SELECT * FROM country WHERE Name LIKE 'F%' LIMIT 25;

SELECT * FROM country WHERE Population IS NOT NULL ORDER BY Population ASC LIMIT 1;

SELECT COUNT(DISTINCT Name) FROM country;

SELECT Name SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 10;

SELECT Name, Population FROM city WHERE CountryCode = 'Jpn' ORDER BY Population DESC LIMIT 5; 

#Need to change spelling of Elizabeth II to Elisabeth II
SELECT Name, Code FROM country WHERE HeadOfState = 'Elisabeth II';

-- SELECT Name, MIN(Population/SurfaceArea) FROM country ORDER BY (Population/SurfaceArea) DESC LIMIT 10;

SELECT Name, (Population/SurfaceArea) FROM country WHERE (Population/SurfaceArea) > 0 ORDER BY (Population/SurfaceArea) ASC LIMIT 10;

SELECT DISTINCT Language FROM countrylanguage;

SELECT Name, GNP FROM country ORDER BY GNP DESC LIMIT 10;

SELECT CountryCode, Language FROM countrylanguage GROUP BY CountryCode LIMIT 10;

SELECT CountryCode, Language, COUNT(`Language`) FROM countrylanguage GROUP BY CountryCode ORDER BY COUNT(`Language`) DESC LIMIT 10;

SELECT CountryCode, Percentage FROM countrylanguage WHERE Language = 'German' and Percentage > 50;

SELECT Name, LifeExpectancy FROM country WHERE LifeExpectancy !=0 ORDER BY LifeExpectancy ASC LIMIT 1;

SELECT GovernmentForm, COUNT(GovernmentForm) FROM country GROUP BY GovernmentForm ORDER BY COUNT(GovernmentForm) DESC LIMIT 3;

SELECT COUNT(Code) FROM country WHERE IndepYear IS NOT NULL;
