drop function if exists productChains();
drop table if exists reg_count;
delete from producttypepairs;

create or replace function productChains()
returns void as 
$$
declare 
m integer;
n integer;
paircursor cursor for select producttype1, producttype2, productcount from producttypepairs;
type1 varchar(20);
type2 varchar(20);
typecount integer;
i integer;
tem_type1 varchar(20);
tem_type2 varchar(20);
a varchar(20);
b varchar(20);
num_row integer;
m_id integer;
n_id integer;
num integer;
begin
	m = 2;
	n = 3;
	i = 0;
	create table reg_count as
		select *
		from sale natural join producttype
	    where producttype != 'extra';
	Alter table reg_count add column reg_id serial;
	
	execute 'select producttype from reg_count  where reg_id = 1' into a;
	execute 'select producttype from reg_count  where reg_id = 2' into b;
	insert into producttypepairs(producttype1, producttype2, productcount) values (a, b, 1);
	execute 'select count(*) from reg_count' into num;
	
	while n <= num
	loop
		execute 'select producttype from reg_count  where reg_id =' ||m||'' into tem_type1;
		execute 'select producttype from reg_count  where reg_id =' ||n||'' into tem_type2;
		execute 'select count(*) from producttypepairs'  into num_row;
		execute 'select eventid from reg_count  where reg_id =' ||m||'' into m_id;
		execute 'select eventid from reg_count  where reg_id =' ||n||'' into n_id;
		if m_id = n_id then  -- 所选两行的eventid必须相等
			open paircursor;
        	loop
				fetch paircursor into type1, type2, typecount;
				exit when not found;
				i = i +1;	
				if type1 = tem_type1 and type2 = tem_type2 then
					update producttypepairs set productcount = productcount + 1 where producttype1 = type1 and producttype2 = type2;
					exit;  --一旦找到符合的记录，退出循环
				else 
					if i >= num_row then  --判断是否遍历完所有记录，只有所有record都不满足上一个条件时，才会插入新的行
					 	insert into producttypepairs(producttype1, producttype2, productcount) values (tem_type1, tem_type2, 1);
					end if;
				end if;	
			end loop;
        	close paircursor;
			i = 0;
		end if;
		m = m + 1;
		n = n + 1;
	end loop;
end;
$$
language plpgsql;


select * from productchains();															 
select * from producttypepairs order by producttype1, producttype2;