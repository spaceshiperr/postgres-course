SELECT COUNT(*) FROM airports_data WHERE airport_code = 'ARN';

-- error
INSERT INTO airports(airport_code, airport_name, city, coordinates, timezone)
VALUES ('ARN', 'Stockholm Arlanda Airpor', 'Стокгольм', '76.48359680175781,60.94929885864258'::point, 'CET');

-- ok, only when the updated column is in the base table itself
UPDATE airports
SET timezone = 'Europe/Moscow'
WHERE airport_code = 'TJM';
