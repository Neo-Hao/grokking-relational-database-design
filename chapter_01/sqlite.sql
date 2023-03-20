DROP TABLE IF EXISTS `paymentinfo`;

CREATE TABLE `paymentinfo` (
    `PaymentId` bigint NOT NULL,
    `CreditCardNumber` bigint NOT NULL,
    `ExpiryDate` char(4) NOT NULL,
    `Name` TEXT NOT NULL,
    `Csc` smallint NOT NULL,
    `UserId` bigint NOT NULL,
    `Address` TEXT NOT NULL,
    PRIMARY KEY (`PaymentId`),
    FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
);

INSERT INTO
    `paymentinfo`
VALUES
    (
        1,
        1234567890123456,
        '0122',
        'John Doe',
        123,
        1,
        '123 Main St'
    ),
    (
        2,
        9876543210987654,
        '0324',
        'Jane Smith',
        456,
        2,
        '456 Elm St'
    );

DROP TABLE IF EXISTS `phone`;

CREATE TABLE `phone` (
    `PhoneNumber` bigint NOT NULL,
    `Type` TEXT NOT NULL,
    `User_UserId` bigint NOT NULL,
    PRIMARY KEY (`PhoneNumber`, `User_UserId`),
    FOREIGN KEY (`User_UserId`) REFERENCES `user` (`UserId`)
);

INSERT INTO
    `phone`
VALUES
    (1234567890, 'Home', 1),
    (2345678901, 'Cell', 1),
    (3456789012, 'Home', 2),
    (4567890123, 'Cell', 2);

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
    `ProductId` int NOT NULL,
    `Manufacturer` TEXT NOT NULL,
    `Name` TEXT NOT NULL,
    `Description` text NOT NULL,
    `Photo` TEXT DEFAULT NULL,
    `Price` decimal(5, 2) NOT NULL,
    PRIMARY KEY (`ProductId`)
);

INSERT INTO
    `product`
VALUES
    (
        1,
        'Mad Inventors Inc.',
        'Atomic Nose Hair Trimmer',
        'Trim your nose hairs with the precision of an atomic clock!',
        'photos/atomic.png',
        19.99
    ),
    (
        2,
        'Goofy Gadgets Corp.',
        'Selfie Toaster',
        'Get your face on your toast every morning with our selfie toaster!',
        'photos/selifet.png',
        24.99
    ),
    (
        3,
        'Absurd Accessories',
        'Cat-Poop Coffee',
        'The only coffee made from the finest cat poop beans!',
        'photos/catpoop.png',
        29.99
    ),
    (
        4,
        'Wacky Wares Ltd.',
        'Inflatable Briefcase',
        'Need more storage space? Inflate our briefcase to double its size!',
        'photos/inflatable.png',
        39.99
    ),
    (
        5,
        'Silly Supplies Co.',
        'Unicorn Horn Polish',
        'Keep your unicorn''s horn shiny and smooth with our magical polish!',
        'photos/unicorn.png',
        9.99
    );

DROP TABLE IF EXISTS `purchase`;

CREATE TABLE `purchase` (
    `PurchaseId` bigint NOT NULL,
    `ProductId` int NOT NULL,
    `ProductNo` tinyint NOT NULL DEFAULT '1',
    FOREIGN KEY (`ProductId`) REFERENCES `product` (`ProductId`) CONSTRAINT `Order-Product` UNIQUE (`PurchaseId`, `ProductId`)
);

INSERT INTO
    `purchase`
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 1),
    (4, 1, 3),
    (5, 2, 1),
    (6, 4, 2),
    (7, 5, 1),
    (8, 3, 2),
    (9, 1, 1),
    (10, 2, 3);

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
    `ReviewId` bigint NOT NULL,
    `UserId` bigint NOT NULL,
    `ProductId` int NOT NULL,
    `ReviewText` text NOT NULL,
    `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`ReviewId`),
    FOREIGN KEY (`ProductId`) REFERENCES `product` (`ProductId`),
    FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
);

INSERT INTO
    `review`
VALUES
    (
        1,
        1,
        3,
        'Great product, would definitely recommend!',
        '2022-01-01 12:30:00'
    ),
    (
        2,
        3,
        5,
        'This is the best thing I have ever bought!',
        '2022-01-02 13:45:00'
    ),
    (
        3,
        4,
        2,
        'Not worth the money, would not recommend',
        '2022-01-03 14:15:00'
    ),
    (
        4,
        4,
        4,
        'Disappointing purchase. Wouldn''t buy again.',
        '2022-01-04 15:00:00'
    ),
    (
        5,
        2,
        1,
        'Decent product for the price, happy with my purchase',
        '2022-01-05 16:30:00'
    ),
    (
        6,
        1,
        2,
        'Really impressed with the quality of this product!',
        '2022-01-06 17:00:00'
    ),
    (
        7,
        3,
        4,
        'Great value for the price, would buy again',
        '2022-01-07 18:15:00'
    ),
    (
        8,
        2,
        3,
        'Not the best quality, but it gets the job done',
        '2022-01-08 19:00:00'
    ),
    (
        9,
        2,
        5,
        'I am really happy with this purchase, it exceeded my expectations',
        '2022-01-09 20:30:00'
    ),
    (
        10,
        4,
        1,
        'Would not recommend this product, very disappointing',
        '2022-01-10 21:00:00'
    ),
    (
        11,
        3,
        3,
        'This product is great, I use it every day!',
        '2022-01-11 22:15:00'
    ),
    (
        12,
        1,
        5,
        'I would definitely buy this again, great value for the price',
        '2022-01-12 23:00:00'
    );

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
    `TransactionId` bigint NOT NULL,
    `UserId` bigint NOT NULL,
    `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `PaymentId` bigint NOT NULL,
    `PurchaseId` bigint NOT NULL,
    PRIMARY KEY (`TransactionId`),
    FOREIGN KEY (`PaymentId`) REFERENCES `paymentinfo` (`PaymentId`),
    FOREIGN KEY (`PurchaseId`) REFERENCES `purchase` (`PurchaseId`),
    FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
);

INSERT INTO
    `transaction`
VALUES
    (1, 1, '2022-01-01 12:30:00', 1, 1),
    (2, 2, '2022-01-02 10:45:00', 2, 2),
    (3, 1, '2022-01-03 15:20:00', 1, 3);

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
    `UserId` bigint NOT NULL,
    `Username` TEXT NOT NULL,
    `Email` TEXT NOT NULL,
    `Password` char(64) NOT NULL,
    `FirstName` TEXT NOT NULL,
    `LastName` TEXT NOT NULL,
    PRIMARY KEY (`UserId`)
);

INSERT INTO
    `user`
VALUES
    (
        1,
        'SirLaughs',
        '	sirlaughs@funny.com',
        '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',
        'Chuckles',
        'McPhee'
    ),
    (
        2,
        'Jokester',
        'jokester@hilarious.net',
        '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8',
        'Ha Ha',
        'Guffaw'
    ),
    (
        3,
        'Laughing',
        '	laughingoutloud@gmail.com',
        'e4ad93ca07acb8d908a3aa41e920ea4f4ef4f26e7f86cf8291c5db289780a5ae',
        'Giggles',
        'O''Malley'
    ),
    (
        4,
        'LOLz4Day',
        'lolz4day@roflmail.com',
        '15d7348d47ba6124bc8cea00b4ad8c9409d90bb9af14bbd29e5e730819b2e45c',
        'Tickle',
        'Fitzsimons'
    );