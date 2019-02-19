drop function if exists productChains();
drop table if exists reg_count;
drop table if exists ex_count;
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
tem_type3 varchar(20);
a varchar(20);
b varchar(20);
num_row integer;
m_id integer;
n_id integer;
x_id integer;
num integer;
begin
-- 'typeX'–'typeX' pairs
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
		if m_id = n_id then 
			open paircursor;
        	loop
				fetch paircursor into type1, type2, typecount;
				exit when not found;
				i = i +1;	
				if type1 = tem_type1 and type2 = tem_type2 then
					update producttypepairs set productcount = productcount + 1 where producttype1 = type1 and producttype2 = type2;
					exit;  
				else 
					if i >= num_row then 
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
	
-- 'extra'–'extra' pairs
	m = 1;
	n = 2;
	i = 0;
	create table ex_count as
		select *
		from sale natural join producttype;
	Alter table ex_count add column ex_id serial;
	insert into producttypepairs(producttype1, producttype2, productcount) values ('extra', 'extra', 0);
	execute 'select count(*) from ex_count' into num;
	while n <= num
	loop
		execute 'select producttype from ex_count  where ex_id =' ||m||'' into tem_type1;
		execute 'select producttype from ex_count  where ex_id =' ||n||'' into tem_type2;
		execute 'select count(*) from producttypepairs'  into num_row;
		execute 'select eventid from ex_count  where ex_id =' ||m||'' into m_id;
		execute 'select eventid from ex_count  where ex_id =' ||n||'' into n_id;
		if m_id = n_id then  
			if tem_type1 = 'extra' and tem_type2 = 'extra' then
				update producttypepairs set productcount = productcount + 1 where producttype1 = 'extra';
			end if;	
			if n+1 <= num then
				execute 'select producttype from ex_count  where ex_id =' ||n+1||'' into tem_type3;
				execute 'select eventid from ex_count  where ex_id =' ||n+1||'' into x_id;
				if tem_type1 = 'extra' and tem_type3 = 'extra' and m_id = x_id then
					update producttypepairs set productcount = productcount + 1 where producttype1 = 'extra';
				end if;
			end if;
		end if;
		m = m + 1;
		n = n + 1;
	end loop;
	
end;
$$
language plpgsql;


select * from productchains();															 
select * from producttypepairs order by producttype1, producttype2;

/*
"beverage"	"beverage"	26
"beverage"	"cone"	69
"beverage"	"dish"	55
"beverage"	"ice cream beverage"	37
"beverage"	"novelty"	17
"beverage"	"pint"	19
"beverage"	"slush"	76
"beverage"	"sundae"	126
"cone"	"beverage"	76
"cone"	"cone"	363
"cone"	"dish"	210
"cone"	"ice cream beverage"	160
"cone"	"novelty"	72
"cone"	"pint"	78
"cone"	"slush"	317
"cone"	"sundae"	483
"dish"	"beverage"	51
"dish"	"cone"	218
"dish"	"dish"	173
"dish"	"ice cream beverage"	111
"dish"	"novelty"	77
"dish"	"pint"	73
"dish"	"slush"	238
"dish"	"sundae"	351
"extra"	"extra"	1902
"ice cream beverage"	"beverage"	32
"ice cream beverage"	"cone"	145
"ice cream beverage"	"dish"	132
"ice cream beverage"	"ice cream beverage"	95
"ice cream beverage"	"novelty"	42
"ice cream beverage"	"pint"	45
"ice cream beverage"	"slush"	181
"ice cream beverage"	"sundae"	247
"novelty"	"beverage"	24
"novelty"	"cone"	80
"novelty"	"dish"	68
"novelty"	"ice cream beverage"	47
"novelty"	"novelty"	28
"novelty"	"pint"	21
"novelty"	"slush"	78
"novelty"	"sundae"	118
"pint"	"beverage"	18
"pint"	"cone"	76
"pint"	"dish"	67
"pint"	"ice cream beverage"	38
"pint"	"novelty"	18
"pint"	"pint"	26
"pint"	"slush"	74
"pint"	"sundae"	120
"slush"	"beverage"	84
"slush"	"cone"	329
"slush"	"dish"	230
"slush"	"ice cream beverage"	156
"slush"	"novelty"	92
"slush"	"pint"	80
"slush"	"slush"	337
"slush"	"sundae"	481
"sundae"	"beverage"	117
"sundae"	"cone"	476
"sundae"	"dish"	355
"sundae"	"ice cream beverage"	272
"sundae"	"novelty"	118
"sundae"	"pint"	96
"sundae"	"slush"	489
"sundae"	"sundae"	726
*/