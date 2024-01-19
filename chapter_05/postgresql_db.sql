/*****************************************************************************
 RDBMS:          PostgreSQL
 Create Date:    01/17/2023
 Author:         Qiang Hao
 Description:    Create all the tables for the scificollective_chapter5 database
                 corresponding to what's covered in Chapter 4.
 Note 1:         This script is for PostgreSQL 14 or above.
 Note 2:         This script assumes that a database is created and used.
*************************************************************************************/

-- Assuming the database scificollective_chapter5 is already created and being used

-- Table payment_method
CREATE TABLE payment_method (
  payment_id SERIAL PRIMARY KEY,
  name VARCHAR(30),
  card_number CHAR(16),
  expiry_date CHAR(4),
  csc CHAR(4),
  billing_address VARCHAR(255),
  email VARCHAR(320),
  CONSTRAINT fk_payment_method_user FOREIGN KEY (email) REFERENCES "user" (email)
);

-- Table product
DROP TABLE IF EXISTS product;
CREATE TABLE product (
  code CHAR(12) PRIMARY KEY,
  name VARCHAR(100),
  description TEXT,
  manufacturer VARCHAR(100),
  photo VARCHAR(1000),
  price NUMERIC(7, 2),
  cost NUMERIC(7, 2),
  inventory_quantity INTEGER
);

-- Table purchase
DROP TABLE IF EXISTS purchase;
CREATE TABLE purchase (
  purchase_id SERIAL PRIMARY KEY,
  total_price NUMERIC(13, 2),
  purchase_time TIMESTAMP,
  product_price NUMERIC(7, 2),
  product_quantity INTEGER,
  payment_id INTEGER,
  email VARCHAR(320),
  CONSTRAINT fk_purchase_payment_method FOREIGN KEY (payment_id) REFERENCES payment_method (payment_id),
  CONSTRAINT fk_purchase_user FOREIGN KEY (email) REFERENCES "user" (email)
);

-- Table purchase_product
DROP TABLE IF EXISTS purchase_product;
CREATE TABLE purchase_product (
  purchase_id INTEGER,
  code CHAR(12),
  PRIMARY KEY (purchase_id, code),
  CONSTRAINT fk_product_has_purchase_product FOREIGN KEY (code) REFERENCES product (code),
  CONSTRAINT fk_product_has_purchase_purchase FOREIGN KEY (purchase_id) REFERENCES purchase (purchase_id)
);

-- Table review
DROP TABLE IF EXISTS review;
CREATE TABLE review (
  review_id SERIAL PRIMARY KEY,
  review_text TEXT,
  review_time TIMESTAMP,
  email VARCHAR(320),
  code CHAR(12),
  CONSTRAINT fk_review_user FOREIGN KEY (email) REFERENCES "user" (email),
  CONSTRAINT fk_review_product FOREIGN KEY (code) REFERENCES product (code)
);

-- Table user
DROP TABLE IF EXISTS "user";
CREATE TABLE "user" (
  email VARCHAR(320) PRIMARY KEY,
  username VARCHAR(30),
  password VARCHAR(20),
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  address VARCHAR(255),
  phone_number VARCHAR(15),
  last_login_time TIMESTAMP
);

-- Table user_address
-- PostgreSQL supports ENUM types, but I've used VARCHAR here for simplicity
-- If you prefer ENUM, you would need to create the ENUM type before creating the table
DROP TABLE IF EXISTS user_address;
CREATE TABLE user_address (
  email VARCHAR(320) PRIMARY KEY,
  street_address VARCHAR(255),
  address_line_optional VARCHAR(100),
  city VARCHAR(100),
  state VARCHAR(2), -- Adjusted from ENUM type
  postal_code CHAR(5),
  CONSTRAINT fk_user_address_user FOREIGN KEY (email) REFERENCES "user" (email)
);