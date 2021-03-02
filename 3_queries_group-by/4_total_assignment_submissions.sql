SELECT cohorts.name as cohort_name, count(assignment_submissions.*) AS total_submissions
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assignment_submissions ON assignment_submissions.student_id = students.id
GROUP BY cohort_name 
ORDER BY total_submissions DESC;