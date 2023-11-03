CREATE OR REPLACE FUNCTION addCustomer(fname varchar(25), lname varchar(25), phonenum varchar(10), email varchar(50))
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
DECLARE
      v_customer_id integer;
begin
        insert into "Bike857A".customer (firstname, lastname, phonenumber, email)
		values (fname, lname, phonenum, email) returning customerid into v_customer_id;
        RETURN v_customer_id;
exception
when others then
        RAISE INFO 'Error Name:%',SQLERRM;
        RAISE INFO 'Error State:%', SQLSTATE;
        return null;
END;
$function$;

CREATE or replace FUNCTION audit_customer() RETURNS trigger AS $audit_customer$
declare
	uname varchar(80);
	supplier_id varchar(80);
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

select addCustomer('Joey','Scmhoey','1234567890','joeySchmoey@email.com');

