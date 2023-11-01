INSERT INTO suppliers (suppliername, contactnumber) VALUES
('Supplier 1', '1234567890'),
('Supplier 2', '9876543210'),
('Supplier 3', '5555555555'),
('Supplier 4', '8888888888'),
('Supplier 5', '7777777777');
INSERT INTO bikeparts (partid, partname, suppliers_supplierid, bikeparts_partid, partdescription) VALUES
('BP001', 'Handlebar', 1, NULL, 'Standard handlebar'),
('BP002', 'Seat', 2, NULL, 'Comfortable seat'),
('BP003', 'Tire', 1, NULL, 'Highperformance tire'),
('BP004', 'Brake', 3, NULL, 'Disc brake system'),
('BP005', 'Pedal', 4, NULL, 'Lightweight pedals');
INSERT INTO customer (firstname, lastname, phonenumber, email) VALUES
('John', 'Doe', '5551234', 'john.doe@example.com'),
('Jane', 'Smith', '5555678', 'jane.smith@example.com'),
('Bob', 'Johnson', '5559876', NULL),
('Alice', 'Williams', '5554321', 'alice.w@example.com'),
('Chris', 'Brown', '5553456', NULL);
INSERT INTO modelbike (modelname, suppliers_supplierid, quantityinstock) VALUES
('Mountain Bike', 1, 10),
('Road Bike', 2, 8),
('City Bike', 3, 15),
('Hybrid Bike', 2, 12),
('BMX Bike', 4, 5);
INSERT INTO customerbike (serialnumber, repairstatus, repairnumber, customer_customerid, modelbike_modelid, repairdescription) VALUES
('CB001', 'R', 'R001', 1, 1, 'Wheel replacement'),
('CB002', 'C', 'R002', 2, 2, 'Tire repair'),
('CB003', 'R', 'R003', 3, 1, 'Brake maintenance'),
('CB004', 'R', 'R004', 4, 4, 'Chain replacement'),
('CB005', 'F', 'R005', 5, 3, 'Seat adjustment');
-- Sample data for haspart
INSERT INTO haspart (modelbike_modelid, bikeparts_partid, partquantity) VALUES
(1, 'BP001', 10),
(2, 'BP002', 5),
(3, 'BP003', 12),
(4, 'BP004', 8),
(5, 'BP005', 15);
INSERT INTO repairdetails (customerbike_serialnumber, labourhours, repairdescription) VALUES
('CB001', 2.5, 'Wheel replacement and alignment'),
('CB002', 1.2, 'Tire puncture repair'),
('CB003', 3.0, 'Brake pad replacement'),
('CB004', 2.8, 'Chain installation and lubrication'),
('CB005', 1.5, 'Seat height adjustment');
-- Sample data for usedparts
INSERT INTO usedparts (repairdetails_repairid, bikeparts_partid, partquantity) VALUES
(1, 'BP001', 2),
(2, 'BP003', 4),
(3, 'BP004', 2),
(4, 'BP002', 1),
(5, 'BP005', 3);
