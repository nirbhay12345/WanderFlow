CREATE OR REFRESH STREAMING TABLE wanderflow.wanderlake.bookings_raw AS
SELECT
  booking_id,
  user_id,
  property_id,
  check_in,
  check_out,
  guests_count,
  total_amount,
  status,
  created_at,
  updated_at
FROM STREAM(samples.wanderbricks.bookings)
UNION ALL
SELECT
  booking_id,
  user_id,
  property_id,
  check_in,
  check_out,
  guests_count,
  total_amount,
  status,
  created_at,
  updated_at
FROM STREAM(samples.wanderbricks.booking_updates);