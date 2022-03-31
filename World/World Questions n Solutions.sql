# Q1. Using COUNT, get the number of cities in the USA.--
SELECT COUNT(`Name`) FROM city WHERE CountryCode = 'USA';

# Q2. Find out the population and life expectancy for people in Argentina.--
SELECT Population, LifeExpectancy FROM country WHERE `Name` = 'Argentina';

# Q3. Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?--
SELECT `Name` FROM country WHERE LifeExpectancy IS NOT NULL ORDER BY LifeExpectancy DESC LIMIT 1;

# Q4. Using JOIN ... ON, find the capital city of Spain.-- 
SELECT city.`name` FROM country 
JOIN city ON country.capital = city.id WHERE country.`Name` = 'Spain';

# Q5. Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.-- 
SELECT cl.`language` FROM country c 
LEFT JOIN countrylanguage cl ON c.code = cl.countrycode WHERE c.region = 'Southeast Asia';

# Q6. Using a single query, list 25 cities around the world that start with the letter F.
SELECT * FROM country WHERE `Name` LIKE 'F%' LIMIT 25;

# Q7. Using COUNT and JOIN ... ON, get the number of cities in China.-- 
SELECT COUNT(city.`Name`) FROM city 
JOIN country ON country.Code = city.CountryCode WHERE country.Code = 'CHN';

# Q8. Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.-- 
SELECT * FROM country WHERE Population IS NOT NULL ORDER BY Population ASC LIMIT 1;

# Q9. Using aggregate functions, return the number of countries the database contains.-- 
SELECT COUNT(DISTINCT `Name`) FROM country;

# Q10. What are the top ten largest countries by area?--
SELECT `Name`, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 10; 

# Q11. List the five largest cities by population in Japan.
SELECT `Name`, Population FROM city WHERE CountryCode = 'Jpn' ORDER BY Population DESC LIMIT 5;

# Q12. List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!-- 
-- Need to change spelling of Elizabeth II to Elisabeth II
SELECT `Name`, Code FROM country WHERE HeadOfState = 'Elisabeth II';

# Q13. List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.-- 
SELECT `Name`, (Population/SurfaceArea) FROM country WHERE (Population/SurfaceArea) > 0 ORDER BY (Population/SurfaceArea) ASC LIMIT 10;

# Q14. List every unique world language.--  
SELECT DISTINCT `Language` FROM countrylanguage;

# Q15. List the names and GNP of the world's top 10 richest countries.-- 
SELECT `Name`, GNP FROM country ORDER BY GNP DESC LIMIT 10;

# Q16. List the names of, and number of languages spoken by, the top ten most multilingual countries.-- 
SELECT `Language`, COUNT(`Language`) FROM countrylanguage GROUP BY CountryCode ORDER BY COUNT(`Language`) DESC LIMIT 10;

# Q17. List every country where over 50% of its population can speak German.-- 
SELECT CountryCode, Percentage FROM countrylanguage WHERE `Language` = 'German' and Percentage > 50;

# Q18. Which country has the worst life expectancy? Discard zero or null values.-- 
SELECT `Name`, LifeExpectancy FROM country WHERE LifeExpectancy !=0 ORDER BY LifeExpectancy ASC LIMIT 1;

# Q19. List the top three most common government forms-- 
SELECT GovernmentForm, COUNT(GovernmentForm) FROM country GROUP BY GovernmentForm ORDER BY COUNT(GovernmentForm) DESC LIMIT 3;

# Q20. How many countries have gained independence since records began?-- 
SELECT COUNT(Code) FROM country WHERE IndepYear IS NOT NULL;


