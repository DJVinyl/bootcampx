SELECT students.name as name, count(assistance_requests.student_id) as total_assistances
FROM students
JOIN assistance_requests ON students.id = assistance_requests.student_id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;