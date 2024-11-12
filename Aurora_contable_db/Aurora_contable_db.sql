-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: aurora_contable_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.8-MariaDB-0ubuntu0.24.04.1

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
-- Table structure for table `abonos`
--

DROP TABLE IF EXISTS `abonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abonos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cabFactura_id` bigint(20) unsigned NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abonos_cabfactura_id_foreign` (`cabFactura_id`),
  CONSTRAINT `abonos_cabfactura_id_foreign` FOREIGN KEY (`cabFactura_id`) REFERENCES `cabFacturas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonos`
--

LOCK TABLES `abonos` WRITE;
/*!40000 ALTER TABLE `abonos` DISABLE KEYS */;
INSERT INTO `abonos` VALUES (6,1,10.00,75.00,'2024-08-08','Abono de $10','Abonado','eavila',NULL,'2024-08-01 20:21:38',NULL,'1'),(9,36,10.00,90.00,'2024-08-01','Se hace un abono de $10','Abonado','eavila',NULL,'2024-08-02 02:12:08',NULL,'1'),(10,37,10.00,5.00,'2024-10-10','Se abona $10','Abonado','mvera0986',NULL,'2024-10-10 06:34:51',NULL,'4'),(11,37,5.00,0.00,'2024-10-11','Se cancela el restante','Abonado','mvera0986',NULL,'2024-10-10 06:42:16',NULL,'4'),(12,39,10.00,67.99,'2024-10-23','Se abona $10','Abonado','mvera0986',NULL,'2024-10-23 16:07:39',NULL,'4'),(13,40,10.00,5.00,'2024-10-23','Se actualiza el abono a $10','Abonado','mvera0986','mvera0986','2024-10-23 16:27:14','2024-10-23 16:39:38','4'),(14,40,3.00,2.00,'2024-10-23','Se abona $3','Abonado','mvera0986',NULL,'2024-10-23 23:20:49',NULL,'4'),(15,39,25.00,42.99,'2024-10-23','Se abona','Abonado','mvera0986','mvera0986','2024-10-23 23:47:09','2024-10-23 23:49:02','4'),(17,41,5.00,10.00,'2024-10-23',NULL,'Abonado','mvera0986','mvera0986','2024-10-23 23:56:27','2024-10-24 02:48:04','4'),(18,41,5.00,5.00,'2024-10-24',NULL,'Abonado','mvera0986',NULL,'2024-10-24 15:57:37',NULL,'4'),(19,41,2.00,3.00,'2024-10-24',NULL,'Abonado','mvera0986',NULL,'2024-10-24 16:02:28',NULL,'4'),(20,41,2.00,1.00,'2024-10-24',NULL,'Abonado','mvera0986',NULL,'2024-10-24 16:08:42',NULL,'4'),(21,42,10.00,84.99,'2024-10-24',NULL,'Abonado','mvera0986',NULL,'2024-10-24 16:13:33',NULL,'4'),(22,42,10.99,74.00,'2024-10-24',NULL,'Abonado','mvera0986',NULL,'2024-10-24 16:14:19',NULL,'4'),(23,43,20.99,59.00,'2024-10-24',NULL,'Abonado','mvera0986',NULL,'2024-10-24 16:15:24',NULL,'4'),(24,43,15.00,44.00,'2024-10-24',NULL,'Abonado','mvera0986',NULL,'2024-10-24 16:17:55',NULL,'4'),(25,44,15.00,26.39,'2024-10-24',NULL,'Abonado','mvera0986',NULL,'2024-10-24 16:23:52',NULL,'4'),(26,44,10.00,16.39,'2024-10-24',NULL,'Abonado','mvera0986',NULL,'2024-10-24 16:24:19',NULL,'4'),(27,44,6.00,10.39,'2024-10-24',NULL,'Abonado','mvera0986',NULL,'2024-10-24 16:49:27',NULL,'4'),(28,45,5.00,10.00,'2024-10-24',NULL,'Abonado','mvera0986',NULL,'2024-10-24 16:50:01',NULL,'4'),(30,46,10.00,31.39,'2024-10-24',NULL,'Abonado','mvera0986',NULL,'2024-10-24 23:35:12',NULL,'4'),(31,46,20.00,11.39,'2024-10-24',NULL,'Abonado','mvera0986',NULL,'2024-10-24 23:42:40',NULL,'4'),(32,47,25.00,32.49,'2024-10-24',NULL,'Abonado','mvera0986',NULL,'2024-10-24 23:43:23',NULL,'4'),(33,49,5.00,10.00,'2024-10-26',NULL,'Abonado','mvera0986',NULL,'2024-10-26 16:38:04',NULL,'4'),(34,49,5.00,5.00,'2024-10-26',NULL,'Abonado','mvera0986',NULL,'2024-10-26 16:53:31',NULL,'4'),(35,50,50.00,29.99,'2024-10-26',NULL,'Abonado','mvera0986',NULL,'2024-10-26 22:57:26',NULL,'4'),(36,51,5.00,10.00,'2024-10-26',NULL,'Abonado','mvera0986',NULL,'2024-10-26 22:57:50',NULL,'4'),(37,52,100.00,50.00,'2024-10-26',NULL,'Abonado','mvera0986',NULL,'2024-10-26 23:01:19',NULL,'4'),(38,52,20.00,30.00,'2024-10-26',NULL,'Abonado','mvera0986',NULL,'2024-10-26 23:06:42',NULL,'4'),(39,72,50.99,29.00,'2024-11-01','Se abona el primer pago','Abonado','mvera0986',NULL,'2024-11-01 20:19:40',NULL,'4'),(40,75,10.00,69.99,'2024-11-04',NULL,'Abonado','mvera0986',NULL,'2024-11-04 20:11:04',NULL,'4'),(41,75,5.00,64.99,'2024-11-04','Pago','Abonado','mvera0986',NULL,'2024-11-04 21:10:43',NULL,'4'),(42,75,5.00,59.99,'2024-11-08','Pago','Abonado','mvera0986',NULL,'2024-11-04 21:12:23',NULL,'4'),(43,75,10.00,49.99,'2024-11-12','Pago','Abonado','mvera0986',NULL,'2024-11-04 21:16:01',NULL,'4'),(44,75,5.00,44.99,'2024-11-16','Pago','Abonado','mvera0986',NULL,'2024-11-04 21:17:17',NULL,'4'),(45,75,5.00,39.99,'2024-11-19','Pago','Abonado','mvera0986',NULL,'2024-11-04 21:18:03',NULL,'4'),(46,75,5.00,34.99,'2024-11-19','Pago','Abonado','mvera0986',NULL,'2024-11-04 21:28:45',NULL,'4'),(47,75,5.00,29.99,'2024-11-30',NULL,'Abonado','mvera0986',NULL,'2024-11-04 21:30:18',NULL,'4'),(48,75,5.00,24.99,'2024-12-07',NULL,'Abonado','mvera0986',NULL,'2024-11-04 21:31:56',NULL,'4'),(49,75,5.00,19.99,'2024-12-10',NULL,'Abonado','mvera0986',NULL,'2024-11-04 21:34:45',NULL,'4'),(50,75,5.99,14.00,'2024-12-17',NULL,'Abonado','mvera0986',NULL,'2024-11-04 21:35:43',NULL,'4'),(51,75,5.00,9.00,'2024-12-24',NULL,'Abonado','mvera0986',NULL,'2024-11-04 21:38:07',NULL,'4'),(52,75,5.00,4.00,'2024-12-31',NULL,'Abonado','mvera0986',NULL,'2024-11-04 21:39:50',NULL,'4'),(53,75,2.00,2.00,'2025-01-04',NULL,'Abonado','mvera0986',NULL,'2024-11-04 21:40:39',NULL,'4'),(54,82,50.00,29.99,'2024-11-04',NULL,'Abonado','mvera0986',NULL,'2024-11-04 21:43:13',NULL,'4'),(55,82,10.00,19.99,'2024-11-19',NULL,'Abonado','mvera0986',NULL,'2024-11-04 21:43:47',NULL,'4'),(56,83,5.00,10.00,'2024-11-04',NULL,'Abonado','mvera0986',NULL,'2024-11-04 21:47:29',NULL,'4'),(57,83,5.00,5.00,'2024-11-12',NULL,'Abonado','mvera0986',NULL,'2024-11-04 21:47:56',NULL,'4'),(58,84,25.00,16.39,'2024-11-04',NULL,'Abonado','mvera0986',NULL,'2024-11-04 21:49:32',NULL,'4'),(59,84,5.00,11.39,'2024-11-12',NULL,'Abonado','mvera0986',NULL,'2024-11-04 21:49:51',NULL,'4'),(60,86,15.00,34.99,'2024-11-05',NULL,'Abonado','mvera0986',NULL,'2024-11-05 00:38:51',NULL,'4'),(61,77,5.00,5.00,'2024-11-05',NULL,'Abonado','mvera0986',NULL,'2024-11-05 00:43:09',NULL,'4'),(62,86,10.00,24.99,'2024-11-05',NULL,'Abonado','mvera0986',NULL,'2024-11-05 00:49:57',NULL,'4');
/*!40000 ALTER TABLE `abonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabFacturas`
--

DROP TABLE IF EXISTS `cabFacturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabFacturas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tipoFactura` varchar(10) NOT NULL,
  `perfil_id` bigint(20) unsigned NOT NULL,
  `fechaEmision` date DEFAULT NULL,
  `puntoEmision_id` bigint(20) unsigned NOT NULL,
  `facturaComercialNegociable` varchar(2) DEFAULT 'NO',
  `receptor_id` bigint(20) unsigned NOT NULL,
  `tipoReceptor` text NOT NULL,
  `subtotalSinIva` decimal(10,2) DEFAULT 0.00,
  `subtotalConIva` decimal(10,2) DEFAULT 0.00,
  `totalDescuento` decimal(10,2) DEFAULT 0.00,
  `totalIva` decimal(10,2) DEFAULT 0.00,
  `totalServicio` decimal(10,2) DEFAULT 0.00,
  `total` decimal(10,2) DEFAULT 0.00,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cabfacturas_perfil_id_foreign` (`perfil_id`),
  KEY `cabfacturas_puntoemision_id_foreign` (`puntoEmision_id`),
  CONSTRAINT `cabfacturas_perfil_id_foreign` FOREIGN KEY (`perfil_id`) REFERENCES `perfilesFactura` (`id`),
  CONSTRAINT `cabfacturas_puntoemision_id_foreign` FOREIGN KEY (`puntoEmision_id`) REFERENCES `puntosEmisionFactura` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabFacturas`
--

LOCK TABLES `cabFacturas` WRITE;
/*!40000 ALTER TABLE `cabFacturas` DISABLE KEYS */;
INSERT INTO `cabFacturas` VALUES (1,'Venta',1,'2024-07-25',1,'NO',1,'Cliente',0.00,0.00,0.00,0.00,0.00,85.00,'Por cobrar','eavila',NULL,'2024-07-15 23:37:47','2024-07-15 23:37:47','1'),(4,'Venta',1,'2024-07-26',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-16 01:53:11','2024-07-16 01:53:11','1'),(5,'Venta',1,'2024-07-26',1,'NO',0,'Consumidor final',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-16 02:15:14','2024-07-16 02:15:14','1'),(6,'Venta',1,'2024-07-27',1,'NO',0,'Consumidor final',1.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila','marana','2024-07-16 02:20:14','2024-07-16 02:54:11','1'),(7,'Compra',1,'2024-07-27',1,'NO',2,'Proveedor',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-16 02:28:51','2024-07-16 02:28:51','1'),(8,'Compra',1,'2024-07-27',1,'NO',2,'Proveedor',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-23 02:06:52','2024-07-23 02:06:52','1'),(9,'Compra',1,'2024-07-27',1,'NO',2,'Proveedor',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-23 02:24:29','2024-07-23 02:24:29','1'),(10,'Compra',1,'2024-07-27',1,'NO',2,'Proveedor',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-23 02:33:44','2024-07-23 02:33:44','1'),(11,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-23 02:34:11','2024-07-23 02:34:11','1'),(12,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-23 02:47:31','2024-07-23 02:47:31','1'),(13,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-23 02:51:02','2024-07-23 02:51:02','1'),(14,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-23 02:54:11','2024-07-23 02:54:11','1'),(15,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-23 02:55:44','2024-07-23 02:55:44','1'),(16,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-23 02:59:11','2024-07-23 02:59:11','1'),(17,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-23 03:00:51','2024-07-23 03:00:51','1'),(18,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-23 03:04:31','2024-07-23 03:04:31','1'),(19,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-23 03:05:51','2024-07-23 03:05:51','1'),(20,'Compra',1,'2024-07-27',1,'NO',0,'Consumidor final',1.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila','marana','2024-07-23 03:06:08','2024-07-23 08:50:02','1'),(21,'Compra',1,'2024-07-27',1,'NO',0,'Consumidor final',1.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila','marana','2024-07-23 08:49:12','2024-07-23 08:50:08','1'),(22,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',1.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila','marana','2024-07-23 08:51:05','2024-07-23 08:52:53','1'),(23,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-23 08:52:58','2024-07-23 08:52:58','1'),(24,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-23 21:48:50','2024-07-23 21:48:50','1'),(25,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-24 01:15:41','2024-07-24 01:15:41','1'),(26,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-24 01:19:07','2024-07-24 01:19:07','1'),(27,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-24 01:19:48','2024-07-24 01:19:48','1'),(28,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-24 01:20:00','2024-07-24 01:20:00','1'),(31,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',1.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila','marana','2024-07-31 00:04:45','2024-07-31 00:16:26','1'),(32,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila',NULL,'2024-07-31 00:15:49','2024-07-31 00:15:49','1'),(33,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',1.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila','marana','2024-07-31 00:18:57','2024-07-31 00:20:49','1'),(34,'Venta',1,'2024-07-27',1,'NO',2,'Cliente',1.00,0.00,0.00,0.00,0.00,1.00,'Pagada','eavila','marana','2024-07-31 02:44:23','2024-07-31 02:45:16','1'),(36,'Venta',1,'2024-08-01',1,'NO',2,'Cliente',0.00,0.00,0.00,0.00,0.00,100.00,'Por cobrar','eavila',NULL,'2024-08-02 07:12:08','2024-08-02 07:12:08','1'),(37,'Venta',17,'2024-10-10',3,'NO',8,'Cliente',0.00,0.00,0.00,0.00,0.00,15.00,'Pagada','mvera0986',NULL,'2024-10-10 11:34:51','2024-10-10 11:34:51','4'),(38,'Venta',17,'2024-10-10',3,'NO',5,'Cliente',0.00,0.00,0.00,5.40,0.00,41.39,'Pagada','mvera0986',NULL,'2024-10-10 11:50:18','2024-10-10 11:50:18','4'),(39,'Venta',17,'2024-10-10',3,'NO',6,'Cliente',0.00,0.00,2.00,0.00,0.00,77.99,'Pagada','mvera0986',NULL,'2024-10-10 11:52:16','2024-10-24 04:49:40','4'),(40,'Venta',17,'2024-10-23',3,'NO',5,'Cliente',0.00,0.00,0.00,0.00,0.00,15.00,'Pagada','mvera0986',NULL,'2024-10-23 21:08:46','2024-10-24 04:44:34','4'),(41,'Venta',17,'2024-10-23',3,'NO',7,'Cliente',0.00,0.00,0.00,0.00,0.00,15.00,'Pagada','mvera0986',NULL,'2024-10-24 04:52:37','2024-10-24 21:09:42','4'),(42,'Venta',17,'2024-10-24',3,'NO',9,'Cliente',0.00,0.00,0.00,0.00,0.00,94.99,'Pagada','mvera0986',NULL,'2024-10-24 21:11:19','2024-10-24 21:17:16','4'),(43,'Venta',17,'2024-10-24',3,'NO',6,'Cliente',0.00,0.00,0.00,0.00,0.00,79.99,'Pagada','mvera0986',NULL,'2024-10-24 21:11:38','2024-10-24 21:18:18','4'),(44,'Venta',17,'2024-10-24',3,'NO',5,'Cliente',0.00,0.00,0.00,5.40,0.00,41.39,'Pagada','mvera0986',NULL,'2024-10-24 21:23:52','2024-10-24 21:52:59','4'),(45,'Venta',17,'2024-10-24',3,'NO',7,'Cliente',0.00,0.00,0.00,0.00,0.00,15.00,'Pagada','mvera0986',NULL,'2024-10-24 21:50:01','2024-10-24 21:53:26','4'),(46,'Venta',17,'2024-10-24',3,'NO',5,'Cliente',0.00,0.00,0.00,5.40,0.00,41.39,'Pagada','mvera0986',NULL,'2024-10-25 04:35:12','2024-10-25 04:44:42','4'),(47,'Venta',17,'2024-10-24',3,'NO',6,'Cliente',0.00,0.00,0.00,7.50,0.00,57.49,'Pagada','mvera0986',NULL,'2024-10-25 04:43:23','2024-10-25 04:44:19','4'),(48,'Compra',17,'2024-10-26',3,'NO',9,'Proveedor',0.00,0.00,0.00,5.40,0.00,41.39,'Pagada','mvera0986',NULL,'2024-10-26 21:36:30','2024-10-26 21:36:30','4'),(49,'Compra',17,'2024-10-26',3,'NO',6,'Proveedor',0.00,0.00,0.00,0.00,0.00,15.00,'Pagada','mvera0986',NULL,'2024-10-26 21:38:04','2024-10-26 21:54:12','4'),(50,'Compra',17,'2024-10-26',3,'NO',9,'Proveedor',0.00,0.00,0.00,0.00,0.00,79.99,'Pagada','mvera0986',NULL,'2024-10-27 03:57:26','2024-10-27 04:00:52','4'),(51,'Venta',17,'2024-10-26',3,'NO',5,'Cliente',0.00,0.00,0.00,0.00,0.00,15.00,'Pagada','mvera0986',NULL,'2024-10-27 03:57:50','2024-10-27 04:07:26','4'),(52,'Compra',17,'2024-10-26',3,'NO',6,'Proveedor',0.00,0.00,0.00,0.00,0.00,150.00,'Pagada','mvera0986',NULL,'2024-10-27 04:01:19','2024-10-27 04:07:31','4'),(53,'Venta',17,'2024-10-26',3,'NO',5,'Cliente',0.00,0.00,0.00,12.90,0.00,178.87,'Pagada','mvera0986',NULL,'2024-10-27 04:08:43','2024-10-27 04:08:43','4'),(54,'Venta',17,'2024-10-29',3,'NO',8,'Cliente',0.00,0.00,0.00,0.00,0.00,15.00,'Pagada','mvera0986',NULL,'2024-10-29 19:57:54','2024-10-29 19:57:54','4'),(55,'Venta',17,'2024-10-29',3,'NO',8,'Cliente',0.00,0.00,0.00,0.00,0.00,15.00,'Pagada','mvera0986',NULL,'2024-10-29 20:02:46','2024-10-29 20:02:46','4'),(56,'Venta',17,'2024-10-29',3,'NO',8,'Cliente',0.00,0.00,0.00,0.00,0.00,15.00,'Pagada','mvera0986',NULL,'2024-10-29 20:06:08','2024-10-29 20:06:08','4'),(57,'Venta',17,'2024-10-29',3,'NO',8,'Cliente',0.00,0.00,0.00,0.00,0.00,15.00,'Pagada','mvera0986',NULL,'2024-10-29 20:07:28','2024-10-29 20:07:28','4'),(58,'Venta',17,'2024-10-29',3,'NO',5,'Cliente',0.00,0.00,0.00,0.00,0.00,15.00,'Pagada','mvera0986',NULL,'2024-10-29 20:23:23','2024-10-29 20:23:23','4'),(59,'Venta',17,'2024-10-29',3,'NO',5,'Cliente',0.00,0.00,0.00,0.00,0.00,15.00,'Pagada','mvera0986',NULL,'2024-10-29 20:24:35','2024-10-29 20:24:35','4'),(60,'Venta',17,'2024-10-29',3,'NO',8,'Cliente',0.00,0.00,0.00,0.00,0.00,79.99,'Pagada','mvera0986',NULL,'2024-10-29 20:26:58','2024-10-29 20:26:58','4'),(61,'Venta',17,'2024-10-29',3,'NO',7,'Cliente',0.00,0.00,0.00,0.00,0.00,15.00,'Pagada','mvera0986',NULL,'2024-10-29 20:27:46','2024-10-29 20:27:46','4'),(62,'Venta',17,'2024-10-29',3,'NO',5,'Cliente',0.00,0.00,0.00,0.00,0.00,94.99,'Pagada','mvera0986',NULL,'2024-10-29 20:29:43','2024-10-29 20:29:43','4'),(63,'Venta',17,'2024-10-29',3,'NO',5,'Cliente',0.00,0.00,0.00,5.40,0.00,41.39,'Pagada','mvera0986',NULL,'2024-10-29 20:31:34','2024-10-29 20:31:34','4'),(64,'Venta',17,'2024-10-29',3,'NO',9,'Cliente',0.00,0.00,0.00,0.00,0.00,94.99,'Pagada','mvera0986',NULL,'2024-10-29 20:35:31','2024-10-29 20:35:31','4'),(65,'Venta',17,'2024-10-29',3,'NO',5,'Cliente',0.00,0.00,0.00,5.40,0.00,41.39,'Pagada','mvera0986',NULL,'2024-10-29 20:37:29','2024-10-29 20:37:29','4'),(66,'Venta',17,'2024-10-29',3,'NO',6,'Cliente',0.00,0.00,0.00,7.50,0.00,57.49,'Pagada','mvera0986',NULL,'2024-10-29 20:38:58','2024-10-29 20:38:58','4'),(67,'Venta',17,'2024-10-31',3,'NO',7,'Cliente',0.00,0.00,0.00,0.00,0.00,79.99,'Pagada','mvera0986',NULL,'2024-11-01 00:29:08','2024-11-01 00:29:08','4'),(68,'Venta',17,'2024-10-31',3,'NO',6,'Cliente',0.00,0.00,0.00,0.00,0.00,79.99,'Pagada','mvera0986',NULL,'2024-11-01 00:29:20','2024-11-01 00:29:20','4'),(69,'Venta',17,'2024-10-31',3,'NO',8,'Cliente',0.00,0.00,0.00,7.50,0.00,57.49,'Pagada','mvera0986',NULL,'2024-11-01 04:00:34','2024-11-01 04:00:34','4'),(70,'Compra',17,'2024-10-31',3,'NO',6,'Proveedor',0.00,0.00,0.00,0.00,0.00,26.00,'Pagada','mvera0986',NULL,'2024-11-01 04:11:04','2024-11-01 04:11:04','4'),(71,'Compra',17,'2024-10-31',3,'NO',9,'Proveedor',0.00,0.00,0.00,0.00,0.00,151.98,'Pagada','mvera0986',NULL,'2024-11-01 04:14:28','2024-11-01 04:14:28','4'),(72,'Venta',17,'2024-11-01',3,'NO',6,'Cliente',0.00,0.00,0.00,0.00,0.00,79.99,'Pagada','mvera0986',NULL,'2024-11-02 01:19:40','2024-11-02 04:20:31','4'),(73,'Venta',17,'2024-11-01',3,'NO',5,'Cliente',71.98,82.78,0.00,10.80,0.00,82.78,'Pagada','mvera0986',NULL,'2024-11-02 03:53:45','2024-11-02 03:53:45','4'),(74,'Compra',17,'2024-11-01',3,'NO',9,'Proveedor',229.95,264.44,0.00,34.49,0.00,264.44,'Pagada','mvera0986',NULL,'2024-11-02 03:58:02','2024-11-02 03:58:02','4'),(75,'Venta',17,'2024-11-04',3,'NO',6,'Cliente',79.99,79.99,0.00,0.00,0.00,79.99,'Pagada','mvera0986',NULL,'2024-11-05 01:00:25','2024-11-05 02:41:24','4'),(76,'Compra',17,'2024-11-04',3,'NO',6,'Proveedor',10.00,10.00,0.00,0.00,0.00,10.00,'Pagada','mvera0986',NULL,'2024-11-05 01:00:46','2024-11-05 01:00:46','4'),(77,'Compra',17,'2024-11-04',3,'NO',6,'Proveedor',10.00,10.00,0.00,0.00,0.00,10.00,'Pagada','mvera0986',NULL,'2024-11-05 01:00:57','2024-11-05 05:49:27','4'),(78,'Venta',17,'2024-11-04',3,'NO',7,'Cliente',15.00,15.00,0.00,0.00,0.00,15.00,'Pagada','mvera0986',NULL,'2024-11-05 01:14:37','2024-11-05 01:14:37','4'),(79,'Venta',17,'2024-11-04',3,'NO',6,'Cliente',79.99,79.99,0.00,0.00,0.00,79.99,'Pagada','mvera0986',NULL,'2024-11-05 01:30:05','2024-11-05 01:30:05','4'),(80,'Venta',17,'2024-11-04',3,'NO',9,'Cliente',35.99,41.39,0.00,5.40,0.00,41.39,'Pagada','mvera0986',NULL,'2024-11-05 01:39:40','2024-11-05 01:39:40','4'),(81,'Venta',17,'2024-11-04',3,'NO',5,'Cliente',35.99,41.39,0.00,5.40,0.00,41.39,'Pagada','mvera0986',NULL,'2024-11-05 01:41:36','2024-11-05 01:41:36','4'),(82,'Venta',17,'2024-11-04',3,'NO',5,'Cliente',79.99,79.99,0.00,0.00,0.00,79.99,'Pagada','mvera0986',NULL,'2024-11-05 02:43:13','2024-11-05 02:44:26','4'),(83,'Venta',17,'2024-11-04',3,'NO',6,'Cliente',15.00,15.00,0.00,0.00,0.00,15.00,'Pagada','mvera0986',NULL,'2024-11-05 02:47:29','2024-11-05 02:48:39','4'),(84,'Venta',17,'2024-11-04',3,'NO',9,'Cliente',35.99,41.39,0.00,5.40,0.00,41.39,'Pagada','mvera0986',NULL,'2024-11-05 02:49:32','2024-11-05 02:50:26','4'),(85,'Venta',17,'2024-11-04',3,'NO',6,'Cliente',79.99,79.99,0.00,0.00,0.00,79.99,'Pagada','mvera0986',NULL,'2024-11-05 02:51:11','2024-11-05 02:51:28','4'),(86,'Compra',17,'2024-11-05',3,'NO',9,'Proveedor',49.99,49.99,0.00,0.00,0.00,49.99,'Pagada','mvera0986',NULL,'2024-11-05 05:38:51','2024-11-05 05:50:12','4'),(87,'Venta',17,'2024-11-11',3,'NO',5,'Cliente',179.95,206.94,0.00,26.99,0.00,206.94,'Pagada','mvera0986',NULL,'2024-11-11 21:35:07','2024-11-11 21:35:07','4'),(90,'Venta',17,'2024-11-12',3,'NO',6,'Cliente',1679.79,1679.79,0.00,0.00,0.00,1679.79,'Pagada','mvera0986',NULL,'2024-11-12 08:39:22','2024-11-12 08:39:22','4'),(92,'Venta',17,'2024-11-12',3,'NO',9,'Cliente',129.98,137.48,0.00,7.50,0.00,137.48,'Pagada','mvera0986',NULL,'2024-11-12 08:41:45','2024-11-12 08:41:45','4');
/*!40000 ALTER TABLE `cabFacturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabMovimientos`
--

DROP TABLE IF EXISTS `cabMovimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabMovimientos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `movimiento_id` bigint(20) unsigned NOT NULL,
  `fecha` date DEFAULT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cabmovimientos_movimiento_id_foreign` (`movimiento_id`),
  CONSTRAINT `cabmovimientos_movimiento_id_foreign` FOREIGN KEY (`movimiento_id`) REFERENCES `movimientos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabMovimientos`
--

LOCK TABLES `cabMovimientos` WRITE;
/*!40000 ALTER TABLE `cabMovimientos` DISABLE KEYS */;
INSERT INTO `cabMovimientos` VALUES (126,1,'2024-01-06','Primer ingreso al inventario','Activo','mvera0986','mvera0986','2024-11-06 23:25:54','2024-11-06 23:26:30','4'),(127,1,'2024-05-11','Segundo ingreso al inventario','Activo','mvera0986','mvera0986','2024-11-06 23:27:25','2024-11-06 23:27:52','4'),(128,1,'2024-11-12','Tercer ingreso a inventario','Activo','mvera0986','mvera0986','2024-11-07 21:18:51','2024-11-07 21:19:16','4'),(132,2,'2024-11-22','Primer egreso por motivo de defectos en los productos','Activo','mvera0986','mvera0986','2024-11-08 10:42:22','2024-11-08 10:43:27','4'),(146,1,'2024-11-21','Cuarto ingreso','Activo','mvera0986',NULL,'2024-11-12 08:40:17','2024-11-12 08:40:17','4');
/*!40000 ALTER TABLE `cabMovimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `categoria` varchar(60) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'General','Todas las categrías','Activo','eavila','marana','2024-07-04 10:27:25','2024-07-04 10:28:50','1'),(2,'General','Todas las categrías','Eliminado','eavila','marana','2024-07-04 10:27:43','2024-07-04 10:29:20','2'),(3,'N/A','Sin categoría','Activo','mvera0986','mvera0986','2024-09-07 01:29:42','2024-09-11 02:04:14','4'),(4,'Aseop','dfsdf','Eliminado','mvera0986',NULL,'2024-09-07 01:37:20','2024-09-07 01:37:25','4'),(5,'Aseop','asdasdsa','Eliminado','mvera0986','mvera0986','2024-09-09 23:26:21','2024-09-09 23:26:36','4'),(6,'Hogar','Productos para el hogar','Activo','mvera0986',NULL,'2024-09-11 02:04:27','2024-09-11 02:04:27','4'),(7,'Moda','Productos de moda','Activo','mvera0986',NULL,'2024-09-11 02:04:46','2024-09-11 02:04:46','4');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `identificacion_id` bigint(20) unsigned NOT NULL,
  `numeroIdentificacion` varchar(15) DEFAULT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_identificacion_id_foreign` (`identificacion_id`),
  CONSTRAINT `clientes_identificacion_id_foreign` FOREIGN KEY (`identificacion_id`) REFERENCES `tiposIdentificacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Carlos Manuel','Tuarez Mendoza',4,'1349682763001','0989543956','cmanuel2968@gmail.com','Portoviejo','Activo','eavila','marana','2024-07-03 20:21:25','2024-07-03 20:24:51','1'),(2,'Maria Josefina','Meza Vera',2,'1349681634','0989543956','mjosefina3562@gmail.com','Portoviejo','Activo','eavila',NULL,'2024-07-03 20:23:59','2024-07-03 20:23:59','1'),(3,'Doris Marissel','Hoyos Saldiego',3,'USA-A12345678','0989543956','dorism8254@gmail.com','California','Activo','eavila',NULL,'2024-07-03 20:27:27','2024-07-03 20:27:27','1'),(4,'Antonio Giussepe','Changreta martinlli',3,'ITA-A12348314','0989543956','antoniocha15935@gmail.com','Roma','Eliminado','eavila',NULL,'2024-07-03 20:29:54','2024-07-03 20:30:34','1'),(5,'Carmen Maribel','Velez Gonzales',2,'1315698658','0988657496','carmen@info.com','Protoviejo','Activo','mvera0986','mvera0986','2024-09-10 02:04:30','2024-09-11 11:54:53','4'),(6,'Mario Daniel','Mendoza Gulos',3,'1316589658','1321656587','mgolma777@mail.com','Manta','Activo','mvera0986','mvera0986','2024-09-10 02:32:48','2024-09-10 03:17:51','4'),(7,'Hulberto Marcos','Intriago Berlin',4,'1315689741001','0986734691','marcos8792@gmail.com','Quito','Activo','mvera0986','mvera0986','2024-09-10 03:22:53','2024-09-11 11:15:15','4'),(8,'Consumidor','final',1,'0000000009','0000000009','consumidorfinal@mail.com','N/A','Activo','mvera0986','mvera0986','2024-09-28 07:13:14','2024-09-28 07:13:32','4'),(9,'Diana Massiel','Gonzales Meza',2,'1314698703','0986324695','dianameza@gmail.com','Portoviejo','Activo','mvera0986',NULL,'2024-10-04 18:53:13','2024-10-04 18:53:13','4');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_sistema`
--

DROP TABLE IF EXISTS `config_sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_sistema` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ventaSincroStock` varchar(2) DEFAULT NULL,
  `valor1` varchar(100) DEFAULT NULL,
  `valor2` varchar(100) DEFAULT NULL,
  `valor3` varchar(100) DEFAULT NULL,
  `valor4` varchar(100) DEFAULT NULL,
  `valor5` varchar(100) DEFAULT NULL,
  `valor6` varchar(100) DEFAULT NULL,
  `valor7` varchar(100) DEFAULT NULL,
  `valor8` varchar(100) DEFAULT NULL,
  `valor9` varchar(100) DEFAULT NULL,
  `valor10` varchar(100) DEFAULT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_sistema`
--

LOCK TABLES `config_sistema` WRITE;
/*!40000 ALTER TABLE `config_sistema` DISABLE KEYS */;
INSERT INTO `config_sistema` VALUES (1,'SI','null','null','null','null','null','null','null','null','null','null','mvera0986','mvera0986','2024-11-12 00:49:37','2024-11-12 08:40:57','4');
/*!40000 ALTER TABLE `config_sistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detFacturas`
--

DROP TABLE IF EXISTS `detFacturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detFacturas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cabFactura_id` bigint(20) unsigned NOT NULL,
  `producto_id` bigint(20) unsigned NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  `iva` varchar(10) NOT NULL,
  `descuento` decimal(10,2) NOT NULL,
  `valorTotal` decimal(10,2) NOT NULL,
  `valorIce` decimal(10,2) DEFAULT 0.00,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detfacturas_cabfactura_id_foreign` (`cabFactura_id`),
  KEY `detfacturas_producto_id_foreign` (`producto_id`),
  CONSTRAINT `detfacturas_cabfactura_id_foreign` FOREIGN KEY (`cabFactura_id`) REFERENCES `cabFacturas` (`id`),
  CONSTRAINT `detfacturas_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detFacturas`
--

LOCK TABLES `detFacturas` WRITE;
/*!40000 ALTER TABLE `detFacturas` DISABLE KEYS */;
INSERT INTO `detFacturas` VALUES (1,1,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-15 23:37:47','2024-07-15 23:37:47','1'),(2,1,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-15 23:37:47','2024-07-15 23:37:47','1'),(3,4,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-16 01:53:11','2024-07-16 01:53:11','1'),(4,4,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-16 01:53:11','2024-07-16 01:53:11','1'),(5,5,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-16 02:15:14','2024-07-16 02:15:14','1'),(6,5,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-16 02:15:14','2024-07-16 02:15:14','1'),(9,7,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-16 02:28:52','2024-07-16 02:28:52','1'),(10,7,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-16 02:28:52','2024-07-16 02:28:52','1'),(13,6,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','marana','marana','2024-07-16 02:54:11','2024-07-16 02:54:11','1'),(14,6,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','marana','marana','2024-07-16 02:54:11','2024-07-16 02:54:11','1'),(15,8,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:06:52','2024-07-23 02:06:52','1'),(16,8,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:06:52','2024-07-23 02:06:52','1'),(17,9,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:24:29','2024-07-23 02:24:29','1'),(18,9,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:24:29','2024-07-23 02:24:29','1'),(19,10,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:33:44','2024-07-23 02:33:44','1'),(20,10,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:33:44','2024-07-23 02:33:44','1'),(21,11,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:34:11','2024-07-23 02:34:11','1'),(22,11,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:34:11','2024-07-23 02:34:11','1'),(23,12,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:47:31','2024-07-23 02:47:31','1'),(24,12,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:47:31','2024-07-23 02:47:31','1'),(25,13,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:51:02','2024-07-23 02:51:02','1'),(26,13,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:51:02','2024-07-23 02:51:02','1'),(27,14,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:54:11','2024-07-23 02:54:11','1'),(28,14,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:54:11','2024-07-23 02:54:11','1'),(29,15,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:55:44','2024-07-23 02:55:44','1'),(30,15,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:55:44','2024-07-23 02:55:44','1'),(31,16,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:59:11','2024-07-23 02:59:11','1'),(32,16,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 02:59:11','2024-07-23 02:59:11','1'),(33,17,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 03:00:51','2024-07-23 03:00:51','1'),(34,17,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 03:00:51','2024-07-23 03:00:51','1'),(35,18,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 03:04:31','2024-07-23 03:04:31','1'),(36,18,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 03:04:31','2024-07-23 03:04:31','1'),(37,19,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 03:05:51','2024-07-23 03:05:51','1'),(38,19,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 03:05:51','2024-07-23 03:05:51','1'),(54,20,1,2,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','marana','marana','2024-07-23 08:50:03','2024-07-23 08:50:03','1'),(55,21,1,2,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','marana','marana','2024-07-23 08:50:08','2024-07-23 08:50:08','1'),(60,22,1,3,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','marana','marana','2024-07-23 08:52:53','2024-07-23 08:52:53','1'),(61,22,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','marana','marana','2024-07-23 08:52:53','2024-07-23 08:52:53','1'),(62,23,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 08:52:58','2024-07-23 08:52:58','1'),(63,23,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 08:52:58','2024-07-23 08:52:58','1'),(64,24,1,4,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-23 21:48:50','2024-07-23 21:48:50','1'),(65,25,1,12,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-24 01:15:41','2024-07-24 01:15:41','1'),(66,26,1,15,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-24 01:19:07','2024-07-24 01:19:07','1'),(67,27,1,8,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-24 01:19:48','2024-07-24 01:19:48','1'),(68,28,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-07-24 01:20:00','2024-07-24 01:20:00','1'),(80,33,1,3,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','marana','marana','2024-07-31 00:20:49','2024-07-31 00:20:49','1'),(81,33,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','marana','marana','2024-07-31 00:20:49','2024-07-31 00:20:49','1'),(83,34,1,3,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','marana','marana','2024-07-31 02:45:16','2024-07-31 02:45:16','1'),(84,34,3,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','marana','marana','2024-07-31 02:45:16','2024-07-31 02:45:16','1'),(85,36,1,1,'Compra un chocolate 1',1.00,'0%',0.00,1.00,0.00,'Activo','eavila',NULL,'2024-08-02 07:12:08','2024-08-02 07:12:08','1'),(86,37,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-10 11:34:51','2024-10-10 11:34:51','4'),(87,38,10,1,'Perfume de mujer',35.99,'15%',0.00,35.99,0.00,'Activo','mvera0986',NULL,'2024-10-10 11:50:18','2024-10-10 11:50:18','4'),(88,39,8,1,'Camisa de hombre',79.99,'0%',2.00,77.99,0.00,'Activo','mvera0986',NULL,'2024-10-10 11:52:16','2024-10-10 11:52:16','4'),(89,40,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-23 21:08:46','2024-10-23 21:08:46','4'),(90,41,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-24 04:52:37','2024-10-24 04:52:37','4'),(91,42,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-24 21:11:19','2024-10-24 21:11:19','4'),(92,42,8,1,'Camisa de hombre',79.99,'0%',0.00,79.99,0.00,'Activo','mvera0986',NULL,'2024-10-24 21:11:19','2024-10-24 21:11:19','4'),(93,43,8,1,'Camisa de hombre',79.99,'0%',0.00,79.99,0.00,'Activo','mvera0986',NULL,'2024-10-24 21:11:38','2024-10-24 21:11:38','4'),(94,44,10,1,'Perfume de mujer',35.99,'15%',0.00,35.99,0.00,'Activo','mvera0986',NULL,'2024-10-24 21:23:53','2024-10-24 21:23:53','4'),(95,45,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-24 21:50:01','2024-10-24 21:50:01','4'),(96,46,10,1,'Perfume de mujer',35.99,'15%',0.00,35.99,0.00,'Activo','mvera0986',NULL,'2024-10-25 04:35:12','2024-10-25 04:35:12','4'),(97,47,9,1,'Pantalón para hombre',49.99,'15%',0.00,49.99,0.00,'Activo','mvera0986',NULL,'2024-10-25 04:43:23','2024-10-25 04:43:23','4'),(98,48,10,1,'Perfume de mujer',35.99,'15%',0.00,35.99,0.00,'Activo','mvera0986',NULL,'2024-10-26 21:36:30','2024-10-26 21:36:30','4'),(99,49,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-26 21:38:04','2024-10-26 21:38:04','4'),(100,50,8,1,'Camisa de hombre',79.99,'0%',0.00,79.99,0.00,'Activo','mvera0986',NULL,'2024-10-27 03:57:26','2024-10-27 03:57:26','4'),(101,51,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-27 03:57:50','2024-10-27 03:57:50','4'),(102,52,11,10,'Galletas de azucar',15.00,'0%',0.00,150.00,0.00,'Activo','mvera0986',NULL,'2024-10-27 04:01:19','2024-10-27 04:01:19','4'),(103,53,9,1,'Pantalón para hombre',49.99,'15%',0.00,49.99,0.00,'Activo','mvera0986',NULL,'2024-10-27 04:08:43','2024-10-27 04:08:43','4'),(104,53,10,1,'Perfume de mujer',35.99,'15%',0.00,35.99,0.00,'Activo','mvera0986',NULL,'2024-10-27 04:08:43','2024-10-27 04:08:43','4'),(105,53,8,1,'Camisa de hombre',79.99,'0%',0.00,79.99,0.00,'Activo','mvera0986',NULL,'2024-10-27 04:08:43','2024-10-27 04:08:43','4'),(106,54,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-29 19:57:54','2024-10-29 19:57:54','4'),(107,55,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-29 20:02:46','2024-10-29 20:02:46','4'),(108,56,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-29 20:06:08','2024-10-29 20:06:08','4'),(109,57,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-29 20:07:28','2024-10-29 20:07:28','4'),(110,58,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-29 20:23:23','2024-10-29 20:23:23','4'),(111,59,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-29 20:24:35','2024-10-29 20:24:35','4'),(112,60,8,1,'Camisa de hombre',79.99,'0%',0.00,79.99,0.00,'Activo','mvera0986',NULL,'2024-10-29 20:26:58','2024-10-29 20:26:58','4'),(113,61,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-29 20:27:46','2024-10-29 20:27:46','4'),(114,62,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-29 20:29:43','2024-10-29 20:29:43','4'),(115,62,8,1,'Camisa de hombre',79.99,'0%',0.00,79.99,0.00,'Activo','mvera0986',NULL,'2024-10-29 20:29:43','2024-10-29 20:29:43','4'),(116,63,10,1,'Perfume de mujer',35.99,'15%',0.00,35.99,0.00,'Activo','mvera0986',NULL,'2024-10-29 20:31:34','2024-10-29 20:31:34','4'),(117,64,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-10-29 20:35:31','2024-10-29 20:35:31','4'),(118,64,8,1,'Camisa de hombre',79.99,'0%',0.00,79.99,0.00,'Activo','mvera0986',NULL,'2024-10-29 20:35:31','2024-10-29 20:35:31','4'),(119,65,10,1,'Perfume de mujer',35.99,'15%',0.00,35.99,0.00,'Activo','mvera0986',NULL,'2024-10-29 20:37:29','2024-10-29 20:37:29','4'),(120,66,9,1,'Pantalón para hombre',49.99,'15%',0.00,49.99,0.00,'Activo','mvera0986',NULL,'2024-10-29 20:38:58','2024-10-29 20:38:58','4'),(121,67,8,1,'Camisa de hombre',79.99,'0%',0.00,79.99,0.00,'Activo','mvera0986',NULL,'2024-11-01 00:29:08','2024-11-01 00:29:08','4'),(122,68,8,1,'Camisa de hombre',79.99,'0%',0.00,79.99,0.00,'Activo','mvera0986',NULL,'2024-11-01 00:29:20','2024-11-01 00:29:20','4'),(123,69,9,1,'Pantalón para hombre',49.99,'15%',0.00,49.99,0.00,'Activo','mvera0986',NULL,'2024-11-01 04:00:34','2024-11-01 04:00:34','4'),(124,70,11,2,'Galletas de azucar',13.00,'0%',0.00,26.00,0.00,'Activo','mvera0986',NULL,'2024-11-01 04:11:04','2024-11-01 04:11:04','4'),(125,71,8,2,'Camisa de hombre',75.99,'0%',0.00,151.98,0.00,'Activo','mvera0986',NULL,'2024-11-01 04:14:28','2024-11-01 04:14:28','4'),(126,72,8,1,'Camisa de hombre',79.99,'0%',0.00,79.99,0.00,'Activo','mvera0986',NULL,'2024-11-02 01:19:40','2024-11-02 01:19:40','4'),(127,73,10,2,'Perfume de mujer',35.99,'15%',0.00,71.98,0.00,'Activo','mvera0986',NULL,'2024-11-02 03:53:45','2024-11-02 03:53:45','4'),(128,74,9,5,'Pantalón para hombre',45.99,'15%',0.00,229.95,0.00,'Activo','mvera0986',NULL,'2024-11-02 03:58:02','2024-11-02 03:58:02','4'),(129,75,8,1,'Camisa de hombre',79.99,'0%',0.00,79.99,0.00,'Activo','mvera0986',NULL,'2024-11-05 01:00:25','2024-11-05 01:00:25','4'),(130,76,11,1,'Galletas de azucar',10.00,'0%',0.00,10.00,0.00,'Activo','mvera0986',NULL,'2024-11-05 01:00:46','2024-11-05 01:00:46','4'),(131,77,11,1,'Galletas de azucar',10.00,'0%',0.00,10.00,0.00,'Activo','mvera0986',NULL,'2024-11-05 01:00:57','2024-11-05 01:00:57','4'),(132,78,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-11-05 01:14:37','2024-11-05 01:14:37','4'),(133,79,8,1,'Camisa de hombre',79.99,'0%',0.00,79.99,0.00,'Activo','mvera0986',NULL,'2024-11-05 01:30:05','2024-11-05 01:30:05','4'),(134,80,10,1,'Perfume de mujer',35.99,'15%',0.00,35.99,0.00,'Activo','mvera0986',NULL,'2024-11-05 01:39:40','2024-11-05 01:39:40','4'),(135,81,10,1,'Perfume de mujer',35.99,'15%',0.00,35.99,0.00,'Activo','mvera0986',NULL,'2024-11-05 01:41:36','2024-11-05 01:41:36','4'),(136,82,8,1,'Camisa de hombre',79.99,'0%',0.00,79.99,0.00,'Activo','mvera0986',NULL,'2024-11-05 02:43:13','2024-11-05 02:43:13','4'),(137,83,11,1,'Galletas de azucar',15.00,'0%',0.00,15.00,0.00,'Activo','mvera0986',NULL,'2024-11-05 02:47:29','2024-11-05 02:47:29','4'),(138,84,10,1,'Perfume de mujer',35.99,'15%',0.00,35.99,0.00,'Activo','mvera0986',NULL,'2024-11-05 02:49:32','2024-11-05 02:49:32','4'),(139,85,8,1,'Camisa de hombre',79.99,'0%',0.00,79.99,0.00,'Activo','mvera0986',NULL,'2024-11-05 02:51:11','2024-11-05 02:51:11','4'),(140,86,8,1,'Camisa de hombre',49.99,'0%',0.00,49.99,0.00,'Activo','mvera0986',NULL,'2024-11-05 05:38:51','2024-11-05 05:38:51','4'),(141,87,10,5,'Perfume de mujer',35.99,'15%',0.00,179.95,0.00,'Activo','mvera0986',NULL,'2024-11-11 21:35:07','2024-11-11 21:35:07','4'),(142,90,8,21,'Camisa de hombre',79.99,'0%',0.00,1679.79,0.00,'Activo','mvera0986',NULL,'2024-11-12 08:39:22','2024-11-12 08:39:22','4'),(143,92,8,1,'Camisa de hombre',79.99,'0%',0.00,79.99,0.00,'Activo','mvera0986',NULL,'2024-11-12 08:41:45','2024-11-12 08:41:45','4'),(144,92,9,1,'Pantalón para hombre',49.99,'15%',0.00,49.99,0.00,'Activo','mvera0986',NULL,'2024-11-12 08:41:45','2024-11-12 08:41:45','4');
/*!40000 ALTER TABLE `detFacturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detFormasPagoFacturas`
--

DROP TABLE IF EXISTS `detFormasPagoFacturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detFormasPagoFacturas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `formaPago_id` bigint(20) unsigned NOT NULL,
  `cabFactura_id` bigint(20) unsigned NOT NULL,
  `valor` decimal(10,2) DEFAULT 0.00,
  `plazo` int(11) DEFAULT 0,
  `tiempo` varchar(10) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detformaspagofacturas_formapago_id_foreign` (`formaPago_id`),
  KEY `detformaspagofacturas_cabfactura_id_foreign` (`cabFactura_id`),
  CONSTRAINT `detformaspagofacturas_cabfactura_id_foreign` FOREIGN KEY (`cabFactura_id`) REFERENCES `cabFacturas` (`id`),
  CONSTRAINT `detformaspagofacturas_formapago_id_foreign` FOREIGN KEY (`formaPago_id`) REFERENCES `formasPago` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detFormasPagoFacturas`
--

LOCK TABLES `detFormasPagoFacturas` WRITE;
/*!40000 ALTER TABLE `detFormasPagoFacturas` DISABLE KEYS */;
INSERT INTO `detFormasPagoFacturas` VALUES (1,1,1,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-15 23:37:47','2024-07-15 23:37:47','1'),(2,1,4,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-16 01:53:11','2024-07-16 01:53:11','1'),(3,1,5,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-16 02:15:14','2024-07-16 02:15:14','1'),(5,1,7,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-16 02:28:51','2024-07-16 02:28:51','1'),(7,1,6,1.00,30,'Dias','Activo','marana','marana','2024-07-16 02:54:11','2024-07-16 02:54:11','1'),(8,1,8,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-23 02:06:52','2024-07-23 02:06:52','1'),(9,1,9,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-23 02:24:29','2024-07-23 02:24:29','1'),(10,1,10,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-23 02:33:44','2024-07-23 02:33:44','1'),(11,1,11,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-23 02:34:11','2024-07-23 02:34:11','1'),(12,1,12,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-23 02:47:31','2024-07-23 02:47:31','1'),(13,1,13,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-23 02:51:02','2024-07-23 02:51:02','1'),(14,1,14,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-23 02:54:11','2024-07-23 02:54:11','1'),(15,1,15,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-23 02:55:44','2024-07-23 02:55:44','1'),(16,1,16,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-23 02:59:11','2024-07-23 02:59:11','1'),(17,1,17,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-23 03:00:51','2024-07-23 03:00:51','1'),(18,1,18,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-23 03:04:31','2024-07-23 03:04:31','1'),(19,1,19,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-23 03:05:51','2024-07-23 03:05:51','1'),(30,1,20,1.00,30,'Dias','Activo','marana','marana','2024-07-23 08:50:02','2024-07-23 08:50:02','1'),(31,1,21,1.00,30,'Dias','Activo','marana','marana','2024-07-23 08:50:08','2024-07-23 08:50:08','1'),(34,1,22,1.00,30,'Dias','Activo','marana','marana','2024-07-23 08:52:53','2024-07-23 08:52:53','1'),(35,1,23,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-23 08:52:58','2024-07-23 08:52:58','1'),(36,1,24,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-23 21:48:50','2024-07-23 21:48:50','1'),(37,1,25,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-24 01:15:41','2024-07-24 01:15:41','1'),(38,1,26,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-24 01:19:07','2024-07-24 01:19:07','1'),(39,1,27,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-24 01:19:48','2024-07-24 01:19:48','1'),(40,1,28,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-24 01:20:00','2024-07-24 01:20:00','1'),(46,1,32,1.00,30,'Dias','Activo','eavila',NULL,'2024-07-31 00:15:49','2024-07-31 00:15:49','1'),(47,1,31,1.00,30,'Dias','Activo','marana','marana','2024-07-31 00:16:26','2024-07-31 00:16:26','1'),(49,1,33,1.00,30,'Dias','Activo','marana','marana','2024-07-31 00:20:49','2024-07-31 00:20:49','1'),(51,1,34,1.00,30,'Dias','Activo','marana','marana','2024-07-31 02:45:16','2024-07-31 02:45:16','1'),(53,1,36,1.00,30,'Dias','Activo','eavila',NULL,'2024-08-02 07:12:08','2024-08-02 07:12:08','1'),(54,1,72,50.99,1,'Día/s','Activo','mvera0986',NULL,'2024-11-02 01:19:40','2024-11-02 01:19:40','4'),(55,1,72,29.00,15,'Día/s','Activo','mvera0986',NULL,'2024-11-02 01:19:40','2024-11-02 01:19:40','4');
/*!40000 ALTER TABLE `detFormasPagoFacturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detMovimientos`
--

DROP TABLE IF EXISTS `detMovimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detMovimientos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cabMovimiento_id` bigint(20) unsigned NOT NULL,
  `producto_id` bigint(20) unsigned NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detmovimientos_cabmovimiento_id_foreign` (`cabMovimiento_id`),
  KEY `detmovimientos_producto_id_foreign` (`producto_id`),
  CONSTRAINT `detmovimientos_cabmovimiento_id_foreign` FOREIGN KEY (`cabMovimiento_id`) REFERENCES `cabMovimientos` (`id`),
  CONSTRAINT `detmovimientos_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detMovimientos`
--

LOCK TABLES `detMovimientos` WRITE;
/*!40000 ALTER TABLE `detMovimientos` DISABLE KEYS */;
INSERT INTO `detMovimientos` VALUES (310,126,8,15,'Activo','mvera0986','mvera0986','2024-11-06 23:26:30','2024-11-06 23:26:30','4'),(311,126,9,15,'Activo','mvera0986','mvera0986','2024-11-06 23:26:30','2024-11-06 23:26:30','4'),(312,126,10,15,'Activo','mvera0986','mvera0986','2024-11-06 23:26:30','2024-11-06 23:26:30','4'),(313,126,11,15,'Activo','mvera0986','mvera0986','2024-11-06 23:26:30','2024-11-06 23:26:30','4'),(329,127,11,25,'Activo','mvera0986','mvera0986','2024-11-07 21:18:00','2024-11-07 21:18:00','4'),(330,127,10,10,'Activo','mvera0986','mvera0986','2024-11-07 21:18:01','2024-11-07 21:18:01','4'),(331,127,8,5,'Activo','mvera0986','mvera0986','2024-11-07 21:18:01','2024-11-07 21:18:01','4'),(332,127,9,5,'Activo','mvera0986','mvera0986','2024-11-07 21:18:01','2024-11-07 21:18:01','4'),(334,128,10,5,'Activo','mvera0986','mvera0986','2024-11-07 21:19:16','2024-11-07 21:19:16','4'),(335,128,8,5,'Activo','mvera0986','mvera0986','2024-11-07 21:19:16','2024-11-07 21:19:16','4'),(370,132,8,5,'Activo','mvera0986','mvera0986','2024-11-08 11:10:09','2024-11-08 11:10:09','4'),(371,132,9,5,'Activo','mvera0986','mvera0986','2024-11-08 11:10:09','2024-11-08 11:10:09','4'),(376,146,8,21,'Activo','mvera0986',NULL,'2024-11-12 08:40:17','2024-11-12 08:40:17','4');
/*!40000 ALTER TABLE `detMovimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detObservacionesFacturas`
--

DROP TABLE IF EXISTS `detObservacionesFacturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detObservacionesFacturas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cabFactura_id` bigint(20) unsigned NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detobservacionesfacturas_cabfactura_id_foreign` (`cabFactura_id`),
  CONSTRAINT `detobservacionesfacturas_cabfactura_id_foreign` FOREIGN KEY (`cabFactura_id`) REFERENCES `cabFacturas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detObservacionesFacturas`
--

LOCK TABLES `detObservacionesFacturas` WRITE;
/*!40000 ALTER TABLE `detObservacionesFacturas` DISABLE KEYS */;
INSERT INTO `detObservacionesFacturas` VALUES (1,1,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-15 23:37:47','2024-07-15 23:37:47','1'),(2,4,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-16 01:53:11','2024-07-16 01:53:11','1'),(3,5,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-16 02:15:14','2024-07-16 02:15:14','1'),(5,7,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-16 02:28:52','2024-07-16 02:28:52','1'),(7,6,'Pago','Se debe cancelar esta factura en 30 dias','Activo','marana','marana','2024-07-16 02:54:11','2024-07-16 02:54:11','1'),(8,8,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-23 02:06:52','2024-07-23 02:06:52','1'),(9,9,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-23 02:24:29','2024-07-23 02:24:29','1'),(10,10,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-23 02:33:44','2024-07-23 02:33:44','1'),(11,11,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-23 02:34:11','2024-07-23 02:34:11','1'),(12,12,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-23 02:47:31','2024-07-23 02:47:31','1'),(13,13,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-23 02:51:02','2024-07-23 02:51:02','1'),(14,14,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-23 02:54:11','2024-07-23 02:54:11','1'),(15,15,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-23 02:55:44','2024-07-23 02:55:44','1'),(16,16,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-23 02:59:11','2024-07-23 02:59:11','1'),(17,17,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-23 03:00:51','2024-07-23 03:00:51','1'),(18,18,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-23 03:04:31','2024-07-23 03:04:31','1'),(19,19,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-23 03:05:51','2024-07-23 03:05:51','1'),(30,20,'Pago','Se debe cancelar esta factura en 30 dias','Activo','marana','marana','2024-07-23 08:50:02','2024-07-23 08:50:02','1'),(31,21,'Pago','Se debe cancelar esta factura en 30 dias','Activo','marana','marana','2024-07-23 08:50:08','2024-07-23 08:50:08','1'),(34,22,'Pago','Se debe cancelar esta factura en 30 dias','Activo','marana','marana','2024-07-23 08:52:53','2024-07-23 08:52:53','1'),(35,23,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-23 08:52:58','2024-07-23 08:52:58','1'),(36,24,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-23 21:48:50','2024-07-23 21:48:50','1'),(37,25,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-24 01:15:41','2024-07-24 01:15:41','1'),(38,26,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-24 01:19:07','2024-07-24 01:19:07','1'),(39,27,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-24 01:19:48','2024-07-24 01:19:48','1'),(40,28,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-24 01:20:00','2024-07-24 01:20:00','1'),(46,32,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-07-31 00:15:49','2024-07-31 00:15:49','1'),(47,31,'Pago','Se debe cancelar esta factura en 30 dias','Activo','marana','marana','2024-07-31 00:16:26','2024-07-31 00:16:26','1'),(49,33,'Pago','Se debe cancelar esta factura en 30 dias','Activo','marana','marana','2024-07-31 00:20:49','2024-07-31 00:20:49','1'),(51,34,'Pago','Se debe cancelar esta factura en 30 dias','Activo','marana','marana','2024-07-31 02:45:16','2024-07-31 02:45:16','1'),(53,36,'Pago','Se debe cancelar esta factura en 30 dias','Activo','eavila',NULL,'2024-08-02 07:12:08','2024-08-02 07:12:08','1'),(54,37,'Pago 1','Se abona $10 el día de la compra','Activo','mvera0986',NULL,'2024-10-10 11:34:51','2024-10-10 11:34:51','4'),(55,37,'Pago 2','Se cobrará $5 en un plazo de 10 días','Activo','mvera0986',NULL,'2024-10-10 11:34:51','2024-10-10 11:34:51','4'),(56,40,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-10-24 04:44:34','2024-10-24 04:44:34','4'),(57,39,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-10-24 04:49:40','2024-10-24 04:49:40','4'),(58,41,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-10-24 21:09:42','2024-10-24 21:09:42','4'),(59,42,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-10-24 21:17:16','2024-10-24 21:17:16','4'),(60,43,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-10-24 21:18:18','2024-10-24 21:18:18','4'),(61,44,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-10-24 21:52:59','2024-10-24 21:52:59','4'),(62,45,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-10-24 21:53:26','2024-10-24 21:53:26','4'),(63,47,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-10-25 04:44:19','2024-10-25 04:44:19','4'),(64,46,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-10-25 04:44:42','2024-10-25 04:44:42','4'),(65,49,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-10-26 21:54:12','2024-10-26 21:54:12','4'),(66,50,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-10-27 04:00:52','2024-10-27 04:00:52','4'),(67,51,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-10-27 04:07:26','2024-10-27 04:07:26','4'),(68,52,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-10-27 04:07:31','2024-10-27 04:07:31','4'),(69,72,'Dos pagos','Se cancelará el total en dos pago','Activo','mvera0986',NULL,'2024-11-02 01:19:40','2024-11-02 01:19:40','4'),(70,72,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-11-02 04:20:31','2024-11-02 04:20:31','4'),(71,75,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-11-05 02:41:24','2024-11-05 02:41:24','4'),(72,82,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-11-05 02:44:26','2024-11-05 02:44:26','4'),(73,83,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-11-05 02:48:39','2024-11-05 02:48:39','4'),(74,84,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-11-05 02:50:26','2024-11-05 02:50:26','4'),(75,85,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-11-05 02:51:28','2024-11-05 02:51:28','4'),(76,77,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-11-05 05:49:27','2024-11-05 05:49:27','4'),(77,86,'Pago de cuenta','La cuanta ha sido pagada','Activo','mvera0986','mvera0986','2024-11-05 05:50:12','2024-11-05 05:50:12','4');
/*!40000 ALTER TABLE `detObservacionesFacturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establecimientos`
--

DROP TABLE IF EXISTS `establecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `establecimientos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `establecimiento` varchar(60) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimientos`
--

LOCK TABLES `establecimientos` WRITE;
/*!40000 ALTER TABLE `establecimientos` DISABLE KEYS */;
INSERT INTO `establecimientos` VALUES (1,'Papeleria buen estudio','Papeleria','Activo','eavila',NULL,'2024-07-07 03:03:55','2024-07-07 03:03:55','1'),(2,'Papeleria minino','Papeleria','Activo','eavila',NULL,'2024-07-07 03:04:25','2024-07-07 03:04:25','1'),(3,'Papeleria Bombacha','Papeleria','Eliminado','eavila','marana','2024-07-07 03:05:45','2024-07-07 03:09:05','1'),(4,'Tienda Gonzales','Tienda','Activo','mvera0986','mvera0986','2024-09-20 22:53:20','2024-09-21 02:53:10','4'),(5,'Ferreteria Gonzales','Ferreteria','Eliminado','mvera0986',NULL,'2024-09-20 22:54:58','2024-09-20 22:55:02','4');
/*!40000 ALTER TABLE `establecimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formasPago`
--

DROP TABLE IF EXISTS `formasPago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formasPago` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `formaPago` varchar(60) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formasPago`
--

LOCK TABLES `formasPago` WRITE;
/*!40000 ALTER TABLE `formasPago` DISABLE KEYS */;
INSERT INTO `formasPago` VALUES (1,'Efectivo','Efectivo','Activo','eavila','','2024-07-07 05:00:00','2024-07-07 05:00:00','1');
/*!40000 ALTER TABLE `formasPago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineas`
--

DROP TABLE IF EXISTS `lineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `linea` varchar(60) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineas`
--

LOCK TABLES `lineas` WRITE;
/*!40000 ALTER TABLE `lineas` DISABLE KEYS */;
INSERT INTO `lineas` VALUES (1,'Cartera','Accesorio de mujer','Activo','eavila','marana','2024-07-03 01:34:01','2024-07-09 22:14:33','1'),(2,'Aretes','Accesorio de mujer','Activo','eavila','marana','2024-07-03 01:38:20','2024-07-09 22:14:29','1'),(3,'Pulseras','Accesorio de mujer','Eliminado','eavila',NULL,'2024-07-03 01:39:19','2024-07-03 01:58:23','1'),(4,'Cartera','Accesorio de mujer','Activo','eavila','marana','2024-07-04 02:10:24','2024-07-04 02:26:29','2'),(5,'Cartera','Accesorio de mujer','Activo','eavila','marana','2024-07-04 02:10:37','2024-07-04 02:26:41','3'),(6,'Moda','Productos a la moda','Eliminado','mvera0986','mvera0986','2024-09-09 23:44:05','2024-09-09 23:47:52','4'),(7,'N/A','Sin linea','Activo','mvera0986','mvera0986','2024-09-09 23:48:04','2024-09-11 02:05:06','4'),(8,'Ropa','Línea de ropa','Activo','mvera0986',NULL,'2024-09-11 02:05:32','2024-09-11 02:05:32','4'),(9,'Estudiantil','Línea de estudiantil','Activo','mvera0986',NULL,'2024-09-11 02:06:00','2024-09-11 02:06:00','4');
/*!40000 ALTER TABLE `lineas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `marca` varchar(60) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Yanbal','Marca','Activo','eavila','marana','2024-07-03 03:12:23','2024-07-03 03:13:21','1'),(2,'Esika','Marca','Eliminado','eavila','marana','2024-07-03 03:13:40','2024-07-03 03:14:50','1'),(3,'N/A','Sin marca','Activo','mvera0986','mvera0986','2024-09-10 00:19:29','2024-09-11 02:06:18','4'),(4,'Avon','Marca de desodorante','Eliminado','mvera0986',NULL,'2024-09-10 00:20:05','2024-09-10 00:20:15','4'),(5,'Gucci','Marca Italiana','Activo','mvera0986',NULL,'2024-09-11 02:06:33','2024-09-11 02:06:33','4'),(6,'Avon','Marca Avon','Activo','mvera0986',NULL,'2024-09-11 02:06:51','2024-09-11 02:06:51','4');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_08_19_000000_create_failed_jobs_table',1),(2,'2019_12_14_000001_create_personal_access_tokens_table',1),(3,'2024_07_01_044335_create_categorias_table',1),(4,'2024_07_01_221650_create_marcas_table',1),(5,'2024_07_01_222127_create_lineas_table',1),(6,'2024_07_01_222255_create_tipos_de_identificacion_table',1),(7,'2024_07_01_222400_create_proveedores_table',1),(8,'2024_07_01_223528_create_tipos_de_iva_table',1),(9,'2024_07_01_224202_create_tipos_de_medicion_table',1),(10,'2024_07_01_224722_create_productos_table',1),(11,'2024_07_03_135354_create_clientes_table',1),(12,'2024_07_04_130933_create_movimientos_table',1),(13,'2024_07_04_131304_create_cab_movimientos_table',1),(14,'2024_07_04_131321_create_det_movimientos_table',1),(15,'2024_07_04_131402_create_stocks_table',1),(16,'2024_07_06_213653_create_establecimientos_table',2),(17,'2024_07_06_225712_create_puntos_de_emicion_factura_table',3),(18,'2024_07_06_225712_create_puntos_de_emision_factura_table',4),(19,'2024_07_08_160339_create_formas_de_pago_table',5),(26,'2024_07_08_161317_create_perfiles_de_factura_table',6),(37,'2024_07_09_210852_create_cab_facturas_table',7),(38,'2024_07_09_212940_create_det_facturas_table',7),(39,'2024_07_09_214224_create_det_observaciones_facturas_table',7),(40,'2024_07_09_214620_create_det_forma_pago_facturas_table',7),(41,'2024_07_30_221849_create_abonos_table',8),(44,'2024_11_04_161350_create_movimientos_contables_table',9),(45,'2024_11_11_171633_create_config_sistema_table',10);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `movimiento` varchar(60) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (1,'Ingreso','Ingreso a inventario','Activo','eavila',NULL,'2024-07-04 20:37:14','2024-07-04 20:37:14','1'),(2,'Egreso','Egreso de inventario','Activo','eavila','marana','2024-07-04 20:37:35','2024-07-04 20:40:43','1');
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientosContables`
--

DROP TABLE IF EXISTS `movimientosContables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientosContables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(60) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientosContables`
--

LOCK TABLES `movimientosContables` WRITE;
/*!40000 ALTER TABLE `movimientosContables` DISABLE KEYS */;
INSERT INTO `movimientosContables` VALUES (1,'Egreso',25.50,'2024-11-04','Se pago la mensualidad del internet','Activo','mvera0986','mvera0986','2024-11-04 23:01:14','2024-11-04 23:01:44','4');
/*!40000 ALTER TABLE `movimientosContables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfilesFactura`
--

DROP TABLE IF EXISTS `perfilesFactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfilesFactura` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `emisor` varchar(60) NOT NULL,
  `ruc` varchar(15) NOT NULL,
  `establecimiento_id` bigint(20) unsigned NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `firmaElectronica` varchar(2) DEFAULT 'NO',
  `certificadoFirma` varchar(200) DEFAULT NULL,
  `claveFirma` varchar(255) DEFAULT NULL,
  `fechaVigencia` date DEFAULT NULL,
  `propietarioCertificado` text DEFAULT NULL,
  `contribuyenteRimpe` varchar(2) DEFAULT 'NO',
  `contribuyenteEspecial` varchar(2) DEFAULT 'NO',
  `negocioPopular` varchar(2) DEFAULT 'NO',
  `obligadoContabilidad` varchar(2) DEFAULT 'NO',
  `agenteRetencion` varchar(2) DEFAULT 'NO',
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `perfilesfactura_establecimiento_id_foreign` (`establecimiento_id`),
  CONSTRAINT `perfilesfactura_establecimiento_id_foreign` FOREIGN KEY (`establecimiento_id`) REFERENCES `establecimientos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfilesFactura`
--

LOCK TABLES `perfilesFactura` WRITE;
/*!40000 ALTER TABLE `perfilesFactura` DISABLE KEYS */;
INSERT INTO `perfilesFactura` VALUES (1,'Marlon Jesus Carranza Gorozabel','1346257361001',3,'perfiles_de_factura/logos/ju7RVuBiBDvN1cH5bV2WVI773sgqAsYEQtJAPbBx.png','SI','perfiles_de_factura/firmas/certificados/vgOC3GG3esosyzHeXehs0mK7l4ab2DHYGiDInoVP.bin','123456789','2025-06-06','L=PORTOVIEJO, ST=MANABÍ, OID.2.5.4.13=Cargo:REPRESENTANTE LEGAL, T=REPRESENTANTE LEGAL, EMAILADDRESS=eavila4906@gmail.com, CN=1314634906 ERICK ALEXANDER AVILA BRAVO, SURNAME=AVILA BRAVO, SERIALNUMBER=1314634906, C=EC, OID.2.5.4.97=1314634906001, GIVENNAME=ERICK ALEXANDER, OU=Certificado Persona Natural RUC EC, O=AVILA BRAVO ERICK ALEXANDER, OID.1.3.6.1.4.1.37442.10.4=1314634906','NO','NO','SI','NO','NO','Activo','eavila','marana','2024-07-09 02:26:28','2024-07-09 20:04:20','1'),(17,'Comercial \"Baratodo\"','1304563218001',4,NULL,'NO',NULL,NULL,NULL,NULL,'NO','NO','NO','NO','NO','Activo','mvera0986','mvera0986','2024-10-04 10:56:58','2024-10-31 20:20:40','4');
/*!40000 ALTER TABLE `perfilesFactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(25) NOT NULL,
  `categoria_id` bigint(20) unsigned NOT NULL,
  `marca_id` bigint(20) unsigned NOT NULL,
  `linea_id` bigint(20) unsigned NOT NULL,
  `proveedor_id` bigint(20) unsigned NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `pvp1` decimal(10,2) DEFAULT NULL,
  `pvp2` decimal(10,2) DEFAULT NULL,
  `pvp3` decimal(10,2) DEFAULT NULL,
  `pvp4` decimal(10,2) DEFAULT NULL,
  `precioCompra` decimal(10,2) DEFAULT NULL,
  `fechaElaboracion` date DEFAULT NULL,
  `fechaVencimiento` date DEFAULT NULL,
  `lote` varchar(25) DEFAULT NULL,
  `medicion_id` bigint(20) unsigned NOT NULL,
  `iva_id` bigint(20) unsigned NOT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productos_categoria_id_foreign` (`categoria_id`),
  KEY `productos_marca_id_foreign` (`marca_id`),
  KEY `productos_linea_id_foreign` (`linea_id`),
  KEY `productos_proveedor_id_foreign` (`proveedor_id`),
  KEY `productos_medicion_id_foreign` (`medicion_id`),
  KEY `productos_iva_id_foreign` (`iva_id`),
  CONSTRAINT `productos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `productos_iva_id_foreign` FOREIGN KEY (`iva_id`) REFERENCES `tiposIva` (`id`),
  CONSTRAINT `productos_linea_id_foreign` FOREIGN KEY (`linea_id`) REFERENCES `lineas` (`id`),
  CONSTRAINT `productos_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`),
  CONSTRAINT `productos_medicion_id_foreign` FOREIGN KEY (`medicion_id`) REFERENCES `tiposMedicion` (`id`),
  CONSTRAINT `productos_proveedor_id_foreign` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'00001',1,1,1,1,'Chocolate blanco',1.00,1.50,1.55,1.65,0.65,NULL,'2024-12-12','12122023',1,1,'Activo','eavila',NULL,'2024-07-03 09:10:20','2024-07-03 09:10:20','1'),(2,'00002',1,1,1,1,'Chocolate negro',1.00,1.20,1.25,1.45,0.55,NULL,'2024-12-12','12122023',1,1,'Activo','eavila',NULL,'2024-07-03 09:11:57','2024-07-03 09:11:57','1'),(3,'00003',1,1,1,1,'Chocolate surtido',1.00,1.60,1.95,2.45,0.80,NULL,'2024-12-12','12122023',1,1,'Activo','eavila',NULL,'2024-07-03 09:12:50','2024-07-03 09:12:50','1'),(4,'00004',1,1,1,1,'Chocolate surtido fiesta',1.15,1.65,2.15,2.65,0.85,'2023-12-12','2024-12-12','12122023',1,1,'Eliminado','eavila','marana','2024-07-03 09:14:01','2024-07-03 09:16:30','1'),(5,'00005',1,1,1,1,'Chocolate carnavalero',1.35,1.75,2.25,2.75,0.95,'2023-12-12','2024-12-12','12122023',1,3,'Activo','eavila','marana','2024-07-03 09:36:52','2024-07-03 09:38:44','1'),(6,'00006',1,1,1,1,'Galletas de amor',1.35,1.75,2.25,2.75,0.95,'2023-12-12','2024-12-12','12122023',1,3,'Activo','eavila','marana','2024-07-04 10:32:04','2024-07-04 10:35:42','1'),(7,'00001',1,1,1,1,'Galletas de amor',1.35,1.75,2.25,2.75,0.95,'2023-12-12','2024-12-12','12122023',1,3,'Activo','eavila','marana','2024-07-04 10:32:32','2024-07-04 10:35:21','2'),(8,'735264895478',7,5,8,9,'Camisa de hombre',79.99,0.00,0.00,0.00,49.99,'0001-01-01','0001-01-01',NULL,1,1,'Activo','mvera0986','mvera0986','2024-09-11 02:21:47','2024-11-03 04:12:52','4'),(9,'785469231548',7,5,8,9,'Pantalón para hombre',49.99,0.00,0.00,0.00,29.99,NULL,NULL,NULL,1,3,'Activo','mvera0986','mvera0986','2024-09-13 01:42:34','2024-11-03 04:12:35','4'),(10,'645854877687',7,6,7,5,'Perfume de mujer',35.99,0.00,0.00,0.00,10.99,NULL,NULL,NULL,1,3,'Activo','mvera0986','mvera0986','2024-09-13 01:44:55','2024-11-03 04:12:17','4'),(11,'521542545523',6,3,7,6,'Galletas de azucar',15.00,0.00,0.00,0.00,10.00,NULL,NULL,NULL,1,1,'Activo','mvera0986','mvera0986','2024-09-13 01:46:20','2024-11-03 04:11:47','4');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(60) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `identificacion_id` bigint(20) unsigned NOT NULL,
  `numeroIdentificacion` varchar(15) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proveedores_numeroidentificacion_unique` (`numeroIdentificacion`),
  KEY `proveedores_identificacion_id_foreign` (`identificacion_id`),
  CONSTRAINT `proveedores_identificacion_id_foreign` FOREIGN KEY (`identificacion_id`) REFERENCES `tiposIdentificacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Comercial Casanova','Comercial','0989548246','ccasanova@mail.com','Portoviejo',1,'1385647391','Activo','eavila','marana','2024-07-03 06:51:22','2024-07-15 23:10:17','1'),(2,'Comercial Gonzales','Comercial','0989546320','cgonzales@mail.com','Portoviejo',2,'1385642123','Activo','eavila',NULL,'2024-07-03 06:53:27','2024-07-03 06:53:27','1'),(3,'Comercial Sizuka','Comercial','0989543956','csizuka@mail.com','Portoviejo',2,'1385644689','Activo','eavila',NULL,'2024-07-03 06:54:05','2024-07-03 06:54:05','1'),(4,'Comercial Jossa','Comercial','0989543956','cjossa@mail.com','Portoviejo',2,'1385648574','Eliminado','eavila',NULL,'2024-07-03 07:09:57','2024-07-03 07:11:08','1'),(5,'N/A','Sin proveedor','0000000009',NULL,'N/A',1,'0000000009','Activo','mvera0986','mvera0986','2024-09-10 11:45:05','2024-09-11 02:08:36','4'),(6,'Nestle S.A',NULL,'0986548545',NULL,'Portoviejo',4,'1358398319001','Activo','mvera0986','mvera0986','2024-09-10 11:53:52','2024-09-10 12:02:57','4'),(7,'Agripac S.A',NULL,'0986486265',NULL,'Portoviejo',4,'1315698742001','Activo','mvera0986','mvera0986','2024-09-10 12:04:33','2024-09-10 12:04:47','4'),(8,'Pilsener S.A',NULL,'0988654721',NULL,'Manta',4,'1315648956001','Eliminado','mvera0986','mvera0986','2024-09-10 12:05:29','2024-09-10 12:05:44','4'),(9,'Gucci S.A',NULL,'0986549231',NULL,'Quito',4,'1349568462001','Activo','mvera0986','mvera0986','2024-09-11 02:09:10','2024-09-11 11:12:57','4'),(10,'Pepsi S.A',NULL,'0986547231','pepsi@gmail.com','Portoviejo',1,NULL,'Activo','mvera0986',NULL,'2024-10-26 21:35:21','2024-10-26 21:35:21','4');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntosEmisionFactura`
--

DROP TABLE IF EXISTS `puntosEmisionFactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntosEmisionFactura` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `establecimiento_id` bigint(20) unsigned NOT NULL,
  `puntoEmision` varchar(10) NOT NULL,
  `factura` int(11) NOT NULL DEFAULT 0,
  `notaCredito` int(11) NOT NULL DEFAULT 0,
  `notaDebito` int(11) NOT NULL DEFAULT 0,
  `comprobanteRetencion` int(11) NOT NULL DEFAULT 0,
  `liquidacionCompra` int(11) NOT NULL DEFAULT 0,
  `guiaRemision` int(11) NOT NULL DEFAULT 0,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `puntosemisionfactura_establecimiento_id_foreign` (`establecimiento_id`),
  CONSTRAINT `puntosemisionfactura_establecimiento_id_foreign` FOREIGN KEY (`establecimiento_id`) REFERENCES `establecimientos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntosEmisionFactura`
--

LOCK TABLES `puntosEmisionFactura` WRITE;
/*!40000 ALTER TABLE `puntosEmisionFactura` DISABLE KEYS */;
INSERT INTO `puntosEmisionFactura` VALUES (1,1,'001',0,0,0,0,0,0,'Factura','Activo','eavila','marana','2024-07-07 09:06:50','2024-07-07 09:11:13','1'),(2,2,'002',0,0,0,0,0,0,'Factura','Eliminado','eavila','marana','2024-07-07 09:08:09','2024-07-07 09:14:05','1'),(3,4,'001',0,0,0,0,0,0,'Punto 1','Activo','mvera0986','mvera0986','2024-09-21 02:43:30','2024-09-21 02:47:41','4');
/*!40000 ALTER TABLE `puntosEmisionFactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `producto_id` bigint(20) unsigned NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stocks_producto_id_foreign` (`producto_id`),
  CONSTRAINT `stocks_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (32,8,19,'Activo',NULL,NULL,'2024-11-06 18:25:54','2024-11-12 03:41:45','4'),(33,9,19,'Activo',NULL,NULL,'2024-11-06 18:25:54','2024-11-12 03:41:45','4'),(34,10,25,'Activo',NULL,NULL,'2024-11-06 18:25:54','2024-11-11 16:35:07','4'),(35,11,40,'Activo',NULL,NULL,'2024-11-06 18:25:54','2024-11-08 17:05:24','4');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposIdentificacion`
--

DROP TABLE IF EXISTS `tiposIdentificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposIdentificacion` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(60) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposIdentificacion`
--

LOCK TABLES `tiposIdentificacion` WRITE;
/*!40000 ALTER TABLE `tiposIdentificacion` DISABLE KEYS */;
INSERT INTO `tiposIdentificacion` VALUES (1,'Sin identificación','Sin identificación','Activo','eavila',NULL,'2024-07-03 03:31:36','2024-07-03 03:31:36','1'),(2,'Cedula','Cedula de ciudadania','Activo','eavila',NULL,'2024-07-03 03:31:36','2024-07-03 03:31:36','1'),(3,'Pasaporte','Pasaporte de ciudadania','Activo','eavila',NULL,'2024-07-03 03:32:31','2024-07-03 03:32:31','1'),(4,'RUC','RUC de ciudadania','Activo','eavila',NULL,'2024-07-03 03:32:58','2024-07-03 03:32:58','1'),(5,'RISE','RISE de ciudadania','Eliminado','eavila','marana','2024-07-03 03:34:09','2024-07-03 03:37:03','1');
/*!40000 ALTER TABLE `tiposIdentificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposIva`
--

DROP TABLE IF EXISTS `tiposIva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposIva` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tipoIva` varchar(60) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposIva`
--

LOCK TABLES `tiposIva` WRITE;
/*!40000 ALTER TABLE `tiposIva` DISABLE KEYS */;
INSERT INTO `tiposIva` VALUES (1,'0%','Sin IVA','Activo','eavila',NULL,'2024-07-03 05:15:43','2024-07-03 05:15:43','1'),(2,'12%','Personas de tercera edad','Activo','eavila',NULL,'2024-07-03 05:16:04','2024-07-03 05:16:04','1'),(3,'15%','Estandar','Activo','eavila','marana','2024-07-03 05:16:15','2024-07-03 05:17:41','1'),(4,'14%','Sin observación','Eliminado','eavila',NULL,'2024-07-03 05:18:45','2024-07-03 05:19:10','1');
/*!40000 ALTER TABLE `tiposIva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposMedicion`
--

DROP TABLE IF EXISTS `tiposMedicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposMedicion` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `medicion` varchar(60) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `usrCreador` varchar(25) DEFAULT NULL,
  `usrEditor` varchar(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `codigoEmpresa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposMedicion`
--

LOCK TABLES `tiposMedicion` WRITE;
/*!40000 ALTER TABLE `tiposMedicion` DISABLE KEYS */;
INSERT INTO `tiposMedicion` VALUES (1,'N/A','Sin medición','Activo','eavila','marana','2024-07-03 05:59:38','2024-07-03 06:01:54','1'),(2,'Libra','Medicion en libras','Activo','eavila',NULL,'2024-07-03 06:02:17','2024-07-03 06:02:43','1');
/*!40000 ALTER TABLE `tiposMedicion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-11 23:11:06
