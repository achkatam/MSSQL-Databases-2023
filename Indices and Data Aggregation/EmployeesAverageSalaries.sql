
SELECT * 
INTO newTableEmployees
FROM Employees AS e
WHERE e.Salary > 30000

DELETE FROM newTableEmployees
WHERE ManagerId = 42

UPDATE newTableEmployees
SET Salary = Salary + 5000
WHERE DepartmentID = 1

SELECT 
	DepartmentID,
	AVG(Salary) AS AverageSalary 
FROM newTableEmployees
GROUP BY DepartmentID