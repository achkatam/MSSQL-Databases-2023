CREATE DATABASE [CarRental]

USE [CarRental]

GO

CREATE TABLE [Categories](
       [Id] INT PRIMARY KEY NOT NULL,
	   [CategoryName] NVARCHAR(10) NOT NULL,
	   [DailyRate] DECIMAL(5,2) NOT NULL,
	   [WeeklyRate] DECIMAL(5,2) NOT NULL,
	   [MonthlyRate] DECIMAL(5,2) NOT NULL,
	   [WeekendRate] DECIMAL(5,2) NOT NULL,
)

GO

CREATE TABLE [Cars](
       [Id] INT PRIMARY KEY NOT NULL,
	   [PlateNumber] VARCHAR(7) NOT NULL,
	   [Manufacturer] VARCHAR(10) NOT NULL,
	   [Model] VARCHAR(15) NOT NULL,
	   [CarYear] DATE NOT NULL,
	   [CategoryId] INT FOREIGN KEY ([CategoryId]) REFERENCES [Categories](Id),
	   [Doors] INT,
	   [Picture] VARBINARY(MAX),
	   CHECK (DATALENGTH([Picture]) <= 900000),
	   [Condition] VARCHAR(10),
	   [Available] CHAR(1),
	   CHECK ([Available] = 'Y' OR [Available] = 'N')
)

GO

CREATE TABLE [Employees](
       [Id] INT PRIMARY KEY NOT NULL,
	   [FirstName] NVARCHAR(20) NOT NULL,
	   [LastName] NVARCHAR(25) NOT NULL,
	   [Title] VARCHAR(15),
	   [Notes] NVARCHAR(150)
)

GO

CREATE TABLE [Customers](
       [Id] INT PRIMARY KEY NOT NULL,
	   [DriverLicenceNumber] INT NOT NULL,
	   [FullName] NVARCHAR(70) NOT NULL,
	   [Address] NVARCHAR(60) NOT NULL,
	   [City] NVARCHAR(50) NOT NULL,
	   [ZIPCode] NVARCHAR(8) NOT NULL,
	   [Notes] NVARCHAR(150)
)

GO

CREATE TABLE [RentalOrders](
       [Id] INT PRIMARY KEY NOT NULL,
	   [EmployeeId] INT FOREIGN KEY ([EmployeeId]) REFERENCES [Employees](Id),
	   [CustomerId] INT FOREIGN KEY ([CustomerId]) REFERENCES [Customers](Id),
	   [CarId] INT FOREIGN KEY ([CarId]) REFERENCES [Cars](Id),
	   [TankLevel] CHAR(1),
	   CHECK ([TankLevel] = 'F' OR [TankLevel] = 'M' OR [TankLevel] = 'E'),
	   [OdometerStart] INT,
	   [OdometerEnd] INT,
	   [TotalOdometer] INT,
	   [StartDate] DATE,
	   [EndDate] DATE,
	   [TotalDays] INT,
	   [RateApplied] DECIMAL(4,2),
	   [TaxRate] DECIMAL(3,2),
	   [OrderStatus] VARCHAR(10),
	   [Notes] NVARCHAR(150)
)

GO

INSERT INTO [Categories]([Id],[CategoryName],[DailyRate],[WeeklyRate],[MonthlyRate],[WeekendRate])
       VALUES
(1, 'Sedan', 2.40,2.45,6.00, 3.80),
(2, 'Luxury', 3.40,8.45,9.00, 4.80),
(3, 'SUV', 8.40,2.45,6.00, 3.80)

GO

INSERT INTO [Cars]([Id], [PlateNumber], [Manufacturer], [Model], [CarYear],  [CategoryId], [Doors], [Picture]
, [Condition], [Available])
       VALUES
(1,'NJ7549B','Mazda', '6', '2018', 2, 4, NULL, NULL, 'Y'),
(2,'NJ7569B','Mazda', '3', '2018', 1, 4, NULL, NULL, 'Y'),
(3,'NJ5549B','Mazda', 'CX-7', '2018',  3, 4, NULL, NULL, 'Y')

GO

INSERT INTO [Employees]([Id], [FirstName], [LastName])
       VALUES
(1, 'Angel' , 'Matev'),
(2, 'Camar' , 'Jackson'),
(3, 'Angelina' , 'Smith')


Go

INSERT INTO [Customers]([Id], [DriverLicenceNumber], [FullName], [Address], [City], [ZIPCode])
       VALUES
(1,612343, 'Matev Angel', 'Smithsonian Ave.', 'Austin', '70404'),
(2,412343, 'Jakari Mayson', 'Smithsonian Ave.', 'Austin', '70404'),
(3,512343, 'customer3', 'Smithsonian Ave.', 'Austin', '70404')

GO

INSERT INTO [RentalOrders]([Id], [EmployeeId], [CustomerId], [CarId])
       VALUES
(1,1,1,1),
(2,2,2,2),
(3,3,3,3)