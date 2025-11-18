CREATE OR REFRESH STREAMING TABLE valid_booking_reviews AS
SELECT
  br.*
FROM STREAM(booking_reviews) br
JOIN booking_info_active bia
  ON br.booking_id = bia.booking_id
   AND br.user_id = bia.user_id
   AND br.property_id = bia.property_id
   AND bia.check_in < br.updated_at
WHERE bia.status in ('confirmed', 'completed')
;