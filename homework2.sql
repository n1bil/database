-- task(1) Вывести название и стоимость в USD одного самого дорогого проданного товара (не используя агрегацию)
SELECT 
	ProductName, Price
FROM Products
ORDER BY
	Price DESC
LIMIT 1

-- task(2) Вывести два самых дорогих товара из категории Beverages из USA
SELECT
	DISTINCT Products. *
FROM Products
JOIN Categories ON Products.CategoryID AND Categories.CategoryID
JOIN Suppliers ON Products.SupplierID AND Suppliers.SupplierID
WHERE
	Categories.CategoryName='Beverages'
    AND
    Suppliers.Country='USA'
ORDER BY
	Products.Price DESC
LIMIT 2

-- task(3) Удалить товары с ценой менее 50 EUR
DELETE FROM Products
WHERE
	Price < 50

-- task(4) Вывести список стран, которые поставляют морепродукты
SELECT 
	DISTINCT Country 
FROM Suppliers
JOIN Products ON Suppliers.SupplierID AND Products.SupplierID
JOIN Categories ON Products.CategoryID AND Categories.CategoryID

-- task(5) Очистить поле ContactName у всех клиентов не из China
UPDATE Customers
SET
	CustomerName=''
WHERE
	Country NOT IN ('China')