USE [SoftUni]

UPDATE [Employees]
SET
[Salary] = [Salary] * 1.10

SELECT [Salary]
FROM [Employees]

USE [Hotel]

UPDATE [Payments]
SET [TaxRate] = [TaxRate] / 1.03

SELECT [TaxRate]
FROM [Payments]