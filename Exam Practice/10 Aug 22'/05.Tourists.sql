SELECT 
		t.Name,
		t.Age,
		t.PhoneNumber,
		t.Nationality
FROM Tourists AS t
ORDER BY t.Nationality, t.Age DESC, t.Name