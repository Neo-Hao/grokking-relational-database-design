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

-- Creating the 'product' table
DROP TABLE IF EXISTS product;
CREATE TABLE product (
    product_id NUMBER NOT NULL,
    name VARCHAR2(255) NOT NULL,
    description VARCHAR2(4000) NOT NULL,
    price NUMBER(5, 2) NOT NULL,
    manufacturer VARCHAR2(255) NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY (product_id)
);

-- Inserting data into 'product'
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
        'Atomic Nose Hair Trimmer',
        'Trim your nose hairs with the precision of an atomic clock!',
        19.99,
        'Mad Inventors Inc.'
    ),
    (
        2,
        'Selfie Toaster',
        'Get your face on your toast every morning with our selfie toaster!',
        24.99,
        'Goofy Gadgets Corp.'
    ),
    (
        3,
        'Cat-Poop Coffee',
        'The only coffee made from the finest cat poop beans!',
        29.99,
        'Absurd Accessories'
    ),
    (
        4,
        'Inflatable Briefcase',
        'Need more storage space? Inflate our briefcase to double its size!',
        39.99,
        'Wacky Wares Ltd.'
    ),
    (
        5,
        'Unicorn Horn Polish',
        'Keep your unicorn''s horn shiny and smooth with our magical polish!',
        9.99,
        'Silly Supplies Co.'
    ),
    (
        6,
        'The Mind Probe',
        'A device from Star Wars that can extract information directly from a person''s mind.',
        19.99,
        'Mad Inventors Inc.'
    ),
    (
        7,
        'Lightsabers',
        'Elegant and deadly energy swords wielded by Jedi and Sith alike.',
        25,
        'Mad Inventors Inc.'
    ),
    (
        8,
        'The Sonic Screwdriver',
        'A versatile tool capable of performing a wide variety of tasks, from unlocking doors to repairing electronics.',
        15.1,
        'Absurd Accessories'
    ),
    (
        9,
        'The Infinite Improbability Generator',
        'A device that can create impossible and absurd events, such as a spaceship suddenly turning into a giant sperm whale.',
        9.99,
        'Silly Supplies Co.'
    ),
    (
        10,
        'The Neuralyzer',
        'A flashy device that erases people''s memories of specific events or encounters.',
        33.55,
        'Silly Supplies Co.'
    );

-- Creating the 'review' table
DROP TABLE IF EXISTS review;
CREATE TABLE IF NOT EXISTS review (
    review_id NUMBER NOT NULL,
    product_id NUMBER NOT NULL,
    review_text CLOB NOT NULL,
    datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT pk_review PRIMARY KEY (review_id),
    CONSTRAINT fk_product_review FOREIGN KEY (product_id) REFERENCES product (product_id)
);

-- Inserting data into 'review'
INSERT INTO
    review (review_id, product_id, review_text, datetime)
VALUES
    (
        1,
        3,
        'Great product, would definitely recommend!',
        TO_TIMESTAMP('2022-01-01 12:30:00', 'YYYY-MM-DD HH24:MI:SS')
    ),
    (
        2,
        5,
        'This is the best thing I have ever bought!',
        TO_TIMESTAMP('2022-01-02 13:45:00')
    ),
    (
        3,
        2,
        'Not worth the money, would not recommend',
        TO_TIMESTAMP('2022-01-03 14:15:00')
    ),
    (
        4,
        4,
        'Disappointing purchase. Wouldn''t buy again.',
        TO_TIMESTAMP('2022-01-04 15:00:00')
    ),
    (
        5,
        1,
        'Decent product for the price, happy with my purchase',
        TO_TIMESTAMP('2022-01-05 16:30:00')
    ),
    (
        6,
        2,
        'Really impressed with the quality of this product!',
        TO_TIMESTAMP('2022-01-06 17:00:00')
    ),
    (
        7,
        4,
        'Great value for the price, would buy again',
        TO_TIMESTAMP('2022-01-07 18:15:00')
    ),
    (
        8,
        3,
        'Not the best quality, but it gets the job done',
        TO_TIMESTAMP('2022-01-08 19:00:00')
    ),
    (
        9,
        5,
        'I am really happy with this purchase, it exceeded my expectations',
        TO_TIMESTAMP('2022-01-09 20:30:00')
    ),
    (
        10,
        1,
        'Would not recommend this product, very disappointing',
        TO_TIMESTAMP('2022-01-10 21:00:00')
    ),
    (
        11,
        3,
        'This product is great, I use it every day!',
        TO_TIMESTAMP('2022-01-11 22:15:00')
    ),
    (
        12,
        5,
        'I would definitely buy this again, great value for the price',
        TO_TIMESTAMP('2022-01-12 23:00:00')
    );