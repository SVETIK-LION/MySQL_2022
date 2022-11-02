/* 1. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
 * Возьмем пользователя с id = 1:
 */

SELECT
    u.id,
    u.firstname,
    u.lastname,
    COUNT(*) AS total 
FROM users u
JOIN messages m 
ON (m.from_user_id = u.id and m.to_user_id = 1) OR (m.from_user_id = 1 and m.to_user_id = u.id)
JOIN friend_requests fr 
ON ((fr.target_user_id = 1 AND fr.initiator_user_id = u.id) OR (fr.target_user_id = u.id AND fr.initiator_user_id = 1)) WHERE fr.status = 'approved' AND m.to_user_id = 1

GROUP BY u.id
ORDER BY total DESC
LIMIT 1;

-- Из всех друзей пользователя с id = 1, больше всего - 3 раза, ему писал пользователь с id = 4
 

/* 2. Подсчитать общее количество лайков, которые получили пользователи младше 11 лет.
 *
 */

SELECT 
     COUNT(*) AS likes
FROM media m
JOIN likes l
JOIN profiles p 
ON l.media_id = m.id AND m.user_id = p.user_id WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 11;

-- Всего 4-м пользователям младше 11 лет поставили лайки


/* 3. Определить кто больше поставил лайков (всего): мужчины или женщины.
*
*/

SELECT
    p.gender AS gender,
    COUNT(*) AS likes
FROM profiles p
JOIN likes l
ON p.user_id = l.user_id
GROUP BY gender
ORDER BY likes DESC;

-- Можно еще поставить LIMIT 1, чтобы выводилось только наибольшее количество

-- Женщины поставили больше лайков, чем мужчины
