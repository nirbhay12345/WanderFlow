CREATE OR REFRESH MATERIALIZED VIEW average_property_rating AS
SELECT
  property_id,
  ROUND(AVG(rating), 2) AS avg_rating,
  COUNT(*) AS num_reviews
FROM wanderflow.wanderlake.valid_booking_reviews
GROUP BY property_id;

CREATE OR REFRESH STREAMING TABLE review_sentiment AS
SELECT
  booking_id,
  user_id,
  property_id,
  rating,
  comment,
  ai_analyze_sentiment(comment) as sentiment,
  updated_at
FROM STREAM(wanderflow.wanderlake.valid_booking_reviews)
;



