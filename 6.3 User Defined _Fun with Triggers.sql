-- EC_IT143_6.3_fwt_s1_ma.sql
-- Question: How do I track when a record is updated?

-- EC_IT143_6.3_fwt_s2_ma.sql
-- Plan: Add columns for last_modified_date and last_modified_by

-- EC_IT143_6.3_fwt_s3_ma.sql
-- Research: Use AFTER UPDATE trigger + GETDATE() + SUSER_NAME()

-- EC_IT143_6.3_fwt_s4_ma.sql

ALTER TABLE t_w3_schools_customers
ADD last_modified_date DATETIME,
    last_modified_by VARCHAR(100);

GO

CREATE TRIGGER trg_update_customer
ON t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    UPDATE t
    SET 
        last_modified_date = GETDATE(),
        last_modified_by = SUSER_NAME()
    FROM t_w3_schools_customers t
    INNER JOIN inserted i
        ON t.customer_id = i.customer_id;
END;


-- EC_IT143_6.3_fwt_s5_ma.sql

UPDATE t_w3_schools_customers
SET city = city
WHERE customer_id = 1;

SELECT * FROM t_w3_schools_customers;


-- EC_IT143_6.3_fwt_s6_ma.sql
-- How else can we track changes? (Audit logs, history tables)