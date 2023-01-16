CREATE PROC usp_EmployeesBySalaryLevel @salaryLevel VARCHAR(8)
AS
BEGIN
	SELECT 
		e.FirstName,
		e.LastName
	FROM Employees AS e
	WHERE dbo.ufn_GetSalaryLevel(e.Salary) = @salaryLevel
END

GO

EXEC usp_EmployeesBySalaryLevel 'High'
EXEC usp_EmployeesBySalaryLevel 'Average'
EXEC usp_EmployeesBySalaryLevel 'Low'