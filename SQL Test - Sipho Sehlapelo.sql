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
SELECT Suppliers.SupplierID,Suppliers.CompanyName,Categories.CategoryName,Products.ProductName,Products.UnitPrice FROM Products, Suppliers, Categories
WHERE Products.SupplierID = Suppliers.SupplierID AND Products.CategoryID = Categories.CategoryID

--Question 14
SELECT Orders.OrderID, Employees.FirstName, Employees.LastName FROM Orders, Employees
WHERE Orders.EmployeeID = Employees.EmployeeID AND Orders.ShippedDate > Orders.RequiredDate

--Question 15
SELECT ProductID, SUM(Quantity) AS TotalQuantityOfProducts FROM [Order Details]
GROUP BY ProductID
HAVING SUM(Quantity) < 200

--Question 16
SELECT CustomerID, COUNT(OrderID) AS TotalNumberOfOrders FROM Orders
WHERE OrderDate > '1996-12-31'
GROUP BY CustomerID
HAVING COUNT(OrderID) > 15

--Question 17
SELECT Products.ProductName,Products.UnitPrice,Suppliers.CompanyName FROM Products, Suppliers
WHERE Products.SupplierID = Suppliers.SupplierID

--Question 18
SELECT Products.ProductName, SUM([Order Details].UnitPrice * [Order Details].Quantity) AS TotalCostsOfOrders FROM Products, [Order Details]
WHERE Products.ProductID = [Order Details].ProductID
GROUP BY Products.ProductName
HAVING SUM([Order Details].UnitPrice * [Order Details].Quantity) > 200

--Question 19
SELECT OrderID, COUNT(OrderID) AS NumberofOrders FROM [Order Details]
GROUP BY OrderID
ORDER BY NumberofOrders DESC

--Question 20
SELECT Suppliers.SupplierID, Products.ProductName, Suppliers.CompanyName FROM Products, Suppliers
WHERE Products.SupplierID = Suppliers.SupplierID AND Suppliers.CompanyName IN ('Exotic Liquids', 'Specialty Biscuits, Ltd.', 'Escargots Nouveaux')
ORDER BY Suppliers.SupplierID