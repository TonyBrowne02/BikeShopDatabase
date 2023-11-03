CREATE OR REPLACE FUNCTION update_bike_repair_status(serial_number INTEGER, new_status CHAR(1))
RETURNS VOID AS $$
BEGIN
    IF new_status = 'R' OR new_status = 'C' OR new_status = 'F' THEN
        UPDATE customerbike
        SET repairstatus = new_status
        WHERE serialnumber = serial_number;
    ELSE
        RAISE EXCEPTION 'Invalid repair status: %', new_status;
    END IF;
EXCEPTION
    WHEN others THEN
        -- Handle exceptions here, if necessary
        RAISE EXCEPTION 'An error occurred in the function: %', SQLERRM;
END;
$$ LANGUAGE plpgsql;


SELECT update_bike_repair_status(1, 'R'::CHAR(1));

select * from customer_bike_log cbl;

select * from customerbike c;
