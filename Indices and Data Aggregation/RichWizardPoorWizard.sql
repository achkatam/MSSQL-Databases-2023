--SELECT *
--FROM WizzardDeposits AS wd1
--INNER JOIN WizzardDeposits AS wd2
--		ON wd1.Id + 1 = wd2.Id

SELECT SUM( [Host Wizard Deposit] - [Guest Wizard Deposit]) AS SumDifference
	FROM (
SELECT 
	wd.FirstName AS [Host Wizard],
	wd.DepositAmount AS [Host Wizard Deposit],
	LEAD(wd.FirstName) OVER(ORDER BY wd.Id ) AS [Guest Wizard],
	LEAD(wd.DepositAmount) OVER(ORDER BY wd.Id) AS [Guest Wizard Deposit]
FROM WizzardDeposits AS wd) AS HostGuestWizardQuery
	WHERE [Guest Wizard] IS NOT NULL