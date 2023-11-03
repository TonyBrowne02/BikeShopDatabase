
create or replace function audit_customer_bike() returns trigger as $audit_customer_bike$
declare 
	uname varchar(50);
	cdate date;
begin
	select user into strict uname;
	select now() into strict cdate;
	insert into "Bike857A".customer_bike_log values(new.serialnumber, new.repairstatus, new.repairnumber, new.customer_customerid, new.modelbike_modelid, new.repairdescription, uname, cdate);
	return new;
end;
$audit_customer_bike$ language plpgsql;

CREATE TRIGGER customerbike_audit
AFTER UPDATE ON customerbike
FOR EACH ROW
EXECUTE FUNCTION audit_customer_bike();

