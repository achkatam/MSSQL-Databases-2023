USE [SoftUni]


INSERT INTO [Towns]([Name])
       VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas')

INSERT INTO [Departments]([Name])
       VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')

SELECT *
FROM [Departments]

DROP TABLE [Employees]

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

DROP TABLE [Employees]

CREATE TABLE [Employees](
       [Id] INT PRIMARY KEY IDENTITY NOT NULL,
	   [FirstName] NVARCHAR(15) NOT NULL,
	   [MiddleName] NVARCHAR(15) NOT NULL,
	   [LastName] NVARCHAR(25) NOT NULL,
	   [JobTitle] NVARCHAR(15) NOT NULL,
	   [DepartmentId] INT FOREIGN KEY ([DepartmentId]) REFERENCES [Departments](Id),
	   [HireDate] DATE NOT NULL,
	   [Salary] DECIMAL(6,2) NOT NULL,
	   [AddressId] INT FOREIGN KEY ([AddressId]) REFERENCES [Addresses](Id)
)

SELECT *
FROM
[Employees]

DROP TABLE [Employees]
CREATE TABLE [Employees](
       [Id] INT PRIMARY KEY IDENTITY,
	   [FirstName] NVARCHAR(15) NOT NULL,
	   [MiddleName] NVARCHAR(15) NOT NULL,
	   [LastName] NVARCHAR(25) NOT NULL,
	   [JobTitle] NVARCHAR(15) NOT NULL,
	   [DepartmentId] INT FOREIGN KEY ([DepartmentId]) REFERENCES [Departments](Id),
	   [HireDate] DATE NOT NULL,
	   [Salary] DECIMAL(6,2) NOT NULL,
	   [AddressId] INT FOREIGN KEY ([AddressId]) REFERENCES [Addresses](Id)
)

INSERT INTO [Employees]([FirstName], [MiddleName], [LastName], [JobTitle], [DepartmentId]
, [HireDate], [Salary])
       VALUES
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
('Petar', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88)

SELECT *
FROM
[Employees]

SELECT *
FROM
[Towns]

SELECT * 
FROM
[Departments]

SELECT *
FROM
[Employees]

GO

SELECT * 
FROM [Towns]
ORDER BY [Name] ASC

SELECT * 
FROM [Departments]
ORDER BY [Name] ASC

SELECT *
FROM [Employees]
ORDER BY [Salary] DESC

GO

SELECT [Name]
FROM [Towns]
ORDER BY [Name] ASC

SELECT [Name]
FROM [Departments]
ORDER BY [Name] ASC

SELECT [FirstName], [LastName], [JobTitle], [Salary]
FROM [Employees]
ORDER BY [SALARY] DESC