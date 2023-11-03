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


