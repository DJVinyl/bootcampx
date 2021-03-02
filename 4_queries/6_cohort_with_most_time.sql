SELECT cohorts.name as name, AVG(completed_at-started_at) as average_assistance_time
FROM assistance_requests
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING AVG(completed_at-started_at) = 
  (SELECT MAX(average_assistance_time) 
  FROM (SELECT cohorts.name as name, AVG(completed_at-started_at) as average_assistance_time
  FROM assistance_requests
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
  GROUP BY cohorts.name) as avg);

-- -- -- ANSWER FROM COMPAS WHICH IS MUCH LESS COMPLICATED
-- SELECT cohorts.name, avg(completed_at - started_at) as average_assistance_time
-- FROM assistance_requests 
-- JOIN students ON students.id = assistance_requests.student_id
-- JOIN cohorts ON cohorts.id = cohort_id
-- GROUP BY cohorts.name
-- ORDER BY average_assistance_time DESC
-- LIMIT 1;