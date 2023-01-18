SELECT 
	a.[Name],
	ae.AnimalType,
	FORMAT(a.BirthDate, 'dd.MM.yyyy') AS BirthDate
FROM [Animals] AS a
JOIN [AnimalTypes] AS ae ON ae.Id = a.AnimalTypeId
ORDER BY a.[Name]