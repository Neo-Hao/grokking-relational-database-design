/*****************************************************************************
 RDBMS:          SQL server
 Create Date:    01/16/2024
 Author:         Qiang Hao
 Description:    Create all the tables for the scificollective database
                 corresponding to what's covered in Chapter 4.
 Note:           This script is for SQL Server 2019 or above.
 *************************************************************************************/

-- Check if the database exists and drop it
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'scificollective_chapter5')
DROP DATABASE scificollective_chapter5;

-- Create database
CREATE DATABASE scificollective_chapter5;

-- Use the database
USE scificollective_chapter5;

-- Table payment_method
CREATE TABLE payment_method (
  payment_id INT IDENTITY PRIMARY KEY,
  name NVARCHAR(30),
  card_number CHAR(16),
  expiry_date CHAR(4),
  csc CHAR(4),
  billing_address NVARCHAR(255),
  email NVARCHAR(320)
);

-- Table product
DROP TABLE IF EXISTS product;
CREATE TABLE product (
  code CHAR(12) PRIMARY KEY,
  name NVARCHAR(100),
  description NVARCHAR(MAX),
  manufacturer NVARCHAR(100),
  photo NVARCHAR(1000),
  price DECIMAL(7, 2),
  cost DECIMAL(7, 2),
  inventory_quantity INT
);

-- Table purchase
DROP TABLE IF EXISTS purchase;
CREATE TABLE purchase (
  purchase_id INT IDENTITY PRIMARY KEY,
  total_price DECIMAL(13, 2),
  purchase_time DATETIME,
  product_price DECIMAL(7, 2),
  product_quantity INT,
  payment_id INT,
  email NVARCHAR(320)
);

-- Table purchase_product
DROP TABLE IF EXISTS purchase_product;
CREATE TABLE purchase_product (
  purchase_id INT,
  code CHAR(12),
  PRIMARY KEY (purchase_id, code)
);

-- Table review
DROP TABLE IF EXISTS review;
CREATE TABLE review (
  review_id INT IDENTITY PRIMARY KEY,
  review_text NVARCHAR(MAX),
  review_time DATETIME,
  email NVARCHAR(320),
  code CHAR(12)
);

-- Table user
DROP TABLE IF EXISTS [user];
CREATE TABLE [user] (
  email NVARCHAR(320) PRIMARY KEY,
  username NVARCHAR(30),
  password NVARCHAR(20),
  first_name NVARCHAR(50),
  last_name NVARCHAR(50),
  address NVARCHAR(255),
  phone_number NVARCHAR(15),
  last_login_time DATETIME
);

-- Table user_address
DROP TABLE IF EXISTS user_address;
CREATE TABLE user_address (
  email NVARCHAR(320) PRIMARY KEY,
  street_address NVARCHAR(255),
  address_line_optional NVARCHAR(100),
  city NVARCHAR(100),
  state CHAR(2), -- Adjusted from ENUM type
  postal_code CHAR(5)
);

-- Add foreign key constraints
ALTER TABLE payment_method ADD CONSTRAINT fk_payment_method_user FOREIGN KEY (email) REFERENCES [user] (email);
ALTER TABLE purchase ADD CONSTRAINT fk_purchase_payment_method FOREIGN KEY (payment_id) REFERENCES payment_method (payment_id);
ALTER TABLE purchase ADD CONSTRAINT fk_purchase_user FOREIGN KEY (email) REFERENCES [user] (email);
ALTER TABLE purchase_product ADD CONSTRAINT fk_product_has_purchase_product FOREIGN KEY (code) REFERENCES product (code);
ALTER TABLE purchase_product ADD CONSTRAINT fk_product_has_purchase_purchase FOREIGN KEY (purchase_id) REFERENCES purchase (purchase_id);
ALTER TABLE review ADD CONSTRAINT fk_review_user FOREIGN KEY (email) REFERENCES [user] (email);
ALTER TABLE review ADD CONSTRAINT fk_review_product FOREIGN KEY (code) REFERENCES product (code);
ALTER TABLE user_address ADD CONSTRAINT fk_user_address_user FOREIGN KEY (email) REFERENCES [user] (email);
