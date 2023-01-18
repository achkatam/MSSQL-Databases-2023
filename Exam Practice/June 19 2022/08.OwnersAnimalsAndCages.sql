SELECT 
	CONCAT(o.[Name], '-',a.[Name]) AS [OwnersAnimals],
	o.PhoneNumber,
	c.Id AS CageId
FROM Owners AS o
 JOIN Animals AS a ON a.OwnerId = o.Id
 JOIN AnimalTypes AS aType ON aType.Id = a.AnimalTypeId
 JOIN AnimalsCages AS ac ON ac.AnimalId = a.Id
 JOIN Cages AS c ON c.Id = ac.CageId
WHERE aType.AnimalType = 'Mammals'
ORDER BY o.[Name], a.[Name] DESC