CREATE OR REPLACE FUNCTION bicycle_repair_shop.insert_new_modelbike(
    modelname VARCHAR,
    suppliers_supplierid INTEGER,
    quantityinstock INTEGER
) RETURNS TEXT AS $$
BEGIN
    -- Insert a new bike model without specifying modelid (it will be generated automatically)
    INSERT INTO modelbike (modelname, suppliers_supplierid, quantityinstock)
    VALUES (modelname, suppliers_supplierid, quantityinstock);

    RETURN 'New bike model added successfully.';
EXCEPTION
    WHEN others THEN
        RETURN 'Error: ' || SQLERRM;
END;
$$ LANGUAGE plpgsql;
GRANT EXECUTE ON FUNCTION bicycle_repair_shop.insert_new_modelbike(modelname VARCHAR, suppliers_supplierid INTEGER, quantityinstock INTEGER) TO owner;

CREATE or replace FUNCTION audit_modelbike() RETURNS trigger AS $audit_bike$
declare
	uname varchar(80);
	supplier_id varchar(80);
	cdate date;
BEGIN
	select user into strict uname;
	select now() into strict cdate;
	insert into "Bike857A".model_bike_log values (new.modelid, new.modelname, new.suppliers_supplierid, new.quantityinstock, uname, cdate);
	return new;
END;
$audit_bike$ LANGUAGE plpgsql;

CREATE or replace TRIGGER audit_bike after INSERT OR UPDATE ON "Bike857A".modelbike
FOR EACH ROW EXECUTE FUNCTION audit_bike();
