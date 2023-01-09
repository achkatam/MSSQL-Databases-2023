--Problem 13.	 Mix of Peak and River Names
SELECT 
	P.PeakName 
	,r.RiverName
		,LOWER(CONCAT(LEFT(p.PeakName,LEN(p.PeakName ) -1), r.RiverName))
		AS [Mix]
FROM [Rivers] AS r
	, [Peaks] AS p
	WHERE RIGHT(p.PeakName, 1) = LEFT(r.RiverName,1)
ORDER BY [Mix] 

GO

USE [Diablo]

GO

--Problem 14.	Games from 2011 and 2012 year
SELECT TOP(50)
	[Name],
	FORMAT([Start],'yyyy-MM-dd') AS [Start]
FROM [Games]
WHERE DATEPART(YEAR, [Start]) IN (2011, 2012)
ORDER BY [Start], [Name]

--Problem 15.	 User Email Providers
SELECT [Username]
	, SUBSTRING([Email], CHARINDEX('@',[Email]) +1 , LEN([Email]))
	AS [Email Provider]
FROM [Users]
ORDER BY [Email Provider], [Username]

--Problem 16.	 Get Users with IPAdress Like Pattern
SELECT [IpAddress]
FROM [Users]
WHERE [IpAddress] LIKE '___.1%.%.___'
ORDER BY [Username]

--Problem 17.	 Show All Games with Duration and Part of the Day
SELECT [Name],
	CASE
		WHEN DATEPART(HOUR, [Start]) BETWEEN 0 AND 11 THEN 'Morning'
		WHEN DATEPART(HOUR, [Start]) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
		END AS [Part of the Day],
	CASE 
		WHEN [Duration] <=3 THEN 'Extra Short'
		WHEN [Duration] BETWEEN 4 AND 6 THEN 'Short'
		WHEN [Duration] > 6 THEN 'Long'
		ELSE 'Extra Long'
		END AS [Duration]
  FROM [Games] AS [g]
  ORDER BY [g].[Name], [Duration], [Part of the Day]

USE [Orders]

--Problem 18.	 Orders Table
SELECT 
	[o].[ProductName]
	,[o].[OrderDate]
	,DATEADD(DAY, 3, [o].[OrderDate]) AS [Pay Due]
	,DATEADD(MONTH, 1, [o].[OrderDate]) AS [Deliver Due]
FROM [Orders] as [o]