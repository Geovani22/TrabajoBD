-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bd_ejercicio1
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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `rut` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `comuna` varchar(40) NOT NULL,
  PRIMARY KEY (`rut`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Wit','Providencia'),(2,'Norton','Las condes'),(3,'Honoria','Ruta 8'),(4,'Umberto','Tennesse'),(5,'Dani','Nevada'),(6,'Martainn','Nevada'),(7,'Alvy','Providencia'),(8,'Pepe','Las condes'),(9,'Jerrine','Providencia'),(10,'Craggie','Ruta 8');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deptos`
--

DROP TABLE IF EXISTS `deptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deptos` (
  `numdep` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  PRIMARY KEY (`numdep`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deptos`
--

LOCK TABLES `deptos` WRITE;
/*!40000 ALTER TABLE `deptos` DISABLE KEYS */;
INSERT INTO `deptos` VALUES (1,'SALES','Sudafrica'),(2,'KASIO','Palestina'),(3,'NUTRESA','Indonesia'),(4,'SONIC','Francia'),(5,'PROTIENDA','New York');
/*!40000 ALTER TABLE `deptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `rut` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DEPTOS_numdep` int(10) unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `cargo` varchar(20) NOT NULL,
  `rut_jefe` int(10) unsigned NOT NULL,
  `sueldo` int(10) unsigned NOT NULL,
  `comision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`rut`),
  KEY `EMPLEADOS_FKIndex1` (`DEPTOS_numdep`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`DEPTOS_numdep`) REFERENCES `deptos` (`numdep`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,3,'WARD','MARQUETING',160,347776,94566),(2,3,'SCOTT','MARQUETING',240,390271,77021),(3,3,'TURNER','VENTAS',251,804095,49376),(4,5,'MARTIN','VENTAS',264,674653,95359),(5,5,'CLARK','SERVICIOS',197,694679,24955),(6,1,'ALLEN','VENTAS',121,483363,87674),(7,1,'JUAN','MANAGER',234,777241,87312),(8,3,'MARIA','MANAGER',186,365084,99741),(9,4,'LUCAS','INVESTIGACION',237,444837,91989),(10,4,'PEDRO','CONTABILIDAD',256,578951,63075);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados_has_grado`
--

DROP TABLE IF EXISTS `empleados_has_grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados_has_grado` (
  `EMPLEADOS_rut` int(10) unsigned NOT NULL,
  `GRADO_grado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`EMPLEADOS_rut`,`GRADO_grado`),
  KEY `EMPLEADOS_has_GRADO_FKIndex1` (`EMPLEADOS_rut`),
  KEY `EMPLEADOS_has_GRADO_FKIndex2` (`GRADO_grado`),
  CONSTRAINT `empleados_has_grado_ibfk_1` FOREIGN KEY (`EMPLEADOS_rut`) REFERENCES `empleados` (`rut`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `empleados_has_grado_ibfk_2` FOREIGN KEY (`GRADO_grado`) REFERENCES `grado` (`grado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados_has_grado`
--

LOCK TABLES `empleados_has_grado` WRITE;
/*!40000 ALTER TABLE `empleados_has_grado` DISABLE KEYS */;
INSERT INTO `empleados_has_grado` VALUES (1,1),(2,1),(3,2),(4,4),(7,4),(8,5),(9,1),(10,4),(10,5);
/*!40000 ALTER TABLE `empleados_has_grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grado`
--

DROP TABLE IF EXISTS `grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grado` (
  `grado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sueldo_inf` int(10) unsigned NOT NULL,
  `sueldo_sup` int(10) unsigned NOT NULL,
  PRIMARY KEY (`grado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grado`
--

LOCK TABLES `grado` WRITE;
/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
INSERT INTO `grado` VALUES (1,173894,757144),(2,372463,859661),(3,301943,563994),(4,161628,726644),(5,324826,761414);
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `precio` int(10) unsigned NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Televisor',93094),(2,'Computador',53621),(3,'Mesa',130487),(4,'Ventilador',90780),(5,'Nevera',12998),(6,'Proyector',139888),(7,'Dvd',93713),(8,'Cd',37861);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `num_venta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EMPLEADOS_rut` int(10) unsigned NOT NULL,
  `CLIENTES_rut` int(10) unsigned NOT NULL,
  `monto` int(10) unsigned NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`num_venta`),
  KEY `VENTAS_FKIndex1` (`CLIENTES_rut`),
  KEY `VENTAS_FKIndex2` (`EMPLEADOS_rut`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`CLIENTES_rut`) REFERENCES `clientes` (`rut`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`EMPLEADOS_rut`) REFERENCES `empleados` (`rut`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,6,10,822628,'2020-06-18'),(2,5,8,118207,'2013-09-01'),(3,5,7,570622,'2020-10-15'),(4,5,6,747340,'2016-04-03'),(5,5,4,595757,'2018-06-10'),(6,2,5,759968,'2011-10-20'),(7,1,1,277417,'2012-10-09'),(8,1,10,751335,'2019-08-14'),(9,2,1,119736,'2016-12-03'),(10,3,7,400138,'2017-05-04');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_detalle`
--

DROP TABLE IF EXISTS `ventas_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas_detalle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCTOS_codigo` int(10) unsigned NOT NULL,
  `VENTAS_num_venta` int(10) unsigned NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `VENTAS_DETALLE_FKIndex1` (`VENTAS_num_venta`),
  KEY `VENTAS_DETALLE_FKIndex2` (`PRODUCTOS_codigo`),
  CONSTRAINT `ventas_detalle_ibfk_1` FOREIGN KEY (`VENTAS_num_venta`) REFERENCES `ventas` (`num_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ventas_detalle_ibfk_2` FOREIGN KEY (`PRODUCTOS_codigo`) REFERENCES `productos` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalle`
--

LOCK TABLES `ventas_detalle` WRITE;
/*!40000 ALTER TABLE `ventas_detalle` DISABLE KEYS */;
INSERT INTO `ventas_detalle` VALUES (1,7,5,2),(2,1,6,8),(3,5,1,2),(4,5,8,9),(5,4,3,4),(6,5,8,7),(7,8,4,7),(8,3,7,1),(9,5,4,2),(10,1,7,5);
/*!40000 ALTER TABLE `ventas_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25 22:03:28
