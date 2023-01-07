CREATE TABLE [Students](
	[StudentID] INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(30) NOT NULL
)

CREATE TABLE [Exams](
	[ExamID] INT PRIMARY KEY IDENTITY(101,1),
	[Name] NVARCHAR(90)
)

CREATE TABLE [StudentsExam](
	[StudentID] INT FOREIGN KEY REFERENCES [Students]([StudentID]),
	[ExamID] INT FOREIGN KEY REFERENCES [Exams]([ExamID]),
	PRIMARY KEY([StudentID], [ExamID])
)

INSERT INTO [Students]([Name])
	VALUES
('Mila'),
('Toni'),
('Ron')



INSERT INTO [Exams]([Name])
	VALUES
('SpringMCV'),
('Neo4j'),
('Oracle 11g')



INSERT INTO [StudentsExam]([StudentID], [ExamID])
	VALUES
(1,101),
(1,102),
(2,101),
(3,103),
(2,102),
(2,103)

SELECT *
FROM [Students]
SELECT *
FROM [Exams]
SELECT *
FROM [StudentsExam]