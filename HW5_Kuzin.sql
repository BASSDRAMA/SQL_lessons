-- 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными.
--    Заполните их текущими датой и временем. 

UPDATE users 
SET 
created_at = now(),
updated_at = now();

SELECT *
FROM users 


-- 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
-- и в них долгое время помещались значения в формате "20.10.2017 8:10". 
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

/* DROP TABLE IF EXISTS users_1;
CREATE TABLE users_1
	(created_at VARCHAR(30));
INSERT INTO users_1 
	(created_at)
VALUES 
	('20.10.2017 8:10'),
	('20.10.2017 8:10'),
	('20.10.2017 8:10'),
	('20.10.2017 8:10');
*/

UPDATE users_1
SET 
created_at = STR_TO_DATE(created_at, "%d.%m.%Y %k:%i");

SELECT * 
FROM users_1;


-- 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
-- 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом,
-- чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.


/* INSERT INTO storehouses_products
	(value, id)
VALUES 
	(0, 1),
	(12223, 2),
	(334232, 3),
	(0, 4),
	(0, 5),
	(88582, 6),
	(99539, 7);
*/

SELECT 
	id, value 
FROM storehouses_products
WHERE value = 0
UNION 
SELECT id, value 
FROM storehouses_products
WHERE value != 0 
ORDER BY value; 
	
	
-- 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
-- Месяцы заданы в виде списка английских названий ('may', 'august')

/*
DROP TABLE IF EXISTS users_1;
CREATE TABLE users_1
	(birthday_at VARCHAR(30),
	name VARCHAR(30));
INSERT INTO users_1 
	(name, birthday_at)
VALUES 
	('Don Baton', '05-may-1990'),
	('Oon Dbton', '06-june-1990'),
	('Bon Daton', '06-august-1991');
 */


SELECT name, birthday_at
FROM users_1 
WHERE 
	birthday_at LIKE '%may%' OR birthday_at LIKE '%august%';



-- 5. Из таблицы catalogs извлекаются записи при помощи запроса. 
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.


SELECT *
FROM catalogs
WHERE 
	id IN (5, 1, 2)
ORDER BY 
	FIELD(id, 5, 1, 2)
	

	
    -- АГРЕГАЦИЯ ДАННЫХ -- 

-- 1. Подсчитайте средний возраст пользователей в таблице users

ALTER TABLE users 
ADD age INT NOT NULL DEFAULT 0 

UPDATE users 
SET 
age = TIMESTAMPDIFF(YEAR, birthday_at, now());

SELECT AVG(age)
FROM users


-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.
 
ALTER TABLE users 
ADD this_year_bd DATE;

UPDATE users 
SET 
this_year_bd = CONCAT_WS('-', YEAR(now()), MONTH(birthday_at), DAY(birthday_at));

SELECT count(*) AS dayz, 
	dayname(this_year_bd) AS daynme
FROM users 
GROUP BY daynme 
ORDER BY dayz

-- 3.  :((  













































	






















