CREATE OR REPLACE FUNCTION insert_new_modelbike(
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
