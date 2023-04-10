

--1. Create a UDF named GetJobTitleFromDepartment that takes a department ID as input and returns the job title of the department's manager.
CREATE FUNCTION GetJobTitleFromDepartment(@DepartmentID INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @JobTitle VARCHAR(50)
    SELECT @JobTitle = JobTitle
    FROM Department
    WHERE DepartmentID = @DepartmentID
    RETURN @JobTitle
END;


--4.List the name of the employee who has worked in the most departments.

SELECT EmployeeName
FROM Employee
WHERE EmployeeID = (
    SELECT TOP 1 EmployeeID
    FROM (
        SELECT EmployeeID, COUNT(DISTINCT DepartmentID) AS NumDepartments
        FROM Employee
        GROUP BY EmployeeID
    ) AS EmployeeDepartments
    ORDER BY NumDepartments DESC
);


--6. Write a SQL query to display the top 3 departments with the highest average age of employees

WITH AvgAgeCTE AS (
  SELECT d.DepartmentName, AVG(e.Age) AS AvgAge
  FROM Employee e
  JOIN Department d ON e.DepartmentID = d.DepartmentID
  GROUP BY d.DepartmentName
)
SELECT TOP 3 DepartmentName, AvgAge
FROM AvgAgeCTE
ORDER BY AvgAge DESC;

--7. Create a trigger that automatically updates the Department table every time an employee is updated in the Employee table. The Department table should be updated with the name of the employee's new department.

CREATE TRIGGER tr_UpdateDepartment
ON Employee
AFTER UPDATE
AS
BEGIN
  UPDATE Department
  SET DepartmentName = inserted.DepartmentName
  FROM Department
  INNER JOIN inserted ON Department.DepartmentID = inserted.DepartmentID;
END;

-- Q.List all departments and the job title of the employee with the highest salary in each department.

SELECT Department.DepartmentID, Department.DepartmentName, Employee.JobTitle
FROM Department
INNER JOIN Employee ON Department.DepartmentID = Employee.DepartmentID
WHERE Employee.Salary = (
    SELECT MAX(Salary)
    FROM Employee
    WHERE Department.DepartmentID = Employee.DepartmentID
);

--List all employees who have a salary greater than the average salary of their department.

SELECT *
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
    WHERE DepartmentID = Employee.DepartmentID
);

