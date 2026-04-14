-- EC_IT143_W4.2_hello_world_s7_ma.sql

CREATE PROCEDURE sp_load_hello_world
AS
BEGIN
    TRUNCATE TABLE tbl_hello_world_record_count;

    INSERT INTO tbl_hello_world_record_count (total_records)
    SELECT total_records
    FROM vw_hello_world_record_count;
END;