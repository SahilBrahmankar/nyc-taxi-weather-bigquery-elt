-- 04_staging_weather.sql
-- Purpose: Clean the raw weather data. NOAA GSOD uses placeholder
--          values to mean "missing"; convert them to NULL.
--   temp  9999.9 -> NULL      prcp  99.99 -> NULL
--   visib 999.9  -> NULL      wdsp  999.9 -> NULL
-- Units: temperature in Fahrenheit, precipitation in inches,
--        visibility in miles, wind speed in knots.
-- Output: staging.stg_weather (view)

CREATE OR REPLACE VIEW `staging.stg_weather` AS
SELECT
  date,
  NULLIF(SAFE_CAST(temp  AS FLOAT64), 9999.9) AS temp_f,
  NULLIF(SAFE_CAST(prcp  AS FLOAT64), 99.99)  AS precip_in,
  NULLIF(SAFE_CAST(visib AS FLOAT64), 999.9)  AS visibility_mi,
  NULLIF(SAFE_CAST(wdsp  AS FLOAT64), 999.9)  AS wind_speed_kn,
  rain_drizzle, snow_ice_pellets, fog
FROM `raw.weather_2022`;
