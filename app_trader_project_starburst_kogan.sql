SELECT *
FROM play_store_apps;

--3

SELECT *
FROM app_store_apps;

SELECT DISTINCT(a.name), a.price,a.rating,a.review_count::integer
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING(name)
WHERE a.rating >= 4
AND type = 'Paid'
ORDER BY a.review_count::integer DESC;


--
SELECT name,a.rating
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING(name);

--avg_rating

(SELECT name, ROUND((a.rating+p.rating)/2,2) AS avg_rating
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING(name)
GROUP BY name, avg_rating);

--avg_price

(SELECT name, (a.price::money + p.price::money)/2 AS avg_price
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING(name)
GROUP BY name, avg_price);

--avg_review_count

(SELECT name,(a.review_count::integer/p.review_count::integer)/2 AS avg_review_count
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING(name)
GROUP BY name,avg_review_count
ORDER BY avg_review_count DESC);

--

SELECT name,
 ROUND((a.rating+p.rating)/2,2) AS avg_rating,
(a.price::money + p.price::money)/2 AS avg_price,
(a.review_count::integer/p.review_count::integer)/2 AS avg_review_count
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING(name)
WHERE type = 'Paid'
GROUP BY name,avg_rating,avg_price,avg_review_count
HAVING ROUND((a.rating+p.rating)/2,2) >= 4
ORDER BY avg_review_count DESC;

SELECT name,
 ROUND((a.rating+p.rating)/2,2) AS avg_rating,
(a.price::money + p.price::money)/2 AS avg_price,
(a.review_count::integer+p.review_count::integer)/2 AS avg_review_count
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING(name)
WHERE type = 'Paid'
GROUP BY name,avg_rating,avg_price,avg_review_count
HAVING ROUND((a.rating+p.rating)/2,2) >= 4
ORDER BY avg_review_count DESC;