CREATE OR REFRESH STREAMING TABLE booking_reviews AS
SELECT 
  *
FROM STREAM(samples.wanderbricks.reviews)
WHERE is_deleted = false