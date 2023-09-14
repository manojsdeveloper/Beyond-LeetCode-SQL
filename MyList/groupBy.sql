Select * from tblEmployee

Select SUM(Salary) from tblEmployee
Select MIN(Salary) from tblEmployee
Select MAX(Salary) from tblEmployee

--GROUP BY: Group by clause use to group selected set of rows into a set of summary
-- rows by the values of one or more columns or expressions. 
-- It is always used in the conjuction with one or more aggregate functions.

Select Gender, DepartmentId, SUM(salary) as TotalSalary, COUNT(ID) as [Total Employees]
from tblEmployee
Group By Gender, DepartmentId
Order By Gender

--Note: If we select a gender but if we don't group by then it cause an error.

Select COUNT(*) from tblEmployee
-- For Performance we can use ID instead of star
Select COUNT(ID) from tblEmployee

--Filtering Groups: WHERE clause is used to filter rows before aggregation, 
--where as HAVING clause is used to filter groups after aggregations.
Select Gender, DepartmentId, SUM(salary) as TotalSalary, COUNT(ID) as [Total Employees]
from tblEmployee
Where Gender= 'Male'
Group By Gender, DepartmentId
Order By Gender
-- Row filtered by gender before group by the rows

Select Gender, DepartmentId, SUM(salary) as TotalSalary, COUNT(ID) as [Total Employees]
from tblEmployee
Group By Gender, DepartmentId
Having Gender='Male'
-- Having SUM(Salary) > 4000, so aggregate function can be used in Having clause but not in where
-- Row filtered by gender after group by the rows