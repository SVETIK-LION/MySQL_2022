/* Практическое задание по теме “Транзакции, переменные, представления”.
 * 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
 * Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции. */

START TRANSACTION;

INSERT INTO sample.users 
SELECT id, name 
FROM shop.users 
WHERE id = 1;

DELETE FROM shop.users
WHERE id=1; 

COMMIT;

/* Практическое задание по теме “Хранимые процедуры и функции, триггеры".
* 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
* С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
* с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи". */

DELIMITER //

DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION hello()
RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE time INT;
	SET time = HOUR(now());
	CASE
		WHEN time BETWEEN 0 AND 5 THEN 
			RETURN 'Доброй ночи!';
		WHEN time BETWEEN 6 AND 11 THEN 
			RETURN 'Доброе утро!';
		WHEN time BETWEEN 12 AND 17 THEN 
			RETURN 'Добрый день!';
		WHEN time BETWEEN 18 AND 23 THEN 
			RETURN 'Добрый вечер!';
	END CASE;
END//

SELECT hello()
