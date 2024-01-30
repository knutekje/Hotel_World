# Data assumed to be credible and clean because of source, the companys booking system.
# However upon first interaction to analyze by making a child per adult colum (Child/Adult) SQL threw a 0 / 0 erro
# After inpsecting this problem, it showed that some bookings had no adults, and, in fact no guests at all. 
# Futher (Confering with SME) on it showed that a vast majority came from bookings made from Portugal. And then one particular agent in Portugal lacked training in using the system.
# They would some times alter bookings to remove all guests before cancelling it, only remove adults from a booking. SME, realised that training videos had only been shown to in house staff and not external agents.
# Checked in completed bookings with zero guests, proved to be all linked to one sales rep, who would dupe all his stats to meat his goals, "agent 6". The findings have been passed along

  
Select *, (stays_in_weekend_nights + stays_in_week_nights )as length_of_stay
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
  OR  arrival_date_month = "November")

  Where (stays_in_weekend_nights + stays_in_week_nights ) <= 21 
  AND (stays_in_weekend_nights + stays_in_week_nights ) > 1 
