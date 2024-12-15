/*****************************************************************************
 RDBMS:          MySQL
 Create Date:    01/31/2023
 Author:         Michail Tsikerdekis
 Description:    Create all the tables for the scificollective_chapter6 database
                  corresponding to what's covered in Chapter 6
 *************************************************************************************/

-- drop database scificollective_chapter6 if it exists
DROP DATABASE IF EXISTS scificollective_chapter6;

-- create database scificollective_chapter6
-- character set utf8
CREATE DATABASE IF NOT EXISTS scificollective_chapter6 
CHARACTER SET utf8 
COLLATE utf8_general_ci;

USE scificollective_chapter6;

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
  PRIMARY KEY (email),
  UNIQUE INDEX unq_username (username ASC) VISIBLE,
  UNIQUE INDEX unq_phone_number (phone_number ASC) VISIBLE
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
  UNIQUE INDEX unq_name_manufacturer (name ASC, manufacturer ASC) VISIBLE
);

-- Table review
DROP TABLE IF EXISTS review;
CREATE TABLE IF NOT EXISTS review (
  review_id INT PRIMARY KEY,
  review_text TEXT NOT NULL,
  review_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  email VARCHAR(320) NOT NULL,
  code CHAR(12) NOT NULL,
  CONSTRAINT fk_review_user FOREIGN KEY (email) REFERENCES user (email) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_review_product FOREIGN KEY (code) REFERENCES product (code) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table payment_method
DROP TABLE IF EXISTS payment_method;
CREATE TABLE payment_method (
  payment_id INT PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  card_number CHAR(16) NOT NULL,
  expiry_date CHAR(4) NOT NULL,
  email VARCHAR(320) NOT NULL,
  CONSTRAINT fk_payment_method_user FOREIGN KEY (email) REFERENCES user (email)
);


-- Table `purchase`
DROP TABLE IF EXISTS purchase;
CREATE TABLE purchase (
  purchase_id INT PRIMARY KEY,
  total_price DECIMAL(13,2) NOT NULL DEFAULT 0,
  purchase_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  payment_id INT NOT NULL,
  CONSTRAINT fk_purchase_payment_method FOREIGN KEY (payment_id) REFERENCES payment_method (payment_id)
);


-- Table user_address
CREATE TABLE IF NOT EXISTS user_address (
  email VARCHAR(320) NOT NULL,
  street_address VARCHAR(255) NOT NULL,
  address_line_optional VARCHAR(100),
  city VARCHAR(100) NOT NULL,
  state VARCHAR(20) NOT NULL,
  postal_code CHAR(5) NOT NULL,
  PRIMARY KEY (email),
  CONSTRAINT fk_user_address_user
    FOREIGN KEY (email)
    REFERENCES user (email)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Table billing_address
CREATE TABLE IF NOT EXISTS billing_address (
  payment_id INT NOT NULL,
  street_address VARCHAR(255) NOT NULL,
  address_line_optional VARCHAR(100),
  city VARCHAR(100) NOT NULL,
  state VARCHAR(20) NOT NULL,
  postal_code CHAR(5) NOT NULL,
  PRIMARY KEY (payment_id),
  CONSTRAINT fk_billing_address_payment_id
    FOREIGN KEY (payment_id)
    REFERENCES payment_method (payment_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
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

