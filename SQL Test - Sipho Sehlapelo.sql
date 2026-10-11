--SQL TEST
--FullName: Sipho Sehlapelo

--Question 1
SELECT * FROM  Customers
SELECT * FROM Orders
SELECT * FROM Suppliers
--Question 2
SELECT ContactName FROM Customers
WHERE ContactTitle LIKE '%Manager%'
ORDER BY ContactName

--Question 3
SELECT * FROM Orders
WHERE OrderDate = '1997-05-19'

--Question 4
SELECT CompanyName, Fax, Phone, Country, HomePage FROM Suppliers
ORDER BY Country DESC, CompanyName ASC

--Question 5
SELECT ProductName, UnitPrice, QuantityPerUnit FROM Products
WHERE UnitsInStock = 0

--Question 6
SELECT ContactName, Address, City FROM  Customers
Where Country NOT IN('Mexico', 'Germany', 'Spain')

--Question 7
SELECT AVG(UnitPrice) AS AveragePrice,MIN(UnitPrice) AS MinimumPrice,MAX(UnitPrice) AS MaximumPrice FROM Products

--Question 8
SELECT FirstName, LastName FROM Employees
WHERE ReportsTo IS NULL

--Question 9
SELECT ShipPostalCode, OrderID, OrderDate, RequiredDate,ShippedDate, ShipAddress FROM Orders
WHERE ShipPostalCode LIKE '98124%'

--Question 10
SELECT LastName, FirstName, City FROM Employees
WHERE City <> 'Seattle'

--Question 11
SELECT  ContactName, ContactTitle, CompanyName FROM Customers
WHERE ContactTitle NOT LIKE '%Sales%'

--Question 12
SELECT CustomerID, SUM(Freight) AS FreightSUM FROM Orders
GROUP BY CustomerID
HAVING SUM(Freight) > 200

--Question 13
SELECT s.SupplierID, s.CompanyName, c.CategoryName, p.ProductName, p.UnitPrice FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN Categories c ON p.CategoryID = c.CategoryID

--Question 14
SELECT o.OrderID, e.FirstName, e.LastName FROM Orders o
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID 
WHERE o.ShippedDate > o.RequiredDate

--Question 15
SELECT P.ProductName, SUM(OD.Quantity) AS TotalQuantityOfProducts FROM [Order Details] OD
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY P.ProductName
HAVING SUM(Quantity) < 200

--Question 16
SELECT CustomerID, COUNT(OrderID) AS TotalNumberOfOrders FROM Orders
WHERE OrderDate > '1996-12-31'
GROUP BY CustomerID
HAVING COUNT(OrderID) > 15

--Question 17
SELECT p.ProductName, p.UnitPrice, s.CompanyName FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID

--Question 18
SELECT P.ProductName, SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalCostsOfOrders FROM Products P 
JOIN [Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductName
HAVING SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) > 200

--Question 19
SELECT OrderID, COUNT(*) AS NumberofOrders FROM [Order Details]
GROUP BY OrderID
ORDER BY NumberofOrders DESC

--Question 20
SELECT s.SupplierID, p.ProductName, s.CompanyName FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID 
WHERE s.CompanyName IN ('Exotic Liquids', 'Specialty Biscuits, Ltd.', 'Escargots Nouveaux')
ORDER BY s.SupplierID