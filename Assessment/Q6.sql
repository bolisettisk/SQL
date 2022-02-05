

/* For all cases where the same reviewer rated the same movie twice and gave it a higher rating the second time, return the reviewer's name and the title of the movie.  */



/* select distinct reviewer.name, movie.title
from movie, reviewer, rating
where rating.mid = movie.mID and rating.rid = reviewer.rid and reviewer.rid in (select r1.rid
from (select * from rating group by rid, mid having count(mid) = 2) as r1, rating as r2
where r1.rID = r2.rid and r1.mid = r2.mid and r2.ratingDate > r1.ratingDate and r2.stars > r1.stars); */


select distinct reviewer.name, movie.title
from movie, reviewer, rating
where rating.mid = movie.mID and rating.rid = reviewer.rid and rating.rid in (select r1.rid from 
rating r1, rating r2
where r1.rid=r2.rid and r1.mid=r2.mid
and r1.ratingDate > r2.ratingDate
and r1.stars > r2.stars
group by r1.rid
having count(*)=1);















