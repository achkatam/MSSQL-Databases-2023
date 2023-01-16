CREATE PROC usp_GetEmployeesFromTown @TownName VARCHAR(50)
AS
BEGIN
	SELECT 
		e.FirstName,
		e.LastName
	FROM Employees AS e
	JOIN Addresses AS ad ON ad.AddressID = e.AddressID
	JOIN Towns AS t ON t.TownID = ad.TownID
	WHERE t.[Name] = @TownName
END

GO

EXEC usp_GetEmployeesFromTown 'Sofia'
EXEC usp_GetEmployeesFromTown 'Plovdiv'
EXEC usp_GetEmployeesFromTown 'Salt Lake City'