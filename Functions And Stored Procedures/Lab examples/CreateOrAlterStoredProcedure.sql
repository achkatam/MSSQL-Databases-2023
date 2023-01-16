CREATE OR ALTER PROC usp_GetMultipleResults
AS
SELECT  FirstName, LastName FROM Employees 
SELECT e.FirstName, e.LastName, d.Name AS Department
FROM Employees AS e
JOIN Departments AS d ON d.DepartmentID = e.DepartmentID

GO

EXEC usp_GetMultipleResults