CREATE OR REFRESH STREAMING TABLE property_bronze AS
SELECT 
  *
FROM STREAM(samples.wanderbricks.properties)
;

