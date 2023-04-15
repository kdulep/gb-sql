CREATE DATABASE IF NOT EXISTS phones;
USE phones;
CREATE TABLE IF NOT EXISTS product
(
idproduct INT PRIMARY KEY NOT NULL,
ProductName VARCHAR(40) NOT NULL,
Manufacturer VARCHAR(40) NOT NULL,
ProductCount INT,
Price VARCHAR(40) NOT NULL
);


INSERT product(idproduct, ProductName, Manufacturer, ProductCount, Price)
VALUES
(1, 'iPhone X', 'Apple', 3, '76000'),
(2, 'iPhone 8', 'Apple', 2, '51000'),
(3, 'Galaxy S9', 'Samsung', 2, '56000'),
(4, 'Galaxy S8', 'Samsung', 1, '41000'),
(5, 'P20 Pro', 'Huawei', 5, '36000');


-- 1) Выведите название, производителя и цену для товаров, количество которых превышает 2 (SQL - файл, скриншот, либо сам код)

SELECT ProductName, Manufacturer, Price  FROM product WHERE ProductCount > 2;


-- 2) Выведите весь ассортимент товаров марки “Samsung” 

SELECT * FROM product WHERE Manufacturer = 'Samsung';


-- 4) С помощью регулярных выражений найти:
-- 	4.1. Товары, в которых есть упоминание "Iphone"
-- 	4.2. "Samsung"
-- 	4.3.  Товары, в которых есть ЦИФРА "8"  

SELECT * FROM product WHERE ProductName LIKE '%Iphone%';

SELECT * FROM product WHERE Manufacturer LIKE '%Samsung%';

SELECT * FROM product WHERE ProductName LIKE '%8%';