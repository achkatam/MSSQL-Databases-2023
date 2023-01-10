--16.	Countries Without Any Mountains
WITH CTE AS
(
  SELECT 
  	c.CountryCode
  	,mc.CountryCode AS [MountainsCountryCode]
  FROM [Countries] AS c
  LEFT JOIN [MountainsCountries] AS mc ON mc.CountryCode = c.CountryCode
  WHERE mc.CountryCode IS NULL
  )
  SELECT 
  COUNT(cte.CountryCode) AS [Count]
  FROM CTE AS cte