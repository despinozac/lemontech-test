select sub.name, s.name, AVG (cal.grade)
from students s, subjects sub, courses c, tests t, califications cal
where
sub.name = 'programacion' and
s.dni = 123 and
c.subject_id = sub.id and
t.course_id = c.id and
cal.test_id = t.id and
cal.student_id = s.id
