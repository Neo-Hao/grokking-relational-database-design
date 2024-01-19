/*****************************************************************************
 RDBMS:          Oracle Database
 Create Date:    01/17/2023
 Author:         Qiang Hao
 Description:    Create all the tables for the scificollective_chapter5 database
                 corresponding to what's covered in Chapter 4.
 Note 1:         This script is for Oracle Database 19c or above.
 Note 2:         This script assumes that a database is created and used.
*************************************************************************************/

-- Assuming the schema scificollective_chapter5 is already created and being used

-- Table payment_method
CREATE TABLE payment_method (
  payment_id INT PRIMARY KEY,
  name VARCHAR2(30),
  card_number CHAR(16),
  expiry_date CHAR(4),
  csc CHAR(4),
  billing_address VARCHAR2(255),
  email VARCHAR2(320)
);
ALTER TABLE payment_method ADD CONSTRAINT fk_payment_method_user FOREIGN KEY (email) REFERENCES user (email);

-- Table product
CREATE TABLE product (
  code CHAR(12) PRIMARY KEY,
  name VARCHAR2(100),
  description CLOB,
  manufacturer VARCHAR2(100),
  photo VARCHAR2(1000),
  price NUMBER(7, 2),
  cost NUMBER(7, 2),
  inventory_quantity INT
);

-- Table purchase
CREATE TABLE purchase (
  purchase_id INT PRIMARY KEY,
  total_price NUMBER(13, 2),
  purchase_time TIMESTAMP,
  product_price NUMBER(7, 2),
  product_quantity INT,
  payment_id INT,
  email VARCHAR2(320)
);
ALTER TABLE purchase ADD CONSTRAINT fk_purchase_payment_method FOREIGN KEY (payment_id) REFERENCES payment_method (payment_id);
ALTER TABLE purchase ADD CONSTRAINT fk_purchase_user FOREIGN KEY (email) REFERENCES user (email);

-- Table purchase_product
CREATE TABLE purchase_product (
  purchase_id INT,
  code CHAR(12),
  PRIMARY KEY (purchase_id, code)
);
ALTER TABLE purchase_product ADD CONSTRAINT fk_product_has_purchase_product FOREIGN KEY (code) REFERENCES product (code);
ALTER TABLE purchase_product ADD CONSTRAINT fk_product_has_purchase_purchase FOREIGN KEY (purchase_id) REFERENCES purchase (purchase_id);

-- Table review
CREATE TABLE review (
  review_id INT PRIMARY KEY,
  review_text CLOB,
  review_time TIMESTAMP,
  email VARCHAR2(320),
  code CHAR(12)
);
ALTER TABLE review ADD CONSTRAINT fk_review_user FOREIGN KEY (email) REFERENCES user (email);
ALTER TABLE review ADD CONSTRAINT fk_review_product FOREIGN KEY (code) REFERENCES product (code);

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

-- Table user_address
CREATE TABLE user_address (
  email VARCHAR2(320) PRIMARY KEY,
  street_address VARCHAR2(255),
  address_line_optional VARCHAR2(100),
  city VARCHAR2(100),
  state VARCHAR2(2), -- Adjusted from ENUM type
  postal_code CHAR(5)
);
ALTER TABLE user_address ADD CONSTRAINT fk_user_address_user FOREIGN KEY (email) REFERENCES user (email);
ALTER TABLE user_address ADD CONSTRAINT chk_state CHECK (state IN ('AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY', 'DC', 'PR', 'VI', 'GU', 'MP', 'AS'));
