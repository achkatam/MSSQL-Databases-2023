SELECT *
FROM Cigars
WHERE TastId = 1
UPDATE Cigars
	SET PriceForSingleCigar = PriceForSingleCigar * 1.20
WHERE TastId = 1


UPDATE Brands
	SET BrandDescription = 'New description'
WHERE BrandDescription IS NULL