-- Inventory Management System Database


CREATE DATABASE  inventory_db;
USE inventory_db;

-- TABLE: Categories
 create TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- TABLE: Suppliers
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

-- TABLE: Products
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    supplier_id INT,
    unit_price DECIMAL(10, 2),
    quantity_in_stock INT DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- TABLE: Stock Entries (Inventory transactions)
CREATE TABLE stock_entries (
    entry_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity_change INT,
    entry_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sample Data Insertion
INSERT INTO categories (category_name) VALUES
('Electronics'), ('Office Supplies'), ('Groceries');

INSERT INTO suppliers (supplier_name, contact_email, phone) VALUES
('TechPoint Ltd', 'contact@techpoint.com', '0712345678'),
('OfficePro', 'support@officepro.co.ke', '0722123456');

INSERT INTO products (product_name, category_id, supplier_id, unit_price, quantity_in_stock) VALUES
('Laptop', 1, 1, 75000.00, 10),
('Printer', 1, 2, 20000.00, 5),
('Stapler', 2, 2, 250.00, 50),
('Sugar (1kg)', 3, NULL, 150.00, 100);

INSERT INTO stock_entries (product_id, quantity_change, description) VALUES
(1, 5, 'Restocked Laptops'),
(3, -10, 'Sold 10 staplers'),
(4, 20, 'Restocked Sugar');
