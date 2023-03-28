CREATE INDEX bookings_book_date_part_key
    ON bookings ( book_date )
    WHERE total_amount > 1000000;

-- time with partial index: 53 ms, 40 ms, 28 ms, 23 ms, 22 ms, avg: 35 ms
SELECT *
FROM bookings
WHERE total_amount > 1000000
ORDER BY book_date DESC;

DROP INDEX bookings_book_date_part_key;

CREATE INDEX bookings_total_amount_key
    ON bookings ( total_amount );

-- time with non-partial index: 32 ms, 37 ms, 24 ms, 25 ms, 22 ms, avg: 28 ms
-- faster??
SELECT *
FROM bookings
WHERE total_amount > 1000000
ORDER BY book_date DESC;
