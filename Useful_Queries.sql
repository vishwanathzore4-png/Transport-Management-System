-- Display all customers
SELECT *
FROM customers;

-- Display customers from Maharashtra
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM address
    WHERE state = 'Maharashtra'
);

-- Display customer name with their city and state
SELECT
    c.customer_id,
    c.customer_name,
    c.phone,
    c.email,
    a.city,
    a.state,
    a.pincode
FROM customers c
JOIN address a
ON c.customer_id = a.customer_id;

-- Display all vehicles
SELECT *
FROM vehicale;

-- Find vehicles with capacity greater than 10,000
SELECT
    vehicale_id,
    vehicale_number,
    vehical_type,
    capacity
FROM vehicale
WHERE capacity > 10000;

-- Display all drivers
SELECT *
FROM drivers;

-- Find drivers whose name starts with 'R'
SELECT *
FROM drivers
WHERE driver_name LIKE 'R%';

-- Display all shipment details
SELECT *
FROM shipments;

-- Display only delivered shipments
SELECT *
FROM shipments
WHERE status = 'DELIVERED';

-- Count shipments by status
SELECT
    status,
    COUNT(*) AS total_shipments
FROM shipments
GROUP BY status;

-- Display shipment with customer name
SELECT
    s.shipment_id,
    c.customer_name,
    s.source,
    s.destination,
    s.shipment_date,
    s.status
FROM shipments s
JOIN customers c
ON s.customer_id = c.customer_id;

-- Display shipment with customer, vehicle and driver
SELECT
    s.shipment_id,
    c.customer_name,
    v.vehicale_number,
    v.vehical_type,
    d.driver_name,
    s.source,
    s.destination,
    s.shipment_date,
    s.status
FROM shipments s
JOIN customers c
    ON s.customer_id = c.customer_id
JOIN vehicale v
    ON s.vehicale_id = v.vehicale_id
JOIN drivers d
    ON s.driver_id = d.driver_id;
    

-- Find shipments going to Mumbai
SELECT
    shipment_id,
    source,
    destination,
    shipment_date,
    status
FROM shipments
WHERE destination = 'Mumbai';

-- Find shipments from Mumbai
SELECT
    shipment_id,
    source,
    destination,
    shipment_date,
    status
FROM shipments
WHERE source = 'Mumbai';

-- Find shipments between a date range
SELECT *
FROM shipments
WHERE shipment_date
BETWEEN '2026-03-01' AND '2026-03-10';

-- Display all payment details with shipment information
SELECT
    p.payment_id,
    p.shipment_id,
    p.amount,
    p.payment_date,
    p.payment_status,
    s.source,
    s.destination,
    s.status AS shipment_status
FROM payments p
JOIN shipments s
ON p.shipment_id = s.shipment_id;

-- Find all paid payments
SELECT *
FROM payments
WHERE payment_status = 'PAID';

-- Calculate total payment amount
SELECT
    SUM(amount) AS total_payment_amount
FROM payments;

-- Calculate total paid and pending amount
SELECT
    payment_status,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_status;

-- Find the highest payment
SELECT *
FROM payments
WHERE amount = (
    SELECT MAX(amount)
    FROM payments
);

-- Find the lowest payment
SELECT *
FROM payments
WHERE amount = (
    SELECT MIN(amount)
    FROM payments
);

-- Find shipments where payment is still pending
SELECT
    s.shipment_id,
    c.customer_name,
    s.source,
    s.destination,
    p.amount,
    p.payment_status
FROM shipments s
JOIN customers c
    ON s.customer_id = c.customer_id
JOIN payments p
    ON s.shipment_id = p.shipment_id
WHERE p.payment_status = 'PENDING';

-- Find total payment by shipment status
SELECT
    s.status,
    SUM(p.amount) AS total_amount
FROM shipments s
JOIN payments p
ON s.shipment_id = p.shipment_id
GROUP BY s.status;

-- Find the driver assigned to each shipment
SELECT
    s.shipment_id,
    d.driver_id,
    d.driver_name,
    d.phone,
    s.source,
    s.destination
FROM shipments s
JOIN drivers d
ON s.driver_id = d.driver_id;

-- Multi-table JOIN
SELECT
    s.shipment_id,
    c.customer_name,
    v.vehicale_number,
    d.driver_name,
    s.source,
    s.destination,
    s.status
FROM shipments s
JOIN customers c
    ON s.customer_id = c.customer_id
JOIN vehicale v
    ON s.vehicale_id = v.vehicale_id
JOIN drivers d
    ON s.driver_id = d.driver_id;
    
    
-- Shipment status analysis
SELECT
    status,
    COUNT(*) AS total_shipments
FROM shipments
GROUP BY status;

-- Payment analysis
SELECT
    payment_status,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_status;

-- Pending payments
SELECT
    c.customer_name,
    s.source,
    s.destination,
    p.amount
FROM customers c
JOIN shipments s
    ON c.customer_id = s.customer_id
JOIN payments p
    ON s.shipment_id = p.shipment_id
WHERE p.payment_status = 'PENDING';

-- Driver workload
SELECT
    d.driver_name,
    COUNT(s.shipment_id) AS total_shipments
FROM drivers d
LEFT JOIN shipments s
ON d.driver_id = s.driver_id
GROUP BY d.driver_id, d.driver_name;













