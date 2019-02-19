create or replace function maintAlert() returns trigger as
$$
BEGIN
RAISE NOTICE 'New event on % . Don''t forget to get clean water!', new.eventStart;
RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER printMaintAlert
AFTER INSERT ON truckEvent
FOR EACH ROW
EXECUTE PROCEDURE maintAlert()

INSERT INTO truckEvent(eventName, eventStart, plannedEnd) VALUES ('COMP430/530 party', '2018-11-30 2:00 PM', '2018-11-30 2:50 PM');
delete from truckevent where eventid = 71

-- 注意:  New event on 2018-11-30 14:00:00 . Don't forget to get clean water!
-- INSERT 0 1


