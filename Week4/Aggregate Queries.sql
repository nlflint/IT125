use world;

SELECT COUNT(*) FROM Country;

SELECT COUNT(Population) FROM Country;

SELECT Continent, COUNT(*) AS Count FROM Country GROUP BY Continent ORDER BY Count DESC;

SELECT COUNT(DISTINCT Continent) FROM Country ;

SELECT GROUP_CONCAT(Name) FROM Country WHERE Region = 'Western Europe';

SELECT GROUP_CONCAT(Name) FROM Country GROUP BY Region;

SELECT GROUP_CONCAT(DISTINCT Continent ORDER BY Continent SEPARATOR '/') FROM Country;

SELECT AVG(Population) FROM Country WHERE Region = 'Western Europe';

SELECT MIN(Population), MAX(Population) FROM Country WHERE Region = 'Western Europe';

SELECT SUM(Population), STD(Population) FROM Country WHERE Region = 'Western Europe';