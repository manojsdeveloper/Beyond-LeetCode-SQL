 --CREATE TABLE Employees (
 --       Id INT PRIMARY KEY IDENTITY,
 --       [Name] NVARCHAR(50),
 --       Email NVARCHAR(50),
 --       Department NVARCHAR(50)
 --   )

------------------------------------START-Index-------------------------------------------------
 -- Create the Employees table if it doesn't exist
IF OBJECT_ID('Employees', 'U') IS NULL
BEGIN
    CREATE TABLE Employees (
        Id INT PRIMARY KEY IDENTITY,
        [Name] NVARCHAR(50),
        Email NVARCHAR(50),
        Department NVARCHAR(50)
    )
END

-- Declare variables
DECLARE @Counter INT = 1
DECLARE @MaxRecords INT = 10000

-- Start inserting records
WHILE @Counter <= @MaxRecords
BEGIN
    DECLARE @Name NVARCHAR(50)
    DECLARE @Email NVARCHAR(50)
    DECLARE @Department NVARCHAR(50)

    -- Generate random values for Name, Email, and Department (you can replace this with your own logic)
    SET @Name = 'Employee' + CAST(@Counter AS NVARCHAR(10))
    SET @Email = 'email' + CAST(@Counter AS NVARCHAR(10)) + '@company.com'
    SET @Department = 'Department' + CAST((@Counter % 10) + 1 AS NVARCHAR(10))

    -- Insert the record
    INSERT INTO Employees ([Name], Email, Department)
    VALUES (@Name, @Email, @Department)

    SET @Counter = @Counter + 1
END


Select * from Employees where Id=999

Select * from Employees where Name='Employee999'

----------Create--Name-as-Non-Clustered-Index------------
--USE [Testing]
--GO
--CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysyname,>]
--ON [dbo].[Employees]([Name])
--GO

CREATE NONCLUSTERED INDEX IX_Employees_Name
ON [dbo].[Employees]([Name])
----------------------------------------------------------------------------------------

Select Name from Employees Where id= 536

Select Name, Email from Employees Where Name='Employee536'

Create Index IX_Employees_Name ON Employees (Name ASC)

Execute sp_helpindex Employees

create Clustered Index IX_Employees_Department_Email
ON Employees(Department DESC, Email Asc)

--drop index Employees.IX_Employees_Name

--Adding Unique constraint to non clustered index
ALTER TABLE Employees
ADD CONSTRAINT UQ_Employees_Name
UNIQUE (Name)