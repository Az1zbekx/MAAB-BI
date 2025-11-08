DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

BULK INSERT Employees
FROM 'C:\Users\Az1zbekx\MAAB-BI\sql\Employees.csv'
WITH(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2,
  TABLOCK
);

SELECT * FROM Employees;

BULK INSERT Orders
FROM 'C:\Users\Az1zbekx\MAAB-BI\sql\Orders.csv'
WITH(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2,
  TABLOCK
);

SELECT * FROM Orders;

BULK INSERT Products
FROM 'C:\Users\Az1zbekx\MAAB-BI\sql\Products.csv'
WITH(
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2,
  TABLOCK
);

SELECT * FROM Products;

WITH TopEmployees AS (
    SELECT TOP 10 PERCENT *
    FROM Employees
    ORDER BY Salary DESC
)
SELECT 
Department, AVG(Salary) as AverageSalary,
CASE 
  WHEN Salary > 80000 THEN 'High'
  WHEN Salary BETWEEN 50000 AND 80000 THEN 'Medium'
  ELSE 'Low'
END AS SalaryCategory
FROM Employees 
GROUP BY Department,
CASE 
    WHEN Salary > 80000 THEN 'High'
    WHEN Salary BETWEEN 50000 AND 80000 THEN 'Medium'
    ELSE 'Low'
END
ORDER BY AverageSalary DESC
OFFSET 2 ROW FETCH NEXT 5 ROWS ONLY;