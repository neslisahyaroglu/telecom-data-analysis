1. TRAFFIC VOLUME KPIs
#### 1.2 Activity Type Distribution

-- Daily percentage of each activity type
CREATE OR REPLACE TABLE
`ndn-project-485520.telecom_italy_data.kpi_daily_activity_distribution` AS
SELECT 
  date,
  ROUND(SUM(sms_in + sms_out) 
        / SUM(sms_in + sms_out + call_in + call_out + internet) * 100, 2) AS sms_percentage,
  ROUND(SUM(call_in + call_out) 
        / SUM(sms_in + sms_out + call_in + call_out + internet) * 100, 2) AS call_percentage,
  ROUND(SUM(internet) 
        / SUM(sms_in + sms_out + call_in + call_out + internet) * 100, 2) AS internet_percentage
FROM `ndn-project-485520.telecom_italy_data.sms_call_internet_mi_all_days_cleaned`
GROUP BY date
ORDER BY date;
