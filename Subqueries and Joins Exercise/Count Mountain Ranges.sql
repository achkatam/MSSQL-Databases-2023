USE [Geography]
--13.	Count Mountain Ranges
SELECT 
	mc.CountryCode,
	 COUNT(m.MountainRange) AS [MountainRanges]
FROM [Mountains] AS m
JOIN [MountainsCountries] AS mc ON mc.MountainId = m.Id
WHERE (mc.CountryCode) IN ('BG', 'RU', 'US')
GROUP BY mc.CountryCode
ORDER BY COUNT(mc.CountryCode) DESC