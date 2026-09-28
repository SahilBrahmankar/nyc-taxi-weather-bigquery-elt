-- 03_staging_trips.sql
-- Purpose: Clean the raw taxi trips. Implemented as a VIEW so it uses
--          no extra storage (sandbox limit is 10 GB).
-- Cleaning rules:
--   * pickup must fall in calendar year 2022 (raw data contains
--     pickups back to 2001 and forward into 2023)
--   * dropoff must be after pickup, and trip under 24 hours
--   * trip_distance between 0 and 100 miles (exclusive)
--   * fare_amount between 0 and 500 dollars (exclusive)
--   * total_amount positive
--   * passenger_count between 1 and 6
--   * pickup and dropoff zone IDs must not be null
-- Output: staging.stg_trips (view)

CREATE OR REPLACE VIEW `staging.stg_trips` AS
SELECT *
FROM `raw.yellow_trips_2022`
WHERE pickup_datetime >= TIMESTAMP('2022-01-01')
  AND pickup_datetime <  TIMESTAMP('2023-01-01')
  AND dropoff_datetime > pickup_datetime
  AND TIMESTAMP_DIFF(dropoff_datetime, pickup_datetime, HOUR) < 24
  AND trip_distance > 0 AND trip_distance < 100
  AND fare_amount > 0 AND fare_amount < 500
  AND total_amount > 0
  AND passenger_count BETWEEN 1 AND 6
  AND pickup_location_id IS NOT NULL
  AND dropoff_location_id IS NOT NULL;
