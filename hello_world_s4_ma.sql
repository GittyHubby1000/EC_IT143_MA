-- EC_IT143_W4.2_hello_world_s4_ma.sql

CREATE VIEW vw_hello_world_record_count AS
SELECT COUNT(*) AS total_records
FROM sys.objects;