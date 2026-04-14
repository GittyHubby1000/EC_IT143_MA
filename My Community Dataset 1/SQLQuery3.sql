CREATE VIEW vw_community1_population AS
SELECT city, COUNT(*) AS total_people
FROM community1
GROUP BY city;