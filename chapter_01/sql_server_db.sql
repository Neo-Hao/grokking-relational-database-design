/*****************************************************************************
 RDBMS:          SQL server
 Create Date:    01/16/2024
 Author:         Qiang Hao
 Description:    Create a product table and insert some data for the onlinestore database.
 Note:           This script is for SQL Server 2019 or above.
 *************************************************************************************/

-- Check if the database exists and create if it does not
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = N'onlinestore')
BEGIN
    CREATE DATABASE onlinestore;
END;

-- Use the database
USE onlinestore;

-- Drop the table product if it exists
DROP TABLE IF EXISTS product;

-- Create the table product
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    name NVARCHAR(MAX) NOT NULL, -- NVARCHAR(MAX) is SQL Server's equivalent of TEXT in MySQL
    description NVARCHAR(MAX) NOT NULL,
    price DECIMAL(5, 2) NOT NULL,
    manufacturer NVARCHAR(MAX) NOT NULL
);

-- Insert data into the table
-- In SQL Server, prefixing a string literal with N before storing it in an NVARCHAR 
-- (or NCHAR or NTEXT) column is important because it signifies that the subsequent 
-- string is in Unicode format. Unicode data types can store any character from 
-- any character set, including special characters and characters from non-Latin
-- languages like Chinese, Japanese, Arabic, etc
INSERT INTO
    product (
        product_id,
        name,
        description,
        price,
        manufacturer
    )
VALUES
    (
        1,
        N'Atomic Nose Hair Trimmer',
        N'Trim your nose hairs with the precision of an atomic clock!',
        19.99,
        N'Mad Inventors Inc.'
    ),
    (
        2,
        N'Selfie Toaster',
        N'Get your face on your toast every morning with our selfie toaster!',
        24.99,
        N'Goofy Gadgets Corp.'
    ),
    (
        3,
        N'Cat-Poop Coffee',
        N'The only coffee made from the finest cat poop beans!',
        29.99,
        N'Absurd Accessories'
    ),
    (
        4,
        N'Inflatable Briefcase',
        N'Need more storage space? Inflate our briefcase to double its size!',
        39.99,
        N'Wacky Wares Ltd.'
    ),
    (
        5,
        N'Unicorn Horn Polish',
        N'Keep your unicorn''s horn shiny and smooth with our magical polish!',
        9.99,
        N'Silly Supplies Co.'
    ),
    (
        6,
        N'The Mind Probe',
        N'A device from Star Wars that can extract information directly from a person''s mind.',
        19.99,
        N'Mad Inventors Inc.'
    ),
    (
        7,
        N'Lightsabers',
        N'Elegant and deadly energy swords wielded by Jedi and Sith alike.',
        25,
        N'Mad Inventors Inc.'
    ),
    (
        8,
        N'The Sonic Screwdriver',
        N'A versatile tool capable of performing a wide variety of tasks, from unlocking doors to repairing electronics.',
        15.1,
        N'Absurd Accessories'
    ),
    (
        9,
        N'The Infinite Improbability Generator',
        N'A device that can create impossible and absurd events, such as a spaceship suddenly turning into a giant sperm whale.',
        9.99,
        N'Silly Supplies Co.'
    ),
    (
        10,
        N'The Neuralyzer',
        N'A flashy device that erases people''s memories of specific events or encounters.',
        33.55,
        N'Silly Supplies Co.'
    );