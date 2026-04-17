-- ============================================
-- Name: Michael Andrew
-- Assignment: W5.2 My Communities Analysis
-- Dataset: Community 2
-- ============================================

-- Question 1 (Author: Me)
-- How many total records are in the dataset?

SELECT COUNT(*) AS total_records
FROM community2_table;


-- Question 2 (Author: Me)
-- What is the average salary?

SELECT AVG(salary) AS avg_salary
FROM community2_table;


-- Question 3 (Author: Classmate)
-- How many employees are in each job type?

SELECT job_type, COUNT(*) AS total_employees
FROM community2_table
GROUP BY job_type;


-- Question 4 (Author: Classmate)
-- What is the minimum salary?

SELECT MIN(salary) AS lowest_salary
FROM community2_table;