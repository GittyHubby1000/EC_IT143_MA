TRUNCATE TABLE tbl_community2_jobs;

INSERT INTO tbl_community2_jobs
SELECT * FROM vw_community2_jobs;