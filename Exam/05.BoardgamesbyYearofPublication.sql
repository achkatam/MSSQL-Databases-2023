SELECT 
	bg.[Name],
	bg.Rating
FROM Boardgames AS bg
ORDER BY bg.YearPublished, bg.Name DESC