CREATE DATABASE [Movies]

USE [Movies]

GO

CREATE TABLE [Directors](
     [Id] INT PRIMARY KEY NOT NULL,
	 [DirectorName] NVARCHAR(70) NOT NULL,
	 [Notes] NVARCHAR(150)
)

GO

CREATE TABLE [Genres](
      [Id] INT PRIMARY KEY NOT NULL,
	  [GenreName] NVARCHAR(20) NOT NULL,
	  [Notes] NVARCHAR(150)
)

GO

CREATE TABLE [Categories](
      [Id] INT PRIMARY KEY NOT NULL,
	  [CategoryName] NVARCHAR(20) NOT NULL,
	  [Notes] NVARCHAR(150)
)

GO

CREATE TABLE [Movies](
      [Id] INT PRIMARY KEY NOT NULL,
	  [Title] NVARCHAR(50) NOT NULL,
	  [DirectorId] INT FOREIGN KEY([DirectorId]) REFERENCES [Directors](Id),
	  [CopyrightYear] DATE NOT NULL,
	  [Length] INT NOT NULL,
	  [GenreId] INT FOREIGN KEY([GenreId]) REFERENCES [Genres](Id),
	  [Rating] INT,
	  [Notes] NVARCHAR(150)
)

GO

INSERT INTO [Directors]
       VALUES
(1,'Director1', 'Note1'),
(2,'Director2', 'Note12'),
(3,'Director3', 'Note13'),
(4,'Director4', 'Note14'),
(5,'Director5', 'Note15')


GO

INSERT INTO [Genres]
       VALUES
(1, 'Genre1', 'Note1'),
(2, 'Genre12', 'Note12'),
(3, 'Genre13', 'Note13'),
(4, 'Genre14', 'Note14'),
(5, 'Genre15', 'Note15')

GO

INSERT INTO [Categories]
       VALUES
(1, 'Category1', 'Note1'),
(2, 'Category12', 'Note12'),
(3, 'Category13', 'Note13'),
(4, 'Category14', 'Note14'),
(5, 'Category15', 'Note15')

GO

INSERT INTO [Movies]
       VALUES
(1,'Title1', 1,'2020-05-05', 11, 1, 5, 'note1'),
(2,'Title12', 2,'2020-05-04', 8, 2, 4, 'note15'),
(3,'Title13', 3,'2020-05-05', 7, 3, 5, 'note14'),
(4,'Title14', 4,'2020-05-06', 1, 4, 1, 'note13'),
(5,'Title15', 5,'2020-05-07', 6, 5, 2, 'note12')

SELECT *
FROM 
[Movies]