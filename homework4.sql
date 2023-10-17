-- Task(1) Найти мин/стоимость товаров для каждой категории
SELECT 
	CategoryID,
	MIN(Price) AS min_price
FROM Products
GROUP BY
	CategoryID

-- Task(2) Вывести названия категорий, в которых более 10 товаров
SELECT 
	Categories.CategoryName,
	COUNT(*) AS count_products
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY
	Products.CategoryID
HAVING
	count_products > 10

-- Task(3) Очистить тел/номер поставщикам из USA
UPDATE Suppliers
SET 
	Phone=''
WHERE
	Country='USA'

-- Task(4) Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
SELECT  
	Employees.FirstName,
    Employees.LastName,
    COUNT(*) AS total_orders
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY
	Employees.EmployeeID
HAVING
	total_orders < 15