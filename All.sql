--Task1

CREATE TABLE IF NOT EXISTS EmployeeDetails(
EmployeeID INTEGER PRIMARY KEY,
EmployeeName TEXT,
Position TEXT,
HireDate DATE,
Salary NUMERIC
);
INSERT INTO EmployeeDetails (EmployeeID,EmployeeName,"Position",HireDate,Salary)
VALUES (1,'Alex','Director','2023-04-04',20000);
INSERT INTO EmployeeDetails (EmployeeID,EmployeeName,"Position",HireDate,Salary)
VALUES (2,'Anastasia','Manager','2023-09-16',15000);
INSERT INTO EmployeeDetails (EmployeeID,EmployeeName,"Position",HireDate,Salary)
VALUES (3,'Sarah','HR','2022-04-04',27000);

--Task2

CREATE VIEW HighValueOrders AS
SELECT o.OrderID, o.OrderDate, SUM(od.Quantity*p.Price) AS TotalAmount 
FROM Orders o 
JOIN OrderDetails od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
GROUP BY o.OrderID
HAVING SUM(od.Quantity*p.Price) > 10000

--Task3

DELETE FROM EmployeeDetails WHERE Salary < 50000

DROP TABLE EmployeeDetails 

--Task4

CREATE PROCEDURE GetProductSales @pProductID INTEGER
AS
BEGIN
	SELECT o.OrderID, o.OrderDate, o.CustomerID
	FROM Orders o 
	JOIN OrderDetails od ON od.OrderID = o.OrderID 
	WHERE od.ProductID = @pProductID
END





