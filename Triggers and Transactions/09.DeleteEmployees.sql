CREATE TABLE Deleted_Employees(
	EmployeeId INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50), 
	MiddleName VARCHAR(50), 
	JobTitle VARCHAR(50), 
	DepartmentId INT, 
	Salary DECIMAL(18,2)
)

GO

CREATE TRIGGER tr_DeletedEmployee ON Employees AFTER DELETE
AS
INSERT INTO Deleted_Employees(FirstName, LastName, MiddleName, JobTitle,DepartmentId, Salary)
SELECT 
		d.FirstName, d.LastName, d.MiddleName, d.JobTitle, d.DepartmentID, d.Salary
	FROM deleted AS d

GO

SELECT *
FROM Deleted_Employees
DELETE FROM Employees
WHERE EmployeeID = 1