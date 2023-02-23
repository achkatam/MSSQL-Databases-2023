SELECT bg.Id,
	bg.[Name],
	bg.YearPublished,
	c.Name AS CategoryName
FROM Boardgames AS bg
JOIN Categories AS c ON c.Id = bg.CategoryId
WHERE c.Name IN ('Strategy Games', 'Wargames')
ORDER BY bg.YearPublished DESC