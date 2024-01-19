/*****************************************************************************
 RDBMS:         SQLite
 Create Date:   01/18/2023
 Author:        Qiang Hao
 Description:   Create all the tables for the scificollective database
                corresponding to what's covered in Chapter 4.
 Note  1:       This script is for SQLite.
 Note 2:        This script assumes that a database is created and used.
*************************************************************************************/

-- assume that the database scificollective_chapter5 is created and used

-- Table payment_method
CREATE TABLE IF NOT EXISTS payment_method (
  payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  card_number TEXT,
  expiry_date TEXT,
  csc TEXT,
  billing_address TEXT,
  email TEXT,
  FOREIGN KEY (email) REFERENCES user (email)
);

-- Table product
DROP TABLE IF EXISTS product;
CREATE TABLE product (
  code TEXT PRIMARY KEY,
  name TEXT,
  description TEXT,
  manufacturer TEXT,
  photo TEXT,
  price REAL,
  cost REAL,
  inventory_quantity INTEGER
);

-- Table purchase
DROP TABLE IF EXISTS purchase;
CREATE TABLE purchase (
  purchase_id INTEGER PRIMARY KEY AUTOINCREMENT,
  total_price REAL,
  purchase_time TEXT,
  product_price REAL,
  product_quantity INTEGER,
  payment_id INTEGER,
  email TEXT,
  FOREIGN KEY (payment_id) REFERENCES payment_method (payment_id),
  FOREIGN KEY (email) REFERENCES user (email)
);

-- Table purchase_product
DROP TABLE IF EXISTS purchase_product;
CREATE TABLE purchase_product (
  purchase_id INTEGER,
  code TEXT,
  PRIMARY KEY (purchase_id, code),
  FOREIGN KEY (code) REFERENCES product (code),
  FOREIGN KEY (purchase_id) REFERENCES purchase (purchase_id)
);

-- Table review
DROP TABLE IF EXISTS review;
CREATE TABLE review (
  review_id INTEGER PRIMARY KEY AUTOINCREMENT,
  review_text TEXT,
  review_time TEXT,
  email TEXT,
  code TEXT,
  FOREIGN KEY (email) REFERENCES user (email),
  FOREIGN KEY (code) REFERENCES product (code)
);

-- Table user
DROP TABLE IF EXISTS user;
CREATE TABLE user (
  email TEXT PRIMARY KEY,
  username TEXT,
  password TEXT,
  first_name TEXT,
  last_name TEXT,
  address TEXT,
  phone_number TEXT,
  last_login_time TEXT
);

-- Table user_address
DROP TABLE IF EXISTS user_address;
CREATE TABLE user_address (
  email TEXT PRIMARY KEY,
  street_address TEXT,
  address_line_optional TEXT,
  city TEXT,
  state TEXT, -- Adjusted from ENUM type
  postal_code TEXT,
  FOREIGN KEY (email) REFERENCES user (email)
);

-- Enable foreign key support (required in each session)
PRAGMA foreign_keys = ON;
