-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT o.user_id, u.name 
FROM 
	orders AS o 
JOIN 
	users AS u 
WHERE 
	o.user_id = u.id;
	

-- 2 Выведите список товаров products и разделов catalogs, который соответствует товару 

SELECT p.name, c.name 
FROM 
	products AS p 
JOIN 
	catalogs AS c 
WHERE 
	p.catalog_id = c.id ;
	

-- 3 (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.

DROP TABLE IF EXISTS flights; 
CREATE TABLE flights (
	id serial,
	ffrom varchar(200),
	tto varchar(200)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities ( 
	label varchar(200),
	name varchar(200)
);

INSERT INTO flights (ffrom, tto)
VALUES 
	('Moscow', 'Omsk'),
	('Novgorod', 'Kazan'),
	('Irkutsk', 'Moscow'),
	('Omsk', 'Irkutsk'),
	('Moscow', 'Kazan');
	
SELECT * FROM flights 

INSERT INTO cities (label, name)
VALUES 
	('Moscow', 'Москва'),
	('Irkutsk', 'Иркутск'),
	('Novgorod', 'Новгород'),
	('Kazan', 'Казань'),
	('Omsk', 'Омск');


SELECT 
	id, 
	(SELECT name FROM cities WHERE label = flights.ffrom) AS 'from',
	(SELECT name FROM cities WHERE label = flights.tto) AS 'to'
FROM 
	flights;






















