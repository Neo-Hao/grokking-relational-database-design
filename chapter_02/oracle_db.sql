/*****************************************************************************
 RDBMS:         Oracle Database
 Create Date:   01/17/2024
 Author:        Qiang Hao
 Description:   Create a pair of two related tables, product and review, 
 and insert some data into the two tables that support the 
 onlinestore database.
 Note 1:          This script is for Oracle 18c or above.
 Note 2:          This script assumes that a database is created and used.
 *************************************************************************************/

-- Assuming the schema onlinestore_chapter2 is created and used

-- Drop 'review' table if it exists
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE review';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/
-- Drop 'review' table if it exists
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE product';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

-- Creating the 'product' table
CREATE TABLE product (
    product_id NUMBER PRIMARY KEY, -- NUMBER is Oracle's equivalent of INT or DECIMAL in MySQL
    name VARCHAR2(255) NOT NULL, -- VARCHAR2 is Oracle's equivalent of TEXT in MySQL
    description VARCHAR2(4000) NOT NULL,
    price NUMBER(5, 2) NOT NULL, -- NUMBER(5, 2) is Oracle's equivalent of DECIMAL(5, 2) in MySQL
    manufacturer VARCHAR2(255) NOT NULL
);

-- Inserting data into 'product'
-- Inserting data into 'product' (Product 1)
INSERT INTO product (product_id, name, description, price, manufacturer)
VALUES (1, 'Atomic Nose Hair Trimmer', 'Trim your nose hairs with the precision of an atomic clock!', 19.99, 'Mad Inventors Inc.');

-- Inserting data into 'product' (Product 2)
INSERT INTO product (product_id, name, description, price, manufacturer)
VALUES (2, 'Selfie Toaster', 'Get your face on your toast every morning with our selfie toaster!', 24.99, 'Goofy Gadgets Corp.');

-- Inserting data into 'product' (Product 3)
INSERT INTO product (product_id, name, description, price, manufacturer)
VALUES (3, 'Cat-Poop Coffee', 'The only coffee made from the finest cat poop beans!', 29.99, 'Absurd Accessories');

-- Inserting data into 'product' (Product 4)
INSERT INTO product (product_id, name, description, price, manufacturer)
VALUES (4, 'Inflatable Briefcase', 'Need more storage space? Inflate our briefcase to double its size!', 39.99, 'Wacky Wares Ltd.');

-- Inserting data into 'product' (Product 5)
INSERT INTO product (product_id, name, description, price, manufacturer)
VALUES (5, 'Unicorn Horn Polish', 'Keep your unicorn''s horn shiny and smooth with our magical polish!', 9.99, 'Silly Supplies Co.');

-- Inserting data into 'product' (Product 6)
INSERT INTO product (product_id, name, description, price, manufacturer)
VALUES (6, 'The Mind Probe', 'A device from Star Wars that can extract information directly from a person''s mind.', 19.99, 'Mad Inventors Inc.');

-- Inserting data into 'product' (Product 7)
INSERT INTO product (product_id, name, description, price, manufacturer)
VALUES (7, 'Lightsabers', 'Elegant and deadly energy swords wielded by Jedi and Sith alike.', 25, 'Mad Inventors Inc.');

-- Inserting data into 'product' (Product 8)
INSERT INTO product (product_id, name, description, price, manufacturer)
VALUES (8, 'The Sonic Screwdriver', 'A versatile tool capable of performing a wide variety of tasks, from unlocking doors to repairing electronics.', 15.1, 'Absurd Accessories');

-- Inserting data into 'product' (Product 9)
INSERT INTO product (product_id, name, description, price, manufacturer)
VALUES (9, 'The Infinite Improbability Generator', 'A device that can create impossible and absurd events, such as a spaceship suddenly turning into a giant sperm whale.', 9.99, 'Silly Supplies Co.');

-- Inserting data into 'product' (Product 10)
INSERT INTO product (product_id, name, description, price, manufacturer)
VALUES (10, 'The Neuralyzer', 'A flashy device that erases people''s memories of specific events or encounters.', 33.55, 'Silly Supplies Co.');


-- Creating the 'review' table
CREATE TABLE review (
    review_id NUMBER PRIMARY KEY, -- NUMBER is Oracle's equivalent of INT or DECIMAL in MySQL
    product_id NUMBER NOT NULL,
    review_text VARCHAR2(4000) NOT NULL, -- VARCHAR2 is Oracle's equivalent of TEXT in MySQL
    datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, -- TIMESTAMP is Oracle's equivalent of DATETIME in MySQL
    CONSTRAINT fk_product_review FOREIGN KEY (product_id) REFERENCES product (product_id)
);

-- Inserting data into 'review'
-- In Oracle SQL, TO_TIMESTAMP is a function used to convert a string 
-- representation of a date and time into a TIMESTAMP value. This function is 
-- particularly useful when you need to work with date and time data that 
-- comes in a string format and you need to convert it to a TIMESTAMP data 
-- type for storage, comparison, or calculation purposes. The TO_TIMESTAMP 
-- function allows you to specify the format of the input string so that Oracle 
-- knows how to correctly interpret it. The basic syntax of the TO_TIMESTAMP 
-- function is TO_TIMESTAMP(string, format_mask)
-- Inserting data into 'review' (Review 1)
-- Inserting data into 'review' (Review 1)
INSERT INTO review (review_id, product_id, review_text, datetime)
VALUES (1, 3, 'Great product, would definitely recommend!', TIMESTAMP '2022-01-01 12:30:00');

-- Inserting data into 'review' (Review 2)
INSERT INTO review (review_id, product_id, review_text, datetime)
VALUES (2, 5, 'This is the best thing I have ever bought!', TIMESTAMP '2022-01-02 13:45:00');

-- Inserting data into 'review' (Review 3)
INSERT INTO review (review_id, product_id, review_text, datetime)
VALUES (3, 2, 'Not worth the money, would not recommend', TIMESTAMP '2022-01-03 14:15:00');

-- Inserting data into 'review' (Review 4)
INSERT INTO review (review_id, product_id, review_text, datetime)
VALUES (4, 4, 'Disappointing purchase. Wouldn''t buy again.', TIMESTAMP '2022-01-04 15:00:00');

-- Inserting data into 'review' (Review 5)
INSERT INTO review (review_id, product_id, review_text, datetime)
VALUES (5, 1, 'Decent product for the price, happy with my purchase', TIMESTAMP '2022-01-05 16:30:00');

-- Inserting data into 'review' (Review 6)
INSERT INTO review (review_id, product_id, review_text, datetime)
VALUES (6, 2, 'Really impressed with the quality of this product!', TIMESTAMP '2022-01-06 17:00:00');

-- Inserting data into 'review' (Review 7)
INSERT INTO review (review_id, product_id, review_text, datetime)
VALUES (7, 4, 'Great value for the price, would buy again', TIMESTAMP '2022-01-07 18:15:00');

-- Inserting data into 'review' (Review 8)
INSERT INTO review (review_id, product_id, review_text, datetime)
VALUES (8, 3, 'Not the best quality, but it gets the job done', TIMESTAMP '2022-01-08 19:00:00');

-- Inserting data into 'review' (Review 9)
INSERT INTO review (review_id, product_id, review_text, datetime)
VALUES (9, 5, 'I am really happy with this purchase, it exceeded my expectations', TIMESTAMP '2022-01-09 20:30:00');

-- Inserting data into 'review' (Review 10)
INSERT INTO review (review_id, product_id, review_text, datetime)
VALUES (10, 1, 'Would not recommend this product, very disappointing', TIMESTAMP '2022-01-10 21:00:00');

-- Inserting data into 'review' (Review 11)
INSERT INTO review (review_id, product_id, review_text, datetime)
VALUES (11, 3, 'This product is great, I use it every day!', TIMESTAMP '2022-01-11 22:15:00');

-- Inserting data into 'review' (Review 12)
INSERT INTO review (review_id, product_id, review_text, datetime)
VALUES (12, 5, 'I would definitely buy this again, great value for the price', TIMESTAMP '2022-01-12 23:00:00');
