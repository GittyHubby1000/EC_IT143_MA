CREATE PROCEDURE sp_load_community1_population
AS
BEGIN
    TRUNCATE TABLE tbl_community1_population;

    INSERT INTO tbl_community1_population
    SELECT * FROM vw_community1_population;
END;