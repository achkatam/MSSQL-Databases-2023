--18.	Highest Peak Name and Elevation by Country
SELECT TOP(5) 
	[Country],
	CASE 
		WHEN PeakName IS NULL THEN '(no highest peak)'
	ELSE PeakName 
	END AS [Highest Peak Name],
	CASE 
			WHEN Elevation IS NULL THEN 0
			ELSE Elevation
		END AS [Hiest Peak Elevation],
	CASE 
		WHEN [Mountain] IS NULL THEN '(no mountain)'
		ELSE [Mountain]
	END AS [Mountain]
FROM (
SELECT 
	c.CountryName AS [Country]
	, m.MountainRange AS [Mountain]
	,p.PeakName
	,p.Elevation
	,DENSE_RANK() OVER(PARTITION BY c.CountryName ORDER BY p.Elevation DESC)
	AS [PeakRank]
  FROM [Countries] AS c
LEFT JOIN [MountainsCountries] AS mc 
		ON mc.CountryCode = c.CountryCode
LEFT JOIN [Mountains] AS m 
		ON m.Id = mc.MountainId
LEFT JOIN [Peaks] AS p
		ON p.MountainId = m.Id
) AS [PeakRankingQuery]
WHERE [PeakRank] = 1
ORDER BY [Country], [Highest Peak Name]