/* 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
 * Сначала заполним таблицу заказов orders:
 */

INSERT INTO orders (user_id, created_at, updated_at) VALUES
    (4, NOW(), NOW()),
    (6, NOW(), NOW()),
    (3, NOW(), NOW()),
    (4, NOW(), NOW());
   
-- Список пользователей, которые сделали хотя бы один заказ:

SELECT 
	users.id AS user_id,
	users.name AS name
FROM 
	users
JOIN
	orders 
ON
	users.id = orders.user_id
GROUP BY user_id;

/* 2. Выведите список товаров products и разделов catalogs, который соответствует товару.
 */

SELECT 
	products.id,
	products.name,
	catalogs.name AS `catalog`
FROM
	products
LEFT JOIN
	catalogs
ON 
	products.catalog_id = catalogs.id; 

-- Еще можно сделать так:

SELECT
    id,
    name,
    price,
    (SELECT name FROM catalogs WHERE id = catalog_id) AS 'catalog'
FROM
    products;

/* 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.
* создадим и заполним нужные таблицы, чтобы проверить на них скрипт: */

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
    id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    `from` VARCHAR(50),
    `to` VARCHAR(50)
);
   
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
    label VARCHAR(50),
    name VARCHAR(50)
   );

INSERT INTO flights (`from`, `to`) VALUES
    ('moscow', 'omsk'),
    ('novgorod', 'kazan'),
    ('irkutsk', 'moscow'),
    ('omsk', 'irkutsk'),
    ('moscow', 'kazan');
   
INSERT INTO cities VALUES
    ('moscow', 'Москва'),
    ('novgorod', 'Новгород'),
    ('irkutsk', 'Иркутск'),
    ('omsk', 'Омск'),
    ('kazan', 'Казань');

-- Выведем нужный результат:
   
SELECT
    id,
    cities_from.name AS `from`,
    cities_to.name AS `to`
FROM
    flights
JOIN
    cities AS cities_from
ON 
    flights.`from` = cities_from.label 
JOIN
    cities AS cities_to
ON
    flights.`to` = cities_to.label 
ORDER BY
    id;

-- Можно еще сделать так:
   
SELECT
    id,
    (SELECT name FROM cities WHERE label = `from`) AS `from`,
    (SELECT name FROM cities WHERE label = `to`) AS `to`
FROM
    flights
ORDER BY
    id;
