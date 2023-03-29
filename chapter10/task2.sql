
-- create index if not exists bookings_total_amount_key
--     on bookings.bookings (total_amount);

-- doesn't use the index but a bitmap instead
explain (verbose, analyze) select * from bookings
         where total_amount BETWEEN 1000 AND 5000
         order by total_amount desc;

-- does use the index
explain select * from bookings
        order by total_amount desc;

EXPLAIN
SELECT total_amount
FROM bookings
ORDER BY total_amount DESC
LIMIT 5;
