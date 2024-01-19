/*****************************************************************************
 RDBMS:         SQLite
 Create Date:   01/17/2023
 Author:        Qiang Hao
 Description:   Create all the tables for the scificollective_chapter4 database
                corresponding to what's covered in Chapter 4.
 Note  1:       This script is for SQLite.
 Note 2:        This script assumes that a database is created and used.
*************************************************************************************/

-- Connect to a new or existing database file
-- Connect to the database
ATTACH DATABASE 'scificollective_chapter4.db' AS scificollective_chapter4;

-- Table payment_method
DROP TABLE IF EXISTS scificollective_chapter4.payment_method;
CREATE TABLE scificollective_chapter4.payment_method (
  payment_id INTEGER PRIMARY KEY,
  name TEXT,
  card_number TEXT,
  expiry_date TEXT,
  csc TEXT,
  billing_address TEXT
);

-- Table product
DROP TABLE IF EXISTS scificollective_chapter4.product;
CREATE TABLE scificollective_chapter4.product (
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
DROP TABLE IF EXISTS scificollective_chapter4.purchase;
CREATE TABLE scificollective_chapter4.purchase (
  purchase_id INTEGER PRIMARY KEY,
  total_price REAL,
  purchase_time TEXT,
  product_price REAL,
  product_quantity INTEGER
);

-- Table review
DROP TABLE IF EXISTS scificollective_chapter4.review;
CREATE TABLE scificollective_chapter4.review (
  review_id INTEGER PRIMARY KEY,
  review_text TEXT,
  review_time TEXT
);

-- Table user
DROP TABLE IF EXISTS scificollective_chapter4.user;
CREATE TABLE scificollective_chapter4.user (
  email TEXT PRIMARY KEY,
  username TEXT,
  password TEXT,
  first_name TEXT,
  last_name TEXT,
  address TEXT,
  phone_number TEXT,
  last_login_time TEXT
);