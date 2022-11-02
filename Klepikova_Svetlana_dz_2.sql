-- Выполняла задания в командной строке. Прикладываю файл с более подробным описанием и выдачами командной строки. 
/* 1. Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.

SVETIK@MacBook-Air ~ % pwd
/Users/SVETIK
SVETIK@MacBook-Air ~ % vim '.my.cnf'
Выдаю права на чтение и запись только для своего пользователя:
SVETIK@MacBook-Air ~ % chmod 0600 ~/.my.cnf
SVETIK@MacBook-Air ~ % ls -la | grep .my.cnf
-rw-------   1 SVETIK  staff     39 19 апр 11:55 .my.cnf
SVETIK@MacBook-Air ~ % mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 34
Server version: 8.0.28 MySQL Community Server - GPL
…
Теперь заходит просто по команде mysql, не надо вводить имя пользователя и пароль
Что написала в самом файле:
[client]
user=root
password=тут мой пароль
*/

-- 2. Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
CREATE DATABASE IF NOT EXISTS example; -- создали БД
USE example -- применили БД
CREATE TABLE IF NOT EXISTS users (
id INT UNSIGNED NOT NULL PRIMARY KEY,
name VARCHAR(256)); -- Создали таблицу с колонками id и users. Сделала id целочисленным без минуса и сделала этот столбец первичным ключом, чтобы больше влезло. А users сделала короткими строками без фиксированного размера с максимальным объемом 256.

-- 3. Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
mysql> exit -- выйдем из mysql
Bye
SVETIK@MacBook-Air ~ % mysqldump example > example.sql -- создадим дамп
SVETIK@MacBook-Air ~ % mysql -- войдем в mysql
mysql> CREATE DATABASE sample; -- создадим новую БД
Query OK, 1 row affected (0,00 sec)
mysql> exit -- выйдем из mysql
Bye
SVETIK@MacBook-Air ~ % mysql sample < example.sql -- развернем дамп в новую БД

-- 4. (по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
mysqldump --where='true limit 100' mysql help_keyword > help_keyword_100.sql
mysql> system ls -l \ grep help_keyword_100.sql
ls:  grep: No such file or directory
-rw-r--r--  1 SVETIK  staff  3643 19 апр 17:10 help_keyword_100.sql