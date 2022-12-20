 CREATE DATABASE [MinionsPreCourse]

 USE [MinionsPreCourse]

 GO
 

 GO

 CREATE TABLE [Minions](
     [Id] INT PRIMARY KEY,
	 [Name] NVARCHAR(50) NOT NULL,
	 [Age] INT NOT NULL
 )

 CREATE TABLE [Towns](
    [Id] INT PRIMARY KEY,
	[Name] NVARCHAR(70) NOT NULL
 )


 ALTER TABLE [Minions]
 ADD [TownId] INT FOREIGN KEY REFERENCES [Towns]([Id]) NOT NULL

 ALTER TABLE [Minions]
 ALTER COLUMN [Age] INT
 GO

INSERT INTO [Towns]([Id], [Name])
        VALUES
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna')

INSERT INTO [Minions]([Id], [Name], [Age], [TownId])
       VALUES
(1, 'Kevin', 22, 1),
(2, 'Bob', 15, 3),
(3, 'Steward', NULL, 2)

SELECT *
FROM [Towns]
SELECT * 
FROM [Minions]

UPDATE [Minions]
SET Name = 'Steward'
WHERE Id = 3

SELECT * 
FROM [Towns]
SELECT * 
FROM [Minions]

GO

TRUNCATE TABLE [Minions]

GO

SELECT * 
  FROM [Minions]

GO

DROP TABLE [Minions]
DROP TABLE [Towns]

GO

CREATE TABLE [People](
         [Id] INT PRIMARY KEY IDENTITY,
		 [Name] NVARCHAR(200) NOT NULL,
		 [Picture] VARBINARY(MAX),
		 CHECK (DATALENGTH([Picture]) <= 2000000),
		 [Height] DECIMAL(3,2),
		 [Weight] DECIMAL(5,2),
		 [Gender] CHAR(1) NOT NULL,
		 CHECK ([Gender] = 'm' OR [Gender] = 'f'),
		 [Birthday] DATE NOT NULL,
		 [Biography] NVARCHAR(MAX)
)

INSERT INTO [People]([Name], [Height], [Weight], [Gender], [Birthday])
       VALUES
('Smith', 1.65, 77.2, 'm', '1992-05-23'),
('George', NULL, NULL, 'm', '1994-11-03'),
('Jackson', 1.65, NULL, 'm', '1992-09-22'),
('Stephany', 1.55, 56.33, 'f', '1992-12-03'),
('Ariel', 1.65, 47.2, 'f', '1999-11-02')

SELECT * 
FROM [People]

ALTER TABLE [People]
ADD CONSTRAINT DF_DefaultBiography DEFAULT ('No biography provided..') FOR [Biography]

INSERT INTO [People]([Name], [Height], [Weight], [Gender], [Birthday])
       VALUES
('Smith', 1.65, 77.2, 'm', '1992-05-23')

SELECT * 
FROM [People]

GO

CREATE TABLE [Users](
       [Id] BIGINT PRIMARY KEY IDENTITY,
	   [Username] VARCHAR(30) NOT NULL,
	   [Password] VARCHAR(26) NOT NULL,
	   [ProfilePicture] VARBINARY(MAX),
	   CHECK (ProfilePicture <= 900000),
	   [LastLoginTime] DATETIME2,
	   [IsDeleted] BIT
)

INSERT INTO [Users]([Username], [Password], [ProfilePicture], [LastLoginTime], [IsDeleted])
       VALUES
('matev', '12asd123', NULL, GETDATE() , 0),
('matev23', '122sd123', NULL, GETDATE() , 0),
('matev12', '12asdd23', NULL, GETDATE() , 1),
('matev43', '12asd223', NULL, GETDATE() , 0),
('matev22', '12asd323', NULL, GETDATE() , 1)

GO

SELECT [Username], [LastLoginTime], [IsDeleted]
FROM 
[Users]

GO

USE [MinionsPreCourse]

DROP TABLE [Users]

CREATE TABLE [Users](
       [Id] BIGINT PRIMARY KEY IDENTITY,
	   [Username] VARCHAR(30) NOT NULL,
	   [Password] VARCHAR(26) NOT NULL,
	   [ProfilePicture] VARBINARY(MAX),
	   CHECK (ProfilePicture <= 900000),
	   [LastLoginTime] DATETIME2,
	   [IsDeleted] BIT
)

INSERT INTO [Users]([Username], [Password], [ProfilePicture], [LastLoginTime], [IsDeleted])
       VALUES
('matev', '12asd123', NULL, GETDATE() , 0),
('matev23', '122sd123', NULL, GETDATE() , 0),
('matev12', '12asdd23', NULL, GETDATE() , 1),
('matev43', '12asd223', NULL, GETDATE() , 0),
('matev22', '12asd323', NULL, GETDATE() , 1)

DROP TABLE [Users]

CREATE TABLE [Users](
       [Id] BIGINT PRIMARY KEY IDENTITY,
	   [Username] VARCHAR(30) NOT NULL,
	   [Password] VARCHAR(26) NOT NULL,
	   [ProfilePicture] VARBINARY(MAX),
	   CHECK (ProfilePicture <= 900000),
	   [LastLoginTime] DATETIME2,
	   [IsDeleted] BIT
)

INSERT INTO [Users]([Username], [Password], [ProfilePicture], [LastLoginTime], [IsDeleted])
       VALUES
('matev', '12asd123', NULL, GETDATE() , 0),
('matev23', '122sd123', NULL, GETDATE() , 0),
('matev12', '12asdd23', NULL, GETDATE() , 1),
('matev43', '12asd223', NULL, GETDATE() , 0),
('matev22', '12asd323', NULL, GETDATE() , 1)

ALTER TABLE [Users]
DROP CONSTRAINT PK_Users_Id

DROP TABLE [People]
DROP TABLE [Users]

GO

CREATE TABLE [Users](
       [Id] BIGINT PRIMARY KEY IDENTITY,
	   [Username] VARCHAR(30) NOT NULL,
	   [Password] VARCHAR(26) NOT NULL,
	   [ProfilePicture] VARBINARY(MAX),
	   CHECK (ProfilePicture <= 900000),
	   [LastLoginTime] DATETIME2,
	   [IsDeleted] BIT
)

INSERT INTO [Users]([Username], [Password], [ProfilePicture], [LastLoginTime], [IsDeleted])
       VALUES
('matev', '12asd123', NULL, GETDATE() , 0),
('matev23', '122sd123', NULL, GETDATE() , 0),
('matev12', '12asdd23', NULL, GETDATE() , 1),
('matev43', '12asd223', NULL, GETDATE() , 0),
('matev22', '12asd323', NULL, GETDATE() , 1)

GO

DECLARE @PrimaryKeyName sysname = 
    (SELECT CONSTRAINT_NAME 
     FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
     WHERE CONSTRAINT_TYPE = 'PRIMARY KEY' and TABLE_SCHEMA='dbo' and TABLE_NAME = 'Users'
    )

IF @PrimaryKeyName is not null
BEGIN
    DECLARE @SQL_PK NVARCHAR(MAX) = 'alter table dbo.Users drop constraint ' + @PrimaryKeyName
    PRINT (@SQL_PK)
    EXEC sp_executesql @SQL_PK;
END

GO

ALTER TABLE [Users]
ADD CONSTRAINT PK_IdUsername PRIMARY KEY([Id], [Username])

SELECT *
FROM [Users]

GO

ALTER TABLE [Users]
ADD CONSTRAINT MyCheckPassword CHECK(DATALENGTH([Password]) >=5)

GO

DECLARE @PrimaryKeyName sysname = 
    (SELECT CONSTRAINT_NAME 
     FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
     WHERE CONSTRAINT_TYPE = 'PRIMARY KEY' and TABLE_SCHEMA='dbo' and TABLE_NAME = 'Users'
    )

IF @PrimaryKeyName is not null
BEGIN
    DECLARE @SQL_PK NVARCHAR(MAX) = 'alter table dbo.Users drop constraint ' + @PrimaryKeyName
    PRINT (@SQL_PK)
    EXEC sp_executesql @SQL_PK;
END

GO

ALTER TABLE [Users]
ADD CONSTRAINT PK_Id PRIMARY KEY([Id])

GO

ALTER TABLE [Users]
ADD CONSTRAINT UsernameLength UNIQUE([Username])

GO

ALTER TABLE [Users]
ADD CONSTRAINT UsernameAtLeast3Chars CHECK(DATALENGTH([Username]) >= 3)