/*****************************************************************************
 RDBMS:          Oracle
 Create Date:    05/20/2023
 Author:         Qiang Hao
 Description:    Create a product table and insert some data for the onlinestore database.
 Note 1:          This script is for Oracle 18c or above.
 Note 2:          This script assumes that a database is created and used.
*************************************************************************************/

-- Assuming a schema 'onlinestore' is already created and used

-- Drop the product table if it exists (using PL/SQL)
DECLARE
   e_table_missing EXCEPTION;
   PRAGMA EXCEPTION_INIT(e_table_missing, -00942);
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE product';
EXCEPTION
   WHEN e_table_missing THEN NULL;
END;
/

-- Create the product table
CREATE TABLE product (
    product_id NUMBER PRIMARY KEY, -- NUMBER is Oracle's equivalent of INT or DECIMAL in MySQL
    name VARCHAR2(255) NOT NULL, -- VARCHAR2 is Oracle's equivalent of TEXT in MySQL
    description VARCHAR2(4000) NOT NULL,
    price NUMBER(5, 2) NOT NULL, -- NUMBER(5, 2) is Oracle's equivalent of DECIMAL(5, 2) in MySQL
    manufacturer VARCHAR2(255) NOT NULL
);

-- Insert data into the product table
INSERT INTO product (product_id, name, description, price, manufacturer) VALUES (1, 'Atomic Nose Hair Trimmer', 'Trim your nose hairs with the precision of an atomic clock!', 19.99, 'Mad Inventors Inc.');
INSERT INTO product (product_id, name, description, price, manufacturer) VALUES (2, 'Selfie Toaster', 'Get your face on your toast every morning with our selfie toaster!', 24.99, 'Goofy Gadgets Corp.');
INSERT INTO product (product_id, name, description, price, manufacturer) VALUES (3, 'Cat-Poop Coffee', 'The only coffee made from the finest cat poop beans!', 29.99, 'Absurd Accessories');
INSERT INTO product (product_id, name, description, price, manufacturer) VALUES (4, 'Inflatable Briefcase', 'Need more storage space? Inflate our briefcase to double its size!', 39.99, 'Wacky Wares Ltd.');
INSERT INTO product (product_id, name, description, price, manufacturer) VALUES (5, 'Unicorn Horn Polish', 'Keep your unicorn''s horn shiny and smooth with our magical polish!', 9.99, 'Silly Supplies Co.');
INSERT INTO product (product_id, name, description, price, manufacturer) VALUES (6, 'The Mind Probe', 'A device from Star Wars that can extract information directly from a person''s mind.', 19.99, 'Mad Inventors Inc.');
INSERT INTO product (product_id, name, description, price, manufacturer) VALUES (7, 'Lightsabers', 'Elegant and deadly energy swords wielded by Jedi and Sith alike.', 25, 'Mad Inventors Inc.');
INSERT INTO product (product_id, name, description, price, manufacturer) VALUES (8, 'The Sonic Screwdriver', 'A versatile tool capable of performing a wide variety of tasks, from unlocking doors to repairing electronics.', 15.1, 'Absurd Accessories');
INSERT INTO product (product_id, name, description, price, manufacturer) VALUES (9, 'The Infinite Improbability Generator', 'A device that can create impossible and absurd events, such as a spaceship suddenly turning into a giant sperm whale.', 9.99, 'Silly Supplies Co.');
INSERT INTO product (product_id, name, description, price, manufacturer) VALUES (10, 'The Neuralyzer', 'A flashy device that erases people''s memories of specific events or encounters.', 33.55, 'Silly Supplies Co.');
