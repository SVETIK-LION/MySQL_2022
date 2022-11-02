/* Практическое задание по теме “CRUD - операции”
1. Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице).
Таблицы заполнены*/

-- 2. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке.

SELECT DISTINCT firstname FROM users;

-- 3. Первые пять пользователей пометить как удаленные.

UPDATE users SET is_deleted=1 LIMIT 5;

/* Проверим, что сработало:
 * mysql> SELECT * FROM users LIMIT 5;
+----+-----------+----------+---------------------------+------------------------------------------+------------+------------------------+
| id | firstname | lastname | email                     | password_hash                            | phone      | is_deleted             |
+----+-----------+----------+---------------------------+------------------------------------------+------------+------------------------+
|  1 | Sonny     | Littel   | jaiden.graham@example.com | 44de279de7943c017436321838970d0d9a978bc2 | 9511434357 | 0x01                   |
|  2 | Rhea      | Jerde    | graciela27@example.org    | f96d8f71e4a0b92b4dd2b35e2c6c9acba6eb0d86 | 9361269891 | 0x01                   |
|  3 | Vesta     | Rath     | arden.stanton@example.org | e8d3b95bd69c7cf52e78a54db673904b71227399 | 9943819668 | 0x01                   |
|  4 | Adrain    | Marks    | imelda97@example.com      | 4a89f693e231257d3ca4f313bfbe05565602d92b | 9677117617 | 0x01                   |
|  5 | Arne      | Labadie  | tchristiansen@example.org | 1982ccaba3173d6eb3b55bf722488db4352490d9 | 9820750065 | 0x01                   |
+----+-----------+----------+---------------------------+------------------------------------------+------------+------------------------+
*/

-- 4. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней).
/* Так как у нас все сообщения с уже прошедшими данными, изменим дату нескольких сообщений, например, первых 4-х

UPDATE messages SET created_at='2044-04-04 04:04:04' WHERE id<=4; */

/* Проверим,что дата изменилась:
 * mysql> SELECT * FROM messages WHERE id<=4\G;
*************************** 1. row ***************************
          id: 1
from_user_id: 1
  to_user_id: 1
        body: Amet quia error sunt laborum quo fugiat. Earum laudantium aut necessitatibus tempore est neque pariatur placeat. Alias atque omnis sed ut dolor et autem.
  created_at: 2044-04-04 04:04:04
*************************** 2. row ***************************
          id: 2
from_user_id: 2
  to_user_id: 2
        body: Quo odio harum dolorem qui distinctio in sit. Magni ut ratione nihil. Animi enim necessitatibus perspiciatis eos. Fugiat eum saepe odit nulla tempore aspernatur. Aut quidem et autem saepe possimus.
  created_at: 2044-04-04 04:04:04
*************************** 3. row ***************************
          id: 3
from_user_id: 3
  to_user_id: 3
        body: Perferendis ad eum dicta laboriosam. Dolorum rerum qui quis. Illo maiores enim voluptatem.
  created_at: 2044-04-04 04:04:04
*************************** 4. row ***************************
          id: 4
from_user_id: 4
  to_user_id: 4
        body: Vel vero consequuntur excepturi velit voluptatem eum delectus. Dolore alias vero rerum quibusdam iste. Laudantium quae similique velit doloribus consectetur dignissimos.
  created_at: 2044-04-04 04:04:04
4 rows in set (0,00 sec)
 */

DELETE FROM messages WHERE `date` > CURRENT_DATE();
-- Можно еще написать NOW()

/* Проверим, что первые 4 сообщения с датой "из будущего" удалились:
 * mysql> SELECT * FROM messages WHERE id<=7\G;
*************************** 1. row ***************************
          id: 5
from_user_id: 5
  to_user_id: 5
        body: In rerum libero velit natus perspiciatis id commodi ad. Vel eaque minus dolorem molestiae ipsam. Vel accusamus aut vero expedita incidunt. Quae ex ea excepturi nam alias quo est voluptatum.
  created_at: 1981-03-22 13:39:54
*************************** 2. row ***************************
          id: 6
from_user_id: 6
  to_user_id: 6
        body: Molestiae odio dolorem accusantium sint aspernatur. Et dignissimos cupiditate earum eum. Voluptas quia ut iste perspiciatis repellat qui tempora. Voluptatibus enim expedita aut nihil.
  created_at: 2005-05-14 16:31:44
*************************** 3. row ***************************
          id: 7
from_user_id: 7
  to_user_id: 7
        body: Cumque nulla possimus dicta esse. Id sed nulla delectus eos omnis. Commodi aut odit qui porro reiciendis. Id consequatur dicta eum veniam quis. Quia sit et aliquid odit laboriosam qui fuga.
  created_at: 1990-05-31 14:45:57
3 rows in set (0,00 sec)
 */

-- 5. Написать название темы курсового проекта.
-- Интернет-магизин косметики для эпиляции
