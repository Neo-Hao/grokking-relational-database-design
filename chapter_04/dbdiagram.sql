/*****************************************************************************
 RDBMS:          MySQL
 Create Date:    01/17/2023
 Author:         Qiang Hao
 Description:    Create all the tables for the scificollective_chapter4 database
                 corresponding to what's covered in Chapter 4.
*************************************************************************************/

-- create database scificollective_chapter4
-- character set utf8
CREATE DATABASE IF NOT EXISTS scificollective_chapter4
CHARACTER SET utf8
COLLATE utf8_general_ci;

-- Use the database
USE scificollective_chapter4;

-- Table payment_method
DROP TABLE IF EXISTS payment_method;
CREATE TABLE payment_method (
  payment_id INT PRIMARY KEY,
  name VARCHAR(30),
  card_number CHAR(16),
  expiry_date CHAR(4),
  billing_address VARCHAR(255)
);


-- Table product
DROP TABLE IF EXISTS product;
CREATE TABLE product (
  code CHAR(12) PRIMARY KEY,
  name VARCHAR(100),
  description TEXT,
  manufacturer VARCHAR(100),
  photo VARCHAR(1000),
  price DECIMAL(7,2),
  cost DECIMAL(7,2),
  inventory_quantity INT
);


-- Table purchase
DROP TABLE IF EXISTS purchase;
CREATE TABLE purchase (
  purchase_id INT PRIMARY KEY,
  total_price DECIMAL(13,2),
  purchase_time TIMESTAMP,
  product_time DECIMAL(7,2),
  product_quantity INT
);



-- Table review
DROP TABLE IF EXISTS review;
CREATE TABLE review (
  review_id INT PRIMARY KEY,
  review_text TEXT,
  review_time TIMESTAMP
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
