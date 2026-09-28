CREATE OR REPLACE TABLE `analytics.dim_date` AS
SELECT
  d AS date_key,
  EXTRACT(YEAR FROM d)  AS year,
  EXTRACT(MONTH FROM d) AS month,
  FORMAT_DATE('%B', d)  AS month_name,
  EXTRACT(DAY FROM d)   AS day,
  FORMAT_DATE('%A', d)  AS day_name,
  EXTRACT(DAYOFWEEK FROM d) IN (1, 7) AS is_weekend
FROM UNNEST(GENERATE_DATE_ARRAY('2022-01-01', '2022-12-31')) AS d;
