-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bd_ejercicio4
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `DNUMBER` int(10) unsigned NOT NULL,
  `DNAME` varchar(40) NOT NULL,
  `MGRSTARTDATE` date NOT NULL,
  `MGRSSN` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Headquarters','2020-12-03',686088),(4,'Marketing','2018-03-02',522249),(5,'Finance','2019-01-01',471295);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `SSN` int(10) unsigned NOT NULL,
  `SUPERSSN` int(10) unsigned DEFAULT NULL,
  `DNO` int(10) unsigned NOT NULL,
  `FNAME` varchar(20) NOT NULL,
  `LNAME` varchar(20) NOT NULL,
  `BDATE` date NOT NULL,
  `POSNUM` int(10) unsigned NOT NULL,
  `ADRESS` varchar(60) NOT NULL,
  `SEX` char(1) NOT NULL,
  `SALARY` int(10) unsigned NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `DNO` (`DNO`,`POSNUM`),
  KEY `POSNUM` (`POSNUM`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`POSNUM`) REFERENCES `position` (`POSNUMBER`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`DNO`) REFERENCES `department` (`DNUMBER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (123456789,333445555,5,'Giacomo','Vaar','2022-01-20',4,'5786 Stephen Circle','M',30000),(333445555,888665555,1,'Hobie','Swindells','2022-02-26',3,'46259 Browning Junction','M',40000),(453453453,333445555,5,'Allayne','Pallent','2022-04-26',5,'9102 David Hill','M',25000),(666884444,123456789,5,'Rita','Hearnah','2021-07-11',7,'508 Utah Pass','F',38000),(888665555,0,1,'Aymer','Burchmore','2021-12-07',1,'312 Bluestem Place','M',55000),(987654321,888665555,1,'Kellia','Aucott','2022-03-05',2,'629 Walton Court','F',43000),(987987987,987654321,5,'Joann','Warr','2022-04-04',8,'1 Hansons Park','F',41000),(999887777,123456789,5,'Duffie','Drake','2021-05-20',6,'7 Ramsey Place','M',25000);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `POSNUMBER` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `POSNAME` varchar(50) NOT NULL,
  PRIMARY KEY (`POSNUMBER`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'President - CEO'),(2,'Vice President of Marketing'),(3,'Vice President of Finance -CFO'),(4,'Treasurer'),(5,'Controller'),(6,'Cash Manager'),(7,'Credit Manager'),(8,'Tax Manager'),(9,'Cost Accounting Manager');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-30 13:58:27
