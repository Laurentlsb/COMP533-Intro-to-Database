create or replace view pp as
select s.nct_id, c.name
from studies as s full outer join conditions as c on s.nct_id = c.nct_id
where s.start_date = '2016-05-01';

select s.nct_id, c.nct_id, c.name, s.start_date
from studies as s full outer join conditions as c on s.nct_id = c.nct_id
where c.nct_id is null and s.start_date = '2016-05-01';


select (count(p1.name)/count(*))
from (select pp.nct_id, pp.name from pp, tt where pp.nct_id = r1.nct_id) as p1
	  full outer join
	 (select pp.nct_id, pp.name from pp, tt where pp.nct_id = r2.nct_id) as p2
	  on p1.name = p2.name	;
							 
create or replace view rr as
select s.nct_id, count(c.name) as
from studies as s full outer join conditions as c on s.nct_id = c.nct_id
where s.start_date = '2016-05-01'
group by s.nct_id;
		
							 
							 
							 
create or replace view gg as
select *
from(select s.nct_id as r1_nct_id, count(c.name) as r1_count
     from studies as s full outer join conditions as c on s.nct_id = c.nct_id
     where s.start_date = '2016-05-01'
     group by s.nct_id) as r1 ,
	 (select s.nct_id as r2_nct_id, count(c.name) as r2_count
     from studies as s full outer join conditions as c on s.nct_id = c.nct_id
     where s.start_date = '2016-05-01'
     group by s.nct_id) as r2
where r1.r1_nct_id != r2.r2_nct_id;	
							 
create or replace view pp as
select s.nct_id, c.name
from studies as s full outer join conditions as c on s.nct_id = c.nct_id
where s.start_date = '2016-05-01';

create or replace view gg as
select *
from(select s.nct_id as r1_nct_id, count(c.name) as r1_count
     from studies as s full outer join conditions as c on s.nct_id = c.nct_id
     where s.start_date = '2016-05-01'
     group by s.nct_id) as r1 ,
	 (select s.nct_id as r2_nct_id, count(c.name) as r2_count
     from studies as s full outer join conditions as c on s.nct_id = c.nct_id
     where s.start_date = '2016-05-01'
     group by s.nct_id) as r2
where r1.r1_nct_id != r2.r2_nct_id;	

select round(avg(jaccard_index), 4)
from(
     select (case 
	              when gg.r1_count = 0 and gg.r2_count = 0 then 1
	              when gg.r1_count = 0 or gg.r2_count = 0 then 0
	         else(
			       select cast (count(p1.name) as numeric)/cast(count(*) as numeric)
                   from (select pp.nct_id, pp.name from pp, gg where pp.nct_id = gg.r1_nct_id) as p1
	                     full outer join
	                    (select pp.nct_id, pp.name from pp, gg where pp.nct_id = gg.r2_nct_id) as p2
	                     on p1.name = p2.name	
		         )
		     end
		    ) as jaccard_index
      from gg
	) as result_table
where jaccard_index != 0		 
							 
							 

						 
							 
