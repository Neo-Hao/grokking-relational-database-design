/*****************************************************************************
 RDBMS:          SQL server
 Create Date:    01/16/2024
 Author:         Qiang Hao
 Description:    Create a product table and insert some data for the onlinestore database.
 Note:           This script is for SQL Server 2019 or above.
 *************************************************************************************/
-- Check if the database exists and create if it does not
IF NOT EXISTS (
    SELECT
        name
    FROM
        master.dbo.sysdatabases
    WHERE
        name = N'onlinestore'
) CREATE DATABASE onlinestore;
GO

-- Use the database
USE onlinestore;
GO

-- Drop the table if it exists
IF OBJECT_ID('product', 'U') IS NOT NULL DROP TABLE product;
GO

-- Create the product table
CREATE TABLE product (
    product_id INT NOT NULL,
    name NVARCHAR(MAX) NOT NULL,
    -- TEXT type in MySQL is similar to NVARCHAR(MAX) in SQL Server
    description NVARCHAR(MAX) NOT NULL,
    price DECIMAL(5, 2) NOT NULL,
    manufacturer NVARCHAR(MAX) NOT NULL,
    PRIMARY KEY (product_id)
);
GO

-- Insert data into the product table
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
GO

-- Drop the review table if it exists
IF OBJECT_ID('review', 'U') IS NOT NULL DROP TABLE review;
GO

-- Create the review table
CREATE TABLE review (
    review_id BIGINT NOT NULL,
    product_id INT NOT NULL,
    review_text NVARCHAR(MAX) NOT NULL,
    datetime DATETIME NOT NULL DEFAULT GETDATE(),
    -- GETDATE() in SQL Server is equivalent to CURRENT_TIMESTAMP in MySQL
    PRIMARY KEY (review_id),
    CONSTRAINT fk_product_review FOREIGN KEY (product_id) REFERENCES product (product_id)
);
GO

-- Insert data into the review table
INSERT INTO
    review (review_id, product_id, review_text, datetime)
VALUES
    (
        1,
        3,
        N'Great product, would definitely recommend!',
        '2022-01-01 12:30:00'
    ),
    (
        2,
        5,
        N'This is the best thing I have ever bought!',
        '2022-01-02 13:45:00'
    ),
    (
        3,
        2,
        N'Not worth the money, would not recommend',
        '2022-01-03 14:15:00'
    ),
    (
        4,
        4,
        N'Disappointing purchase. Wouldn''t buy again.',
        '2022-01-04 15:00:00'
    ),
    (
        5,
        1,
        N'Decent product for the price, happy with my purchase',
        '2022-01-05 16:30:00'
    ),
    (
        6,
        2,
        N'Really impressed with the quality of this product!',
        '2022-01-06 17:00:00'
    ),
    (
        7,
        4,
        N'Great value for the price, would buy again',
        '2022-01-07 18:15:00'
    ),
    (
        8,
        3,
        N'Not the best quality, but it gets the job done',
        '2022-01-08 19:00:00'
    ),
    (
        9,
        5,
        N'I am really happy with this purchase, it exceeded my expectations',
        '2022-01-09 20:30:00'
    ),
    (
        10,
        1,
        N'Would not recommend this product, very disappointing',
        '2022-01-10 21:00:00'
    ),
    (
        11,
        3,
        N'This product is great, I use it every day!',
        '2022-01-11 22:15:00'
    ),
    (
        12,
        5,
        N'I would definitely buy this again, great value for the price',
        '2022-01-12 23:00:00'
    );
GO