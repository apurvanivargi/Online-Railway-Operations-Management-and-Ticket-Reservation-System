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
-- Table structure for table `passenger_details`
--

DROP TABLE IF EXISTS `passenger_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `passenger_details` (
  `Passenger_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Passenger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_details`
--

LOCK TABLES `passenger_details` WRITE;
/*!40000 ALTER TABLE `passenger_details` DISABLE KEYS */;
INSERT INTO `passenger_details` VALUES (1,'John','Gerard','8573996716','john21@gmail.com','78 Boylston','Boston','MA','1994-02-04','M'),(2,'Gabriello','Occleshaw','4132330261','goccleshaw10@gmail.com','8150 Holy Cross Junction','Springfield','Massachusetts','1981-10-07','M'),(3,'Jolynn','Aulton','7819637476','jaulton11@gmail.com','202 Carioca Trail','Newton','Massachusetts','1994-03-16','F'),(4,'Britni','Daborne','4131079597','bdaborne10@gmail.com','361 Lukken Trail','Springfield','Massachusetts','1995-02-04','F'),(5,'Elizabeth','Frondt','6171731885','efrondt31@gmail.com','94 Petterle Center','Boston','Massachusetts','1986-02-13','F'),(6,'Rosco','Mellish','8572440595','rmellish10@gmail.com','57532 Arapahoe Center','Boston','Massachusetts','1985-01-04','M'),(7,'Leonerd','Besnard','8574417010','lbesnard10@gmail.com','7276 Meadow Vale Crossing','Boston','Massachusetts','1990-11-05','M'),(8,'Cynthea','Bentjens','9788059614','cbentjens10@gmail.com','454 Sycamore Circle','Boston','Massachusetts','1981-12-28','F'),(9,'Audrie','Eriksson','7815061182','aeriksson71@gmail.com','1 6th Court','Boston','Massachusetts','1992-04-20','F'),(10,'Elenore','Bierman','7746116768','ebierman10@gmail.com','52 Warner Court','Worcester','Massachusetts','1991-01-07','F'),(11,'Barrie','Doby','6178593201','bdoby10@gmail.com','663 Fair Oaks Trail','Boston','Massachusetts','1996-09-14','F'),(12,'Mildred','Grunwald','6177059457','mgrunwalda10@gmail.com','6254 Golden Leaf Street','Watertown','Massachusetts','1991-08-27','F'),(13,'Kellia','Mallett','6175113238','kmallettb10@gmail.com','28 Hovde Alley','Lynn','Massachusetts','1989-11-26','F'),(14,'Antoine','Hazeldene','6176779704','ahazeldenec10@gmail.com','112 Shelley Alley','Boston','Massachusetts','1989-07-26','M'),(15,'Gerhardine','Antczak','6179111650','gantczakd10@gmail.com','62 Grayhawk Drive','Boston','Massachusetts','1997-01-14','F'),(16,'Staffard','Markwell','9785159647','smarkwelle10@gmail.com','65 Hayes Way','Watertown','Massachusetts','1995-02-25','M'),(17,'Clint','Persent','4131211301','cpersentf10@gmail.com','9849 Delaware Road','Springfield','Massachusetts','1998-02-25','M'),(18,'Phillie','Chrystal','6177522214','pchrystalg10@gmail.com','443 Independence Park','Boston','Massachusetts','1987-12-11','F'),(19,'Killian','O\'Scully','5083601494','koscullyh10@gmail.com','46 Scofield Crossing','Worcester','Massachusetts','1999-03-06','M'),(20,'Killie','Flye','5083640338','kflyei10@gmail.com','763 Everett Hill','Worcester','Massachusetts','1988-08-20','M'),(21,'Teddy','Goodlad','6177347493','tgoodladj10@gmail.com','752 Buena Vista Place','Boston','Massachusetts','1985-03-19','M');
/*!40000 ALTER TABLE `passenger_details` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `for_passenger` BEFORE INSERT ON `passenger_details` FOR EACH ROW Begin
if(new.mobile_number REGEXP '^-?[0-9]+$') = 0 THEN
#if(new.mobile_number REGEXP '^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$') = 0 THEN
SIGNAL SQLSTATE '12345'
SET message_text = 'Invalid input';
end if;
if not(new.email_id REGEXP '^[a-z0-9](\.?[a-z0-9]){5,}@g(oogle)?mail\.com$' ) THEN 
SIGNAL SQLSTATE '45000' SET message_text = 'Wrong Email';
End if;
End */;;
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

-- Dump completed on 2018-12-13 11:39:09
