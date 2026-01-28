1. TRAFFIC VOLUME KPIs

#### 1.3 Hourly Average Traffic

-- Average activity per hour across all days
CREATE OR REPLACE TABLE
`ndn-project-485520.telecom_italy_data.kpi_hourly_avg_traffic` AS
SELECT 
  hour,
  ROUND(AVG(sms_in + sms_out + call_in + call_out + internet), 2) AS avg_activity,
  ROUND(AVG(sms_in + sms_out), 2) AS avg_sms,
  ROUND(AVG(call_in + call_out), 2) AS avg_calls,
  ROUND(AVG(internet), 2) AS avg_internet
FROM `ndn-project-485520.telecom_italy_data.sms_call_internet_mi_all_days_cleaned`
GROUP BY hour
ORDER BY hour;
