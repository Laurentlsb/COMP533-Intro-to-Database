create or replace view selfconnect as
select *
from(select s.nct_id as r1_nct_id, c.name as r1_name
     from studies as s full outer join conditions as c on s.nct_id = c.nct_id
     where s.start_date = '2016-05-01') as r1,    
	 (select s.nct_id as r2_nct_id, c.name as r2_name
     from studies as s full outer join conditions as c on s.nct_id = c.nct_id
     where s.start_date = '2016-05-01') as r2
where r1.r1_nct_id > r2.r2_nct_id;	

create or replace view union_result1 as
select r1_nct_id, r2_nct_id, count(r1_name) as c1
from(
select r1_nct_id, r2_nct_id, r1_name
from selfconnect
union
select r1_nct_id, r2_nct_id, r2_name
from selfconnect
) as A_union_B
group by r1_nct_id, r2_nct_id;

create or replace view intersect_result2 as
select r1_nct_id, r2_nct_id, count(r1_name) as c2
from(
select r1_nct_id, r2_nct_id, r1_name
from selfconnect
intersect
select r1_nct_id, r2_nct_id, r2_name
from selfconnect
) as A_union_B
group by r1_nct_id, r2_nct_id;

create or replace view final_r as
select union_result1.r1_nct_id, union_result1.r2_nct_id, c1, c2
from union_result1, intersect_result2 
where union_result1.r1_nct_id = intersect_result2.r1_nct_id and union_result1.r2_nct_id = intersect_result2.r2_nct_id;

select avg(jaccard_index) as avg_score from(
select (case 
	         when c1 = 0 and c2 = 0 then 1
	    else cast(c2 as numeric)/cast(c1 as numeric)
		end) as jaccard_index
from final_r) as jaccard_table

