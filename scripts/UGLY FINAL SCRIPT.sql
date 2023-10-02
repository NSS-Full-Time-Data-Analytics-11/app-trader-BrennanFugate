-- Select Relevant Columns, starting with the name of the apps
SELECT a.name,
-- Find the average rating between both stores
ROUND(AVG(a.rating + p.rating)/2,2) AS total_rating,
-- Round the floors to the nearest .25
ROUND((FLOOR(AVG(a.rating + p.rating)/2/.25)*.25),2) AS rounded_total_rating,
-- List the price of the apps (all of them are free)
MAX(a.price) ::money AS price,
-- List the review counts for both stores to emphasize the reviews are given over a wide margin and fall within the average amt of reviews for the apps. 
MAX(p.review_count) AS play_store_reviews, 
MAX(a.review_count) AS app_store_reviews,
-- List apps' price upon purchase
p.genres,a.primary_genre,MAX(a.price) + 25000 AS price_to_buy_app,
-- List how long the app will last based on its rating in months
ROUND((((ROUND((FLOOR(AVG(a.rating + p.rating)/2/.25)*.25),2) *24)+12)),2) AS longevity_in_months,
-- In years
ROUND((((ROUND((FLOOR(AVG(a.rating + p.rating)/2/.25)*.25),2) *24)+12)/12),2) AS longevity_in_years,
-- How much money was made from the app in general?
ROUND((((ROUND((FLOOR(AVG(a.rating + p.rating)/2/.25)*.25),2) *24)+12)*5000),2) :: money AS money_made_from_app,
-- How much did the app cost to maintain
ROUND((((ROUND((FLOOR(AVG(a.rating + p.rating)/2/.25)*.25),2) *24)+12)*1000),2) :: money AS app_maintenance,
-- Profit from the apps after considering maintenance and initial price
(ROUND((((ROUND((FLOOR(AVG(a.rating + p.rating)/2/.25)*.25),2) *24)+12)*5000),2)-ROUND((((ROUND((FLOOR(AVG(a.rating + p.rating)/2/.25)*.25),2) *24)+12)*1000)+25000,2)) :: money AS profit 
FROM app_store_apps AS a 
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE p.review_count >= 444153 AND CAST(a.review_count AS int) >= 12892
GROUP BY a.name,p.genres,a.primary_genre
ORDER BY total_rating DESC
LIMIT 10;



