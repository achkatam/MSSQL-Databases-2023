SELECT TOP(2)
	wz.DepositGroup AS DepositGroup
	FROM WizzardDeposits AS wz
  GROUP BY wz.DepositGroup
  ORDER BY AVG(wz.MagicWandSize)