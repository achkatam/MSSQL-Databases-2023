CREATE TABLE [Passports]( 
	[PassportID] INT PRIMARY KEY IDENTITY(101,1),
	[PassportNumber] NVARCHAR(10) NOT NULL
)


CREATE TABLE [Persons](
	[PersonID] INT PRIMARY KEY IDENTITY,
	[FirstName] NVARCHAR(20) NOT NULL,
	[Salary] DECIMAL NOT NULL,
	[PassportID] INT FOREIGN KEY REFERENCES [Passports]([PassportID]) UNIQUE NOT NULL
)


INSERT INTO [Passports]([PassportNumber])
	VALUES
('N34FG21B'),
('K65LO4R7'),
('ZE657QP2')

INSERT INTO [Persons]([FirstName], [Salary], [PassportID])
	VALUES
('Roberto', 43300.00, 102),
('Tom', 56100.00, 103),
('Yana', 60200.00, 101)

SELECT *
FROM [Persons]

SELECT *
FROM [Passports]