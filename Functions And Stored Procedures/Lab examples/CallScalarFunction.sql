SELECT 
	p.[Name],
	p.StartDate,
	p.EndDate,
	dbo.udf_ProjectDuration(p.StartDate, p.EndDate) AS ProjectDuration
FROM Projects AS p