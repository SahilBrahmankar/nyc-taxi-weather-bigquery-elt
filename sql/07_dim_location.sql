CREATE OR REPLACE TABLE `analytics.dim_location` AS
SELECT
  zone_id   AS location_id,
  zone_name,
  borough
FROM `bigquery-public-data.new_york_taxi_trips.taxi_zone_geom`;
