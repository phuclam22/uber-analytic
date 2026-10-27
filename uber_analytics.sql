SELECT 
f.trip_id,
  f.VendorID,
  d.tpep_pickup_datetime,
  d.tpep_dropoff_datetime,
  d.pick_hour,
  d.pick_weekday,
  f.passenger_count,
  f.trip_distance,
  f.pickup_longitude,
  f.pickup_latitude,
  f.dropoff_longitude,
  f.dropoff_latitude,
  r.rate_code_name,
  p.payment_type_name,
  f.fare_amount,
  f.extra,
  f.mta_tax,
  f.tip_amount,
  f.tolls_amount,
  f.improvement_surcharge,
  f.total_amount
FROM `uber_data_engineering.fact_table` f
JOIN `uber_data_engineering.datetime_dim` d ON f.datetime_id = d.datetime_id
JOIN `uber_data_engineering.rate_code_dim` r ON f.rate_code_id = r.rate_code_id
JOIN `uber_data_engineering.payment_type_dim` p ON f.payment_type_id = p.payment_type_id



--------------------
WITH HourStats AS (
  SELECT
    pick_hour,
    COUNT(trip_id) AS total_trips,
    ROUND(AVG(trip_distance),2) AS avg_distance,
    ROUND(AVG(total_amount),2) AS avg_revenue,
    SUM(CASE WHEN trip_distance > 10 then 1 else 0 end) AS long_trips
  FROM `uber_data_engineering.table_analytics` 
  GROUP BY pick_hour
)
SELECT 
  pick_hour,
  total_trips,
  avg_revenue,
  round((long_trips * 100.0 / total_trips),2) AS long_trip_percentage
FROM HourStats
ORDER BY total_trips DESC;



--------------
SELECT 
  VendorID,
  rate_code_name,
  count(trip_id) as trip_count,
  round(sum(total_amount),2) AS total_revenue,
  round(sum(total_amount) / nullif(sum(trip_distance),0) ,2) AS revenue_per_mile,
  rank() over(partition by VendorID ORDER BY (sum(total_amount) / nullif(sum(trip_distance),0)) DESC) as rank_efficiency
FROM `uber_data_engineering.table_analytics`
where trip_distance > 0
group by vendorid, rate_code_name;






