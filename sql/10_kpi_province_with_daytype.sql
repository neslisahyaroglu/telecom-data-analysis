-- Purpose:
-- Compares average or total traffic levels of provinces
-- between weekdays and weekends to detect behavioral differences.
--
-- Source table:
-- mi_to_provinces_all_days
--
-- KPI:
-- Province Day Type Behavior

CREATE OR REPLACE TABLE `ndn-project-485520.telecom_italy_data.province_with_daytype` AS
SELECT
  datetime,
  date,
  time,
  cell_id,
  province_name,
  cell2Province,
  Province2cell,
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM date) IN (1, 7) THEN 'Weekend'
    ELSE 'Weekday'
  END AS day_type
FROM `ndn-project-485520.telecom_italy_data.mi_to_provinces_all_days`;
