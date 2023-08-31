 CREATE TABLE Employees (
        Id INT PRIMARY KEY IDENTITY,
        [Name] NVARCHAR(50),
        Email NVARCHAR(50),
        Department NVARCHAR(50)
    )


--	-- Create the Employees table if it doesn't exist
--IF OBJECT_ID('Employees', 'U') IS NULL
--BEGIN
--    CREATE TABLE Employees (
--        Id INT PRIMARY KEY IDENTITY,
--        [Name] NVARCHAR(50),
--        Email NVARCHAR(50),
--        Department NVARCHAR(50)
--    )
--END

-- Declare variables
DECLARE @Counter INT = 1
DECLARE @MaxRecords INT = 1000000

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


Select Name from Employees Where Id=536