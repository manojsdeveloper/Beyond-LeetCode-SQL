Part 4 - Delete duplicate rows in sql
Suggested Videos:
Part 1 - How to find nth highest salary in sql 
Part 2 - SQL query to get organization hierarchy 
Part 3 - How does a recursive CTE work 

 

In this video, we will discuss deleting all duplicate rows except one from a sql server table. 

 

Let me explain what we want to achieve. We will be using Employees table for this demo. 
Delete duplicate rows in sql 

SQL Script to create Employees table
Create table Employees
(
     ID int,
     FirstName nvarchar(50),
     LastName nvarchar(50),
     Gender nvarchar(50),
     Salary int
)
GO

Insert into Employees values (1, 'Mark', 'Hastings', 'Male', 60000)
Insert into Employees values (1, 'Mark', 'Hastings', 'Male', 60000)

Insert into Employees values (1, 'Mark', 'Hastings', 'Male', 60000)

Insert into Employees values (2, 'Mary', 'Lambeth', 'Female', 30000)
Insert into Employees values (2, 'Mary', 'Lambeth', 'Female', 30000)
Insert into Employees values (3, 'Ben', 'Hoskins', 'Male', 70000)
Insert into Employees values (3, 'Ben', 'Hoskins', 'Male', 70000)
Insert into Employees values (3, 'Ben', 'Hoskins', 'Male', 70000)

The delete query should delete all duplicate rows except one. The output should be as shown below, after the delete query is executed. 
Delete all duplicate rows except one in sql 

Here is the SQL query that does the job. PARTITION BY divides the query result set into partitions.
WITH EmployeesCTE AS
(
   SELECT *, ROW_NUMBER()OVER(PARTITION BY ID ORDER BY ID) AS RowNumber
   FROM Employees
)
DELETE FROM EmployeesCTE WHERE RowNumber > 1

--------------------------------------------------------------------------

Part 5 - SQL query to find employees hired in last n months
Suggested Videos:
Part 2 - SQL query to get organization hierarchy
Part 3 - How does a recursive CTE work 
Part 4 - Delete duplicate rows in sql 

 

This question is asked is many sql server interviews. If you have used DATEDIFF() sql server function then you already know the answer. 

 

We will be using the following Employees table for this demo. 
SQL query to find employees hired in last n months 

SQL Script to create the table and populate with test data
Create table Employees
(
     ID int primary key identity,
     FirstName nvarchar(50),
     LastName nvarchar(50),
     Gender nvarchar(50),
     Salary int,
     HireDate DateTime
)
GO

Insert into Employees values('Mark','Hastings','Male',60000,'5/10/2014')
Insert into Employees values('Steve','Pound','Male',45000,'4/20/2014')

Insert into Employees values('Ben','Hoskins','Male',70000,'4/5/2014')
Insert into Employees values('Philip','Hastings','Male',45000,'3/11/2014')
Insert into Employees values('Mary','Lambeth','Female',30000,'3/10/2014')
Insert into Employees values('Valarie','Vikings','Female',35000,'2/9/2014')
Insert into Employees values('John','Stanmore','Male',80000,'2/22/2014')
Insert into Employees values('Able','Edward','Male',5000,'1/22/2014')
Insert into Employees values('Emma','Nan','Female',5000,'1/14/2014')
Insert into Employees values('Jd','Nosin','Male',6000,'1/10/2013')
Insert into Employees values('Todd','Heir','Male',7000,'2/14/2013')
Insert into Employees values('San','Hughes','Male',7000,'3/15/2013')
Insert into Employees values('Nico','Night','Male',6500,'4/19/2013')
Insert into Employees values('Martin','Jany','Male',5500,'5/23/2013')
Insert into Employees values('Mathew','Mann','Male',4500,'6/23/2013')
Insert into Employees values('Baker','Barn','Male',3500,'7/23/2013')
Insert into Employees values('Mosin','Barn','Male',8500,'8/21/2013')
Insert into Employees values('Rachel','Aril','Female',6500,'9/14/2013')
Insert into Employees values('Pameela','Son','Female',4500,'10/14/2013')
Insert into Employees values('Thomas','Cook','Male',3500,'11/14/2013')
Insert into Employees values('Malik','Md','Male',6500,'12/14/2013')
Insert into Employees values('Josh','Anderson','Male',4900,'5/1/2014')
Insert into Employees values('Geek','Ging','Male',2600,'4/1/2014')
Insert into Employees values('Sony','Sony','Male',2900,'4/30/2014')
Insert into Employees values('Aziz','Sk','Male',3800,'3/1/2014')
Insert into Employees values('Amit','Naru','Male',3100,'3/31/2014')

Here is the SQL Query that does the job
-- Replace N with number of months
Select *
FROM Employees
Where DATEDIFF(MONTH, HireDate, GETDATE()) Between 1 and N

