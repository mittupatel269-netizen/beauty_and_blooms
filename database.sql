CREATE DATABASE IF NOT EXISTS beauty_blooms CHARACTER SET utf8mb4;
USE beauty_blooms;
CREATE TABLE IF NOT EXISTS users(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(120),email VARCHAR(180) UNIQUE,password VARCHAR(255),role ENUM('user','admin') DEFAULT 'user');
CREATE TABLE IF NOT EXISTS categories(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(80) UNIQUE);
CREATE TABLE IF NOT EXISTS products(id INT AUTO_INCREMENT PRIMARY KEY,category_id INT NULL,name VARCHAR(160),description TEXT,price DECIMAL(10,2),image_url TEXT,stock INT DEFAULT 10,FOREIGN KEY(category_id) REFERENCES categories(id) ON DELETE SET NULL);
CREATE TABLE IF NOT EXISTS orders(id INT AUTO_INCREMENT PRIMARY KEY,user_id INT,total DECIMAL(10,2),customer_name VARCHAR(120),phone VARCHAR(30),address TEXT,status VARCHAR(30) DEFAULT 'Pending',created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,FOREIGN KEY(user_id) REFERENCES users(id));
CREATE TABLE IF NOT EXISTS order_items(id INT AUTO_INCREMENT PRIMARY KEY,order_id INT,product_id INT NULL,product_name VARCHAR(160),price DECIMAL(10,2),quantity INT,FOREIGN KEY(order_id) REFERENCES orders(id) ON DELETE CASCADE);
INSERT IGNORE INTO categories(name) VALUES('Skincare'),('Makeup'),('Haircare'),('Fragrance');
INSERT INTO products(category_id,name,description,price,image_url,stock)
SELECT id,'Rose Glow Serum','A lightweight daily serum for a fresh, dewy look.',599,'https://images.unsplash.com/photo-1608248543803-ba4f8c70ae0b?w=800',25 FROM categories WHERE name='Skincare' AND NOT EXISTS(SELECT 1 FROM products WHERE name='Rose Glow Serum');
INSERT INTO products(category_id,name,description,price,image_url,stock)
SELECT id,'Petal Pink Lip Tint','A soft pop of colour for everyday looks.',349,'https://images.unsplash.com/photo-1586495777744-4413f21062fa?w=800',30 FROM categories WHERE name='Makeup' AND NOT EXISTS(SELECT 1 FROM products WHERE name='Petal Pink Lip Tint');
INSERT INTO products(category_id,name,description,price,image_url,stock)
SELECT id,'Silk Shine Hair Oil','A lightweight hair finishing oil.',525,'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?w=800',20 FROM categories WHERE name='Haircare' AND NOT EXISTS(SELECT 1 FROM products WHERE name='Silk Shine Hair Oil');
