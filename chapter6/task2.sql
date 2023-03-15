-- name has 3 characters
SELECT passenger_name
FROM tickets
WHERE passenger_name LIKE '___ %';

-- surname has 5 characters
SELECT passenger_name
FROM tickets
WHERE passenger_name LIKE '% _____';
