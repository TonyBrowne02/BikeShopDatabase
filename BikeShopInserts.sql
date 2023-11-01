-- Suppliers Table
INSERT INTO suppliers (supplierid, suppliername, contactnumber)
VALUES
    (1, 'ABC Bicycle Parts', '123-456-7890'),
    (2, 'XYZ Bike Supplies', '987-654-3210'),
    (3, 'Bike World', '555-555-5555'),
    (4, 'Cycle Pro', '777-888-9999'),
    (5, 'Fast Bikes', '111-222-3333');

-- Bike Parts Table
INSERT INTO bikeparts (partid, partname, suppliercost, consumerprice, suppliers_supplierid)
VALUES
    ('P1', 'Tire', 20.00, 35.00, 1),
    ('P2', 'Brake Pad', 5.00, 12.00, 2),
    ('P3', 'Chain', 10.00, 20.00, 1),
    ('P4', 'Handlebar Grips', 7.50, 15.00, 4),
    ('P5', 'Pedals', 8.00, 18.00, 3);

-- Customers Table
INSERT INTO customer (customerid, firstname, lastname, phonenumber, email)
VALUES
    (1, 'John', 'Smith', '555-1234', 'john.smith@example.com'),
    (2, 'Alice', 'Johnson', '555-5678', 'alice.johnson@example.com'),
    (3, 'Robert', 'Williams', '555-9876', 'robert.williams@example.com'),
    (4, 'Susan', 'Davis', '555-4321', 'susan.davis@example.com'),
    (5, 'Michael', 'Brown', '555-8765', 'michael.brown@example.com');

-- Model Bike Table
INSERT INTO modelbike (modelid, modelname, suppliers_supplierid, quantityinstock)
VALUES
    (1, 'Mountain', 1, 50),
    (2, 'Road', 2, 30),
    (3, 'Hybrid', 3, 40),
    (4, 'Cruiser', 1, 25),
    (5, 'BMX', 4, 15);

-- Customer Bike Table
INSERT INTO customerbike (serialnumber, repairstatus, repairnumber, repairdescription, customer_customerid, modelbike_modelid)
VALUES
    ('SN1', 'A', 'R1234', 'Flat tire', 1, 1),
    ('SN2', 'R', 'R1235', 'Brake replacement', 2, 2),
    ('SN3', 'A', 'R1236', 'Chain repair', 3, 1),
    ('SN4', 'A', 'R1237', 'Handlebar grip replacement', 4, 4),
    ('SN5', 'R', 'R1238', 'Pedal replacement', 5, 3);
