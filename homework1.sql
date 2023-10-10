-- task(1) - Приведите десять типовых бизнес-процессов для предметной области ВИДЕО-ХОСТИНГ (Youtube), а также их соответствие по CRUD.
/*
1. Загрузка видео (Create)
2. Просмотр видео (Read)
3. Редактировать видео (Update)
4. Удалить видео (Delete)
5. Комментировать видео (Create, Read, Update, Delete)
6. Лайкать видео (Create, Read, Delete)
7. Дизлайкать видео (Create, Delete)
8. Поиск видео (Read)
9. Создать учетную запись (Create)
10. Редактировать учетную запись (Update)
11. Удалить учетную запись (Delete)
*/
-- task(2) - Вывести название и стоимость товаров от 20 EUR.
SELECT
	ProductName, Price
FROM Products
WHERE
	Price >= 20

-- task(3) - Вывести страны поставщиков.
SELECT 
    Country
FROM Suppliers

-- task(4) - В упорядоченном по стоимости виде вывести название и стоимость товаров от всех поставщиков, кроме поставщика 1.
SELECT 
	ProductName, Price
FROM Products
Where
	SupplierID NOT IN (1)
ORDER BY
	Price

-- task(5) - Вывести контактные имена клиентов, кроме тех, что из France и USA.
SELECT 
	ContactName@
FROM Customers
WHERE
	Country NOT IN ('France', 'USA')
