USE [SoftUni]
--1.	Employee Address
SELECT TOP(5)
	e.EmployeeID
	,e.JobTitle
	,e.AddressID
	,a.AddressText AS [AddressText]
FROM [Employees] AS e
JOIN [Addresses] AS a ON e.AddressID = a.AddressID
ORDER BY e.AddressID 