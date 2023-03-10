--delete ALTER before submitting in judge system

CREATE OR ALTER PROC usp_SearchByAirportName (@airportName VARCHAR(70))
AS
BEGIN
	SELECT 
		a.AirportName,
		p.FullName,
		CASE 
			WHEN fd.TicketPrice <= 400 THEN 'Low'
			WHEN fd.TicketPrice BETWEEN 401 AND 1500 THEN 'Medium'
			WHEN fd.TicketPrice > 1500 THEN 'High'
		END	AS LevelOfTicketPrice,
		ac.Manufacturer,
		ac.Condition,
		aType.TypeName
	FROM Airports AS a
	JOIN FlightDestinations AS fd ON fd.AirportId = a.Id
	JOIN Passengers AS p ON p.Id = fd.PassengerId
	JOIN Aircraft AS ac ON fd.AircraftId = ac.Id
	JOIN AircraftTypes AS aType ON ac.TypeId = aType.Id
	WHERE a.AirportName = @airportName
	ORDER BY ac.Manufacturer, p.FullName
END

GO

EXEC usp_SearchByAirportName 'Sir Seretse Khama International Airport'