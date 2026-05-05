DROP DATABASE IF EXISTS CarDealership2026;
CREATE DATABASE IF NOT EXISTS CarDealership2026;
USE CarDealership2026;

-- 1. Manufacturer
CREATE TABLE Manufacturer (
    _id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    country VARCHAR(50),
    headquarters_contact VARCHAR(100)
);

-- 2. Dealership 
CREATE TABLE Dealership (
    _id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- 3. Car 
CREATE TABLE Car (
    _vin VARCHAR(50) PRIMARY KEY,
    model_name VARCHAR(100) UNIQUE NOT NULL,
    year INT,
    price DECIMAL(15,2),
    color VARCHAR(30),
    _manufacturer_id INT,
    CONSTRAINT fk_manufacturer
        FOREIGN KEY (_manufacturer_id) REFERENCES Manufacturer(_id)
        ON DELETE SET NULL
);

-- 4. Employee 
CREATE TABLE Employee (
    _id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    salary INT,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20) UNIQUE,
    address VARCHAR(255),
    _dealership_id INT,
    FOREIGN KEY (_dealership_id) REFERENCES Dealership(_id)
);

-- 5. Customer 
CREATE TABLE Customer (
    _id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20) UNIQUE,
    address VARCHAR(255),
    occupation VARCHAR(100)
);

-- 6. Inventory 
CREATE TABLE Inventory (
    _id INT AUTO_INCREMENT PRIMARY KEY,
    _car_vin VARCHAR(50) NOT NULL,
    _dealership_id INT NOT NULL,
    stock_in_date DATE NOT NULL,
    stock_out_date DATE,
    status ENUM('Available', 'Reserved', 'Sold') DEFAULT 'Available',
    FOREIGN KEY (_car_vin) REFERENCES Car(_vin) ON DELETE CASCADE,
    FOREIGN KEY (_dealership_id) REFERENCES Dealership(_id) ON DELETE CASCADE
);

-- 7. Sale 
CREATE TABLE Sale (
    _id INT AUTO_INCREMENT PRIMARY KEY,
    sale_date DATE NOT NULL,
    original_price DECIMAL(12, 2),
    discount_amount DECIMAL(12, 2) DEFAULT 0,
    final_price DECIMAL(12, 2) AS (original_price - discount_amount) VIRTUAL,
    _car_vin VARCHAR(50) NOT NULL UNIQUE, 
    _customer_id INT NOT NULL,
    _employee_id INT NOT NULL,
    _dealership_id INT NOT NULL,
    FOREIGN KEY (_car_vin) REFERENCES Car(_vin),
    FOREIGN KEY (_customer_id) REFERENCES Customer(_id),
    FOREIGN KEY (_employee_id) REFERENCES Employee(_id),
    FOREIGN KEY (_dealership_id) REFERENCES Dealership(_id)
);



-- =========================
-- INSERT DATA
-- =========================

-- 1. Tesla
INSERT INTO Manufacturer(name, country, headquarters_contact) 
VALUES ('Tesla', 'USA', '+1 650-681-5000'); 

INSERT INTO Dealership(name, location, phone_number, email) 
VALUES ('TeslaDenmark', 'Copenhagen', '1234-5678', 'tdenmark@tesla.com');

INSERT INTO Car (_vin, model_name, year, price, color, _manufacturer_id) 
VALUES ('12345AAA', 'Model3', 2024, 50000, 'White', 1);

INSERT INTO Employee(name, position, salary, email, phone, address, _dealership_id) 
VALUES ('Tom', 'Sales Consultant', 5000, 'tom@tesla.com', '1234-5679', 'Lyngby', 1);

INSERT INTO Customer(name, email, phone, address, occupation) 
VALUES ('Peter', 'peter@email.com', '1234-5670', 'Naerum', 'Singer');

INSERT INTO Inventory(_car_vin, _dealership_id, stock_in_date, stock_out_date, status) 
VALUES ('12345AAA', 1, '2026-01-01', '2026-01-05', 'Sold');

INSERT INTO Sale(sale_date, original_price, discount_amount, _car_vin, _customer_id, _employee_id, _dealership_id) 
VALUES ('2026-01-05', 50000, 1000, '12345AAA', 1, 1, 1);




-- 2. Hyundai
INSERT INTO Manufacturer(name, country, headquarters_contact) 
VALUES ('Hyundai', 'Korea', '+82 02-3464-1114'); 

INSERT INTO Dealership(name, location, phone_number, email) 
VALUES ('HyundaiDenmark', 'Odense', '1234-1234', 'hdenmark@hyundai.com');

INSERT INTO Car (_vin, model_name, year, price, color, _manufacturer_id) 
VALUES ('12345AAB', 'IONIQ6', 2023, 100000, 'Red', 2);

INSERT INTO Employee(name, position, salary, email, phone, address, _dealership_id) 
VALUES ('Jin', 'Manager', 7000, 'jin@hyundai.com', '1234-1235', 'Lyngby', 2);

INSERT INTO Customer(name, email, phone, address, occupation) 
VALUES ('Olivia', 'olivia@email.com', '1234-1244', 'Naerum', 'Writer');

INSERT INTO Inventory(_car_vin, _dealership_id, stock_in_date, stock_out_date, status) 
VALUES ('12345AAB', 2, '2023-12-01', '2024-01-29', 'Sold');

INSERT INTO Sale(sale_date, original_price, discount_amount, _car_vin, _customer_id, _employee_id, _dealership_id) 
VALUES ('2024-01-29', 100000, 2000, '12345AAB', 2, 2, 2);


-- 3. Benz
INSERT INTO Manufacturer(name, country, headquarters_contact) 
VALUES ('Benz', 'Germany', '+49 711-17'); 

INSERT INTO Dealership(name, location, phone_number, email) 
VALUES ('BenzDenmark', 'Aarhus', '1234-0000', 'bdenmark@benz.com');

INSERT INTO Car (_vin, model_name, year, price, color, _manufacturer_id) 
VALUES ('12345ART', 'EClass', 2023, 70000, 'Black', 3);

INSERT INTO Employee(name, position, salary, email, phone, address, _dealership_id) 
VALUES ('Karen', 'Sales Consultant', 7000, 'karen@benz.com', '1234-5690', 'Glostrup', 3);

INSERT INTO Customer(name, email, phone, address, occupation) 
VALUES ('Benjamin', 'benjamin@email.com', '1234-5867', 'Ballerup', 'Programmer');

INSERT INTO Inventory(_car_vin, _dealership_id, stock_in_date, stock_out_date, status) 
VALUES ('12345ART', 3, '2023-04-05', '2023-05-05', 'Sold');

INSERT INTO Sale(sale_date, original_price, discount_amount, _car_vin, _customer_id, _employee_id, _dealership_id) 
VALUES ('2023-05-05', 70000, 5000, '12345ART', 3, 3, 3);




-- 4. Jeep
INSERT INTO Manufacturer(name, country, headquarters_contact) 
VALUES ('Jeep','USA', '+1-800-334-9200'); 

INSERT INTO Dealership(name, location, phone_number, email) 
VALUES ('JeepDenmark', 'Copenhagen', '1234-9090', 'jdenmark@jeep.com');

INSERT INTO Car (_vin, model_name, year, price, color, _manufacturer_id) 
VALUES ('12345BRE', 'Wrangler', 2024, 30000, 'Blue', 4);

INSERT INTO Employee(name, position, salary, email, phone, address, _dealership_id) 
VALUES ('Simon', 'Sales Consultant', 4000, 'simon@jeep.com', '1234-4765', 'Billund', 4);

INSERT INTO Customer(name, email, phone, address, occupation) 
VALUES ('Ashley', 'ashley@email.com', '1234-8970', 'Kolding', 'Teacher');

INSERT INTO Inventory(_car_vin, _dealership_id, stock_in_date, stock_out_date, status) 
VALUES ('12345BRE', 4, '2024-01-01', '2024-01-05', 'Sold');

INSERT INTO Sale(sale_date, original_price, discount_amount, _car_vin, _customer_id, _employee_id, _dealership_id) 
VALUES ('2024-01-05', 30000, 1000, '12345BRE', 4, 4, 4);




-- 5. BMW
INSERT INTO Manufacturer(name, country, headquarters_contact) 
VALUES ('BMW', 'Germany', '+49 89 382 0');

INSERT INTO Dealership(name, location, phone_number, email) 
VALUES ('BMWDenmark', 'Aalborg', '2233-4455', 'bmwdenmark@bmw.com');

INSERT INTO Car (_vin, model_name, year, price, color, _manufacturer_id) 
VALUES ('12345BMW', 'BMWX5', 2024, 85000, 'Grey', 5);

INSERT INTO Employee(name, position, salary, email, phone, address, _dealership_id) 
VALUES ('Lars', 'Sales Consultant', 5500, 'lars@bmw.com', '2233-4466', 'Aalborg', 5);

INSERT INTO Customer(name, email, phone, address, occupation) 
VALUES ('Emma', 'emma@email.com', '2233-4477', 'Aalborg', 'Architect');

INSERT INTO Inventory(_car_vin, _dealership_id, stock_in_date, stock_out_date, status) 
VALUES ('12345BMW', 5, '2024-02-01', NULL, 'Reserved');



-- 6. Toyota
INSERT INTO Manufacturer(name, country, headquarters_contact) 
VALUES ('Toyota', 'Japan', '+81 565-28-2121');

INSERT INTO Dealership(name, location, phone_number, email) 
VALUES ('ToyotaDenmark', 'Esbjerg', '3344-5566', 'toyotadenmark@toyota.com');

INSERT INTO Car (_vin, model_name, year, price, color, _manufacturer_id) 
VALUES ('12345TOY', 'CorollaHybrid', 2023, 32000, 'Silver', 6);

INSERT INTO Employee(name, position, salary, email, phone, address, _dealership_id) 
VALUES ('Mia', 'Sales Consultant', 4800, 'mia@toyota.com', '3344-5577', 'Esbjerg', 6);

INSERT INTO Customer(name, email, phone, address, occupation) 
VALUES ('Noah', 'noah@email.com', '3344-5588', 'Varde', 'Engineer');

INSERT INTO Inventory(_car_vin, _dealership_id, stock_in_date, stock_out_date, status) 
VALUES ('12345TOY', 6, '2023-09-10', '2023-09-25', 'Sold');

INSERT INTO Sale(sale_date, original_price, discount_amount, _car_vin, _customer_id, _employee_id, _dealership_id) 
VALUES ('2023-09-25', 32000, 1500, '12345TOY', 6, 6, 6);




-- 7. Audi
INSERT INTO Manufacturer(name, country, headquarters_contact) 
VALUES ('Audi', 'Germany', '+49 841 89 0');

INSERT INTO Dealership(name, location, phone_number, email) 
VALUES ('AudiDenmark', 'Roskilde', '4455-6677', 'audidenmark@audi.com');

INSERT INTO Car (_vin, model_name, year, price, color, _manufacturer_id) 
VALUES ('12345AUD', 'AudiA4', 2025, 61000, 'Black', 7);

INSERT INTO Employee(name, position, salary, email, phone, address, _dealership_id) 
VALUES ('Freja', 'Sales Consultant', 5300, 'freja@audi.com', '4455-6688', 'Roskilde', 7);

INSERT INTO Customer(name, email, phone, address, occupation) 
VALUES ('Lucas', 'lucas@email.com', '4455-6699', 'Hedehusene', 'Lawyer');

INSERT INTO Inventory(_car_vin, _dealership_id, stock_in_date, stock_out_date, status) 
VALUES ('12345AUD', 7, '2025-01-12', NULL, 'Available');



#SELECT * FROM Manufacturer;
#SELECT * FROM Dealership;
#SELECT * FROM Car;
#SELECT * FROM Employee;
#SELECT * FROM Customer;
#SELECT * FROM Inventory;
#SELECT * FROM Sale;


