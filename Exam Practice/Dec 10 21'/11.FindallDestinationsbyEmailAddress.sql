--Delete ALTER before submitting in judge

CREATE OR ALTER FUNCTION udf_FlightDestinationsByEmail (@email VARCHAR(50))
RETURNS INT
AS
BEGIN
	DECLARE @CountOfFlights INT

	BEGIN 
	SET @CountOfFlights = (
		SELECT 
			COUNT(fd.Id)
		FROM Passengers AS p
		JOIN FlightDestinations AS fd ON fd.PassengerId = p.Id
		WHERE p.Email = @email)
	END

	RETURN @CountOfFlights
END

GO

SELECT dbo.udf_FlightDestinationsByEmail ('PierretteDunmuir@gmail.com')
		AS Output
SELECT dbo.udf_FlightDestinationsByEmail ('Montacute@gmail.com')
		AS Output
SELECT dbo.udf_FlightDestinationsByEmail ('MerisShale@gmail.com')
		AS Output