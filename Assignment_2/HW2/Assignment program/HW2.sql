/*   queries  1(a)  */
SELECT name, email, phone
FROM central_contacts
UNION ALL 
SELECT name, email, phone
FROM facility_contacts
UNION ALL
SELECT name, email, phone
FROM result_contacts;

SELECT COUNT(*)
FROM (SELECT name, email, phone
FROM central_contacts
    UNION ALL 
    SELECT name, email, phone
    FROM facility_contacts
    UNION ALL
    SELECT name, email, phone
        FROM result_contacts) AS UNION_1; 
/* The count value is 31311 */


/* 1(b) */
SELECT COUNT(*)
FROM (SELECT name, email, phone
      FROM central_contacts
      UNION  
      SELECT name, email, phone
      FROM facility_contacts
      UNION 
      SELECT name, email, phone
      FROM result_contacts) AS UNION_1;
/*The new count value is 24549 */


/* 1(c) */
SELECT *
FROM (SELECT name, email, phone
      FROM central_contacts
      UNION  
      SELECT name, email, phone
      FROM facility_contacts
      UNION 
      SELECT name, email, phone
      FROM result_contacts) AS UNION_1
WHERE name like 'Efthymios Avgerinos%';
--Because one of the value is 'Efthymios Avgerinos, M.D.' , and the other is 'Efthymios Avgerinos, MD'.
--We can unify the format of name, delete the 'dot' of their degree.


/* 2(a) */
select points
from scorepoints
where points = (
	select MAX(points) 
	from scorepoints);
/* The highest possible value is 12. */


/* 2(b) */
create or replace view v_1 as
select distinct * from(
select s.nct_id, st.term, sp.points
from studies as s, conditions as c, scoreterms as st, scorepoints as sp
where s.nct_id = c.nct_id and c.name = st.name and st.term = sp.term ) as temp_1;

create or replace view v_2 as
select v_1.nct_id, sum(v_1.points) as score
from v_1
group by v_1.nct_id;

select *
from v_2
where score = (select max(score) from v_2);
/* The nct_id is NCT02758977, the score is 23 */


/* 2(c) */
create or replace view v_1 as
select distinct * from(
select s.nct_id, st.term, sp.points
from studies as s, conditions as c, scoreterms as st, scorepoints as sp
where s.nct_id = c.nct_id and c.name = st.name and st.term = sp.term ) as temp_1;

create or replace view v_2 as
select v_1.nct_id, sum(v_1.points) as score
from v_1
where v_1.term = 'Neurodegenerative disorders'
group by v_1.nct_id;

select count(*)
from v_2
where score = 6;
/* There are 3 stueies satisfying the requirements */


/* 2(d) */
create or replace view term_1 as
select s.nct_id as nct_id_1, st.term
from studies as s, conditions as c, scoreterms as st
where s.nct_id = c.nct_id and c.name = st.name;

select count(*)
from studies
where nct_id  not in (select nct_id_1 from term_1 );
/* 11042 studies have no risk terms */ 


/* 2(e) */
create or replace view qq as
select nct_id
from (select s.nct_id, sum(sp.points) as score
      from studies as s, conditions as c, scoreterms as st, scorepoints as sp
      where s.nct_id = c.nct_id and c.name = st.name and st.term = sp.term 
      group by s.nct_id) as t
where score != 0;

select round(avg(count_name),2),  round(avg(count_term),2)
from (select qq.nct_id, count(distinct c.name) as count_name, count(distinct st.term) as count_term
      from studies as s, conditions as c, scoreterms as st, qq
      where qq.nct_id = s.nct_id and s.nct_id = c.nct_id and c.name = st.name
      group by qq.nct_id) as t2; 
/* The average number of contributing conditions and terms are 1.24 and 1.03 respectively. */

/* 3 */
/* Create another table including the term and points for this new score, using the same attribute name, to replace the original table 'scorepoints'. */

/* 4 */
/*Because the point values in 'scorepoints' are relative values to predict the risk of in-hospital death, and some of comorbidities are independently or significantly associated with a decreased risk of death. 
So negative value means that it is not likely to be the factor causing death compared with other conditions with positive value. */

/* 5 */
create or replace view ww as
select c.name
from studies as s, conditions as c
where s.nct_id = c.nct_id and s.nct_id = 'NCT02789800'; 

create or replace view ee as
select s.nct_id, count(c.name) as number_of_condition
from ww, studies as s, conditions as c
where s.nct_id = c.nct_id and c.name = ww.name
group by s.nct_id;

select nct_id
from ee
where number_of_condition >= (select number_of_condition
							  from ee
							  where nct_id = 'NCT02789800') and nct_id != 'NCT02789800';
/* The study NCT02742597 satisfies the requirement. */


/* 6(a) */
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
from final_r) as jaccard_table;
/* The average score is approximately 0.605179 */

/* 6(b) */
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

create or replace view jaccard_relation as
select (case 
	         when c1 = 0 and c2 = 0 then 1
	    else cast(c2 as numeric)/cast(c1 as numeric)
		end) as jaccard_index
from final_r ;

create or replace view pair as
select r1_nct_id, r2_nct_id
from selfconnect
group by r1_nct_id, r2_nct_id;

select (round(JI_1/num_of_pairs*100, 2))||'%' as percentage
from(select cast(count(*) as numeric) as num_of_pairs  from pair ) as s1,
    (select cast(count(*) as numeric) as JI_1 from jaccard_relation where jaccard_index = 1 ) as s2;
/* The percentage is 0.11% */	
	
	










