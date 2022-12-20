CREATE DATABASE [Hotel]

USE [Hotel]

CREATE TABLE [Employees](
       [Id] INT PRIMARY KEY NOT NULL,
	   [FirstName] NVARCHAR(20) NOT NULL,
	   [LastName] NVARCHAR(25) NOT NULL,
	   [Title] VARCHAR(15),
	   [Notes] NVARCHAR(150)
)

INSERT INTO [Employees]([Id], [FirstName], [LastName])
       VALUES
(1,'Lara', 'Thompson'),
(2,'Laras', 'Thompson'),
(3,'Lara', 'Thompsons')

GO

CREATE TABLE [Customers](
       [Id] INT PRIMARY KEY NOT NULL,
	   [AccountNumber] BIGINT NOT NULL,
	   [FirstName] NVARCHAR(20),
	   [LastName] NVARCHAR(25),
	   [PhoneNumber] VARCHAR(4) NOT NULL,
	   [EmergencyName] NVARCHAR(16),
	   [EmergencyNumber] VARCHAR(4),
	   [Notes] NVARCHAR(50)
)

INSERT INTO [Customers]([Id], [AccountNumber], [PhoneNumber])
       VALUES
(1,234567,2341),
(2,234564,2345),
(3,234563,2342)

GO

CREATE TABLE [RoomStatus](
       [Id] INT PRIMARY KEY NOT NULL,
       [RoomStatus] CHAR(3) NOT NULL,
	   CHECK ([RoomStatus] = 'A' OR [RoomStatus] = 'N/A'),
	   [Notes] NVARCHAR(50)
)

INSERT INTO [RoomStatus]([Id], [RoomStatus])
      VALUES
(1,'A'),
(2,'N/A'),
(3,'A')

GO

CREATE TABLE [RoomTypes](
       [RoomType] VARCHAR(10) PRIMARY KEY NOT NULL,
	   [Notes] NVARCHAR(50)
)	   

INSERT INTO [RoomTypes]([RoomType])
       VALUES
('Apartment'),
('Studio'),
('DoubleBed')

GO

CREATE TABLE [BedTypes](
       [BedType] VARCHAR(10) PRIMARY KEY,
	   [Notes] NVARCHAR(50)
)	   

INSERT INTO [BedTypes]([BedType])
       VALUES
('King'),
('Queen'),
('KingSize')

GO

CREATE TABLE [Rooms](
       [RoomNumber] INT PRIMARY KEY NOT NULL,
	   [RoomType] VARCHAR(10) FOREIGN KEY REFERENCES [RoomTypes](RoomType),
	   [BedType] VARCHAR(10) FOREIGN KEY REFERENCES [BedTypes](BedType),
	   [Rate] INT,
	   [RoomStatus] CHAR(3),
	   [Notes] NVARCHAR(150)
)	   

INSERT INTO [Rooms]([RoomNumber], [RoomType], [BedType])
       VALUES
(101, 'Studio', 'King'),
(102, 'Studio', 'Queen'),
(103, 'Apartment', 'KingSize')

GO

CREATE TABLE [Payments](
       [Id] INT PRIMARY KEY NOT NULL,
	   [EmployeesId] INT FOREIGN KEY REFERENCES [Employees](Id),
	   [PaymentDate] DATE,
	   [AccountNumber] BIGINT,
	   [FirstDateOccupied] DATE,
	   [LastDateOccupied] DATE,
	   [TotalDays] AS DATEDIFF(DAY, FirstDateOccupied, LastDateOccupied),
	   [AmountCharged] DECIMAL (10,2),
	   [TaxRate] DECIMAL(6,2),
	   [TaxAmount] DECIMAL (6,2),
	   [PaymentTotal] DECIMAL (12,2),
	   [Notes] NVARCHAR(150)
)

INSERT INTO [Payments]([Id], [EmployeesId])
       VALUES
(1,1),
(2,2),
(3,3)

CREATE TABLE [Occupancies](
       [Id]  INT PRIMARY KEY IDENTITY NOT NULL,
       [EmployeeId] INT FOREIGN KEY REFERENCES Employees(Id),
       [DateOccupied] DATE,
       [AccountNumber] BIGINT,
       [RoomNumber] INT FOREIGN KEY REFERENCES Rooms(RoomNumber),
       [RateApplied] DECIMAL(6,2),
       [PhoneCharge] DECIMAL(6,2),
       [Notes] NVARCHAR(150)
)
 
INSERT INTO Occupancies (EmployeeId, RateApplied, Notes) VALUES
(1, 55.55, NULL),
(2, 15.55, NULL),
(3, 35.55, NULL)