const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


pool.query(`
SELECT teachers.name as teacher_name, cohorts.name as cohort_name
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = '${process.argv[2]}'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort_name}: ${user.teacher_name}`);
  })
}).catch(err => console.error('query error', err.stack));