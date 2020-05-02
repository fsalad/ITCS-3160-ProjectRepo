CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `DriverID` int NOT NULL,
  `StudentID` int DEFAULT NULL,
  `DateHired` date DEFAULT NULL,
  `Ratings` varchar(45) DEFAULT NULL,
  `LicenseNumber` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`DriverID`),
  KEY `StudentID_idx` (`StudentID`),
  CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (101,47,'2019-06-29','4/5','fi3980'),(201,27,'2020-02-15','5/5','js4003');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `drivers_BEFORE_INSERT` BEFORE INSERT ON `drivers` FOR EACH ROW BEGIN
IF NEW.`Ratings` NOT LIKE '%_/_%' THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'Ratings column not valid must be _/_ format';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `FacultyID` int NOT NULL,
  `Title` varchar(80) DEFAULT NULL,
  `HighestDegree` varchar(80) DEFAULT NULL,
  `DegreeCollege` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FacultyID`),
  CONSTRAINT `FacultyID` FOREIGN KEY (`FacultyID`) REFERENCES `persons` (`PersonsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Assistant Professor','PhD','UF'),(2,'Professor','Master','SJSU'),(3,'Adjunct Professor','Master','UNCC');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `LocationID` int NOT NULL,
  `LocationName` varchar(100) DEFAULT NULL,
  `LocationAddress` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (401,'Student Union','408 Craven Rd'),(402,'West Dorm','1148 Columbus Crossing'),(403,'East Dorm','264 Lawrence Lane');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `RestaurantID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `DriverID` int DEFAULT NULL,
  `FoodOrdered` varchar(200) DEFAULT NULL,
  `FoodCost` float DEFAULT NULL,
  `DeliveryFee` float DEFAULT NULL,
  `TotalCost` float DEFAULT NULL,
  `DeliveryTime` time DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID_idx` (`CustomerID`),
  KEY `RestaurantID_idx` (`RestaurantID`),
  KEY `DriverID_idx` (`DriverID`),
  KEY `OrderId` (`OrderID`,`CustomerID`),
  CONSTRAINT `CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `persons` (`PersonsID`),
  CONSTRAINT `DriverID` FOREIGN KEY (`DriverID`) REFERENCES `drivers` (`DriverID`),
  CONSTRAINT `RestaurantID` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurants` (`RestaurantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,101,1,101,'#5 Combo, #4 Combo',18.25,2,20.25,'00:13:52'),(2,102,2,201,'#8 combo, chocolate frosty',16.25,2,18.25,'00:41:33'),(3,101,1,101,'20 piece nugget',10,2,12,'33:44:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_has_locations`
--

DROP TABLE IF EXISTS `orders_has_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_has_locations` (
  `Orders_OrderID` int NOT NULL,
  `Locations_LocationID` int NOT NULL,
  PRIMARY KEY (`Orders_OrderID`,`Locations_LocationID`),
  KEY `fk_Orders_has_Locations_Locations1_idx` (`Locations_LocationID`),
  KEY `fk_Orders_has_Locations_Orders1_idx` (`Orders_OrderID`),
  CONSTRAINT `fk_Orders_has_Locations_Locations1` FOREIGN KEY (`Locations_LocationID`) REFERENCES `locations` (`LocationID`),
  CONSTRAINT `fk_Orders_has_Locations_Orders1` FOREIGN KEY (`Orders_OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_has_locations`
--

LOCK TABLES `orders_has_locations` WRITE;
/*!40000 ALTER TABLE `orders_has_locations` DISABLE KEYS */;
INSERT INTO `orders_has_locations` VALUES (3,401),(1,403),(2,403);
/*!40000 ALTER TABLE `orders_has_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `PersonsID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(65) DEFAULT NULL,
  `PhoneNumber` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`PersonsID`),
  KEY `PersonId` (`PersonsID`,`Name`,`Email`,`PhoneNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (1,'Rahsaan Collins','rcollins@uncc.edu','920-455-1200'),(2,'Ansel Welch','awelch@uncc.edu','889-941-2235'),(3,'Axel Bins PhD','abins@uncc.edu','705-225-3310'),(26,'Frank Leffler','fleffler@uncc.edu','704-336-9201'),(27,'Eden Schowalter','eschowalter@uncc.edu','704-329-1027'),(28,'Eldridge Von','evon@uncc.edu','910-581-5418'),(39,'Dagmar Kassulke','dkassulke@uncc.edu','704-228-1802'),(46,'Haylee Hickle','hayleehickle@uncc.edu','910-825-6610'),(47,'Mallory Rolfson','mrolfson@uncc.edu','919-774-7720'),(48,'Lelia Tromp','ltromp@uncc.edu','706-335-1209');
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `persons_BEFORE_INSERT` BEFORE INSERT ON `persons` FOR EACH ROW BEGIN
IF NEW.`Email` NOT LIKE '%_@%_.__%' THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'Email format is not valid';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `RestaurantID` int NOT NULL,
  `RestaurantType` varchar(60) DEFAULT NULL,
  `RestaurantName` varchar(100) DEFAULT NULL,
  `RestaurantAddress` varchar(200) DEFAULT NULL,
  `RestaurantPhoneNumber` varchar(12) DEFAULT NULL,
  `RestaurantWebsite` varchar(80) DEFAULT NULL,
  `RestaurantSchedule` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RestaurantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (101,'fastfood','Chic-fil-a','2158 Victory St','704-333-9291','www.chicfila.com','Monday-Friday 9am-10pm\"'),(102,'fastfood','Wendys','5188 Tasty Rd','704-891-2247','www.wendys.com','Everyday 7am-11pm\"'),(103,'fastfood','McDonalds','331 Rival Avenue','980-272-4001','www.McDonalds.com','Open 24/7\"');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `restaurants_BEFORE_INSERT` BEFORE INSERT ON `restaurants` FOR EACH ROW BEGIN
	IF NEW.`RestaurantWebsite` NOT LIKE '%_._%_.__%' THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'Website format not valid';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL,
  `Position` varchar(80) DEFAULT NULL,
  `AdminYorN` char(1) DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `StaffID` FOREIGN KEY (`StaffID`) REFERENCES `persons` (`PersonsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (26,'VP Acad Affairs','Y'),(27,'Lab Assistant','N'),(28,'Dean Engineering','Y');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `StudentID` int NOT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `GradYear` year DEFAULT NULL,
  `Major` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `StudentID_idx` (`StudentID`),
  CONSTRAINT `StudentID` FOREIGN KEY (`StudentID`) REFERENCES `persons` (`PersonsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (27,'Graduate',2024,'Computer Science'),(39,'Undergraduate',2020,'Philosophy'),(47,'Undergraduate',2022,'Accounting'),(48,'Graduate',2022,'Electronics');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `students_BEFORE_UPDATE` BEFORE UPDATE ON `students` FOR EACH ROW BEGIN
IF new.GradYear < 2020 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Current student cannot have a graduation date before the current year';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `SelectAllOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SelectAllOrders`()
BEGIN
	SELECT *  FROM orders;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-01 20:05:05
