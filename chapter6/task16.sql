SELECT right(passenger_name, length(passenger_name) - strpos(passenger_name, ' ')),
       count(*) filter ( where contact_data->>'email' <> '')
FROM tickets
GROUP BY 1
ORDER BY 2 DESC;
