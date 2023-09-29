/************ Table : candidates *************/
drop table if exists candidates;
create table candidates
(
    id      int,
    gender  varchar(1),
    age     int,
    party   varchar(20)
);
insert into candidates values(1,'M',55,'Democratic');
insert into candidates values(2,'M',51,'Democratic');
insert into candidates values(3,'F',62,'Democratic');
insert into candidates values(4,'M',60,'Republic');
insert into candidates values(5,'F',61,'Republic');
insert into candidates values(6,'F',58,'Republic');

/************ Table : results ************/
drop table if exists results;
create table results
(
    constituency_id     int,
    candidate_id        int,
    votes               int
);
insert into results values(1,1,847529);
insert into results values(1,4,283409);
insert into results values(2,2,293841);
insert into results values(2,5,394385);
insert into results values(3,3,429084);
insert into results values(3,6,303890);


/*************** QUERY *****************/
select concat(party, ' ', count(1)) as party_seats_won
from (select *, rank() over(partition by r.constituency_id order by r.votes desc) as position
	  from candidates c
      join results r on r.candidate_id = c.id) as temp_table
where position=1
group by party
order by count(1) desc;