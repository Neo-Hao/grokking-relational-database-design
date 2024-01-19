/*****************************************************************************
 RDBMS:          SQL server
 Create Date:    01/16/2024
 Author:         Qiang Hao
 Description:    Create a product table and insert some data for the onlinestore database.
 Note:           This script is for SQL Server 2019 or above.
 *************************************************************************************/
-- Check if the database exists and create if it does not
CREATE DATABASE IF NOT EXISTS onlinestore;

-- Use the database
USE onlinestore;

-- Create the table
CREATE TABLE IF NOT EXISTS product (
    product_id INT PRIMARY KEY,
    name NVARCHAR(MAX) NOT NULL,
    -- TEXT type in MySQL is similar to NVARCHAR(MAX) in SQL Server
    description NVARCHAR(MAX) NOT NULL,
    price DECIMAL(5, 2) NOT NULL,
    manufacturer NVARCHAR(MAX) NOT NULL
);

-- Insert data into the table
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
        N 'Atomic Nose Hair Trimmer',
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
        N 'Need more storage space? Inflate our briefcase to double its size!',
        39.99,
        N'Wacky Wares Ltd.'
    ),
    (
        5,
        N'Unicorn Horn Polish',
        N'Keep your unicorn' 's horn shiny and smooth with our magical polish!',
        9.99,
        N'Silly Supplies Co.'
    ),
    (
        6,
        N'The Mind Probe',
        N'A device from Star Wars that can extract information directly from a person' 's mind.',
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
        N 'The Neuralyzer',
        N'A flashy device that erases people' 's memories of specific events or encounters.',
        33.55,
        N'Silly Supplies Co.'
    );