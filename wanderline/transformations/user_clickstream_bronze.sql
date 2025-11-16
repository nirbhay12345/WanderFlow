CREATE OR REFRESH STREAMING TABLE user_clickstream AS
SELECT
  property_id,
  user_id,
  event,
  metadata.device as device_type,
  metadata.referrer as referrer,
  timestamp as event_timestamp
FROM STREAM(samples.wanderbricks.clickstream)
UNION ALL
SELECT
  property_id,
  user_id,
  'view' as event,
  device_type,
  referrer,
  timestamp as event_timestamp
FROM STREAM(samples.wanderbricks.page_views)
;