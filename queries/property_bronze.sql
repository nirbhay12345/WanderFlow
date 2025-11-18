CREATE OR REFRESH STREAMING TABLE wanderflow.wanderlake.property_bronze AS
SELECT 
  *
FROM STREAM(samples.wanderbricks.properties)
;

