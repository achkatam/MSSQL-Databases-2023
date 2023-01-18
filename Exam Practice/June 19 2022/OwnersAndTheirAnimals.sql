SELECT TOP(5)
	o.[Name] AS Owner,
	COUNT(*) AS CountOfAnimals
FROM Owners AS o
JOIN Animals AS a ON a.OwnerID = o.Id
GROUP BY o.[Name]
ORDER BY CountOfAnimals DESC, o.[Name]