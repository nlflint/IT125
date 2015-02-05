use world;

SELECT Name, LocalName, LENGTH(LocalName) AS len
FROM Country 
WHERE Continent = 'Europe'
ORDER BY len DESC;

SELECT Name, LocalName, LENGTH(LocalName) AS len, CHAR_LENGTH(LocalName) as chars
FROM Country 
WHERE Continent = 'Europe'
ORDER BY len DESC;

SELECT Name, LEFT(Name, 3), RIGHT(Name, 3), MID(Name, 2, 3)
FROM Country
WHERE Continent = 'Europe';

SELECT CONCAT(Name, LocalName )
FROM Country
WHERE Continent = 'Europe';

SELECT CONCAT_WS(', ', Name, LocalName, Region, Continent )
FROM Country
WHERE Continent = 'Europe';

SELECT LOCATE('stan', 'kazahstan');

SELECT Name, LOCATE('stan', Name)
FROM Country
WHERE Name LIKE '%stan%';

SELECT Name, LOCATE('k', Name)
FROM Country
WHERE Name LIKE '%k%';

SELECT Name, UPPER(Name), LocalName, UPPER(LocalName)
FROM Country
WHERE Continent = 'Europe';

SELECT Name, LOWER(Name), LocalName, LOWER(LocalName)
FROM Country
WHERE Continent = 'Europe';

SELECT Name, REVERSE(Name), LocalName, REVERSE(LocalName)
FROM Country
WHERE Continent = 'Europe';