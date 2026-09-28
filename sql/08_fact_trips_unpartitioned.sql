CREATE OR REPLACE TABLE `analytics.fact_trips_unpartitioned` AS
SELECT
  DATE(pickup_datetime)                                        AS date_key,
  pickup_datetime,
  dropoff_datetime,
  EXTRACT(HOUR FROM pickup_datetime)                           AS pickup_hour,
  TIMESTAMP_DIFF(dropoff_datetime, pickup_datetime, MINUTE)    AS trip_minutes,
  pickup_location_id,
  dropoff_location_id,
  passenger_count,
  trip_distance,
  payment_type,
  fare_amount,
  tip_amount,
  total_amount
FROM `staging.stg_trips`;
