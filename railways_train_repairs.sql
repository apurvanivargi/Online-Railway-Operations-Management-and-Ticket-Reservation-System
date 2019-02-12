CREATE DATABASE  IF NOT EXISTS `railways` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `railways`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: railways
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `train_repairs`
--

DROP TABLE IF EXISTS `train_repairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `train_repairs` (
  `repairs_id` int(11) NOT NULL AUTO_INCREMENT,
  `repairs_type` varchar(50) DEFAULT NULL,
  `repairs_cost` float DEFAULT NULL,
  `repairs_zone_id` int(11) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `train_id` int(11) DEFAULT NULL,
  `repair_status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`repairs_id`),
  KEY `repairs_zone_id` (`repairs_zone_id`),
  KEY `train_id` (`train_id`),
  KEY `supervisor_id` (`supervisor_id`),
  KEY `repair_status_id` (`repair_status_id`),
  CONSTRAINT `train_repairs_ibfk_1` FOREIGN KEY (`repairs_zone_id`) REFERENCES `train_zone` (`zone_id`),
  CONSTRAINT `train_repairs_ibfk_2` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`),
  CONSTRAINT `train_repairs_ibfk_3` FOREIGN KEY (`supervisor_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `train_repairs_ibfk_4` FOREIGN KEY (`repair_status_id`) REFERENCES `repair_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_repairs`
--

LOCK TABLES `train_repairs` WRITE;
/*!40000 ALTER TABLE `train_repairs` DISABLE KEYS */;
INSERT INTO `train_repairs` VALUES (1,'light repair',500,1,1,1,4),(2,'coach repair',500,1,1,1,1);
/*!40000 ALTER TABLE `train_repairs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-13 11:39:08
