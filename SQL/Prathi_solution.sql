/* select distinct SID from apply where major='CS' and SID not in (select SID from apply where major='EE');*/

select distinct College.cName, state, GPA
from College, Apply, Student
where College.cName = Apply.cName
  and Apply.sID = Student.sID
  and GPA >= all
          (select GPA from Student, Apply
           where Student.sID = Apply.sID
             and Apply.cName = College.cName);



select distinct apply.cName, student.sID, student.GPA
from apply, student
where apply.sID = student.sID 
and cName in (select distinct cName from college where GPA >= 3.9;


select max(GPA),college.cName, state
from college, student, apply
where college.cName = apply.cName
and apply.sID = student.sID
group  by college.cName,state;

select min(GPA),college.cName, state
from college, student, apply
where college.cName = apply.cName
and apply.sID = student.sID
group  by college.cName,state;









