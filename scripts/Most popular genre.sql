-- Find the most popular genre

SELECT name,CAST(review_count AS int)
FROM app_store_apps 
ORDER BY review_count DESC