-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bd_ejercicio2
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
-- Table structure for table `dept2`
--

DROP TABLE IF EXISTS `dept2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept2` (
  `DEPT_NO` int(2) unsigned NOT NULL,
  `DNOMBRE` varchar(14) DEFAULT NULL,
  `LOC` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`DEPT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept2`
--

LOCK TABLES `dept2` WRITE;
/*!40000 ALTER TABLE `dept2` DISABLE KEYS */;
INSERT INTO `dept2` VALUES (10,'Investigacion','Bogota'),(20,'Contabilidad','Brasilia'),(30,'Ventas','New York'),(40,'Operaciones','Quito'),(50,'Tesoreria','Caracas');
/*!40000 ALTER TABLE `dept2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `DOCTOR_NO` int(3) unsigned NOT NULL,
  `hospital_HOSPITAL_COD` int(2) unsigned NOT NULL,
  `APELLIDO` varchar(13) DEFAULT NULL,
  `ESPECIALIDAD` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`DOCTOR_NO`),
  KEY `doctor_FKIndex1` (`hospital_HOSPITAL_COD`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`hospital_HOSPITAL_COD`) REFERENCES `hospital` (`HOSPITAL_COD`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (511,45,'Perez H.','Ginecologia'),(606,10,'Lopez G.','Pediatria'),(637,31,'Nico A.','Psiquiatria'),(673,22,'Galo D.','Cardiologia'),(805,26,'Kloff L.','Cirugia');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp` (
  `EPM_NO` int(4) unsigned NOT NULL,
  `dept2_DEPT_NO` int(2) unsigned NOT NULL,
  `APELLIDO` varchar(10) DEFAULT NULL,
  `OFICIO` varchar(10) DEFAULT NULL,
  `DIR` int(4) unsigned DEFAULT NULL,
  `FECHA_ALTA` date DEFAULT NULL,
  `SALARIO` int(10) unsigned DEFAULT NULL,
  `COMISION` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`EPM_NO`),
  KEY `emp_FKIndex1` (`dept2_DEPT_NO`),
  CONSTRAINT `emp_ibfk_1` FOREIGN KEY (`dept2_DEPT_NO`) REFERENCES `dept2` (`DEPT_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (7000,20,'Vergara D.','Analista',7002,'2018-09-09',100000,0),(7034,10,'Rey','Vendedor',7568,'2019-02-01',283721,0),(7192,40,'Jimenez','Analista',7666,'2018-12-04',733712,338727),(7209,30,'Rodriguez','Analista',7301,'2022-01-12',815517,0),(7813,50,'Arroyo','Presidente',7272,'2015-11-16',686919,217515),(7847,20,'Alonso','Director',7358,'2021-05-30',283620,893712);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermo`
--

DROP TABLE IF EXISTS `enfermo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermo` (
  `idenfermo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ocupacion_INSCRIPCION` int(5) unsigned NOT NULL,
  `APELLIDO` varchar(15) DEFAULT NULL,
  `DIRECCION` varchar(20) DEFAULT NULL,
  `FECHA_NAC` date DEFAULT NULL,
  `S` char(1) DEFAULT NULL,
  `NSS` int(9) unsigned DEFAULT NULL,
  PRIMARY KEY (`idenfermo`),
  KEY `enfermo_FKIndex1` (`ocupacion_INSCRIPCION`),
  CONSTRAINT `enfermo_ibfk_1` FOREIGN KEY (`ocupacion_INSCRIPCION`) REFERENCES `ocupacion` (`INSCRIPCION`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermo`
--

LOCK TABLES `enfermo` WRITE;
/*!40000 ALTER TABLE `enfermo` DISABLE KEYS */;
INSERT INTO `enfermo` VALUES (1,14763,'Fernandez A.','Avenida 24','2022-12-01','M',7781570),(2,17101,'Marron R.','Carrera 45','2012-11-02','F',4718139),(3,31475,'Cervantes L.','Calle 34-1','2018-07-03','M',7308647),(4,78641,'Serrano O.','Transversal 21','2013-02-04','M',6370852),(5,60788,'Ruiz A.','Carrera 45-87','2016-12-05','F',5526683);
/*!40000 ALTER TABLE `enfermo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `HOSPITAL_COD` int(2) unsigned NOT NULL,
  `NOMBRE` varchar(10) DEFAULT NULL,
  `DIRECCION` varchar(20) DEFAULT NULL,
  `TELEFONO` int(8) unsigned DEFAULT NULL,
  `NUM_CAMA` int(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`HOSPITAL_COD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (10,'Imat','Circumbalar 32',7769088,888),(22,'San Pedro','Avenida 1-20',7761088,150),(26,'Jerusalen','Carrera 11 -22',7762088,508),(31,'Central','Calle 2 ',7769081,394),(45,'Regional','Carrera 45-A ',7769488,844);
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocupacion`
--

DROP TABLE IF EXISTS `ocupacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ocupacion` (
  `INSCRIPCION` int(5) unsigned NOT NULL,
  `sala_SALA_COD` int(2) unsigned NOT NULL,
  `hospital_HOSPITAL_COD` int(2) unsigned NOT NULL,
  `CAMA` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`INSCRIPCION`),
  KEY `ocupacion_FKIndex1` (`hospital_HOSPITAL_COD`),
  KEY `ocupacion_FKIndex2` (`sala_SALA_COD`),
  CONSTRAINT `ocupacion_ibfk_1` FOREIGN KEY (`hospital_HOSPITAL_COD`) REFERENCES `hospital` (`HOSPITAL_COD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ocupacion_ibfk_2` FOREIGN KEY (`sala_SALA_COD`) REFERENCES `sala` (`SALA_COD`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupacion`
--

LOCK TABLES `ocupacion` WRITE;
/*!40000 ALTER TABLE `ocupacion` DISABLE KEYS */;
INSERT INTO `ocupacion` VALUES (14763,1,10,1),(17101,2,22,2),(31475,3,31,3),(60788,5,26,5),(78641,4,45,4);
/*!40000 ALTER TABLE `ocupacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plantilla`
--

DROP TABLE IF EXISTS `plantilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plantilla` (
  `idplantilla` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `emp_EPM_NO` int(4) unsigned NOT NULL,
  `sala_SALA_COD` int(2) unsigned NOT NULL,
  `hospital_HOSPITAL_COD` int(2) unsigned NOT NULL,
  `APELLIDO` varchar(15) DEFAULT NULL,
  `FUNCION` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `TURNO` char(1) DEFAULT NULL,
  `SALARIO` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idplantilla`),
  KEY `plantilla_FKIndex1` (`hospital_HOSPITAL_COD`),
  KEY `plantilla_FKIndex2` (`sala_SALA_COD`),
  KEY `plantilla_FKIndex3` (`emp_EPM_NO`),
  CONSTRAINT `plantilla_ibfk_1` FOREIGN KEY (`hospital_HOSPITAL_COD`) REFERENCES `hospital` (`HOSPITAL_COD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `plantilla_ibfk_2` FOREIGN KEY (`sala_SALA_COD`) REFERENCES `sala` (`SALA_COD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `plantilla_ibfk_3` FOREIGN KEY (`emp_EPM_NO`) REFERENCES `emp` (`EPM_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantilla`
--

LOCK TABLES `plantilla` WRITE;
/*!40000 ALTER TABLE `plantilla` DISABLE KEYS */;
INSERT INTO `plantilla` VALUES (1,7034,1,10,'Ganzira B.','Enfermero','T',1366799),(2,7847,2,22,'Hernandez F.','Enfermera','T',2826312),(3,7209,3,31,'Rivera A.','Interno','M',1749780),(4,7192,4,45,'Garcia G.','Enfermera','M',2360994),(5,7813,5,26,'Diaz Y.','Enfermero','N',1962747),(6,7000,3,45,'Correa A.','Enfermero','T',200000);
/*!40000 ALTER TABLE `plantilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sala` (
  `SALA_COD` int(2) unsigned NOT NULL,
  `hospital_HOSPITAL_COD` int(2) unsigned NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `NUM_CAMA` int(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`SALA_COD`),
  KEY `sala_FKIndex1` (`hospital_HOSPITAL_COD`),
  CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`hospital_HOSPITAL_COD`) REFERENCES `hospital` (`HOSPITAL_COD`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,10,'Cuidados Intensivos',21),(2,22,'Maternidad',33),(3,31,'Recuperacion',45),(4,45,'Cardiologia',11),(5,26,'Psiquiatrico',67);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-01 12:55:41
