CREATE OR REFRESH MATERIALIZED VIEW booking_info_active
AS
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
FROM wanderflow.wanderlake.booking_info
WHERE __END_AT IS NULL;