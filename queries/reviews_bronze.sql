CREATE OR REFRESH STREAMING TABLE wanderflow.wanderlake.booking_reviews AS
SELECT 
  *
FROM STREAM(samples.wanderbricks.reviews)
WHERE is_deleted = false
;