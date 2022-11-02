/* 1. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
 * Возьмем пользователя с id = 1:
 */

SELECT
    from_user_id,
    (SELECT CONCAT(firstname,' ', lastname) FROM users WHERE id = messages.from_user_id) AS user_name,
    COUNT(*) AS total
FROM messages 
    WHERE to_user_id = 1 AND from_user_id IN 
        (SELECT initiator_user_id FROM friend_requests WHERE (target_user_id = 1) AND status ='approved'
        UNION
        SELECT target_user_id FROM friend_requests WHERE (initiator_user_id = 1) AND status ='approved')
GROUP BY from_user_id
ORDER BY total DESC 
LIMIT 1;

-- Из всех друзей пользователя с id = 1, больше всего - 3 раза, ему писал пользователь с id = 4
 

/* 2. Подсчитать общее количество лайков, которые получили пользователи младше 11 лет.
 *
 */

SELECT 
    COUNT(*) as likes
FROM likes 
WHERE media_id IN
    (SELECT id FROM media WHERE user_id IN
    (SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 11)
);

-- Всего 4-м пользователям младше 11 лет поставили лайки


/* 3. Определить кто больше поставил лайков (всего): мужчины или женщины.
*
*/

SELECT 'female' AS gender, COUNT(*) AS total
FROM likes
WHERE user_id IN (
SELECT user_id  FROM profiles WHERE gender = 'f')
UNION
SELECT 'male' AS gender, COUNT(*) AS total
FROM likes
WHERE user_id IN (
SELECT user_id  FROM profiles WHERE gender = 'm')
ORDER BY total DESC;

-- Можно еще поставить LIMIT 1, чтобы выводилось только наибольшее количество

-- Женщины поставили больше лайков, чем мужчины
