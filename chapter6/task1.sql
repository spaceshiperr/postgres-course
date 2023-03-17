SELECT count( * ) FROM tickets;

-- all passengers
SELECT count( * ) FROM tickets WHERE passenger_name LIKE '% %';

-- none of them since there are no two spaces
SELECT count( * ) FROM tickets WHERE passenger_name LIKE '% % %';

-- all of them
SELECT count( * ) FROM tickets WHERE passenger_name LIKE '% %%';
