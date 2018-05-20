use AdventureWorks2017

-- Pivot used for checking number of people per shift in each department.
select DepartmentID, [Name] as 'Department Name', [1] as 'ShiftID 1', [2] as 'ShiftID 2'
from 
(
	select edh.BusinessEntityID, edh.DepartmentID, d.[Name], edh.ShiftID
	from HumanResources.EmployeeDepartmentHistory edh
	inner join HumanResources.Department d
			on edh.DepartmentID = d.DepartmentID
	where edh.EndDate IS NULL
) src
pivot
(
	count(BusinessEntityID)
	for ShiftID in ([1], [2])
) piv