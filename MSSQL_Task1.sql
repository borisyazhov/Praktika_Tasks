USE Club;
GO

DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS [Services];
DROP TABLE IF EXISTS Members;
GO

CREATE TABLE Members(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	[name] NVARCHAR(100) NOT NULL,
	surname NVARCHAR(100) NOT NULL,
	age INT NOT NULL,
	gender BIT NOT NULL,
	[start_date] DATETIME NOT NULL,
	recomended_by INT,
	FOREIGN KEY (recomended_by) REFERENCES Members(id)
);

CREATE TABLE [Services](
	id INT IDENTITY(1, 1) PRIMARY KEY,
	[name] NVARCHAR(100) NOT NULL,
	price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Employees(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	[name] NVARCHAR(100) NOT NULL
);

CREATE TABLE Bookings(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	[service_id] INT NOT NULL,
	member_id INT NOT NULL,
	date_start DATETIME NOT NULL,
	date_end DATETIME NOT NULL,
	employer_id INT NOT NULL,
	FOREIGN KEY ([service_id]) REFERENCES [Services](id),
	FOREIGN KEY (member_id) REFERENCES Members(id),
	FOREIGN KEY (employer_id) REFERENCES Employees(id)
);
SELECT b.date_start, s.[name], e.[name], m.[name], b.date_end FROM Bookings b
  JOIN [Services] s ON (b.service_id = s.id)
  JOIN [Employees] e ON (b.employer_id = e.id)
  JOIN Members m ON (b.member_id = m.id);