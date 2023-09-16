-- SQL Int Ques: https://www.youtube.com/watch?v=SEdAF8mSKS4

Section 1:
-- normalization
-- De-normalization
-- 1st normal form
-- 2nd normal form
-- 3rd normal form
-- primary key
-- unique key
-- char, varchar, nvarchar

Section 2:
-- Clustered
-- Non-Clustered
-- Function
-- Stored Procedure
-- Triggers
-- CTE
-- Transactions

Section 3:
-- left join
-- right join
-- inner join
-- cross join
-- full join
-- outer join
-- sub-query
-- core related query
-- union, union all
-- wild-card operator

-- 1. How to find nth highest salary in SQL Server using a Sub-Query
-- 2. How to find nth highest salary in SQL Server using a CTE
-- 3. How to find the 2nd, 3rd or 15th highest salary

-- Let's use the following Employees table for this demo.
-- sql query to find nth highest salary of employee

-- Use the following script to create Employees table
Create table Employees
(
     ID int primary key identity,
     FirstName nvarchar(50),
     LastName nvarchar(50),
     Gender nvarchar(50),
     Salary int
)
GO

Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000)
Insert into Employees values ('Mark', 'Hastings', 'Male', 60000)

Insert into Employees values ('Steve', 'Pound', 'Male', 45000)

Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000)
Insert into Employees values ('Philip', 'Hastings', 'Male', 45000)
Insert into Employees values ('Mary', 'Lambeth', 'Female', 30000)
Insert into Employees values ('Valarie', 'Vikings', 'Female', 35000)
Insert into Employees values ('John', 'Stanmore', 'Male', 80000)
GO

Use superherodb
GO

-- To find the highest salary it is straight forward. We can simply use the Max() function as shown below.
Select Max(Salary) from Employees1

-- To get the second highest salary use a sub query along with Max() function as shown below.
Select Max(Salary) from Employees1 where Salary < (Select Max(Salary) from Employees1)

-- To find nth highest salary using Sub-Query
SELECT TOP 1 SALARY
FROM (
      SELECT DISTINCT TOP 3 SALARY
      FROM Employees1
      ORDER BY SALARY DESC
      ) RESULT
ORDER BY SALARY

SELECT TOP 1 * from 
(SELECT DISTINCT TOP 4 SALARY
FROM Employees1
ORDER BY Salary DESC) RESULT
Order by Salary

WITH RESULT AS
(SELECT DISTINCT TOP 4 SALARY
FROM Employees1
ORDER BY Salary DESC)

SELECT TOP 1 Salary
from RESULT
order by Salary

-- To find nth highest salary using CTE(Common Table Expression)
--A common table expression, or CTE, is a temporary named result set created from a 
-- simple SELECT statement that can be used in a subsequent SELECT statement. 
-- Each SQL CTE is like a named query, whose result is stored in a virtual table (a CTE) to be referenced later in the main query.
WITH RESULT AS
(
    SELECT SALARY,
           DENSE_RANK() OVER (ORDER BY SALARY DESC) AS DENSERANK
    FROM Employees1
)

SELECT TOP 1 SALARY
FROM RESULT
WHERE DENSERANK = N




-- To find 2nd highest salary we can use any of the above queries. Simple replace N with 2. 

-- Similarly, to find 3rd highest salary, simple replace N with 3. 

-- Please Note: On many of the websites, you may have seen that, the following query can be used to get the nth highest salary. The below query will only work if there are no duplicates.
WITH RESULT AS
(
    SELECT SALARY,
           ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS ROWNUMBER
    FROM EMPLOYEES
)
SELECT SALARY
FROM RESULT
WHERE ROWNUMBER = 3

