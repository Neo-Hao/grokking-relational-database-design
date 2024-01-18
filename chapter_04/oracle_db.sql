/*****************************************************************************
 RDBMS:          Oracle Database
 Create Date:    01/17/2023
 Author:         Qiang Hao
 Description:    Create all the tables for the scifi_collective database
                 corresponding to what's covered in Chapter 4.
 Note 1:         This script is for Oracle Database 19c or above.
 Note 2:         This script assumes that a database is created and used.
*************************************************************************************/

-- Assuming the schema (user) scifi_collective is already created and being used

-- Table payment_method
CREATE TABLE payment_method (
  payment_id INT PRIMARY KEY,
  name VARCHAR2(30),
  card_number CHAR(16),
  expiry_date CHAR(4),
  csc CHAR(4),
  billing_address VARCHAR2(255)
);

-- Table product
CREATE TABLE product (
  code CHAR(12) PRIMARY KEY,
  name VARCHAR2(100),
  description CLOB,
  manufacturer VARCHAR2(100),
  photo VARCHAR2(1000),
  price NUMBER(7,2),
  cost NUMBER(7,2),
  inventory_quantity INT
);

-- Table purchase
CREATE TABLE purchase (
  purchase_id INT PRIMARY KEY,
  total_price NUMBER(13,2),
  purchase_time TIMESTAMP,
  product_time NUMBER(7,2),
  product_quantity INT
);

-- Table review
CREATE TABLE review (
  review_id INT PRIMARY KEY,
  review_text CLOB,
  review_time TIMESTAMP
);

-- Table user
CREATE TABLE user (
  email VARCHAR2(320) PRIMARY KEY,
  username VARCHAR2(30),
  password VARCHAR2(20),
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  address VARCHAR2(255),
  phone_number VARCHAR2(15),
  last_login_time TIMESTAMP
);
