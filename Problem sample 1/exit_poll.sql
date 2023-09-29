/*************** Table : candidates_tab *****************/
drop table if exists candidates_tab;
create table candidates_tab
(
    id          int,
    first_name  varchar(50),
    last_name   varchar(50)
);
insert into candidates_tab values(1, 'Davide', 'Kentish');
insert into candidates_tab values(2, 'Thorstein', 'Bridge');



/**************** Table : results_tab ********************/
drop table if exists results_tab;
create table results_tab
(
    candidate_id    int,
    state           varchar(50)
);
insert into results_tab values(1, 'Alabama');
insert into results_tab values(1, 'Alabama');
insert into results_tab values(1, 'California');
insert into results_tab values(1, 'California');
insert into results_tab values(1, 'California');
insert into results_tab values(1, 'California');
insert into results_tab values(1, 'California');
insert into results_tab values(2, 'California');
insert into results_tab values(2, 'California');
insert into results_tab values(2, 'New York');
insert into results_tab values(2, 'New York');
insert into results_tab values(2, 'Texas');
insert into results_tab values(2, 'Texas');
insert into results_tab values(2, 'Texas');
insert into results_tab values(1, 'New York');
insert into results_tab values(1, 'Texas');
insert into results_tab values(1, 'Texas');
insert into results_tab values(1, 'Texas');
insert into results_tab values(2, 'California');
insert into results_tab values(2, 'Alabama');



/********************** QUERY ********************/
select candidate_name,
	   group_concat(case when rank_=1 then state_rank end) as first_place,
       group_concat(case when rank_=2 then state_rank end) as second_place,
       group_concat(case when rank_=3 then state_rank end) as third_place
from   (select concat(first_name, ' ', last_name) as candidate_name,
       dense_rank() over (partition by concat(first_name, ' ', last_name) order by count(*) desc) as rank_,
       concat(state, '(', count(*), ')') as state_rank
	   from candidates_tab ct join results_tab rt on ct.id=rt.candidate_id
	   group by candidate_name, state) as temp_table
group by candidate_name
;