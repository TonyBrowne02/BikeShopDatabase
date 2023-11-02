CREATE OR REPLACE FUNCTION bicycle_repair_shop.insert_new_supplier(
    suppliername VARCHAR,
    contactnumber VARCHAR
) RETURNS TEXT AS $$
BEGIN
    -- Insert a new supplier
    INSERT INTO bicycle_repair_shop.suppliers (suppliername, contactnumber)
    VALUES (suppliername, contactnumber);

    RETURN 'New supplier added successfully.';
EXCEPTION
    WHEN others THEN
        RETURN 'Error: ' || SQLERRM;
END;
$$ LANGUAGE plpgsql;
GRANT EXECUTE ON FUNCTION bicycle_repair_shop.insert_new_supplier(suppliername VARCHAR, contactnumber VARCHAR) TO owner;
