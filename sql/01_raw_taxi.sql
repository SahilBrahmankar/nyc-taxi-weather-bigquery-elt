-- 01_raw_taxi.sql
-- Purpose: Copy a column subset of the 2022 NYC yellow taxi trips
--          from the public dataset into my own `raw` dataset.
-- Source:  bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022
-- Output:  raw.yellow_trips_2022 (unpartitioned; also used as the
--          "before" table in the optimization comparison)

CREATE OR REPLACE TABLE `raw.yellow_trips_2022` AS
SELECT
  vendor_id, pickup_datetime, dropoff_datetime, passenger_count,
  trip_distance, pickup_location_id, dropoff_location_id,
  payment_type, fare_amount, tip_amount, total_amount
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022`;
