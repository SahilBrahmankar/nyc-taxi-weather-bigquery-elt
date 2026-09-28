CREATE OR REPLACE TABLE `analytics.dim_weather` AS
SELECT
  date AS date_key,
  temp_f, precip_in, visibility_mi, wind_speed_kn,
  CASE
    WHEN precip_in IS NULL THEN 'unknown'
    WHEN precip_in >= 0.1  THEN 'wet'
    ELSE 'dry'
  END AS precip_category,
  CASE
    WHEN temp_f IS NULL THEN 'unknown'
    WHEN temp_f < 32 THEN 'freezing'
    WHEN temp_f < 50 THEN 'cold'
    WHEN temp_f < 70 THEN 'mild'
    WHEN temp_f < 85 THEN 'warm'
    ELSE 'hot'
  END AS temp_band
FROM `staging.stg_weather`;
