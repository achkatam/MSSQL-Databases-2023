--Extract all passengers, who have flown in more than one aircraft
--and have an 'a' as the second letter of their full name. Select the full name,
--the count of aircraft that he/she traveled, and the total sum which was paid.
--Order the result by passenger's FullName.

SELECT 
	p.FullName,
	COUNT(fd.AircraftId) AS CountOfAircraft,
	SUM(fd.TicketPrice) AS TotalPayed
FROM Passengers AS p
JOIN FlightDestinations AS fd ON fd.PassengerId = p.Id
GROUP BY p.FullName
HAVING p.FullName LIKE '_a%' AND COUNT(fd.AircraftId) > 1
ORDER BY p.FullName