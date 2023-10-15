-- Task(1) Вывести ко-во поставщиков не из UK и не из China
SELECT 
	COUNT(*)
FROM Suppliers
WHERE
	Country NOT IN ('UK', 'China')

-- Task(2) Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT 
	AVG(Price) AS avg_price,
    MAX(Price) AS max_price,
	MIN(Price) AS min_price,
    COUNT(*) AS count_products
FROM Products
WHERE
	CategoryID IN (3, 5)

-- Task(3) Вывести общую сумму проданных товаров
SELECT 
	SUM(Products.Price * OrderDetails.Quantity) AS sum_products
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID

-- Task(4) Вывести данные о заказах (номер_заказа, имя_клиента, страна_клиента, фамилия_менеджера, название_компании_перевозчика)
SELECT 
	Orders.OrderID,
    Customers.CustomerName,
    Customers.Country,
    Employees.LastName,
    Shippers.ShipperName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID

-- Task(5) Вывести сумму, на которую было отправлено товаров клиентам в Germany
SELECT 
	SUM(Products.Price * OrderDetails.Quantity) sum_products
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
	Country='Germany'