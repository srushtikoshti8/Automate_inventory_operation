--create the product table

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(25) NOT NULL,
    stock_quantity INT NOT NULL ,
    price NUMBER(10, 2) NOT NULL
);


--Insert date into product table

INSERT INTO products (product_name, stock_quantity, price) VALUES
('Laptop', 50, 1200.00),
('Keyboard', 150, 75.50),
('Mouse', 200, 25.00),
('Monitor', 30, 300.75),
('Webcam', 100, 50.00);







-- Procedure to add a new product

DELIMITER $$
CREATE PROCEDURE AddNewProduct(
    IN p_name VARCHAR(255),
    IN p_quantity INT,
    IN p_price DECIMAL(10, 2)
)
BEGIN
    INSERT INTO products (product_name, stock_quantity, price)
    VALUES (p_name, p_quantity, p_price);
END$$
DELIMITER ;




-- Procedure to update the stock of an existing product

DELIMITER $$
CREATE PROCEDURE UpdateProductStock(
    IN p_id INT,
    IN p_quantity_change INT
)
BEGIN
    UPDATE products
    SET stock_quantity = stock_quantity + p_quantity_change
    WHERE product_id = p_id;
END$$
DELIMITER ;


-- to add the new product 

CALL AddNewProduct('Laptop', 50, 1200.00);


-- to update product stock

CALL UpdateProductStock(1, 20);


