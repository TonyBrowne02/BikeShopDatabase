--Creates
-- Create the "suppliers" table
CREATE TABLE suppliers (
    supplierid SERIAL PRIMARY KEY,
    suppliername VARCHAR(50) NOT NULL,
    contactnumber VARCHAR(10) NOT NULL
);

-- Create the "bikeparts" table
CREATE TABLE bikeparts (
    partid serial PRIMARY KEY,
    partname VARCHAR(50) NOT NULL,
    suppliers_supplierid INTEGER NOT NULL,
    partdescription VARCHAR(50) not null
);

-- Create the "customer" table
CREATE TABLE customer (
    customerid SERIAL PRIMARY KEY,
    firstname VARCHAR(25) NOT NULL,
    lastname VARCHAR(25) NOT NULL,
    phonenumber VARCHAR(10) NOT NULL,
    email VARCHAR(50)
);

-- Create the "modelbike" table
CREATE TABLE modelbike (
    modelid SERIAL PRIMARY KEY,
    modelname VARCHAR(50) NOT NULL,
    suppliers_supplierid INTEGER NOT NULL,
    quantityinstock INTEGER not null
);

-- Create the "customerbike" table
CREATE TABLE customerbike (
    serialnumber serial PRIMARY KEY,
    repairstatus CHAR(1) NOT NULL,
    repairnumber VARCHAR(25) NOT NULL,
    customer_customerid INTEGER NOT NULL,
    modelbike_modelid INTEGER NOT NULL,
    repairdescription VARCHAR(255) NOT NULL
);

-- Create the "haspart" table
CREATE TABLE haspart (
    modelbike_modelid INTEGER NOT NULL,
    bikeparts_partid integer NOT NULL,
    partquantity INTEGER,
    PRIMARY KEY (modelbike_modelid, bikeparts_partid)
);

-- Create the "repairdetails" table
CREATE TABLE repairdetails (
    repairid SERIAL PRIMARY KEY,
    customerbike_serialnumber VARCHAR(50) NOT NULL,
    labourhours FLOAT NOT NULL,
    repairdescription VARCHAR(250) NOT NULL
);

-- Create the "usedParts" table
CREATE TABLE usedparts (
    repairdetails_repairid INTEGER NOT NULL,
    bikeparts_partid integer NOT NULL,
    partquantity INTEGER NOT NULL,
    PRIMARY KEY (bikeparts_partid, repairdetails_repairid)
);

--Create the customer_log table
create table customer_log(
    customerid numeric,
    firstname varchar(25),
    lastname varchar(25),
    phonenumber varchar(10),
    email varchar(50),
    usernameCreator varchar(50),
    timeAdded date
);

create table model_bike_log(
	modelid numeric,
    modelname VARCHAR(50),
    suppliers_supplierid INTEGER,
    quantityinstock INTEGER,
	usernameCreator varchar(50),
	timeAdded date
);

CREATE TABLE customer_bike_log (
    serialnumber serial,
    repairstatus CHAR(1),
    repairnumber VARCHAR(25),
    customer_customerid INTEGER,
    modelbike_modelid INTEGER,
    repairdescription VARCHAR(255),
    usernameCreator varchar(50),
	timeAdded date
);
-- Add foreign keys to the tables
ALTER TABLE bikeparts ADD FOREIGN KEY (suppliers_supplierid) REFERENCES suppliers (supplierid);
ALTER TABLE customerbike ADD FOREIGN KEY (customer_customerid) REFERENCES customer (customerid);
ALTER TABLE customerbike ADD FOREIGN KEY (modelbike_modelid) REFERENCES modelbike (modelid);
ALTER TABLE haspart ADD FOREIGN KEY (bikeparts_partid) REFERENCES bikeparts (partid);
ALTER TABLE haspart ADD FOREIGN KEY (modelbike_modelid) REFERENCES modelbike (modelid);
ALTER TABLE modelbike ADD FOREIGN KEY (suppliers_supplierid) REFERENCES suppliers (supplierid);
ALTER TABLE repairdetails ADD FOREIGN KEY (customerbike_serialnumber) REFERENCES customerbike (serialnumber);
ALTER TABLE usedparts ADD FOREIGN KEY (bikeparts_partid) REFERENCES bikeparts (partid);
ALTER TABLE usedparts ADD FOREIGN KEY (repairdetails_repairid) REFERENCES repairdetails (repairid);

--Inserts
-- Insert statements for the "suppliers" table:
INSERT INTO suppliers (suppliername, contactnumber)
VALUES ('Supplier 1', '1234567890');

INSERT INTO suppliers (suppliername, contactnumber)
VALUES ('Supplier 2', '9876543210');

INSERT INTO suppliers (suppliername, contactnumber)
VALUES ('Supplier 3', '1112223333');

INSERT INTO suppliers (suppliername, contactnumber)
VALUES ('Supplier 4', '4445556666');

INSERT INTO suppliers (suppliername, contactnumber)
VALUES ('Supplier 5', '7778889999');

-- Insert statements for the "bikeparts" table:
INSERT INTO bikeparts (partname, suppliers_supplierid, partdescription)
VALUES ('Part A', 1, 'Description A');

INSERT INTO bikeparts (partname, suppliers_supplierid, partdescription)
VALUES ('Part B', 2, 'Description B');

INSERT INTO bikeparts (partname, suppliers_supplierid, partdescription)
VALUES ('Part C', 1, 'Description C');

INSERT INTO bikeparts (partname, suppliers_supplierid, partdescription)
VALUES ('Part D', 3, 'Description D');

INSERT INTO bikeparts (partname, suppliers_supplierid, partdescription)
VALUES ('Part E', 4, 'Description E');

-- Insert statements for the "customer" table:
INSERT INTO customer (firstname, lastname, phonenumber, email)
VALUES ('John', 'Doe', '5551234567', 'john.doe@email.com');

INSERT INTO customer (firstname, lastname, phonenumber, email)
VALUES ('Jane', 'Smith', '5559876543', 'jane.smith@email.com');

INSERT INTO customer (firstname, lastname, phonenumber, email)
VALUES ('Robert', 'Johnson', '5555555555', 'robert.johnson@email.com');

INSERT INTO customer (firstname, lastname, phonenumber, email)
VALUES ('Emily', 'Davis', '5553338888', 'emily.davis@email.com');

INSERT INTO customer (firstname, lastname, phonenumber, email)
VALUES ('Michael', 'Brown', '5557779999', 'michael.brown@email.com');

-- Insert statements for the "modelbike" table:
INSERT INTO modelbike (modelname, suppliers_supplierid, quantityinstock)
VALUES ('Model X', 1, 10);

INSERT INTO modelbike (modelname, suppliers_supplierid, quantityinstock)
VALUES ('Model Y', 2, 15);

INSERT INTO modelbike (modelname, suppliers_supplierid, quantityinstock)
VALUES ('Model Z', 3, 20);

INSERT INTO modelbike (modelname, suppliers_supplierid, quantityinstock)
VALUES ('Model A', 4, 12);

INSERT INTO modelbike (modelname, suppliers_supplierid, quantityinstock)
VALUES ('Model B', 5, 8);

-- Insert statements for the "customerbike" table:
INSERT INTO customerbike (repairstatus, repairnumber, customer_customerid, modelbike_modelid, repairdescription)
VALUES ('R', 'Repair 001', 1, 1, 'Repair description 1');

INSERT INTO customerbike (repairstatus, repairnumber, customer_customerid, modelbike_modelid, repairdescription)
VALUES ('F', 'Repair 002', 2, 2, 'Repair description 2');

INSERT INTO customerbike (repairstatus, repairnumber, customer_customerid, modelbike_modelid, repairdescription)
VALUES ('R', 'Repair 003', 3, 3, 'Repair description 3');

INSERT INTO customerbike (repairstatus, repairnumber, customer_customerid, modelbike_modelid, repairdescription)
VALUES ('F', 'Repair 004', 4, 4, 'Repair description 4');

INSERT INTO customerbike (repairstatus, repairnumber, customer_customerid, modelbike_modelid, repairdescription)
VALUES ('C', 'Repair 005', 5, 5, 'Repair description 5');

--Grants
--Grants
-- CREATE ROLE "C21481174"; Receptionist
-- CREATE ROLE "C21315413"; ShopOwner
-- CREATE ROLE "C21403052"; Mechanic
-- CREATE ROLE "C21403052"; Customer

--Tony Function Permissions add"C21403052", Receptionist
GRANT USAGE ON schema "Bike857A" TO "C21481174";
--GRANT execute ON function "Bike857A".addCustomer to "C21481174";--must run creation of addCustomer function and audit_Customer function and trigger before
GRANT select on table "Bike857A".customer to "C21481174";
GRANT insert on table "Bike857A".customer to "C21481174";
grant update on sequence customer_customerid_seq to "C21481174";
GRANT update ON table "Bike857A".customer to "C21481174";
grant insert on table "Bike857A".customer_log to "C21481174";

--DJ Function Permissions addSupplier, addBikePart, addBikeModel
GRANT USAGE ON schema "Bike857A" TO "C21315413";
GRANT INSERT ON "Bike857A".bikeparts TO "C21315413";
GRANT INSERT ON "Bike857A".suppliers TO "C21315413";
GRANT INSERT ON "Bike857A".modelbike TO "C21315413";
--Grant execute on function "Bike857A".addBikeModel to "C21315413"; --must run creation of insert_new_modelbike and audit_modelbike function and trigger before

--Aaron Function Permissions update_bike_repair_status
grant usage on schema "Bike857A" to "C21403052";
grant select on table customerbike to "C21403052";
grant select on table bikeparts to "C21403052";
grant update on table customerbike to "C21403052";
grant insert on table repairdetails to "C21403052";
grant insert on table usedParts to "C21403052";
--Grant execute on fucntion "Bike857A".update_bike_repair_status to "C21403052"; --must run creation of update_bike_repair_status and audit_customer_bike
