import dlt
from pyspark.sql.functions import col

catalog = "wanderflow"
schema = "wanderlake"
bronze_table = "booking_info"

dlt.create_streaming_table(f"{catalog}.{schema}.{bronze_table}")

dlt.create_auto_cdc_flow(
 target=f"{bronze_table}",
 source="bookings_raw",
 keys=["booking_id", "user_id", "property_id"],
 sequence_by=col("updated_at"),
 stored_as_scd_type = 2
)
