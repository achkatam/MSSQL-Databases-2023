CREATE FUNCTION ufn_IsWordComprised(@setOfLetters NVARCHAR(60) , @word NVARCHAR(60))
RETURNS BIT
AS
BEGIN
	DECLARE @Index INT = 1
	DECLARE @wordLength INT = LEN(@word)
	DECLARE @currLetter CHAR

	WHILE (@Index <= @wordLength)
	BEGIN
		SET @currLetter = SUBSTRING(@word, @Index, 1)
	-- CHARINDEX looks for the expression @currLetter if it presents into @setOfLetters expression
		
		IF (CHARINDEX(@currLetter, @setOfLetters) = 0)
		BEGIN
			RETURN 0
		END

		SET @Index += 1
	END

	RETURN 1
END

GO

SELECT dbo.ufn_IsWordComprised('oistmiahf', 'Sofia')
SELECT dbo.ufn_IsWordComprised('oistmiahf', 'halves')
SELECT dbo.ufn_IsWordComprised('bobr', 'Rob')
SELECT dbo.ufn_IsWordComprised('pppp', 'Guy')