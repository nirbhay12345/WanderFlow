CREATE OR REFRESH STREAMING TABLE valid_booking_reviews AS
SELECT
  br.*
FROM STREAM(booking_reviews) br
JOIN booking_info bi
  ON br.booking_id = bi.booking_id
   AND br.user_id = bi.user_id
   AND br.property_id = bi.property_id
   AND bi.check_in < br.updated_at
WHERE bi.status in ('confirmed', 'completed') AND bi.__END_AT IS NULL
;