-- 02_raw_weather.sql
-- Purpose: Copy 2022 daily weather for the NYC Central Park station
--          from NOAA GSOD into my own `raw` dataset.
-- Source:  bigquery-public-data.noaa_gsod.gsod2022
-- Station: stn = 725053, wban = 94728 (Central Park; 365 days of 2022)
-- Output:  raw.weather_2022

CREATE OR REPLACE TABLE `raw.weather_2022` AS
SELECT
  stn, wban, date, temp, prcp, visib, wdsp,
  rain_drizzle, snow_ice_pellets, fog
FROM `bigquery-public-data.noaa_gsod.gsod2022`
WHERE stn = '725053' AND wban = '94728';
