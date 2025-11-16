CREATE OR REFRESH MATERIALIZED VIEW average_property_rating AS
SELECT
  property_id,
  ROUND(AVG(rating), 2) AS avg_rating
FROM wanderflow.wanderlake.valid_booking_reviews
GROUP BY property_id;