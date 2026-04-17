-- EC_IT143_6.3_fwf_s1_ma.sql
-- Question: How do I extract the first name from contact_name?

-- STEP2
-- EC_IT143_6.3_fwf_s2_ma.sql
-- Plan: Use string functions like LEFT and CHARINDEX to split names

--STEP3
-- EC_IT143_6.3_fwf_s3_ma.sql
SELECT 
    contact_name,
    LEFT(contact_name, CHARINDEX(' ', contact_name) - 1) AS first_name
FROM t_w3_schools_customers;

-- STEP4
-- EC_IT143_6.3_fwf_s4_ma.sql
-- Source: https://www.w3schools.com/sql/sql_functions.asp
-- Using LEFT + CHARINDEX to extract first name

--STEP5
-- EC_IT143_6.3_fwf_s5_ma.sql
CREATE FUNCTION fn_get_first_name (@full_name VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    RETURN LEFT(@full_name, CHARINDEX(' ', @full_name) - 1);
END;

--STEP6
-- EC_IT143_6.3_fwf_s6_ma.sql
SELECT 
    contact_name,
    dbo.fn_get_first_name(contact_name) AS udf_result,
    LEFT(contact_name, CHARINDEX(' ', contact_name) - 1) AS adhoc_result
FROM t_w3_schools_customers;

--STEP7
-- EC_IT143_6.3_fwf_s7_ma.sql
WITH test AS (
    SELECT 
        contact_name,
        dbo.fn_get_first_name(contact_name) AS udf_result,
        LEFT(contact_name, CHARINDEX(' ', contact_name) - 1) AS adhoc_result
    FROM t_w3_schools_customers
)
SELECT *
FROM test
WHERE udf_result <> adhoc_result;

--STEP8
-- EC_IT143_6.3_fwf_s8_ma.sql
-- Question: How do I extract the last name?

CREATE FUNCTION fn_get_last_name (@full_name VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    RETURN RIGHT(@full_name, LEN(@full_name) - CHARINDEX(' ', @full_name));
END;
