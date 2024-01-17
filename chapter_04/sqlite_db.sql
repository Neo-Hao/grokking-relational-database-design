/*****************************************************************************
 RDBMS:         SQLite
 Create Date:   01/17/2023
 Author:        Qiang Hao
 Description:   Create all the tables for the scifi_collective database
                corresponding to what's covered in Chapter 4.
 Note  1:       This script is for SQLite.
 Note 2:        This script assumes that a database is created and used.
*************************************************************************************/


-- Table payment_method
CREATE TABLE IF NOT EXISTS payment_method (
  payment_id INTEGER PRIMARY KEY,
  name TEXT,
  card_number TEXT,
  expiry_date TEXT,
  csc TEXT,
  billing_address TEXT
);

-- Table product
CREATE TABLE IF NOT EXISTS product (
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
CREATE TABLE IF NOT EXISTS purchase (
  purchase_id INTEGER PRIMARY KEY,
  total_price REAL,
  purchase_time TEXT,
  product_price REAL,
  product_quantity INTEGER
);

-- Table review
CREATE TABLE IF NOT EXISTS review (
  review_id INTEGER PRIMARY KEY,
  review_text TEXT,
  review_time TEXT
);

-- Table user
CREATE TABLE IF NOT EXISTS user (
  email TEXT PRIMARY KEY,
  username TEXT,
  password TEXT,
  first_name TEXT,
  last_name TEXT,
  address TEXT,
  phone_number TEXT,
  last_login_time TEXT
);