/* For each student A who likes a student B where the two are not friends, find if they have a friend C in common (who can introduce them!). 
For all such trios, return the name and grade of A, B, and C.  */


select h1.name, h1.grade, h2.name, h2.grade, h3.name, h3.grade
from  highschooler h1, highschooler h2, highschooler h3, (
	select MF.A2 A, MF.B2 B, MF.AF C
	from friend f, (
		select f.ID2 AF, NF.B2, NF.A2
		from friend f, (
			select ID1 A2, ID2 B2
			from likes l left join 
				(select l.id1 A1, l.id2 B1
				from friend f, likes l
				where f.ID1 = l.ID1 and f.id2 = l.id2) Frnds
			on l.ID1 = Frnds.A1
			where Frnds.A1 is null) NF
		where f.ID1 = NF.A2) MF
	where f.id1 = mf.af and f.id2 = mf.B2) TAB
where h1.id = tab.A and h2.id = tab.B and h3.id = tab.C