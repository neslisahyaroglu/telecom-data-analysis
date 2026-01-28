1. TRAFFIC VOLUME KPIs
#### 1.4 Peak Hour Traffic

--Peak hour and traffic value for each day
SELECT 
  date,
  hour AS peak_hour,
  total_activity AS peak_traffic
FROM (
  SELECT 
    date,
    hour,
    SUM(total_activity) AS total_activity,
    ROW_NUMBER() OVER (PARTITION BY date ORDER BY SUM(total_activity) DESC) AS rn
  FROM `ndn-project-485520.telecom_italy_data.sms_call_internet_mi_all_days_cleaned`
  GROUP BY date, hour
)
WHERE rn = 1
ORDER BY date;
