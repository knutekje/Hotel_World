# Data assumed to be credible and clean because of source, the companys booking system.
# However upon first interaction to analyze by making a child per adult colum (Child/Adult) SQL threw a 0 / 0 erro
# After inpsecting this problem, it showed that some bookings had no adults, and, in fact no guests at all. 
# Futher (Confering with SME) on it showed that a vast majority came from bookings made from Portugal. And then one particular agent in Portugal lacked training in using the system.
# They would some times alter bookings to remove all guests before cancelling it, only remove adults from a booking. SME, realised that training videos had only been shown to in house staff and not external agents.
  # where (adults + children + babies) != 0 addresses <- this issue

# Checked in completed bookings with zero guests, proved to be all linked to one sales rep, who would dupe all his stats to meat his goals, "agent 6". The findings have been passed along
 # AND (stays_in_weekend_nights + stays_in_week_nights ) > 1 <- adresses this issue


  
Select AVG(adults) as avg_adult, AVG(Children) as avg_children, avg(lead_time) avg_lead_time, market_segment, distribution_channel
FROM
(SELECT *
FROM hote_world.bookings
where (adults + children + babies) != 0
  AND arrival_date_month = "January" 
  OR  arrival_date_month = "February"
  OR  arrival_date_month = "March"
  OR  arrival_date_month = "April"
  OR arrival_date_month = "September" 
  OR  arrival_date_month = "October"
  OR  arrival_date_month = "November"
  AND (stays_in_weekend_nights + stays_in_week_nights ) <= 21 
  AND (stays_in_weekend_nights + stays_in_week_nights ) > 1 
  AND hotel = 'Resort Hotel')
  GROUP BY market_segment, distribution_channel


