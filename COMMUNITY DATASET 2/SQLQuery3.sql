SELECT job_type, COUNT(*) AS total_employees
FROM community2
GROUP BY job_type;