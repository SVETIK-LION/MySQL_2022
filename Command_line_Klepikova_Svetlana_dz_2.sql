{\rtf1\ansi\ansicpg1251\cocoartf2638
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fswiss\fcharset0 ArialMT;\f2\froman\fcharset0 Times-Roman;
\f3\fswiss\fcharset0 Arial-BoldMT;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red33\green34\blue36;\red0\green0\blue0;
}
{\*\expandedcolortbl;;\csgray\c0;\cssrgb\c17255\c17647\c18824;\cssrgb\c0\c0\c0;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww28600\viewh15120\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs22 \cf2 \CocoaLigature0 \
\pard\pardeftab720\sl276\partightenfactor0

\f1\fs42\fsmilli21333 \cf3 \expnd0\expndtw0\kerning0
\CocoaLigature1 /* 1. \uc0\u1059 \u1089 \u1090 \u1072 \u1085 \u1086 \u1074 \u1080 \u1090 \u1077  \u1057 \u1059 \u1041 \u1044  MySQL. \u1057 \u1086 \u1079 \u1076 \u1072 \u1081 \u1090 \u1077  \u1074  \u1076 \u1086 \u1084 \u1072 \u1096 \u1085 \u1077 \u1081  \u1076 \u1080 \u1088 \u1077 \u1082 \u1090 \u1086 \u1088 \u1080 \u1080  \u1092 \u1072 \u1081 \u1083  .my.cnf, \u1079 \u1072 \u1076 \u1072 \u1074  \u1074  \u1085 \u1077 \u1084  \u1083 \u1086 \u1075 \u1080 \u1085  \u1080  \u1087 \u1072 \u1088 \u1086 \u1083 \u1100 , \u1082 \u1086 \u1090 \u1086 \u1088 \u1099 \u1081  \u1091 \u1082 \u1072 \u1079 \u1099 \u1074 \u1072 \u1083 \u1089 \u1103  \u1087 \u1088 \u1080  \u1091 \u1089 \u1090 \u1072 \u1085 \u1086 \u1074 \u1082 \u1077 .
\f2\fs24 \cf4 \
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs22 \cf2 \kerning1\expnd0\expndtw0 \CocoaLigature0 \
SVETIK@MacBook-Air ~ % pwd\
/Users/SVETIK\
SVETIK@MacBook-Air ~ % vim '.my.cnf'\
\uc0\u1042 \u1099 \u1076 \u1072 \u1102  \u1087 \u1088 \u1072 \u1074 \u1072  \u1085 \u1072  \u1095 \u1090 \u1077 \u1085 \u1080 \u1077  \u1080  \u1079 \u1072 \u1087 \u1080 \u1089 \u1100  \u1090 \u1086 \u1083 \u1100 \u1082 \u1086  \u1076 \u1083 \u1103  \u1089 \u1074 \u1086 \u1077 \u1075 \u1086  \u1087 \u1086 \u1083 \u1100 \u1079 \u1086 \u1074 \u1072 \u1090 \u1077 \u1083 \u1103 :\
SVETIK@MacBook-Air ~ % chmod 0600 ~/.my.cnf\
SVETIK@MacBook-Air ~ % ls -la | grep .my.cnf\
-rw-------   1 SVETIK  staff     39 19 \uc0\u1072 \u1087 \u1088  11:55 .my.cnf\
SVETIK@MacBook-Air ~ % mysql\
Welcome to the MySQL monitor.  Commands end with ; or \\g.\
Your MySQL connection id is 34\
Server version: 8.0.28 MySQL Community Server - GPL\
\'85\
\uc0\u1058 \u1077 \u1087 \u1077 \u1088 \u1100  \u1079 \u1072 \u1093 \u1086 \u1076 \u1080 \u1090  \u1087 \u1088 \u1086 \u1089 \u1090 \u1086  \u1087 \u1086  \u1082 \u1086 \u1084 \u1072 \u1085 \u1076 \u1077  mysql, \u1085 \u1077  \u1085 \u1072 \u1076 \u1086  \u1074 \u1074 \u1086 \u1076 \u1080 \u1090 \u1100  \u1080 \u1084 \u1103  \u1087 \u1086 \u1083 \u1100 \u1079 \u1086 \u1074 \u1072 \u1090 \u1077 \u1083 \u1103  \u1080  \u1087 \u1072 \u1088 \u1086 \u1083 \u1100 \
\uc0\u1063 \u1090 \u1086  \u1085 \u1072 \u1087 \u1080 \u1089 \u1072 \u1083 \u1072  \u1074  \u1089 \u1072 \u1084 \u1086 \u1084  \u1092 \u1072 \u1081 \u1083 \u1077 :
\f2\fs24 \cf0 \expnd0\expndtw0\kerning0
\CocoaLigature1 \
\pard\pardeftab720\partightenfactor0
\cf0 [client]\
user=root\
password=\uc0\u1090 \u1091 \u1090  \u1084 \u1086 \u1081  \u1087 \u1072 \u1088 \u1086 \u1083 \u1100 \
\
\
\pard\pardeftab720\sl276\partightenfactor0

\f1\fs42\fsmilli21333 \cf3 2. \uc0\u1057 \u1086 \u1079 \u1076 \u1072 \u1081 \u1090 \u1077  \u1073 \u1072 \u1079 \u1091  \u1076 \u1072 \u1085 \u1085 \u1099 \u1093  example, \u1088 \u1072 \u1079 \u1084 \u1077 \u1089 \u1090 \u1080 \u1090 \u1077  \u1074  \u1085 \u1077 \u1081  \u1090 \u1072 \u1073 \u1083 \u1080 \u1094 \u1091  users, \u1089 \u1086 \u1089 \u1090 \u1086 \u1103 \u1097 \u1091 \u1102  \u1080 \u1079  \u1076 \u1074 \u1091 \u1093  \u1089 \u1090 \u1086 \u1083 \u1073 \u1094 \u1086 \u1074 , \u1095 \u1080 \u1089 \u1083 \u1086 \u1074 \u1086 \u1075 \u1086  id \u1080  \u1089 \u1090 \u1088 \u1086 \u1082 \u1086 \u1074 \u1086 \u1075 \u1086  name.
\f0\fs22 \cf2 \kerning1\expnd0\expndtw0 \CocoaLigature0 \
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0
\
mysql> CREATE DATABASE IF NOT EXISTS example;\
Query OK, 1 row affected (0,01 sec)\
\
mysql> SHOW DATABASES;\
+--------------------+\
| Database           |\
+--------------------+\
| example            |\
| information_schema |\
| mysql              |\
| performance_schema |\
| sys                |\
+--------------------+\
5 rows in set (0,00 sec)\
mysql> USE example\
Database changed\
mysql> SHOW TABLES;\
Empty set (0,00 sec)\
mysql> CREATE TABLE IF NOT EXISTS users (id INT UNSIGNED NOT NULL PRIMARY KEY, name VARCHAR(255));\
Query OK, 0 rows affected (0,01 sec)\
\
mysql> show tables;\
+-------------------+\
| Tables_in_example |\
+-------------------+\
| users             |\
+-------------------+\
1 row in set (0,00 sec)\
\
mysql> DESCRIBE users;\
+-------+--------------+------+-----+---------+-------+\
| Field | Type         | Null | Key | Default | Extra |\
+-------+--------------+------+-----+---------+-------+\
| id    | int unsigned | NO   | PRI | NULL    |       |\
| name  | varchar(255) | YES  |     | NULL    |       |\
+-------+--------------+------+-----+---------+-------+\
2 rows in set (0,01 sec)
\f1\fs42\fsmilli21333 \cf3 \expnd0\expndtw0\kerning0
\CocoaLigature1 \
\pard\pardeftab720\sl276\partightenfactor0
\cf3 \
3. \uc0\u1057 \u1086 \u1079 \u1076 \u1072 \u1081 \u1090 \u1077  \u1076 \u1072 \u1084 \u1087  \u1073 \u1072 \u1079 \u1099  \u1076 \u1072 \u1085 \u1085 \u1099 \u1093  example \u1080 \u1079  \u1087 \u1088 \u1077 \u1076 \u1099 \u1076 \u1091 \u1097 \u1077 \u1075 \u1086  \u1079 \u1072 \u1076 \u1072 \u1085 \u1080 \u1103 , \u1088 \u1072 \u1079 \u1074 \u1077 \u1088 \u1085 \u1080 \u1090 \u1077  \u1089 \u1086 \u1076 \u1077 \u1088 \u1078 \u1080 \u1084 \u1086 \u1077  \u1076 \u1072 \u1084 \u1087 \u1072  \u1074  \u1085 \u1086 \u1074 \u1091 \u1102  \u1073 \u1072 \u1079 \u1091  \u1076 \u1072 \u1085 \u1085 \u1099 \u1093  sample.\
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs22 \cf2 \kerning1\expnd0\expndtw0 \CocoaLigature0 \
mysql> exit \
Bye\
SVETIK@MacBook-Air ~ % mysqldump example > example.sql\
SVETIK@MacBook-Air ~ % ls | grep example.sql\
example.sql\
SVETIK@MacBook-Air ~ % cat example.sql \
-- MySQL dump 10.13  Distrib 8.0.28, for macos12.2 (arm64)\
--\
-- Host: localhost    Database: example\
-- ------------------------------------------------------\
-- Server version	8.0.28\
\
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;\
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;\
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;\
/*!50503 SET NAMES utf8mb4 */;\
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;\
/*!40103 SET TIME_ZONE='+00:00' */;\
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;\
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;\
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;\
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;\
\
--\
-- Table structure for table `users`\
--\
\
DROP TABLE IF EXISTS `users`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `users` (\
  `id` int unsigned DEFAULT NULL,\
  `name` varchar(255) DEFAULT NULL\
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `users`\
--\
\
LOCK TABLES `users` WRITE;\
/*!40000 ALTER TABLE `users` DISABLE KEYS */;\
/*!40000 ALTER TABLE `users` ENABLE KEYS */;\
UNLOCK TABLES;\
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;\
\
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;\
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;\
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;\
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;\
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;\
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;\
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;\
\
-- Dump completed on 2022-04-19 15:51:09\
SVETIK@MacBook-Air ~ % mysql\
Welcome to the MySQL monitor.  Commands end with ; or \\g.\
Your MySQL connection id is 51\
Server version: 8.0.28 MySQL Community Server - GPL\
\
Copyright (c) 2000, 2022, Oracle and/or its affiliates.\
\
Oracle is a registered trademark of Oracle Corporation and/or its\
affiliates. Other names may be trademarks of their respective\
owners.\
\
Type 'help;' or '\\h' for help. Type '\\c' to clear the current input statement.\
\
mysql> CREATE DATABASE sample;\
Query OK, 1 row affected (0,00 sec)\
mysql> exit\
Bye\
SVETIK@MacBook-Air ~ % mysql sample < example.sql \
SVETIK@MacBook-Air ~ % mysql                     \
Welcome to the MySQL monitor.  Commands end with ; or \\g.\
Your MySQL connection id is 53\
Server version: 8.0.28 MySQL Community Server - GPL\
\
Copyright (c) 2000, 2022, Oracle and/or its affiliates.\
\
Oracle is a registered trademark of Oracle Corporation and/or its\
affiliates. Other names may be trademarks of their respective\
owners.\
\
Type 'help;' or '\\h' for help. Type '\\c' to clear the current input statement.\
\
mysql> SHOW DATABASES;\
+--------------------+\
| Database           |\
+--------------------+\
| example            |\
| information_schema |\
| mysql              |\
| performance_schema |\
| sample             |\
| sys                |\
+--------------------+\
6 rows in set (0,01 sec)\
\
mysql> USE sample\
Reading table information for completion of table and column names\
You can turn off this feature to get a quicker startup with -A\
\
Database changed\
mysql> SHOW TABLES;\
+------------------+\
| Tables_in_sample |\
+------------------+\
| users            |\
+------------------+\
1 row in set (0,00 sec)
\f1\fs42\fsmilli21333 \cf3 \expnd0\expndtw0\kerning0
\CocoaLigature1 \
\pard\pardeftab720\sl276\partightenfactor0
\cf3 \
4. 
\f3\b (\uc0\u1087 \u1086  \u1078 \u1077 \u1083 \u1072 \u1085 \u1080 \u1102 )
\f1\b0  \uc0\u1054 \u1079 \u1085 \u1072 \u1082 \u1086 \u1084 \u1100 \u1090 \u1077 \u1089 \u1100  \u1073 \u1086 \u1083 \u1077 \u1077  \u1087 \u1086 \u1076 \u1088 \u1086 \u1073 \u1085 \u1086  \u1089  \u1076 \u1086 \u1082 \u1091 \u1084 \u1077 \u1085 \u1090 \u1072 \u1094 \u1080 \u1077 \u1081  \u1091 \u1090 \u1080 \u1083 \u1080 \u1090 \u1099  mysqldump. \u1057 \u1086 \u1079 \u1076 \u1072 \u1081 \u1090 \u1077  \u1076 \u1072 \u1084 \u1087  \u1077 \u1076 \u1080 \u1085 \u1089 \u1090 \u1074 \u1077 \u1085 \u1085 \u1086 \u1081  \u1090 \u1072 \u1073 \u1083 \u1080 \u1094 \u1099  help_keyword \u1073 \u1072 \u1079 \u1099  \u1076 \u1072 \u1085 \u1085 \u1099 \u1093  mysql. \u1055 \u1088 \u1080 \u1095 \u1077 \u1084  \u1076 \u1086 \u1073 \u1077 \u1081 \u1090 \u1077 \u1089 \u1100  \u1090 \u1086 \u1075 \u1086 , \u1095 \u1090 \u1086 \u1073 \u1099  \u1076 \u1072 \u1084 \u1087  \u1089 \u1086 \u1076 \u1077 \u1088 \u1078 \u1072 \u1083  \u1090 \u1086 \u1083 \u1100 \u1082 \u1086  \u1087 \u1077 \u1088 \u1074 \u1099 \u1077  100 \u1089 \u1090 \u1088 \u1086 \u1082  \u1090 \u1072 \u1073 \u1083 \u1080 \u1094 \u1099 .\
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs22 \cf2 \kerning1\expnd0\expndtw0 \CocoaLigature0 mysqldump --where='true limit 100' mysql help_keyword > help_keyword_100.sql\
mysql> system ls -l \\ grep help_keyword_100.sql\
ls:  grep: No such file or directory\
-rw-r--r--  1 SVETIK  staff  3643 19 \uc0\u1072 \u1087 \u1088  17:10 help_keyword_100.sql\
\pard\pardeftab720\sl276\partightenfactor0

\f2\fs24 \cf4 \expnd0\expndtw0\kerning0
\CocoaLigature1 \

\f1\fs42\fsmilli21333 \cf3 \
/*
\f2\fs24 \cf4 \

\f1\fs42\fsmilli21333 \cf3 \

\f2\fs24 \cf4 \
}