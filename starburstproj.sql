SELECT name,
 ROUND((a.rating+p.rating)/2,2) AS avg_rating,
(a.price::money + p.price::money)/2 AS avg_price,
(a.review_count::integer+p.review_count::integer)/2 AS avg_review_count,genres
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING(name)
WHERE type = 'Paid'
GROUP BY name,avg_rating,avg_price,avg_review_count, genres
HAVING ROUND((a.rating+p.rating)/2,2) >= 4
ORDER BY avg_review_count DESC;