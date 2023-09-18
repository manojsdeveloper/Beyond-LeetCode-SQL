-- SQL query to get organization hierarchy

Here is the problem definition:
1. Employees table contains the following columns 
    a) EmployeeId, 
    b) EmployeeName 
    c) ManagerId 
2. If an EmployeeId is passed, the query should list down the entire organization hierarchy i.e who is the manager of the EmployeeId passed and who is managers manager and so on till full hierarchy is listed.

For example, 
Scenario 1: If we pass David's EmployeeId to the query, then it should display the organization hierarchy starting from David.

Scenario 2: If we pass Lara's EmployeeId to the query, then it should display the organization hierarchy starting from Lara.

We will be Employees table for this demo. SQL to create and populate Employees table with test data
Create table Employees
(
 EmployeeID int primary key identity,
 EmployeeName nvarchar(50),
 ManagerID int foreign key references Employees(EmployeeID)
)
GO

Insert into Employees values ('John', NULL)
Insert into Employees values ('Mark', NULL)
Insert into Employees values ('Steve', NULL)
Insert into Employees values ('Tom', NULL)
Insert into Employees values ('Lara', NULL)
Insert into Employees values ('Simon', NULL)
Insert into Employees values ('David', NULL)
Insert into Employees values ('Ben', NULL)
Insert into Employees values ('Stacy', NULL)
Insert into Employees values ('Sam', NULL)
GO

Update Employees Set ManagerID = 8 Where EmployeeName IN ('Mark', 'Steve', 'Lara')
Update Employees Set ManagerID = 2 Where EmployeeName IN ('Stacy', 'Simon')
Update Employees Set ManagerID = 3 Where EmployeeName IN ('Tom')
Update Employees Set ManagerID = 5 Where EmployeeName IN ('John', 'Sam')
Update Employees Set ManagerID = 4 Where EmployeeName IN ('David')
GO

Here is the SQL that does the job
Declare @ID int ;
Set @ID = 7;

WITH EmployeeCTE AS
(
 Select EmployeeId, EmployeeName, ManagerID
 From Employees
 Where EmployeeId = @ID
 
 UNION ALL
 
 Select Employees.EmployeeId , Employees.EmployeeName, Employees.ManagerID
 From Employees
 JOIN EmployeeCTE
 ON Employees.EmployeeId = EmployeeCTE.ManagerID
)

Select E1.EmployeeName, ISNULL(E2.EmployeeName, 'No Boss') as ManagerName
From EmployeeCTE E1
LEFT Join EmployeeCTE E2
ON E1.ManagerID = E2.EmployeeId

------------------------------------------------------------------------------------

Part 3 - How does a recursive CTE work
Suggested Videos:
Part 1 - How to find nth highest salary in sql 
Part 2 - SQL query to get organization hierarchy 

 

A lot of you have asked to explain, how a recursive CTE work line by line. If you have not watched Part 2 already, I strongly recommend to watch that video first before proceeding. 

 

In Part 2 of SQL Server Interview questions and answers video series we discussed recursive CTE to retrieve the organization hierarchy.

We will be using Employees table to understand how a recursive CTE works. 
sql server query to display org chart 

Here is the recursive CTE that gets the organization hierarchy based on an EmployeeId. Notice that the recursive CTE has got 2 parts (Anchor & Recursive Member)
Declare @ID int;
Set @ID = 7;

WITH EmployeeCTE AS
(
     -- Anchor
     Select EmployeeId, EmployeeName, ManagerID
     From Employees
     Where EmployeeId = @ID
    
     UNION ALL
    
     -- Recursive Member
     Select Employees.EmployeeId , Employees.EmployeeName, Employees.ManagerID
     From Employees
     JOIN EmployeeCTE
     ON Employees.EmployeeId = EmployeeCTE.ManagerID
)

Select E1.EmployeeName, ISNULL(E2.EmployeeName, 'No Boss') as ManagerName
From EmployeeCTE E1
LEFT Join EmployeeCTE E2
ON E1.ManagerID = E2.EmployeeId

When David's EmployeeId is passed the query produces the following output 
how does a recursive cte work 

Let's now discuss how the CTE executes line by line.
Step 1: Execute the anchor part and get result R0
Step 2: Execute the recursive member using R0 as input and generate result R1


Step 3: Execute the recursive member using R1 as input and generate result R2
Step 4: Recursion goes on until the recursive member output becomes NULL
Step 5: Finally apply UNION ALL on all the results to produce the final output