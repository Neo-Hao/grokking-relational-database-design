/*****************************************************************************
 RDBMS:          SQL server
 Create Date:    01/16/2024
 Author:         Qiang Hao
 Description:    Create all the tables for the scifi_collective database
                 corresponding to what's covered in Chapter 4.
 Note:           This script is for SQL Server 2019 or above.
 *************************************************************************************/

-- Create database scifi_collective
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'scifi_collective')
BEGIN
    CREATE DATABASE scifi_collective;
END
GO

-- Use the database
USE scifi_collective;
GO

-- Table payment_method
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[payment_method]') AND type in (N'U'))
BEGIN
    CREATE TABLE payment_method (
        payment_id INT PRIMARY KEY IDENTITY(1,1),
        name NVARCHAR(30),
        card_number CHAR(16),
        expiry_date CHAR(4),
        csc CHAR(4),
        billing_address NVARCHAR(255)
    );
END
GO

-- Table product
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[product]') AND type in (N'U'))
BEGIN
    CREATE TABLE product (
        code CHAR(12) PRIMARY KEY,
        name NVARCHAR(100),
        description NVARCHAR(MAX),
        manufacturer NVARCHAR(100),
        photo NVARCHAR(MAX),
        price DECIMAL(7,2),
        cost DECIMAL(7,2),
        inventory_quantity INT
    );
END
GO

-- Table purchase
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[purchase]') AND type in (N'U'))
BEGIN
    CREATE TABLE purchase (
        purchase_id INT PRIMARY KEY IDENTITY(1,1),
        total_price DECIMAL(13,2),
        purchase_time DATETIME,
        product_price DECIMAL(7,2),
        product_quantity INT
    );
END
GO

-- Table review
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[review]') AND type in (N'U'))
BEGIN
    CREATE TABLE review (
        review_id INT PRIMARY KEY IDENTITY(1,1),
        review_text NVARCHAR(MAX),
        review_time DATETIME
    );
END
GO

-- Table user
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[user]') AND type in (N'U'))
BEGIN
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
END
GO
