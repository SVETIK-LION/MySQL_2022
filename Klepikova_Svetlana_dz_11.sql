/* 1) Создайте таблицу logs типа Archive.
 * Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи,
 * название таблицы, идентификатор первичного ключа и содержимое поля name. */

/* Так как у нас таблица логов, то не деелаем индексированный столбец primary key. Записи будут постоянно добавляться в эту таблицу,
 * индекс будет пересчитываться, что может замедлить работу. Создадим таблицу logs: */

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	table_name VARCHAR(45) NOT NULL,
	primary_key_id BIGINT(20) NOT NULL,
	name_value VARCHAR(45) NOT NULL)
ENGINE = ARCHIVE;


-- Триггер, заносящий данные в таблицу logs, при добавлении записей в таблицу users:

DELIMITER //

DROP TRIGGER IF EXISTS users_log//
CREATE TRIGGER users_log AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, primary_key_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END//

DELIMITER ;

-- Проверим:

INSERT INTO users (name, birthday_at, created_at, updated_at)
VALUES ('Киану Ривз', '1964-09-02', NOW(), NOW());

SELECT id, name, birthday_at, created_at, updated_at FROM users;
SELECT created_at, table_name, primary_key_id, name_value FROM logs;


-- Триггер, заносящий данные в таблицу logs, при добавлении записей в таблицу catalogs:

DELIMITER //

DROP TRIGGER IF EXISTS catalogs_log//
CREATE TRIGGER catalogs_log AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, primary_key_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END//

DELIMITER ;

-- Проверим:

INSERT INTO catalogs (name)
VALUES ('Звуковые карты');

SELECT id, name FROM catalogs;
SELECT created_at, table_name, primary_key_id, name_value FROM logs;


-- Триггер, заносящий данные в таблицу logs, при добавлении записей в таблицу products:

DELIMITER //

DROP TRIGGER IF EXISTS products_log//
CREATE TRIGGER products_log AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, primary_key_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END//

DELIMITER ;

-- Проверим:

INSERT INTO products (name, description, price, catalog_id, created_at, updated_at)
VALUES ('Внутренняя звуковая карта ASUS Xonar AE', 'Внутренняя звуковая карта ASUS Xonar AE устанавливается в корпус ПК и служит для улучшения качества как входящего, так и исходящего аудиосигнала.', 4899, 6, NOW(), NOW());

SELECT id, name, description, price, catalog_id, created_at, updated_at FROM products;
SELECT created_at, table_name, primary_key_id, name_value FROM logs;


-- 2) Создайте SQL-запрос, который помещает в таблицу users миллион записей.

DELIMITER //

DROP PROCEDURE IF EXISTS one_mil_note//
CREATE PROCEDURE one_mil_note()
BEGIN
    DECLARE n INT DEFAULT 1;
    WHILE n <= 1000000 DO
        INSERT INTO users (name, birthday_at, created_at, updated_at)
        VALUES ('Firstname_Lastname', '1988-04-25', NOW(), NOW());
        SET n = n + 1;
    END WHILE;
END//

DELIMITER ;

CALL one_mil_note ();

-- Проверим:

SELECT id, name, birthday_at, created_at, updated_at FROM users;

