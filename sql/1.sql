DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees(
  ID INT PRIMARY KEY,
  Name NVARCHAR(50),
  Department NVARCHAR(50),
  Salary INT,
  HireDate DATE,
  Gender NVARCHAR(5)
);

BULK INSERT Employees
FROM 'C:\Users\Az1zbekx\MAAB-BI\sql\data.csv'
WITH(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2,
  TABLOCK
);

SELECT Name, Department, Salary FROM Employees
WHERE Department = 'IT'
ORDER BY Salary DESC;

SELECT Department, AVG(Salary) AS AvgSalary FROM Employees
GROUP BY Department
ORDER BY AvgSalary DESC;

SELECT * FROM Employees
WHERE HireDate BETWEEN '2021-01-01' AND '2023-12-31';

SELECT TOP 3 * FROM Employees
ORDER BY Salary DESC;
 
SELECT Department FROM Employees
WHERE Gender = 'F'
GROUP BY Department
HAVING COUNT(DISTINCT Gender) = 1;


SELECT Department, MAX(Salary) AS MaxSalary FROM Employees
GROUP BY Department
ORDER BY MaxSalary DESC; 
