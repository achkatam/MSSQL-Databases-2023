UPDATE PlayersRanges
SET PlayersMax += 1
WHERE PlayersMax = 2
	AND PlayersMin = 2
	
UPDATE Boardgames
SET [Name] = [Name] + 'V2'
WHERE YearPublished >= 2020