/*****************************************************************************
 RDBMS:          MySQL
 Create Date:    08/27/2024
 Author:         Qiang Hao
 Description:    Create all the tables for the shipsrus_chapter8 database
 corresponding to what's covered in Chapter 8
 *************************************************************************************/
-- drop database shipsrus_chapter8 if it exists
DROP DATABASE IF EXISTS shipsrus_chapter8;

-- create database shipsrus_chapter8
-- character set utf8
CREATE DATABASE IF NOT EXISTS shipsrus_chapter8 CHARACTER SET utf8 COLLATE utf8_general_ci;

USE shipsrus_chapter8;

-- Create country table for address validation
CREATE TABLE country (
  country_id INT PRIMARY KEY AUTO_INCREMENT,
  country_abbr VARCHAR(2) NOT NULL,
  country_code CHAR(5) NOT NULL,
  country_name VARCHAR(100) NOT NULL
);

-- Create brand table
CREATE TABLE brand (name VARCHAR(100) PRIMARY KEY);

-- Create model table
CREATE TABLE model (
  model_number CHAR(4) PRIMARY KEY,
  model_name VARCHAR(100) NOT NULL,
  brand_name VARCHAR(100) NOT NULL,
  CONSTRAINT fk_brand_model 
    FOREIGN KEY (brand_name) 
    REFERENCES brand(name) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

-- Create address table
CREATE TABLE address (
  address_id INT PRIMARY KEY AUTO_INCREMENT,
  street_address VARCHAR(255) NOT NULL,
  suburb VARCHAR(100),
  city VARCHAR(100) NOT NULL,
  state_province VARCHAR(100) NOT NULL,
  postal_code VARCHAR(20),
  country_id INT NOT NULL,
  CONSTRAINT fk_address_country
    FOREIGN KEY (country_id) 
    REFERENCES country(country_id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);

-- Create dealer table
CREATE TABLE dealer (
  dealer_id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email_address VARCHAR(100) UNIQUE NOT NULL,
  website_url VARCHAR(255) NOT NULL,
  dealer_phone_number CHAR(15) NOT NULL,
  country_id INT NOT NULL,
  address_id INT NOT NULL,
  CONSTRAINT unique_dealer_phone_number
    UNIQUE (country_id, dealer_phone_number),
  CONSTRAINT fk_dealer_country_id
    FOREIGN KEY (country_id) 
    REFERENCES country(country_id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_dealer_address
    FOREIGN KEY (address_id) 
    REFERENCES address(address_id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);

-- Create customer table
CREATE TABLE customer (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email_address VARCHAR(100) UNIQUE NOT NULL,
  customer_phone_number CHAR(15) NOT NULL,
  country_id INT NOT NULL,
  address_id INT NOT NULL,
  CONSTRAINT unique_customer_phone_number 
    UNIQUE (country_id, customer_phone_number),
  CONSTRAINT fk_customer_country_id
    FOREIGN KEY (country_id) 
    REFERENCES country(country_id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_customer_address
    FOREIGN KEY (address_id) 
    REFERENCES address(address_id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);

-- Create spaceship table
CREATE TABLE spaceship (
  serial_number CHAR(17) PRIMARY KEY,
  recommended_price NUMERIC(8, 2) CHECK (recommended_price >= 0) NOT NULL,
  year YEAR CHECK (year >= 1900) NOT NULL,
  model_number CHAR(4) NOT NULL,
  dealer_id INT,
  customer_id INT,
  CONSTRAINT fk_model_spaceship
    FOREIGN KEY (model_number) 
    REFERENCES model(model_number)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_dealer_spaceship 
    FOREIGN KEY (dealer_id) 
    REFERENCES dealer(dealer_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT fk_customer_spaceship 
    FOREIGN KEY (customer_id) 
    REFERENCES customer(customer_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

-- Create customer_dealer table
CREATE TABLE customer_dealer (
  customer_id INT NOT NULL,
  dealer_id INT NOT NULL,
  CONSTRAINT pk_customer_dealer
    PRIMARY KEY (customer_id, dealer_id),
  CONSTRAINT fk_customer_dealer_customer
    FOREIGN KEY (customer_id) 
    REFERENCES customer(customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_customer_dealer_dealer
    FOREIGN KEY (dealer_id) 
    REFERENCES dealer(dealer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);