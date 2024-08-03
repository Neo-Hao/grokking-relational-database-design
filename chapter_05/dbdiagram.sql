/*****************************************************************************
 RDBMS:          MySQL
 Create Date:    01/18/2023
 Author:         Qiang Hao
 Description:    Create all the tables for the scificollective_chapter5 database
                  corresponding to what's covered in Chapter 5.
 *************************************************************************************/

-- drop database scificollective_chapter5 if it exists
DROP DATABASE IF EXISTS scificollective_chapter5;

-- create database scificollective_chapter5
-- character set utf8
CREATE DATABASE IF NOT EXISTS scificollective_chapter5 
CHARACTER SET utf8 
COLLATE utf8_general_ci;

-- Use the database
USE scificollective_chapter5;

-- Table payment_method
DROP TABLE IF EXISTS payment_method;
CREATE TABLE payment_method (
  payment_id INT PRIMARY KEY,
  name VARCHAR(30),
  card_number CHAR(16),
  expiry_date CHAR(4),
  email VARCHAR(320),
  CONSTRAINT fk_payment_method_user FOREIGN KEY (email) REFERENCES user (email)
);

-- Table product
DROP TABLE IF EXISTS product;
CREATE TABLE product (
  code CHAR(12) PRIMARY KEY,
  name VARCHAR(100),
  description TEXT,
  manufacturer VARCHAR(100),
  photo VARCHAR(1000),
  price DECIMAL(7, 2),
  cost DECIMAL(7, 2),
  inventory_quantity INT
);

-- Table purchase
DROP TABLE IF EXISTS purchase;
CREATE TABLE purchase (
  purchase_id INT PRIMARY KEY,
  total_price DECIMAL(13, 2),
  purchase_time TIMESTAMP,
  product_price DECIMAL(7, 2),
  product_quantity INT,
  payment_id INT,
  email VARCHAR(320),
  CONSTRAINT fk_purchase_payment_method FOREIGN KEY (payment_id) REFERENCES payment_method (payment_id),
  CONSTRAINT fk_purchase_user FOREIGN KEY (email) REFERENCES user (email)
);

-- Table purchase_product
DROP TABLE IF EXISTS purchase_product;
CREATE TABLE purchase_product (
  purchase_id INT,
  code CHAR(12),
  PRIMARY KEY (purchase_id, code),
  CONSTRAINT fk_product_has_purchase_product FOREIGN KEY (code) REFERENCES product (code),
  CONSTRAINT fk_product_has_purchase_purchase FOREIGN KEY (purchase_id) REFERENCES purchase (purchase_id)
); 

-- Table review
DROP TABLE IF EXISTS review;
CREATE TABLE review (
  review_id INT PRIMARY KEY,
  review_text TEXT,
  review_time TIMESTAMP,
  email VARCHAR(320),
  code CHAR(12),
  CONSTRAINT fk_review_user FOREIGN KEY (email) REFERENCES user (email),
  CONSTRAINT fk_review_product FOREIGN KEY (code) REFERENCES product (code)
);

-- Table user
DROP TABLE IF EXISTS user;
CREATE TABLE user (
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
DROP TABLE IF EXISTS user_address;
CREATE TABLE user_address (
  email VARCHAR(320) PRIMARY KEY,
  street_address VARCHAR(255),
  address_line_optional VARCHAR(100),
  city VARCHAR(100),
  state VARCHAR(20),
  postal_code CHAR(5),
  CONSTRAINT fk_user_address_user FOREIGN KEY (email) REFERENCES user (email)
);

-- Table billing_address
DROP TABLE IF EXISTS billing_address;
CREATE TABLE billing_address (
  payment_id INT PRIMARY KEY,
  street_address VARCHAR(255),
  address_line_optional VARCHAR(100),
  city VARCHAR(100),
  state VARCHAR(20),
  postal_code CHAR(5),
  CONSTRAINT fk_payment_method_billing_address FOREIGN KEY (payment_id) REFERENCES payment_method (payment_id)
);