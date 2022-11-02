/* Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»
1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем. */
-- Я использовала скрипт для создания БД из урока. Там уже заполнены поля created_at и updated_at. Сделаем их пустыми:
UPDATE users
SET created_at = NULL,
    updated_at = NULL;

-- Затем, поменяем все значения NULL в столбцах created_at и updated_at на текущую дату:

UPDATE users SET created_at = NOW(), updated_at = NOW() WHERE created_at IS NULL AND updated_at IS NULL;
-- Последнее условие на всякий случай пишем, вдруг где-то появятся записи, чтобы их не затереть

/* 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR
 *  и в них долгое время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME,
 * сохранив введённые ранее значения.
 * Так как у нас по скрипту таблица спроектирована правильно, в столбцах created_at и updated_at заполнены данные,
 * то очистим таблицу и заполним данные непраивльно:
 */
TRUNCATE users; -- TRUNCATE выполняется быстрее, требует меньше ресурсов, чем DELETE + еще обнуляет счетчик

ALTER TABLE users CHANGE created_at created_at VARCHAR(50);
ALTER TABLE users CHANGE updated_at updated_at VARCHAR(50); -- меняем формат столбцов на неверный VARCHAR

-- Заполним таблицу неверными значениями:
INSERT INTO users (name, birthday_at, created_at, updated_at)
VALUES
	('Геннадий', '1990-10-05', '20.10.2017 7:45', '20.10.2017 8:10'),
	('Наталья', '1984-11-12', '04.05.2020 10:50', '23.05.2021 13:14'),
	('Александр', '1985-05-20', '16.03.2015 12:10', '16.03.2015 12:11'),
	('Сергей', '1988-02-14', '14.04.2022 14:44', '14.04.2022 14:55'),
	('Мария', '1992-08-29', '12.12.2022 12:15', '12.12.2022 12:20');

UPDATE users
SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),
	updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i'); -- форматируем

ALTER TABLE users CHANGE created_at created_at DATETIME;
ALTER TABLE users CHANGE updated_at updated_at DATETIME; -- меняем формат столбцов created_at и updated_at на DATETIME

/* Проверим в командной строке:
mysql> SELECT id, name,birthday_at, created_at, updated_at FROM users;
+----+--------------------+-------------+---------------------+---------------------+
| id | name               | birthday_at | created_at          | updated_at          |
+----+--------------------+-------------+---------------------+---------------------+
|  1 | Геннадий           | 1990-10-05  | 2017-10-20 07:45:00 | 2017-10-20 08:10:00 |
|  2 | Наталья            | 1984-11-12  | 2020-05-04 10:50:00 | 2021-05-23 13:14:00 |
|  3 | Александр          | 1985-05-20  | 2015-03-16 12:10:00 | 2015-03-16 12:11:00 |
|  4 | Сергей             | 1988-02-14  | 2022-04-14 14:44:00 | 2022-04-14 14:55:00 |
|  5 | Мария              | 1992-08-29  | 2022-12-12 12:15:00 | 2022-12-12 12:20:00 |
+----+--------------------+-------------+---------------------+---------------------+
5 rows in set (0,00 sec)

mysql> describe users;
+-------------+-----------------+------+-----+---------+----------------+
| Field       | Type            | Null | Key | Default | Extra          |
+-------------+-----------------+------+-----+---------+----------------+
| id          | bigint unsigned | NO   | PRI | NULL    | auto_increment |
| name        | varchar(255)    | YES  |     | NULL    |                |
| birthday_at | date            | YES  |     | NULL    |                |
| created_at  | datetime        | YES  |     | NULL    |                |
| updated_at  | datetime        | YES  |     | NULL    |                |
+-------------+-----------------+------+-----+---------+----------------+
5 rows in set (0,00 sec)
*/

/* 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
 * 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом,
 * чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех записей.
 * Таблица storehouses_products еще не заполнена, поэтому внесем в нее необходимые для задания строки values: */
INSERT INTO storehouses_products (value) VALUES (0), (5345356.00), (3232), (0), (532), (424), (0);

SELECT value FROM storehouses_products ORDER BY value = 0, value; -- отсотрируем (по-умолчанию сортирует в порядке возрастания - ASC, по убыванию - DESC)

/* Проверим:
mysql> SELECT value FROM storehouses_products ORDER BY value = 0, value;
+---------+
| value   |
+---------+
|     424 |
|     532 |
|    3232 |
| 5345356 |
|       0 |
|       0 |
|       0 |
+---------+
7 rows in set (0,00 sec) */

/* 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
Месяцы заданы в виде списка английских названий (may, august) */

ALTER TABLE users CHANGE birthday_at birthday_at VARCHAR(50); -- Преобразует поле birthday_at в VARCHAR

UPDATE users SET birthday_at = DATE_FORMAT (birthday_at, '%D %M %Y'); -- Поменяем формат даты, чтобы там были названия месяцев

SELECT id, name, birthday_at, created_at, updated_at FROM users WHERE birthday_at RLIKE 'May|August'; -- Найдем нужные значения

/* Проверим:
 * mysql> SELECT id, name, birthday_at, created_at, updated_at FROM users WHERE birthday_at RLIKE 'May|August';
+----+--------------------+------------------+---------------------+---------------------+
| id | name               | birthday_at      | created_at          | updated_at          |
+----+--------------------+------------------+---------------------+---------------------+
|  3 | Александр          | 20th May 1985    | 2015-03-16 12:10:00 | 2015-03-16 12:11:00 |
|  5 | Мария              | 29th August 1992 | 2022-12-12 12:15:00 | 2022-12-12 12:20:00 |
+----+--------------------+------------------+---------------------+---------------------+
 */

/* 5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2);
 * Отсортируйте записи в порядке, заданном в списке IN.
 * Воспользуемся сортировкой с выбором порядка значений FIELD(name, val1, ... , valN): */

SELECT id, name FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);

/* Проверим:
 * mysql> SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);
+----+-------------------------------------+
| id | name                                |
+----+-------------------------------------+
|  5 | Оперативная память                  |
|  1 | Процессоры                          |
|  2 | Материнские платы                   |
+----+-------------------------------------+
3 rows in set (0,00 sec) */

/* Практическое задание теме «Агрегация данных»
1. Подсчитайте средний возраст пользователей в таблице users. */
SELECT name, TIMESTAMPDIFF(YEAR, birthday_at, NOW()) AS age FROM users; -- показать возраст каждого пользователя (написала для себя)
SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())), 2) AS abs_age FROM users; -- средний возрвст всех пользователей из таблицы users, округленный до сотых

/* 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
Следует учесть, что необходимы дни недели текущего года, а не года рождения.
Сначала "слепим" строчку даты из текущего года и данных др из столбца birthday_at таблицы users, с помощью функции CONCAT_WS().
Отформатируем в день недели функцией DATE_FORMAT() с параметром %W и запишем это в столбец days_of_week.
Посчитаем количество записей в таблице и запишем результат в столбец amount.
Сгруппируем по дням недели.
Отсотируем по количеству в порядке возрастания.
 */

SELECT DATE_FORMAT(CONCAT_WS('.', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at)), '%W') AS days_of_week, COUNT(*) AS amount
    FROM users 
    GROUP BY days_of_week 
    ORDER BY amount;

/* Проверим:
 * mysql> SELECT DATE_FORMAT(CONCAT_WS('.', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at)), '%W') AS days_of_week, COUNT(*) AS amount
    ->     FROM users 
    ->     GROUP BY days_of_week 
    ->     ORDER BY amount;
+--------------+--------+
| days_of_week | amount |
+--------------+--------+
| Saturday     |      1 |
| Friday       |      1 |
| Wednesday    |      2 |
| Monday       |      2 |
+--------------+--------+
4 rows in set (0,00 sec)
 */
   
/* 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы.
 * Вычислим произведение столбца value из таблицы storehouses_products:
 */

SELECT EXP(SUM(LN(value))) AS product FROM storehouses_products;

/* Проверим:
 * mysql> SELECT EXP(SUM(LN(value))) AS product FROM storehouses_products;
+--------------------+
| product            |
+--------------------+
| 3896955759456251.5 |
+--------------------+
1 row in set, 3 warnings (0,00 sec) */
