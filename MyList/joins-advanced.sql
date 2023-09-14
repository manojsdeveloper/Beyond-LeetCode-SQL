
SELECT Name, Gender, Salary, DepartmentName
FROM tblEmployee
LEFT OUTER JOIN tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.Id
where tblEmployee.DepartmentId is NULL

SELECT Name, Gender, Salary, DepartmentName
FROM tblEmployee
RIGHT OUTER JOIN tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.Id
where tblEmployee.DepartmentId is NULL

SELECT Name, Gender, Salary, DepartmentName
FROM tblEmployee
FULL OUTER JOIN tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.Id
where tblEmployee.DepartmentId is NULL

Select Id, Name, Gender, Salary, DepartmentId, ManagerId from tblEmployee
ALTER TABLE tblEmployee
ADD ManagerId INT;

--Update tblEmployee SET ManagerId= 7
--where Id=8

select * from tblEmployee

--SELF JOIN: Joining a table with itself is called as Self Join
Select E.Name as Employee, M.Name as Manager 
from tblEmployee E
INNER JOIN tblEmployee M
ON E.ID = M.ManagerId

-- CROSS JOIN: Number of rows in the left table multiples number of rows in the right table
-- 10 * 10
Select E.Name as Employee, M.Name as Manager 
from tblEmployee E
CROSS JOIN tblEmployee M

-- In the output, MANAGER column, for Todd's rows is NULL. I want to replace the NULL value, with 'No Manager'

--Replacing NULL value using ISNULL() function: We are passing 2 parameters to IsNULL() function. If M.Name returns NULL, then 'No Manager' string is used as the replacement value.
SELECT E.Name as Employee, ISNULL(M.Name,'No Manager') as Manager
FROM tblEmployee E
LEFT JOIN tblEmployee M
ON E.ManagerID = M.EmployeeID

--Replacing NULL value using CASE Statement:
SELECT E.Name as Employee, CASE WHEN M.Name IS NULL THEN 'No Manager' 
   ELSE M.Name END as Manager
FROM  tblEmployee E
LEFT JOIN tblEmployee M
ON   E.ManagerID = M.EmployeeID

--Replacing NULL value using COALESCE() function: COALESCE() function, returns the first NON NULL value.
SELECT E.Name as Employee, COALESCE(M.Name, 'No Manager') as Manager
FROM tblEmployee E
LEFT JOIN tblEmployee M
ON E.ManagerID = M.EmployeeID

--COALESCE: We are passing FirstName, MiddleName and LastName columns as parameters to the COALESCE() function. The COALESCE() function returns the first non null value from the 3 columns.
SELECT Id, COALESCE(FirstName, MiddleName, LastName) AS Name
FROM tblEmployee