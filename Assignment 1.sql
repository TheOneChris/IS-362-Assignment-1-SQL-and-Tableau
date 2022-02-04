/*
QUESTION 1. How many airplanes have listed speeds? What is the minimum listed speed and the maximum listed speed?
	ANSWER = 23 planes with speed
    ANSWER 2 = Maximum speed = 432
    ANSWER 3 = Minimum speed = 90
*/
SELECT 'Number of planes with a speed', COUNT(speed) FROM planes
union
SELECT 'Maximum SPEED', MAX(speed) FROM planes
union
SELECT 'Minimum SPEED', MIN(speed) FROM planes;

/*
QUESTION 2. What is the total distance flown by all of the planes in January 2013?
What is the total distance flown by all of the planes in January 2013 where the tailnum is missing? 
	ANSWER = 31482 total distance in January 2013
    ANSWER 2 = NULL ? 
*/
SELECT COUNT(*) AS 'Total Distance flown of all planes just January 2013', SUM(distance) AS 'Total Distance of all planes' FROM flights
	WHERE (flights.year = 2013 AND flights.month = 1);
    
SELECT SUM(distance) as TotalMiles FROM flights   
	WHERE (flights.month = 1) AND (flights.year = 2013) AND (flights.tailnum is NULL);   #???????? 
    
/*
QUESTION 3. What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer?
Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare? 
	ANSWER = The INNER JOIN Query doesn't include the 140 flights with no Manufacturer that the LEFT OUTER JOIN Query includes
    ANSWER 2 = TOTAL DISTANCE INNER JOIN = 755337
    ANSWER 3 = TOTAL DISTANCE LEFT OUTER JOIN = 883008
*/
SELECT COUNT(*) AS 'Specfic Manufacturer Flights', SUM(distance) AS 'Specfic Total Distance for Manufacturer', manufacturer AS 'Manufacturer' FROM flights
    INNER JOIN planes ON flights.tailnum = planes.tailnum
    WHERE (flights.year = 2013 AND flights.month = 7 AND flights.day = 5)
		GROUP BY manufacturer;
    
SELECT COUNT(*) AS 'Specfic Manufacturer Flights', SUM(distance) AS 'Specfic Total Distance for Manufacturer', manufacturer AS 'Manufacturer' FROM flights
	LEFT OUTER JOIN planes ON flights.tailnum = planes.tailnum
	WHERE (flights.year = 2013 AND flights.month = 7 AND flights.day = 5)
		GROUP BY manufacturer;

/*
QUESTION 4. Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database.

What manufacturer had the most flights with a specfic airliner on January 29,2013?
 ANSWER = 222 Total flights with BOEING using Airliner "United Air Lines Inc"
*/

SELECT COUNT(*) AS 'Total Number of Flights', name AS 'Airlines', manufacturer AS 'Manufacturer' FROM flights
	LEFT OUTER JOIN airlines ON flights.carrier = airlines.carrier
    INNER JOIN planes ON flights.tailnum = planes.tailnum 
    WHERE (flights.year = 2013 AND flights.month = 1 AND flights.day = 29)
		GROUP BY manufacturer;
       