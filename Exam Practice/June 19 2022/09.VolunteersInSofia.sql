SELECT 
	v.[Name] ,
	v.PhoneNumber,
	SUBSTRING(v.[Address],PATINDEX('%[0-9]%', v.Address), LEN(v.Address)) 
	AS [Address]
FROM Volunteers AS v
JOIN VolunteersDepartments AS vd ON v.DepartmentId = vd.Id
WHERE vd.Id = 2 AND v.[Address] LIKE '%Sofia%'
GROUP BY v.Name, v.PhoneNumber, v.Address
ORDER BY v.Name