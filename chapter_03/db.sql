CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `paymentinfo`
--

DROP TABLE IF EXISTS `paymentinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentinfo` (
  `PaymentId` bigint NOT NULL,
  `CreditCardNumber` bigint NOT NULL,
  `ExpiryDate` char(4) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Csc` smallint NOT NULL,
  `UserId` bigint NOT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`PaymentId`),
  KEY `fk_PaymentInfo_User1_idx` (`UserId`),
  CONSTRAINT `fk_PaymentInfo_User1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentinfo`
--

LOCK TABLES `paymentinfo` WRITE;
/*!40000 ALTER TABLE `paymentinfo` DISABLE KEYS */;
INSERT INTO `paymentinfo` VALUES (1,1234567890123456,'0122','John Doe',123,1,'123 Main St'),(2,9876543210987654,'0324','Jane Smith',456,2,'456 Elm St');
/*!40000 ALTER TABLE `paymentinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone` (
  `PhoneNumber` bigint NOT NULL,
  `Type` enum('Home','Cell') NOT NULL,
  `User_UserId` bigint NOT NULL,
  PRIMARY KEY (`PhoneNumber`,`User_UserId`),
  KEY `fk_Phone_User1_idx` (`User_UserId`),
  CONSTRAINT `fk_Phone_User1` FOREIGN KEY (`User_UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
INSERT INTO `phone` VALUES (1234567890,'Home',1),(2345678901,'Cell',1),(3456789012,'Home',2),(4567890123,'Cell',2);
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductId` int NOT NULL,
  `Manufacturer` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Photo` varchar(1000) DEFAULT NULL,
  `Price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Mad Inventors Inc.','Atomic Nose Hair Trimmer','Trim your nose hairs with the precision of an atomic clock!','photos/atomic.png',19.99),(2,'Goofy Gadgets Corp.','Selfie Toaster','Get your face on your toast every morning with our selfie toaster!','photos/selifet.png',24.99),(3,'Absurd Accessories','Cat-Poop Coffee','The only coffee made from the finest cat poop beans!','photos/catpoop.png',29.99),(4,'Wacky Wares Ltd.','Inflatable Briefcase','Need more storage space? Inflate our briefcase to double its size!','photos/inflatable.png',39.99),(5,'Silly Supplies Co.','Unicorn Horn Polish','Keep your unicorn\'s horn shiny and smooth with our magical polish!','photos/unicorn.png',9.99);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `PurchaseId` bigint NOT NULL,
  `ProductId` int NOT NULL,
  `ProductNo` tinyint NOT NULL DEFAULT '1',
  UNIQUE KEY `Order-Product` (`PurchaseId`,`ProductId`),
  KEY `fk_Order_Product1_idx` (`ProductId`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_Order_Product1` FOREIGN KEY (`ProductId`) REFERENCES `product` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,1,1),(2,2,2),(3,3,1),(4,1,3),(5,2,1),(6,4,2),(7,5,1),(8,3,2),(9,1,1),(10,2,3);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `ReviewId` bigint NOT NULL,
  `UserId` bigint NOT NULL,
  `ProductId` int NOT NULL,
  `ReviewText` text NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ReviewId`),
  KEY `fk_User_has_Product_Product2_idx` (`ProductId`),
  KEY `fk_User_has_Product_User1_idx` (`UserId`),
  CONSTRAINT `fk_User_has_Product_Product2` FOREIGN KEY (`ProductId`) REFERENCES `product` (`ProductId`),
  CONSTRAINT `fk_User_has_Product_User1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,3,'Great product, would definitely recommend!','2022-01-01 12:30:00'),(2,3,5,'This is the best thing I have ever bought!','2022-01-02 13:45:00'),(3,4,2,'Not worth the money, would not recommend','2022-01-03 14:15:00'),(4,4,4,'Disappointing purchase. Wouldn\'t buy again.','2022-01-04 15:00:00'),(5,2,1,'Decent product for the price, happy with my purchase','2022-01-05 16:30:00'),(6,1,2,'Really impressed with the quality of this product!','2022-01-06 17:00:00'),(7,3,4,'Great value for the price, would buy again','2022-01-07 18:15:00'),(8,2,3,'Not the best quality, but it gets the job done','2022-01-08 19:00:00'),(9,2,5,'I am really happy with this purchase, it exceeded my expectations','2022-01-09 20:30:00'),(10,4,1,'Would not recommend this product, very disappointing','2022-01-10 21:00:00'),(11,3,3,'This product is great, I use it every day!','2022-01-11 22:15:00'),(12,1,5,'I would definitely buy this again, great value for the price','2022-01-12 23:00:00');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `TransactionId` bigint NOT NULL,
  `UserId` bigint NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PaymentId` bigint NOT NULL,
  `PurchaseId` bigint NOT NULL,
  PRIMARY KEY (`TransactionId`),
  KEY `fk_User_has_Product_User_idx` (`UserId`),
  KEY `fk_Purchase_PaymentInfo1_idx` (`PaymentId`),
  KEY `fk_Transaction_Order1_idx` (`PurchaseId`),
  CONSTRAINT `fk_Purchase_PaymentInfo1` FOREIGN KEY (`PaymentId`) REFERENCES `paymentinfo` (`PaymentId`),
  CONSTRAINT `fk_Transaction_Order1` FOREIGN KEY (`PurchaseId`) REFERENCES `purchase` (`PurchaseId`),
  CONSTRAINT `fk_User_has_Product_User` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1,'2022-01-01 12:30:00',1,1),(2,2,'2022-01-02 10:45:00',2,2),(3,1,'2022-01-03 15:20:00',1,3);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserId` bigint NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` char(64) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `Username_UNIQUE` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'SirLaughs','	sirlaughs@funny.com','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','Chuckles','McPhee'),(2,'Jokester','jokester@hilarious.net','5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','Ha Ha','Guffaw'),(3,'Laughing','	laughingoutloud@gmail.com','e4ad93ca07acb8d908a3aa41e920ea4f4ef4f26e7f86cf8291c5db289780a5ae','Giggles','O\'Malley'),(4,'LOLz4Day','lolz4day@roflmail.com','15d7348d47ba6124bc8cea00b4ad8c9409d90bb9af14bbd29e5e730819b2e45c','Tickle','Fitzsimons');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-07 19:03:54
