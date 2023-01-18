SELECT 
	a.Name,
	YEAR( a.BirthDate) AS BirthYear,
	aType.AnimalType
FROM Animals AS a
JOIN AnimalTypes AS aType ON a.AnimalTypeId = aType.Id
WHERE a.OwnerId IS NULL 
	--the difference from birthdate to the date should be less than 5
	AND DATEDIFF(YEAR, a.BirthDate, '2022-01-01') < 5
		AND aType.Id <> 3
ORDER BY a.Name