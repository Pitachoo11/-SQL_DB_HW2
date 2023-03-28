CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    order_date DATE,
    count_product INT
);

INSERT INTO sales (order_date, count_product)
VALUES ('2022-03-01', 156),
       ('2022-03-02', 180),
       ('2022-03-03', 21),
       ('2022-03-04', 124),
       ('2022-03-05', 341);

ALTER TABLE sales
ADD COLUMN order_type VARCHAR(20);

UPDATE sales
SET order_type = CASE
    WHEN count_product < 100 THEN 'small order'
    WHEN count_product BETWEEN 100 AND 300 THEN 'average order'
    ELSE 'big order'
END;

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    employee_id VARCHAR(20),
    amount INT,
    order_status VARCHAR(10),
    order_type VARCHAR(20)
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
    ('EMP001', 500, 'OPEN'),
    ('EMP002', 200, 'CLOSED'),
    ('EMP003', 50, 'OPEN'),
    ('EMP004', 350, 'CLOSED'),
    ('EMP005', 150, 'CANCELLED');

ALTER TABLE orders
ADD COLUMN order_type VARCHAR(20);

SELECT *,
    CASE order_status
        WHEN 'OPEN' THEN 'Order is in open state'
        WHEN 'CLOSED' THEN 'Order is closed'
        WHEN 'CANCELLED' THEN 'Order is cancelled'
        ELSE 'Unknown status'
    END AS full_order_status
FROM orders;