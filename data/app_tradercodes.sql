select distinct (a.name), a.price, a.rating, a.review_count::integer
from app_store_apps as a
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE a.rating >=4 
and type = 'Paid'
order by a.review_count::integer DESC;



--avg_rating
SELECT name, ROUND((a.rating+p.rating)/2,2) as avg_rating
	FROM app_store_apps as a  
	INNER JOIN play_store_apps as p
	USING (name)
	GROUP BY name, Avg_rating;

--avg_price 
SELECT name, (a.price::Money+ p.price::money) /2 AS avg_price
	FROM app_store_apps as a  
	INNER JOIN play_store_apps as p
	USING (name)
	GROUP BY name, avg_price;


--avg_review_count
SELECT name, (a.review_count::integer/p.review_count::integer) /2 AS avg_review_count
	FROM app_store_apps as a  
	INNER JOIN play_store_apps as p
	USING (name)
	GROUP BY name, avg_review_count 
	ORDER BY avg_review_count DESC;



SELECT a.name,
 ROUND((a.rating+p.rating)/2,2) AS avg_rating,
(a.price::money + p.price::money)/2 AS avg_price,
((a.price::money + p.price::money)/2 * 10000) AS purchase_price,
(a.review_count::integer+p.review_count::integer)/2 AS avg_review_count,
genres
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING(name)
WHERE type = 'Paid'
GROUP BY a.name,avg_rating,avg_price,avg_review_count,genres
HAVING ROUND((a.rating+p.rating)/2,2) >= 4
ORDER BY avg_review_count DESC

--by avg price and genre 






