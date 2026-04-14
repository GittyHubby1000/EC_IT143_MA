TRUNCATE TABLE tbl_community1_population;

INSERT INTO tbl_community1_population
SELECT * FROM vw_community1_population;