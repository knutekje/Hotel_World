
SELECT COUNT(*) as num_segment, market_segment, hotel
FROM
(SELECT *,(CONCAT(arrival_date_year, arrival_date_month, arrival_date_day_of_month)) AS string_to_date 
  FROM hote_world.bookings as off_peak
  WHERE arrival_date_month = "January" 
  OR  arrival_date_month = "February"
  OR  arrival_date_month = "March"
  OR  arrival_date_month = "April"
  OR arrival_date_month = "September" 
  OR  arrival_date_month = "October"
  OR  arrival_date_month = "November")

GROUP BY market_segment, hotel
