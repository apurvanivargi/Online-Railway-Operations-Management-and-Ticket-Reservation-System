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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `added_date` date NOT NULL,
  `added_by` int(11) DEFAULT NULL,
  `modified_date` date NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `supervisor_id` (`supervisor_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`supervisor_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'john','Smith',1,'john@gmail.com','8573996457','Boylston St','Boston','MA','M','1991-02-03',NULL,'2018-12-11',1,'2018-12-11',1,1),(2,'Norma','frazier',1,'n@gmail.com','8573996458','Smith St','Boston','MA','F','1985-02-03',1,'2018-12-11',1,'2018-12-11',1,1),(3,'Ronald','Jolly',1,'ro@gmail.com','8573906458','Mcgreavy St','Boston','MA','F','1994-02-03',1,'2018-12-11',1,'2018-12-11',1,1),(4,'Mathew','Reynold',2,'mathew34@gmail.com','785963456','Botolph st','Boston','MA','M','1980-02-03',NULL,'2018-12-11',1,'2018-12-11',1,1),(5,'Haley','Lu',2,'haley67@gmail.com','852369789','smith st','Boston','MA','F','1999-09-09',4,'2018-12-11',1,'2018-12-11',1,1),(6,'Yash','Lekhwani',3,'yash66@gmail.com','789456236','mc st','Boston','MA','M','1990-02-02',NULL,'2018-12-11',1,'2018-12-11',1,1),(7,'pooja','dharma',2,'pooja78@gmail.com','789456369','smith st','Boston','MA','F','1996-02-05',4,'2018-12-11',1,'2018-12-11',1,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-13 11:39:05
