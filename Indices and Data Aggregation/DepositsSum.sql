SELECT 
	wz.DepositGroup AS DepositGroup,
	SUM(wz.DepositAmount) AS TotalSum
FROM WizzardDeposits AS wz
GROUP BY wz.DepositGroup