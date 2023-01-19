--Extract information about all the Aircraft and
--the count of their FlightDestinations. Display average ticket price (AvgPrice) of each flight 
--destination by the Aircraft, rounded to the second digit.
--Take only the aircraft with at least 2  FlightDestinations. 
--Order the results by count of flight destinations descending, 
--then by the aircraft’s id ascending. 
SELECT 
	a.Id AS AircraftId,
	a.Manufacturer,
	a.FlightHours,
	COUNT(fd.AircraftId) AS FlightDestinationsCount,
	ROUND(AVG(fd.TicketPrice),2 ) AS AvgPrice
FROM Aircraft AS a
JOIN FlightDestinations AS fd ON fd.AircraftId = a.Id
GROUP BY a.Id, a.Manufacturer, a.FlightHours
HAVING COUNT(fd.AircraftId) >= 2
ORDER BY COUNT(fd.AircraftId) DESC, a.Id