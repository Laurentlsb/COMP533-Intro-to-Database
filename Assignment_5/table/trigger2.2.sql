Alter table truckEvent add column validEvent integer default 0;
update truckEvent 
set validEvent = 1;

create or replace view startorder as
select *
from truckevent
order by eventstart

create or replace function whetheroverlap() returns trigger as
$$
DECLARE
mycursor cursor for select eventStart, plannedEnd, eventname, eventid from startorder where eventid != new.eventid;
starttime timestamp;
endtime timestamp;
Ename varchar(200);
Eid integer;
count integer;
count_2 integer;

BEGIN
count_2 =0;
open mycursor;
loop
	fetch mycursor into starttime, endtime, Ename, Eid;
	exit when not found;
	if (new.eventstart < starttime and new.plannedend > starttime) or (new.eventstart < endtime and new.plannedend > endtime) or (new.eventstart >= starttime and new.plannedend <= endtime) then
		if Ename != new.eventname and starttime != new.eventstart and Eid <= new.eventid then
			if count_2 = 0 then
				RAISE NOTICE 'New event % on %  overlaps with the following scheduled events:', new.eventname, new.eventstart;
				count_2 = count_2 + 1;
			end if;
			RAISE NOTICE '%', Ename;
		end if;
	end if;
end loop;
close mycursor;

if count_2 = 0 then
	update truckevent set validEvent = 1 where eventid = new.eventid;
end if;
RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER insertoverlap
AFTER INSERT ON truckEvent
FOR EACH ROW
EXECUTE PROCEDURE whetheroverlap()
--drop trigger if exists insertoverlap2 on truckEvent

INSERT INTO truckEvent(eventid, eventName, eventStart, plannedEnd) VALUES 
(64, 'Event1', '2017-06-16 14:30', '2017-06-16 20:45'), 
(65, 'Event2', '2017-09-07 15:30', '2017-09-07 18:00'), 
(66, 'Event3', '2017-09-07 17:30', '2017-09-07 21:00');


--注意:  New event Event1 on 2017-06-16 14:30:00  overlaps with the following scheduled events:
--注意:  Hooding
--注意:  New event on 2017-06-16 14:30:00. Don't forget to get clean water!
--注意:  New event on 2017-09-07 15:30:00. Don't forget to get clean water!
--注意:  New event Event3 on 2017-09-07 17:30:00  overlaps with the following scheduled events:
--注意:  Event2
--注意:  Grad Games
--注意:  New event on 2017-09-07 17:30:00. Don't forget to get clean water!
--INSERT 0 3









--注意:  New event Event1 on 2017-06-16 14:30:00  overlaps with the following scheduled events:
--注意:  Hooding
--注意:  New event on 2017-06-16 14:30:00. Don't forget to get clean water!
--注意:  New event Event2 on 2017-09-07 15:30:00  overlaps with the following scheduled events:
--注意:  Event3
--注意:  New event on 2017-09-07 15:30:00. Don't forget to get clean water!
--注意:  New event Event3 on 2017-09-07 17:30:00  overlaps with the following scheduled events:
--注意:  Event2
--注意:  Grad Games
--注意:  New event on 2017-09-07 17:30:00. Don't forget to get clean water!
--INSERT 0 3


SELECT * FROM truckEvent WHERE eventName in( 'Event1', 'Event2', 'Event3') ORDER BY eventName;

delete from truckevent where eventid = 64 or eventid = 65 or eventid = 66;
