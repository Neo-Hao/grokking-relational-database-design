/*****************************************************************************
 RDBMS:          SQL server
 Create Date:    01/16/2024
 Author:         Qiang Hao
 Description:    Create all the tables for the scificollective_chapter4 database
                    corresponding to what's covered in Chapter 4.
 Note:           This script is for SQL Server 2019 or above.
 *************************************************************************************/

-- Create database scificollective_chapter4
CREATE DATABASE IF NOT EXISTS scificollective_chapter4;

-- Use the database
USE scificollective_chapter4;

-- Table payment_method
DROP TABLE IF EXISTS payment_method;
CREATE TABLE payment_method (
    payment_id INT PRIMARY KEY IDENTITY(1, 1),
    name NVARCHAR(30),
    card_number CHAR(16),
    expiry_date CHAR(4),
    csc CHAR(4),
    billing_address NVARCHAR(255)
);

-- Table product
DROP TABLE IF EXISTS product;
CREATE TABLE product (
    code CHAR(12) PRIMARY KEY,
    name NVARCHAR(100),
    description NVARCHAR(MAX),
    manufacturer NVARCHAR(100),
    photo NVARCHAR(MAX),
    price DECIMAL(7, 2),
    cost DECIMAL(7, 2),
    inventory_quantity INT
);

-- Table purchase
DROP TABLE IF EXISTS purchase;
CREATE TABLE purchase (
    purchase_id INT PRIMARY KEY IDENTITY(1, 1),
    total_price DECIMAL(13, 2),
    purchase_time DATETIME,
    product_price DECIMAL(7, 2),
    product_quantity INT
);

-- Table review
DROP TABLE IF EXISTS review;
CREATE TABLE review (
    review_id INT PRIMARY KEY IDENTITY(1, 1),
    review_text NVARCHAR(MAX),
    review_time DATETIME
);

-- Table user
DROP TABLE IF EXISTS user;
CREATE TABLE user (
    email NVARCHAR(320) PRIMARY KEY,
    username NVARCHAR(30),
    password NVARCHAR(20),
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    address NVARCHAR(255),
    phone_number NVARCHAR(15),
    last_login_time DATETIME
);