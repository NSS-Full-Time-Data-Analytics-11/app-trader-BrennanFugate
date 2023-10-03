WITH Halloween_apps AS (SELECT DISTINCT name, 
ROUND((p.rating+ s.rating)/2,1) AS avg_rating,
s.price AS price,
(s.price+25000)::money AS cost_to_buy_app
FROM play_store_apps AS p INNER JOIN app_store_apps AS s USING(name)
WHERE name ILIKE '%zombie%'
ORDER BY avg_rating DESC)


SELECT name,
avg_rating,
price,
(avg_rating * 2)+1 AS longevity_in_yrs,
((avg_rating * 2 + 1) *12 *1000)::money AS maintenance_cost, 
((avg_rating * 2 + 1) *12 *5000)::money AS app_revenue,
((avg_rating * 2 + 1) *12 *5000)::money - (((avg_rating * 2 + 1) *12 *1000)+25000)::money AS profit
FROM Halloween_apps











