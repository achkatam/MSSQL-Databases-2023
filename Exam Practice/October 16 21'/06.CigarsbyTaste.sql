SELECT 
	c.Id,
	c.CigarName,
	c.PriceForSingleCigar,
	t.TasteType,
	t.TasteStrength
FROM Cigars AS c
JOIN Tastes AS t ON t.Id = c.TastId
WHERE (c.TastID) IN (2, 3)
ORDER BY c.PriceForSingleCigar DESC