SELECT 
	COUNT(e.Salary) AS COUNT
FROM Employees AS e
WHERE e.ManagerID IS NULL