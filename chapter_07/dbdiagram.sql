/*****************************************************************************
 RDBMS:          MySQL
 Create Date:    08/03/2024
 Author:         Qiang Hao
 Description:    Create all the tables for the scificollective_chapter7 database
                  corresponding to what's covered in Chapter 7
 *************************************************************************************/

-- drop database scificollective_chapter7 if it exists
DROP DATABASE IF EXISTS scificollective_chapter7;

-- create database scificollective_chapter7
-- character set utf8
CREATE DATABASE IF NOT EXISTS scificollective_chapter7 
CHARACTER SET utf8 
COLLATE utf8_general_ci;

USE scificollective_chapter7;


-- Table state
CREATE TABLE IF NOT EXISTS state (
  state_id CHAR(2) PRIMARY KEY,
  state VARCHAR(20) NOT NULL
);

-- Table address
CREATE TABLE IF NOT EXISTS address (
  address_id INT PRIMARY KEY AUTO_INCREMENT,
  street_address VARCHAR(255) NOT NULL,
  address_line_optional VARCHAR(100),
  city VARCHAR(100) NOT NULL,
  postal_code CHAR(5) NOT NULL,
  state_id CHAR(2) NOT NULL,
  CONSTRAINT fk_address_state
    FOREIGN KEY (state_id)
    REFERENCES state (state_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Table user
DROP TABLE IF EXISTS user;
CREATE TABLE IF NOT EXISTS user (
  email VARCHAR(320),
  username VARCHAR(30) NOT NULL,
  password VARCHAR(20) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  phone_number VARCHAR(15),
  last_login_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  address_id INT NULL,
  PRIMARY KEY (email),
  UNIQUE INDEX unq_username (username ASC) VISIBLE,
  UNIQUE INDEX unq_phone_number (phone_number ASC) VISIBLE,
  CONSTRAINT fk_user_address
    FOREIGN KEY (address_id)
    REFERENCES address (address_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- Table product
DROP TABLE IF EXISTS product;
CREATE TABLE product (
  code CHAR(12),
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  manufacturer VARCHAR(100) NOT NULL,
  photo VARCHAR(1000) NOT NULL,
  price DECIMAL(7,2) NOT NULL,
  cost DECIMAL(7,2) NOT NULL,
  inventory_quantity INT NOT NULL,
  PRIMARY KEY (code),
  UNIQUE INDEX unq_name_manufacturer (name ASC, manufacturer ASC) VISIBLE,
  FULLTEXT INDEX ft_idx_name (name) VISIBLE
);

-- Table review
DROP TABLE IF EXISTS review;
CREATE TABLE IF NOT EXISTS review (
  review_id INT PRIMARY KEY,
  review_text TEXT NOT NULL,
  review_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  email VARCHAR(320) NOT NULL,
  code CHAR(12) NOT NULL,
  CONSTRAINT fk_review_user 
    FOREIGN KEY (email) 
    REFERENCES user (email) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
  CONSTRAINT fk_review_product 
    FOREIGN KEY (code) 
    REFERENCES product (code) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
  INDEX idx_code (code)
);

-- Table payment_method
DROP TABLE IF EXISTS payment_method;
CREATE TABLE payment_method (
  payment_id INT PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  card_number CHAR(45) NOT NULL,
  expiry_date CHAR(45) NOT NULL,
  email VARCHAR(320) NOT NULL,
  address_id INT NOT NULL,
  CONSTRAINT fk_payment_method_user 
    FOREIGN KEY (email) 
    REFERENCES user (email),
  CONSTRAINT fk_payment_method_address
    FOREIGN KEY (address_id)
    REFERENCES address (address_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- Table purchase
DROP TABLE IF EXISTS purchase;
CREATE TABLE purchase (
  purchase_id INT PRIMARY KEY,
  total_price DECIMAL(13,2) NOT NULL DEFAULT 0,
  purchase_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  payment_id INT NOT NULL,
  email VARCHAR(320) NOT NULL,
  CONSTRAINT fk_purchase_payment_method 
    FOREIGN KEY (payment_id) 
    REFERENCES payment_method (payment_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_purchase_user
    FOREIGN KEY (email)
    REFERENCES user (email)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  INDEX idx_purchase_email (email)
);

-- Table purchase_product
DROP TABLE IF EXISTS purchase_product;
CREATE TABLE purchase_product (
  purchase_id INT NOT NULL,
  code CHAR(12) NOT NULL,
  product_price DECIMAL(7,2) NOT NULL,
  product_quantity INT NOT NULL DEFAULT 1,
  product_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (code, purchase_id),
  CONSTRAINT fk_product_has_purchase_product1
    FOREIGN KEY (code)
    REFERENCES product (code)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_product_has_purchase_purchase1
    FOREIGN KEY (purchase_id)
    REFERENCES purchase (purchase_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

