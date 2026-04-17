-- ============================================
-- Name: Michael Andrew
-- Assignment: W5.2 My Communities Analysis
-- Dataset: Community 1
-- ============================================

-- Question 1 (Author: Me)
-- How many total records are in the dataset?

SELECT COUNT(*) AS total_records
FROM community1_table;


-- Question 2 (Author: Me)
-- What is the average income?

SELECT AVG(income) AS avg_income
FROM community1_table;


-- Question 3 (Author: Classmate)
-- How many people are in each city?

SELECT city, COUNT(*) AS total_people
FROM community1_table
GROUP BY city;


-- Question 4 (Author: Classmate)
-- What is the highest income recorded?

SELECT MAX(income) AS highest_income
FROM community1_table;