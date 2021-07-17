USE vk;


-- Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
-- который больше всех общался с выбранным пользователем (написал ему сообщений).

SELECT from_user_id 
FROM messages 
	WHERE to_user_id = 1 
GROUP BY from_user_id 


-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..



SELECT COUNT(*) AS kids_likes
FROM likes 
WHERE media_id IN ( 
	SELECT id 
	FROM media 
		WHERE user_id IN (
			SELECT user_id 
			FROM profiles 
			WHERE TIMESTAMPDIFF(YEAR, birthday, now()) < 10
		)
)


-- Определить кто больше поставил лайков (всего): мужчины или женщины.


SET @male_likes = (SELECT COUNT(*) 
				FROM likes 
				WHERE user_id IN (
					SELECT user_id
					FROM profiles 
					WHERE gender = 'm'));

SET @female_likes = (SELECT COUNT(*) 
					FROM likes 
					WHERE user_id IN (
						SELECT user_id
						FROM profiles 
						WHERE gender = 'f'));
						
SELECT @male_likes, @female_likes;

	
	
	
	
	
	