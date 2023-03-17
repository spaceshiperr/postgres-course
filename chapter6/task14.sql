SELECT left( passenger_name, strpos( passenger_name, ' ' ) - 1 )
           AS firstname, count( * )
FROM tickets
GROUP BY 1
ORDER BY 2 DESC;

SELECT right(passenger_name, length(passenger_name) - strpos(passenger_name, ' ')), count(*)
FROM tickets
GROUP BY 1
ORDER BY 2 DESC;

select * from tickets;
