--firstly bring in rental_date as a field from the table joins
-- DROP TABLE IF EXISTS complete_joint_dataset_with_rental_date;
-- CREATE TEMP TABLE complete_joint_dataset_with_rental_date AS
-- SELECT
--   rental.customer_id,
--   inventory.film_id,
--   film.title,
--   category.name AS category_name,
--   rental.rental_date
-- FROM dvd_rentals.rental
-- INNER JOIN dvd_rentals.inventory
--   ON rental.inventory_id = inventory.inventory_id
-- INNER JOIN dvd_rentals.film
--   ON inventory.film_id = film.film_id
-- INNER JOIN dvd_rentals.film_category
--   ON film.film_id = film_category.film_id
-- INNER JOIN dvd_rentals.category
--   ON film_category.category_id = category.category_id

-- -- Finally perform group by aggregations on category_name and customer_id
-- SELECT
--   customer_id,
--   category_name,
--   COUNT(*) AS rental_count,
--   MAX(rental_date) AS latest_rental_date
-- FROM complete_joint_dataset_with_rental_date
-- -- note the different filter here!
-- WHERE customer_id = 3
-- GROUP BY
--   customer_id,
--   category_name
-- ORDER BY
--   customer_id,
--   rental_count DESC,
--   latest_rental_date DESC;

--SELECT * FROM complte_joint_dataset_with_rental_date limit 10;
-- SELECT 
--     market_date
--     open_price
--     COALESCE (
--         open_price ,
--         LAG(open_price ,1) OVER (ORDER BY market_date ),
--         LAG(open_price ,2) OVER (ORDER BY market_date )
--     ) AS adj_open_price

-- FROM TRADING.daily_btc
-- WHERE market_date BETWEEN '2020-10-10' :: DATE AND '2020-10-13' :: DATE ;

-- SELECT 
--     market_date,
--     open_price,
--     COALESCE(
--         open_price
--         CASE 
--             WHEN market_date = '2020-10-10'
--                 THEN LAG (open_price,2) OVER (ORDER BY market_date)
--             ELSE LAG (open_price,1) OVER (ORDER BY market_date)
--             END
--     ) AS adj_open_price

-- FROM trading.daily_btc

-- WHERE market_date BETWEEN '2020-10-10' :: DATE AND '2020-10-13' :: DATE;

-- DROP TABLE IF EXISTS frame_example ;
-- CREATE TEMP TABLE frame_example as 
-- WITH input_data (val) AS (
--     VALUES
--     (1),
--     (1),
--     (2),
--     (6),
--     (9),
--     (25).
--     (20),
--     (6),
--     (8),
--     (9)
-- )nk
-- SELECT 
--     val,
--     ROW_NUMBER() OVER w AS _reo_number,
--     DENCE_RANK() OVER w AS _dence_rank
-- FROM input_data

-- WINDOW w AS (ORDER BY val);
SELECT
    val
    SUM(val) OVER (
        RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW 
    ) AS cum_sum

    _reo_number,
    _dence_rank
FROM frame_example;
