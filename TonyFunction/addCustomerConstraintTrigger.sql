CREATE or replace FUNCTION audit_customer() RETURNS trigger AS $audit_customer$
declare
	uname varchar(80);
	cdate date;
BEGIN
	select user into strict uname;
	select now() into strict cdate;
	insert into "Bike857A".customer_log values (new.customerid, new.firstname, new.lastname, new.phonenumber, new.email, uname, cdate);
	return new;
END;
$audit_customer$ LANGUAGE plpgsql;


CREATE or replace TRIGGER audit_customer after INSERT OR UPDATE ON "Bike857A".customer
FOR EACH ROW EXECUTE FUNCTION audit_customer();