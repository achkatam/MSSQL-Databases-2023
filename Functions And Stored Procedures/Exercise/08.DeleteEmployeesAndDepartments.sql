CREATE PROC usp_DeleteEmployeesFromDepartment (@departmentId INT)
AS
BEGIN
  DELETE FROM EmployeesProjects
	WHERE EmployeeID IN (
		SELECT 
			e.EmployeeID
		FROM Employees AS e
		WHERE e.DepartmentID = @departmentId
		)
	UPDATE Employees 
		SET ManagerID = NULL
		WHERE (ManagerID) IN (
		SELECT 
			e.EmployeeID
		FROM Employees AS e
		WHERE e.DepartmentID = @departmentId
		)
	ALTER TABLE Departments
	ALTER COLUMN ManagerID INT 

	UPDATE Departments
	SET ManagerID = NULL
	WHERE ManagerID IN (
	SELECT 
			e.EmployeeID
		FROM Employees AS e
		WHERE e.DepartmentID = @departmentId
	)
	DELETE FROM Employees
		WHERE DepartmentID = @departmentId

	DELETE FROM Departments
		WHERE DepartmentID = @departmentId

	SELECT COUNT(EmployeeID)
	FROM Employees
	WHERE DepartmentID = @departmentId
END

GO

EXEC dbo.usp_DeleteEmployeesFromDepartment 2