DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(100),
    lastname VARCHAR(100) COMMENT 'Фамилия', -- COMMENT на случай, если имя неочевидное
    email VARCHAR(100) UNIQUE,
    password_hash varchar(100),
    phone BIGINT,
    is_deleted bit default 0,
    -- INDEX users_phone_idx(phone), -- помним: как выбирать индексы
    INDEX users_firstname_lastname_idx(firstname, lastname)
);

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
	user_id SERIAL PRIMARY KEY,
    gender CHAR(1),
    birthday DATE,
	photo_id BIGINT UNSIGNED,
    created_at DATETIME DEFAULT NOW(),
    hometown VARCHAR(100)
    -- , FOREIGN KEY (photo_id) REFERENCES media(id) -- пока рано, т.к. таблицы media еще нет
);

-- NO ACTION
-- CASCADE 
-- RESTRICT
-- SET NULL
-- SET DEFAULT


ALTER TABLE `profiles` ADD CONSTRAINT fk_user_id
    FOREIGN KEY (user_id) REFERENCES users(id)
    ON UPDATE CASCADE ON DELETE CASCADE;

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(), -- можно будет даже не упоминать это поле при вставке

    FOREIGN KEY (from_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (to_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS friend_requests;
CREATE TABLE friend_requests (
	-- id SERIAL PRIMARY KEY, -- изменили на составной ключ (initiator_user_id, target_user_id)
	initiator_user_id BIGINT UNSIGNED NOT NULL,
    target_user_id BIGINT UNSIGNED NOT NULL,
    -- `status` TINYINT UNSIGNED,
    `status` ENUM('requested', 'approved', 'declined', 'unfriended'),
    -- `status` TINYINT UNSIGNED, -- в этом случае в коде хранили бы цифирный enum (0, 1, 2, 3...)
	requested_at DATETIME DEFAULT NOW(),
	updated_at DATETIME on update now(),
	
    PRIMARY KEY (initiator_user_id, target_user_id),
    FOREIGN KEY (initiator_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (target_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS communities;
CREATE TABLE communities(
	id SERIAL PRIMARY KEY,
	name VARCHAR(150),
	admin_user_id BIGINT UNSIGNED,

	INDEX communities_name_idx(name),
	FOREIGN KEY (admin_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE SET NULL
);

DROP TABLE IF EXISTS users_communities;
CREATE TABLE users_communities(
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,
  
	PRIMARY KEY (user_id, community_id), -- чтобы не было 2 записей о пользователе и сообществе
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (community_id) REFERENCES communities(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types(
	id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

    -- записей мало, поэтому индекс будет лишним (замедлит работу)!
);

DROP TABLE IF EXISTS media;
CREATE TABLE media(
	id SERIAL PRIMARY KEY,
    media_type_id BIGINT UNSIGNED,
    user_id BIGINT UNSIGNED NOT NULL,
  	body text,
    filename VARCHAR(255),
    `size` INT,
	metadata JSON,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (media_type_id) REFERENCES media_types(id) ON UPDATE CASCADE ON DELETE SET NULL
);

DROP TABLE IF EXISTS likes;
CREATE TABLE likes(
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),

    -- PRIMARY KEY (user_id, media_id) – можно было и так вместо id в качестве PK
  	-- слишком увлекаться индексами тоже опасно, рациональнее их добавлять по мере необходимости (напр., провисают по времени какие-то запросы)  

/* намеренно забыли, чтобы позднее увидеть их отсутствие в ER-диаграмме*/
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (media_id) REFERENCES media(id) ON UPDATE CASCADE ON DELETE CASCADE

);

DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
	`id` SERIAL,
	`name` varchar(255) DEFAULT NULL,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE SET NULL,
  	PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
	id SERIAL PRIMARY KEY,
	`album_id` BIGINT unsigned NOT NULL,
	`media_id` BIGINT unsigned NOT NULL,

	FOREIGN KEY (album_id) REFERENCES photo_albums(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (media_id) REFERENCES media(id) ON UPDATE CASCADE ON DELETE CASCADE
);

ALTER TABLE `profiles` ADD CONSTRAINT fk_photo_id
    FOREIGN KEY (photo_id) REFERENCES photos(id)
    ON UPDATE CASCADE ON DELETE set NULL;

DZ start
/* Написать cкрипт, добавляющий в БД vk, которую создали на 3 вебинаре, 3-4 новые таблицы (с перечнем полей, указанием индексов и внешних ключей).
(по желанию: организовать все связи 1-1, 1-М, М-М)
Добавим таблицу файлов для сообщений: */
DROP TABLE IF EXISTS files_for_messages;
CREATE TABLE  files_for_messages (
	id SERIAL PRIMARY KEY,
	file_type_id BIGINT UNSIGNED,
    images VARCHAR(255), -- Ссылка на картинку
    img_size BIGINT UNSIGNED NOT NULL, -- Размер изображения, далее все то же самое ниже для других файлов
    videos VARCHAR(255),
    video_size BIGINT UNSIGNED NOT NULL,
    music VARCHAR(255),
    music_size BIGINT UNSIGNED NOT NULL,
    documents VARCHAR(255),
    doc_size BIGINT UNSIGNED NOT NULL,
    from_files_id BIGINT UNSIGNED NOT NULL,
    to_files_id BIGINT UNSIGNED NOT NULL,
    sent DATETIME DEFAULT NOW(), -- Когда отправлено сообщение
    
FOREIGN KEY (from_files_id) REFERENCES users(id), -- делаем внешний ключ, кто был отправителем файлов 
FOREIGN KEY (to_files_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE, -- Делаем внешний ключ, кто был получателем файлов
FOREIGN KEY (id) REFERENCES messages(id) ON UPDATE CASCADE ON DELETE CASCADE, -- Делаем внешний ключ, в каком сообщении находятся файлы
FOREIGN KEY (file_type_id) REFERENCES media_types(id) ON UPDATE CASCADE ON DELETE CASCADE -- Делаем внешний ключ, какой тип файла у нас будет(картинка, видео, документ и т.д.), берем информацию из таблицы media_types
); -- т.к. файл может принадлежать только одному сообщению и пользователю, а у пользователя и в сообщении может быть несколько файлов - это свять 1-М (один ко многим)
-- ON UPDATE CASCADE ON DELETE CASCADE пишем, чтобы при добавлении или удалении записи, добавились/удалились данные и в другой связанной таблице

/* Сделаем связь М-М (многие ко многим). Для этого создадим две таблицы.
Таблица событий: */

DROP TABLE IF EXISTS events;
CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    name_event VARCHAR(150),
    date_event DATE NOT NULL,
    time_event TIME NOT NULL,
    description_event TEXT,
    adm_event_id BIGINT UNSIGNED,
    
    INDEX events_name_idx(name_event), -- Делаем индекс по названиям событий для ускорения поиска, т.к. предполагаем, что по ним юудут искать
    INDEX event_date_idx(date_event), -- По дате тоже сделаем индекс, вдруг кому-то нужно занять себя на определенную дату, и он будет по ней искать
    FOREIGN KEY (adm_event_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

/* Таблица событий пользователя: */

DROP TABLE IF EXISTS users_events;
CREATE TABLE users_events (
   user_event_id BIGINT UNSIGNED NOT NULL,
   event_id BIGINT UNSIGNED NOT NULL,
   
   PRIMARY KEY (user_event_id, event_id), -- Исключаем возможность 2-х записей о событии и пользователе
   FOREIGN KEY (user_event_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE, -- Делаем внешний ключ, берем пользователя из таблички пользователей
   FOREIGN KEY (event_id) REFERENCES events(id) ON UPDATE CASCADE ON DELETE CASCADE -- Делаем внешний ключ, берем данные о событии из таблицы событий
   );
-- Получается, что один пользователь может участовать в нескольких событиях, и в одном событии может быть несколько разных пользователей. Связь М-М.
  
/* Сделаем связь 1-1 (один к одному). Для этого создадим таблицу статуса пользователя: */

DROP TABLE IF EXISTS user_ststus;
CREATE TABLE users_status (
    status_id SERIAL PRIMARY KEY,
    user_status ENUM('online', 'offline', 'not available', 'busy'), -- В каком статусе аккаунт: в сети, не в сети, доступен, занят
    status_text TEXT, -- Тут текстовый статус пользователя, который он написал
    status_date DATE,
    -- Искать по статусам навряд ли кто-то будет, так что индекс не делаем
    FOREIGN KEY (status_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
    ); -- Связали статус с идентификатором пользователя. Столбец status_id выступает одновременно и первичным, и внешним ключом. Один пользователь - один уникальный статус. Связь 1-1.
 
    


