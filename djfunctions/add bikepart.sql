CREATE OR REPLACE FUNCTION insert_new_bikepart(
    partname VARCHAR,
    supplier_id INTEGER,
    partdescription VARCHAR
) RETURNS TEXT AS $$
DECLARE
    new_partid VARCHAR;
BEGIN
    -- Generate a UUID for the new 'partid'
    new_partid := uuid_generate_v4()::VARCHAR;

    -- Insert a new bike part
    INSERT INTO bikeparts (partid, partname, suppliers_supplierid, partdescription)
    VALUES (new_partid, partname, supplier_id, partdescription);

    RETURN 'New bike part added successfully.';
EXCEPTION
    WHEN others THEN
        RETURN 'Error: ' || SQLERRM;
END;
$$ LANGUAGE plpgsql;
