SELECT *
FROM Aircraft
UPDATE Aircraft	
	SET Condition = 'A'
		WHERE
		(Condition = 'B' OR Condition = 'C')
		AND
		(FlightHours IS NULL OR FlightHours <= 100)
		AND
		([Year] >= 2013)