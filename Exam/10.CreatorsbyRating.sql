SELECT 
		c.LastName,
		CEILING(AVG(b.Rating)) AS AverageRating,
		p.Name
FROM Creators AS c
LEFT JOIN CreatorsBoardgames AS cbg ON cbg.CreatorId = c.Id
LEFT JOIN Boardgames AS b ON b.Id = cbg.BoardgameId
LEFT JOIN Publishers AS p ON p.Id = b.PublisherId
WHERE p.Name = 'Stonemaier Games' 
GROUP BY c.LastName, p.Name
ORDER BY AVG(b.Rating) DESC