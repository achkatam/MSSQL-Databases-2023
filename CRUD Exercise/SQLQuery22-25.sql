USE [Geography]

--22
SELECT 
	PeakName
FROM [Peaks]
ORDER BY PeakName ASC

--23
SELECT TOP(30)
	[CountryName],
	[Population]
FROM [Countries]
WHERE ContinentCode = 'EU'
ORDER BY [Population] DESC, [CountryName] ASC

--24
SELECT 
	[CountryName],
	[CountryCode],
	[Currency] = CASE WHEN [CurrencyCode] = 'EUR' THEN 'Euro' ELSE 'Not Euro' END
FROM [Countries]
ORDER BY CountryName ASC

USE [Diablo]
--25
SELECT 
	Name
FROM [Characters]
ORDER BY [Name] ASC