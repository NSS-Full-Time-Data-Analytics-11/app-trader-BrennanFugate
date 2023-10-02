-- Both Stores Free
SELECT DISTINCT a.name, a.price, a.rating,a.content_rating,a.primary_genre,a.size_bytes
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.price = 0
ORDER BY a.rating DESC, a.price,a.rating,a.size_bytes 