USE CarDealership2026;

-- =========================
-- Section 6: SQL Data Queries
-- =========================

-- Section 6, Query 1: JOIN
SELECT 
    s._id AS sale_id,
    c.model_name,
    cu.name AS customer_name,
    e.name AS employee_name,
    d.name AS dealership_name,
    s.sale_date,
    s.original_price,
    s.discount_amount,
    s.final_price
FROM Sale s
JOIN Car c ON s._car_vin = c._vin
JOIN Customer cu ON s._customer_id = cu._id
JOIN Employee e ON s._employee_id = e._id
JOIN Dealership d ON s._dealership_id = d._id;


-- Section 6, Query 2: GROUP BY and HAVING
SELECT 
    m.name AS manufacturer_name,
    AVG(c.price) AS average_car_price
FROM Manufacturer m
JOIN Car c ON m._id = c._manufacturer_id
GROUP BY m._id, m.name
HAVING AVG(c.price) > 40000;


-- Section 6, Query 3: IN 
SELECT 
    c._vin,
    c.model_name,
    c.price,
    c.color
FROM Car c
WHERE c._vin IN (
    SELECT s._car_vin
    FROM Sale s
    WHERE s._dealership_id IN (1, 2, 3)
);

-- =========================
-- Section 7: SQL Programming
-- =========================

-- Section 7.1 : Function

DROP FUNCTION IF EXISTS GetDiscountedPrice;

DELIMITER //

CREATE FUNCTION GetDiscountedPrice(
    original DECIMAL(12,2),
    discount DECIMAL(12,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN original - discount;
END //

DELIMITER ;

#SELECT 
    #_id,
    #original_price,
    #discount_amount,
    #GetDiscountedPrice(original_price, discount_amount) AS computed_final_price
#FROM Sale;


-- Section 7.2 : Procedure

DROP PROCEDURE IF EXISTS ShowAvailableCars;

DELIMITER //

CREATE PROCEDURE ShowAvailableCars()
BEGIN
    SELECT 
        c._vin,
        c.model_name,
        c.year,
        c.price,
        c.color,
        d.name AS dealership_name
    FROM Car c
    JOIN Inventory i ON c._vin = i._car_vin
    JOIN Dealership d ON i._dealership_id = d._id
    WHERE i.status = 'Available';
END //

DELIMITER ;

CALL ShowAvailableCars();

-- Section 7.3 Trigger

DROP TRIGGER IF EXISTS trg_after_sale_insert;

DELIMITER //

CREATE TRIGGER trg_after_sale_insert
AFTER INSERT ON Sale
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET status = 'Sold',
        stock_out_date = NEW.sale_date
    WHERE _car_vin = NEW._car_vin;
END //

DELIMITER ;

SELECT * FROM Inventory WHERE _car_vin = '12345AUD';


-- =========================
-- Section 8: Table Modifications
-- =========================

-- Section 8, Update example (safe mode compatible)
SELECT _id, name, position, salary
FROM Employee
WHERE position = 'Sales Consultant';

UPDATE Employee
SET salary = salary + 500
WHERE _id IN (1, 3, 4, 5, 6, 7);

SELECT * FROM Employee;


-- Section 8, Delete example 
SELECT _id, _car_vin, status
FROM Inventory
WHERE status = 'Reserved';

DELETE FROM Inventory
WHERE _id = 5;

SELECT * FROM Inventory;






