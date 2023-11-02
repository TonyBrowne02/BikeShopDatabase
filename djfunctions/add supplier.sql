CREATE OR REPLACE FUNCTION insert_new_supplier(
    suppliername VARCHAR,
    contactnumber VARCHAR
) RETURNS TEXT AS $$
BEGIN
    -- Insert a new supplier
    INSERT INTO suppliers (suppliername, contactnumber)
    VALUES (suppliername, contactnumber);

    RETURN 'New supplier added successfully.';
EXCEPTION
    WHEN others THEN
        RETURN 'Error: ' || SQLERRM;
END;
$$ LANGUAGE plpgsql;
