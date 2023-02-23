SELECT 
	CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
	c.Email,
	MAX(b.Rating) AS Rating
FROM Creators AS c
 JOIN CreatorsBoardgames AS cbg ON cbg.CreatorId = c.Id
 JOIN Boardgames AS b ON b.Id = cbg.BoardgameId
GROUP BY c.FirstName, c.LastName, c.Email
HAVING c.Email LIKE '%.com'
ORDER BY FullName