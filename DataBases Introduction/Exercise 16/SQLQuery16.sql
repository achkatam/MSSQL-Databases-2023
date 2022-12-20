CREATE DATABASE [SoftUni]

USE [SoftUni]

GO

CREATE TABLE [Towns](
       [Id] INT PRIMARY KEY IDENTITY,
	   [Name] NVARCHAR(50)
)



DROP TABLE [Towns]

CREATE TABLE [Towns](
       [Id] INT PRIMARY KEY IDENTITY,
	   [Name] NVARCHAR(50)
)

CREATE TABLE [Addresses](
       [Id] INT PRIMARY KEY IDENTITY,
	   [AddressText] NVARCHAR(70) NOT NULL,
	   [TownId] INT FOREIGN KEY([TownId]) REFERENCES [Towns](Id)
)

CREATE TABLE [Departments](
       [Id] INT PRIMARY KEY IDENTITY NOT NULL,
	   [Name] NVARCHAR(60) NOT NULL
)

CREATE TABLE [Employees](
       [Id] INT PRIMARY KEY NOT NULL,
	   [FirstName] NVARCHAR(15) NOT NULL,
	   [MiddleName] NVARCHAR(15) NOT NULL,
	   [LastName] NVARCHAR(25) NOT NULL,
	   [JobTitle] NVARCHAR(15) NOT NULL,
	   [DepartmentId] INT FOREIGN KEY ([DepartmentId]) REFERENCES [Departments](Id),
	   [HireDate] DATE NOT NULL,
	   [Salary] DECIMAL(6,2) NOT NULL,
	   [AddressId] INT FOREIGN KEY ([AddressId]) REFERENCES [Addresses](Id)
)

