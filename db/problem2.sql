select s.name, s.dni
from courses c, students s, subjects sub, presences  p
where 
sub.name = 'programacion' and 
c.subject_id = sub.id and 
p.student_id = s.id
order by s.name ASC
