SELECT 
	c.Id,
	CONCAT(c.FirstName, ' ', c.LastName) AS CreatorName,
	c.Email
FROM Creators AS c
LEFT JOIN CreatorsBoardgames AS cbg ON cbg.CreatorId = c.Id
LEFT JOIN Boardgames AS b ON b.Id = cbg.BoardgameId
WHERE cbg.BoardgameId IS NULL
ORDER BY CreatorName