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