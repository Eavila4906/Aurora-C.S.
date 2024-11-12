-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: aurora_db_2
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
-- Table structure for table `aurora_apps`
--

DROP TABLE IF EXISTS `aurora_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aurora_apps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(25) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aurora_apps`
--

LOCK TABLES `aurora_apps` WRITE;
/*!40000 ALTER TABLE `aurora_apps` DISABLE KEYS */;
INSERT INTO `aurora_apps` VALUES (1,'Aurora','Sistema general',1,'2024-08-29 05:00:00','2024-08-29 05:00:00'),(2,'Restaurant','Aurora restaurant - Sistema',1,'2024-08-29 05:00:00','2024-09-04 22:53:58'),(3,'Contable','Aurora contable - Sistema',1,'2024-08-29 05:00:00','2024-09-04 22:53:50'),(5,'Transporte','Aurora transporte - Sistema',2,'2024-09-04 22:55:12','2024-09-04 23:00:49');
/*!40000 ALTER TABLE `aurora_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Aurora C.S.','Aurora Computer System',1,NULL,NULL),(2,'Restaurant Cielito','Aurora restaurant - cielito',1,NULL,'2024-08-20 22:38:12'),(4,'Comercial Buena vida','Comercial',1,'2024-08-27 00:24:18','2024-09-04 23:04:47');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
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
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) unsigned DEFAULT NULL,
  `submodule_id` bigint(20) unsigned NOT NULL,
  `item` varchar(25) NOT NULL,
  `path` varchar(25) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `items_submodule_id_foreign` (`submodule_id`),
  KEY `fk_items_app_id` (`app_id`),
  CONSTRAINT `fk_items_app_id` FOREIGN KEY (`app_id`) REFERENCES `aurora_apps` (`id`),
  CONSTRAINT `items_submodule_id_foreign` FOREIGN KEY (`submodule_id`) REFERENCES `submodules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (9,1,3,'Módulos','/modulos','Administrador de módulos del sistema','<i class=\"fas fa-shapes\"></i>',1,'2024-08-23 10:58:22','2024-09-03 06:49:17'),(10,1,3,'Submódulos','/submodulos','Administrados de submódulos del sistema','<i class=\"fas fa-square\"></i>',1,'2024-08-23 11:00:07','2024-08-23 11:02:59'),(11,1,3,'Items','/items','Administrador de items del sistema','<i class=\"fas fa-circle\"></i>',1,'2024-08-23 11:01:48','2024-08-23 11:01:48'),(15,3,36,'Perfil','/perfil','Item para configurar el perfil para la facturación','<i class=\"far fa-id-card\"></i>',1,'2024-09-05 04:27:03','2024-09-05 04:27:03'),(16,3,36,'Establecimientos','/establecimientos','Item para configurar el o los establecimientos de la factura','<i class=\"fas fa-map-marked\"></i>',1,'2024-09-05 04:28:27','2024-09-05 04:28:27'),(17,3,36,'Puntos de emisión','/puntos-de-emision','Item para configurar los puntos de emisión de una factura','<i class=\"fas fa-map-pin\"></i>',1,'2024-09-05 04:29:32','2024-09-05 04:29:32');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (50,'2014_10_12_000000_create_users_table',1),(51,'2014_10_12_100000_create_password_resets_table',1),(52,'2016_06_01_000001_create_oauth_auth_codes_table',1),(53,'2016_06_01_000002_create_oauth_access_tokens_table',1),(54,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(55,'2016_06_01_000004_create_oauth_clients_table',1),(56,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(57,'2019_08_19_000000_create_failed_jobs_table',1),(58,'2019_12_14_000001_create_personal_access_tokens_table',1),(59,'2024_02_06_144401_create_modules_table',1),(60,'2024_02_06_144746_create_roles_table',1),(61,'2024_02_06_144959_create_permissions_table',1),(62,'2024_02_06_145230_create_user_roles_table',1),(63,'2024_05_18_164615_create_submodules_table',1),(64,'2024_05_18_164906_create_items_table',1),(65,'2024_06_01_174315_create_permissions_sub_modules_table',1),(66,'2024_06_01_174540_create_permissions_items_table',1),(67,'2024_06_23_012342_create_companies_table',2),(68,'2024_06_23_015919_create_user_companies_table',2),(69,'2024_08_29_180622_create_aurora_apps_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) unsigned DEFAULT NULL,
  `module` varchar(25) NOT NULL,
  `path` varchar(25) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_modules_app_id` (`app_id`),
  CONSTRAINT `fk_modules_app_id` FOREIGN KEY (`app_id`) REFERENCES `aurora_apps` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,1,'Administración','/administracion','Administracion del sistema','<i class=\"fas fa-shapes\"></i>',1,NULL,'2024-08-21 21:57:41'),(2,2,'Ordenes','/ordenes','Ordenes','<i class=\"fas fa-book-reader\"></i>',1,NULL,'2024-09-02 23:22:07'),(3,2,'Delivery','/delivery','Delivery','<i class=\"fas fa-motorcycle\"></i>',1,NULL,'2024-09-02 23:22:14'),(4,2,'Gestión productos','/gestion_productos','Gestión de productos','<i class=\"fas fa-box-open\"></i>',1,NULL,'2024-09-02 23:22:01'),(5,2,'Gestión existencia','/gestion_existencia','Gestón de existencia','<i class=\"fas fa-clipboard-list\"></i>',1,NULL,'2024-09-02 23:21:56'),(6,2,'Reportes','/reportes','Reportes','<i class=\"fas fa-book\"></i>',1,NULL,'2024-09-02 23:21:46'),(15,3,'Tienda','/tienda','Módulo para gestionar ventas y compras en aurora contable','<i class=\"fas fa-store-alt\"></i>',1,'2024-09-05 01:39:17','2024-09-05 01:39:17'),(16,3,'Inventario','/inventario','Módulo para gestionar el inventario en aurora contable','<i class=\"fas fa-dolly\"></i>',1,'2024-09-05 03:49:51','2024-11-04 22:11:30'),(17,3,'Contabilidad','/contabilidad','Módulo para gestionar la contabilidad de aurora contable','<i class=\"fas fa-file-invoice-dollar\"></i>',1,'2024-09-05 03:55:26','2024-09-05 03:55:26'),(18,3,'Reportes','/reportes','Módulo para los reportes de aurora contable','<i class=\"fas fa-clipboard\"></i>',1,'2024-09-05 03:57:11','2024-09-05 03:57:11'),(19,3,'Gestión','/gestion','Módulo para gestionar y configurar la tienda en aurora contable','<i class=\"fas fa-shapes\"></i>',1,'2024-09-05 03:59:49','2024-09-05 03:59:49'),(20,3,'Configuración','/configuracion','Módulo de configuración','<i class=\"fas fa-cog\"></i>',1,'2024-09-05 04:24:19','2024-09-05 04:24:19');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('191e0deba9306b2a8f40dec16a53a28e3409164a89343b5459b57daf63ae46ca7d107b81519b3af4',6,1,NULL,'[]',0,'2024-11-06 23:20:45','2024-11-06 23:20:45','2025-11-06 18:20:45'),('2112c39fb5e091a7e6bb93f2a5c478a0ff5e759dc2e0dfec776d2bab2abb37358d7b2bbd986df7cf',1,1,NULL,'[]',0,'2024-11-04 22:07:02','2024-11-04 22:07:02','2025-11-04 17:07:02'),('49ef6a771043c7a2bfd09fc426d28715a675ca6b0b3f8d73b6f784545aa852ec3c8a06dcc4dcfd1e',2,1,NULL,'[]',0,'2024-09-13 01:49:49','2024-09-13 01:49:49','2025-09-12 20:49:49'),('ac8764e6cb24e978dd928a7781e4bd36b8797fbf724ae563c94c5fb0f634cd5e86051df1c18a8c1e',1,1,NULL,'[]',0,'2024-11-03 04:48:40','2024-11-03 04:48:40','2025-11-02 23:48:40'),('bd41c09683d59e34751dd3e1e7697336166bacdd8e3e97efedd135e022bbdc44858bea6ac959db9b',2,1,NULL,'[]',0,'2024-09-27 22:16:07','2024-09-27 22:16:07','2025-09-27 17:16:07'),('f489264323f95a98919f35809a52cd736ccdde7171ba8d6100658fef9efafd557bae96d39f84ddb0',1,1,NULL,'[]',0,'2024-11-09 05:28:36','2024-11-09 05:28:36','2025-11-09 00:28:36');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','c4HrEfxfK3eloUa1yzLRgg3BPpbtVEPhJ2wHp5XC',NULL,'http://localhost',1,0,0,'2024-06-16 01:52:26','2024-06-16 01:52:26'),(2,NULL,'Laravel Password Grant Client','beenU5yoQOGv3iatp5o7sllY3knaAdHPjd3UeLOY','users','http://localhost',0,1,0,'2024-06-16 01:52:27','2024-06-16 01:52:27');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2024-06-16 01:52:27','2024-06-16 01:52:27');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rol` bigint(20) unsigned NOT NULL,
  `module` bigint(20) unsigned NOT NULL,
  `r` int(11) NOT NULL DEFAULT 0,
  `w` int(11) NOT NULL DEFAULT 0,
  `u` int(11) NOT NULL DEFAULT 0,
  `d` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `permissions_rol_foreign` (`rol`),
  KEY `permissions_module_foreign` (`module`),
  CONSTRAINT `permissions_module_foreign` FOREIGN KEY (`module`) REFERENCES `modules` (`id`),
  CONSTRAINT `permissions_rol_foreign` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=596 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (553,5,1,0,0,0,0),(554,5,2,1,1,1,1),(555,5,3,0,0,0,0),(556,5,4,0,0,0,0),(557,5,5,0,0,0,0),(558,5,6,0,0,0,0),(565,1,1,1,1,1,1),(566,1,2,0,0,0,0),(567,1,3,0,0,0,0),(568,1,4,0,0,0,0),(569,1,5,0,0,0,0),(570,1,6,0,0,0,0),(571,2,2,1,1,1,1),(572,2,3,1,1,1,1),(573,2,4,1,1,1,1),(574,2,5,1,1,1,1),(575,2,6,1,1,1,1),(584,3,15,1,1,1,1),(585,3,16,1,1,1,1),(586,3,17,1,1,1,1),(587,3,18,1,1,1,1),(588,3,19,1,1,1,1),(589,3,20,1,1,1,1),(590,9,15,1,1,1,1),(591,9,16,0,0,0,0),(592,9,17,0,0,0,0),(593,9,18,0,0,0,0),(594,9,19,0,0,0,0),(595,9,20,0,0,0,0);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_items`
--

DROP TABLE IF EXISTS `permissions_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rol` bigint(20) unsigned NOT NULL,
  `item` bigint(20) unsigned NOT NULL,
  `r` int(11) NOT NULL DEFAULT 0,
  `w` int(11) NOT NULL DEFAULT 0,
  `u` int(11) NOT NULL DEFAULT 0,
  `d` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `permissions_items_rol_foreign` (`rol`),
  KEY `permissions_items_item_foreign` (`item`),
  CONSTRAINT `permissions_items_item_foreign` FOREIGN KEY (`item`) REFERENCES `items` (`id`),
  CONSTRAINT `permissions_items_rol_foreign` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_items`
--

LOCK TABLES `permissions_items` WRITE;
/*!40000 ALTER TABLE `permissions_items` DISABLE KEYS */;
INSERT INTO `permissions_items` VALUES (55,1,9,1,1,1,1),(56,1,10,1,1,1,1),(57,1,11,1,1,1,1),(82,5,9,0,0,0,0),(83,5,10,0,0,0,0),(84,5,11,0,0,0,0),(87,3,15,1,1,1,1),(88,3,16,1,1,1,1),(89,3,17,1,1,1,1);
/*!40000 ALTER TABLE `permissions_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_submodules`
--

DROP TABLE IF EXISTS `permissions_submodules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions_submodules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rol` bigint(20) unsigned NOT NULL,
  `submodule` bigint(20) unsigned NOT NULL,
  `r` int(11) NOT NULL DEFAULT 0,
  `w` int(11) NOT NULL DEFAULT 0,
  `u` int(11) NOT NULL DEFAULT 0,
  `d` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `permissions_submodules_rol_foreign` (`rol`),
  KEY `permissions_submodules_submodule_foreign` (`submodule`),
  CONSTRAINT `permissions_submodules_rol_foreign` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`),
  CONSTRAINT `permissions_submodules_submodule_foreign` FOREIGN KEY (`submodule`) REFERENCES `submodules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_submodules`
--

LOCK TABLES `permissions_submodules` WRITE;
/*!40000 ALTER TABLE `permissions_submodules` DISABLE KEYS */;
INSERT INTO `permissions_submodules` VALUES (1033,5,1,0,0,0,0),(1034,5,2,0,0,0,0),(1035,5,3,0,0,0,0),(1036,5,4,1,1,1,0),(1037,5,5,0,0,0,0),(1038,5,6,0,0,0,0),(1039,5,7,0,0,0,0),(1040,5,8,0,0,0,0),(1041,5,9,0,0,0,0),(1042,5,10,0,0,0,0),(1043,5,11,0,0,0,0),(1044,5,12,0,0,0,0),(1045,5,13,0,0,0,0),(1046,5,14,0,0,0,0),(1047,5,15,0,0,0,0),(1094,2,4,1,1,1,1),(1095,2,5,1,1,1,1),(1096,2,6,1,1,1,1),(1097,2,7,1,1,1,1),(1098,2,8,1,1,1,1),(1099,2,9,1,1,1,1),(1100,2,10,1,1,1,1),(1101,2,11,1,1,1,1),(1102,2,12,1,1,1,1),(1103,2,13,1,1,1,1),(1104,2,14,1,1,1,1),(1120,1,1,1,1,1,1),(1121,1,2,1,1,1,1),(1122,1,3,1,1,1,1),(1123,1,15,1,1,1,1),(1124,1,20,1,1,1,1),(1190,9,21,1,1,1,1),(1191,9,22,1,1,1,1),(1192,9,23,0,0,0,0),(1193,9,24,0,0,0,0),(1194,9,25,0,0,0,0),(1195,9,26,0,0,0,0),(1196,9,27,0,0,0,0),(1197,9,28,0,0,0,0),(1198,9,29,0,0,0,0),(1199,9,30,0,0,0,0),(1200,9,31,0,0,0,0),(1201,9,32,0,0,0,0),(1202,9,33,0,0,0,0),(1203,9,34,0,0,0,0),(1204,9,35,0,0,0,0),(1205,9,36,0,0,0,0),(1241,3,21,1,1,1,1),(1242,3,22,1,1,1,1),(1243,3,23,1,1,1,1),(1244,3,24,1,1,1,1),(1245,3,25,1,1,1,1),(1246,3,26,1,1,1,1),(1247,3,27,1,1,1,1),(1248,3,28,1,1,1,1),(1249,3,29,1,1,1,1),(1250,3,30,1,1,1,1),(1251,3,31,1,1,1,1),(1252,3,32,1,1,1,1),(1253,3,33,1,1,1,1),(1254,3,34,1,1,1,1),(1255,3,35,1,1,1,1),(1256,3,36,1,1,1,1),(1257,3,37,1,1,1,1),(1258,3,38,1,1,1,1),(1259,3,39,1,1,1,1);
/*!40000 ALTER TABLE `permissions_submodules` ENABLE KEYS */;
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
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) unsigned DEFAULT NULL,
  `rol` varchar(25) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_roles_app_id` (`app_id`),
  CONSTRAINT `fk_roles_app_id` FOREIGN KEY (`app_id`) REFERENCES `aurora_apps` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,1,'Administrador','Administrador',1,NULL,'2024-08-23 10:46:22'),(2,2,'Administrador','Administrador de Aurora Restaurant',1,NULL,'2024-08-30 04:45:51'),(3,3,'Administrador','Administrador de Aurora Contable',1,NULL,'2024-08-30 04:45:59'),(5,2,'Mesa 1','Mesa 1',1,'2024-08-18 02:29:35','2024-09-03 00:02:15'),(9,3,'Vendedor','Vendedor',1,'2024-08-30 01:41:41','2024-09-06 01:27:34');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submodules`
--

DROP TABLE IF EXISTS `submodules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submodules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) unsigned DEFAULT NULL,
  `module_id` bigint(20) unsigned NOT NULL,
  `submodule` varchar(25) NOT NULL,
  `path` varchar(25) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `submodules_module_id_foreign` (`module_id`),
  KEY `fk_submodules_app_id` (`app_id`),
  CONSTRAINT `fk_submodules_app_id` FOREIGN KEY (`app_id`) REFERENCES `aurora_apps` (`id`),
  CONSTRAINT `submodules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submodules`
--

LOCK TABLES `submodules` WRITE;
/*!40000 ALTER TABLE `submodules` DISABLE KEYS */;
INSERT INTO `submodules` VALUES (1,1,1,'Usuarios','/usuarios','Usuarios del sistema','<i class=\"fas fa-users\"></i>',1,NULL,NULL),(2,1,1,'Roles','/roles&permisos','Roles del sistema','<i class=\"fas fa-tags\"></i>',1,NULL,'2024-09-03 05:33:50'),(3,1,1,'Modulación','/modulacion','Modulación del sistema','<i class=\"fas fa-sitemap\"></i>',1,NULL,NULL),(4,2,2,'Ordenar','/crear','Crear orden','<i class=\"fas fa-concierge-bell\"></i>',1,NULL,NULL),(5,2,2,'Orden pendiente','/pendientes','Ordenes pendientes','<i class=\"fas fa-bell\"></i>',1,NULL,NULL),(6,2,2,'Orden pagada','/pagadas','Ordenes pagadas','<i class=\"fas fa-cash-register\"></i>',1,NULL,NULL),(7,2,4,'Categorías','/categorias','Gestión de categorías','<i class=\"fas fa-th-list\"></i>',1,NULL,NULL),(8,2,4,'Productos','/productos','Gestión de productos','<i class=\"fas fa-utensils\"></i>',1,NULL,NULL),(9,2,4,'Ingredientes','/ingredientes','Gestión de ingredientes','<i class=\"fas fa-carrot\"></i>',1,NULL,NULL),(10,2,5,'Movimientos','/movimientos','Gestión de inventarios para restaurant','<i class=\"fas fa-dolly\"></i></span>',1,NULL,NULL),(11,2,6,'General','/general','Reportes generales de restaurat','<i class=\"fas fa-clipboard\"></i>',1,NULL,NULL),(12,2,6,'Comercial','/comercial','Reportes comerciales de restaurant','<i class=\"fas fa-store-alt\"></i>',1,NULL,NULL),(13,2,6,'Ingredientes','/ingrediente-ventas','Reportes de ingredientes de restaurant','<i class=\"fas fa-leaf\"></i>',1,NULL,NULL),(14,2,6,'Stock','/ingrediente-stocks','Reportes de stock de restauran','<i class=\"fas fa-cubes\"></i>',1,NULL,NULL),(15,1,1,'Empresas','/empresas','Empresas del sistema','<i class=\"fas fa-building\"></i>',1,NULL,NULL),(20,1,1,'Aplicaciones','/apps','Gestión de aplicaciones del sistema general','<i class=\"fab fa-blackberry\"></i>',1,'2024-09-04 22:30:40','2024-09-04 22:31:55'),(21,3,15,'Vender','/vender','Submódulo para vender en aurora contable','<i class=\"fas fa-cash-register\"></i>',1,'2024-09-05 01:47:19','2024-09-05 01:47:19'),(22,3,15,'Comprar','/comprar','Submódulo para comprar productos para la venta','<i class=\"fas fa-shopping-cart\"></i>',1,'2024-09-05 01:50:41','2024-09-05 01:50:41'),(23,3,16,'Ingresos','/ingresos','Submódulo para gestionar ingresos en aurora contable','<i class=\"fas fa-plus-circle\"></i>',1,'2024-09-05 03:52:11','2024-09-05 03:52:11'),(24,3,16,'Egresos','/egresos','Submódulos para gestionar egresos en aurora contable','<i class=\"fas fa-minus-circle\"></i>',1,'2024-09-05 03:52:50','2024-09-05 03:52:50'),(25,3,17,'Abonos','/abonos','Submódulo para gestionar abonos','<i class=\"fas fa-hand-holding-usd\"></i>',1,'2024-09-05 04:01:31','2024-09-05 04:01:31'),(26,3,17,'Cuentas por cobrar','/cuentas-por-cobrar','Submódulos para gestionar cuentas por cobrar','<i class=\"fas fa-money-bill\"></i>',1,'2024-09-05 04:03:41','2024-09-05 04:04:43'),(27,3,17,'Cuentas por pagar','/cuentas-por-pagar','Submódulo para gestionar cuentas por pagar','<i class=\"fas fa-money-bill-wave\"></i>',1,'2024-09-05 04:04:32','2024-09-05 04:04:32'),(28,3,18,'Contable','/contable','Submódulo para reportes contables','<i class=\"fas fa-coins\"></i>',1,'2024-09-05 04:06:06','2024-09-05 04:06:06'),(29,3,18,'Stock','/stock','Submódulo para reportes de stock','<i class=\"fas fa-tasks\"></i>',1,'2024-09-05 04:06:55','2024-09-05 04:06:55'),(30,3,19,'Categorías','/categorias','Submódulo para gestionar categorías','<i class=\"fas fa-clipboard-list\"></i>',1,'2024-09-05 04:12:45','2024-09-05 04:12:45'),(31,3,19,'Líneas','/lineas','Submódulo para gestionar lineas','<i class=\"far fa-list-alt\"></i>',1,'2024-09-05 04:14:07','2024-09-05 04:14:07'),(32,3,19,'Marcas','/marcas','Submódulo para gestionar marcas','<i class=\"fas fa-registered\"></i>',1,'2024-09-05 04:14:59','2024-09-05 04:14:59'),(33,3,19,'Clientes','/clientes','Submódulo para gestionar clientes','<i class=\"fas fa-user-friends\"></i>',1,'2024-09-05 04:17:06','2024-09-05 04:17:06'),(34,3,19,'Proveedores','/proveedores','Submódulo para gestionar proveedores','<i class=\"fas fa-people-arrows\"></i>',1,'2024-09-05 04:17:57','2024-09-05 04:17:57'),(35,3,19,'Productos','/productos','Submódulo para gestionar productos','<i class=\"fas fa-box\"></i>',1,'2024-09-05 04:19:12','2024-09-11 02:17:41'),(36,3,20,'Facturación','/facturacion','Submódulo para configurar la facturación','<i class=\"fas fa-receipt\"></i>',1,'2024-09-05 04:25:40','2024-09-05 04:25:40'),(37,3,18,'Facturas','/facturas','Submódulo para ver las facturas de ventas y de compras','<i class=\"fas fa-file-invoice\"></i>',1,'2024-11-01 21:19:45','2024-11-01 21:19:45'),(38,3,17,'Movimientos','/movimientos','Submódulo de Movimientos es el encargado de registrar ingresos y egresos ajenos a las ventas y compras de productos o servicios','<i class=\"fas fa-wallet\"></i>',1,'2024-11-03 04:38:33','2024-11-04 22:16:55'),(39,3,20,'Sistema','/sistema','Submódulo que se encarga de gestionar las configuraciones del sistema','<i class=\"fab fa-ubuntu\"></i>',1,'2024-11-09 05:32:03','2024-11-09 05:32:03');
/*!40000 ALTER TABLE `submodules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_companies`
--

DROP TABLE IF EXISTS `user_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` bigint(20) unsigned NOT NULL,
  `company` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_companies_user_foreign` (`user`),
  KEY `user_companies_company_foreign` (`company`),
  CONSTRAINT `user_companies_company_foreign` FOREIGN KEY (`company`) REFERENCES `companies` (`id`),
  CONSTRAINT `user_companies_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_companies`
--

LOCK TABLES `user_companies` WRITE;
/*!40000 ALTER TABLE `user_companies` DISABLE KEYS */;
INSERT INTO `user_companies` VALUES (1,1,1,1),(2,1,2,0),(19,2,1,0),(20,2,2,1),(27,6,1,0),(28,6,2,0),(29,6,4,1),(30,7,1,0),(31,7,2,0),(32,7,4,1);
/*!40000 ALTER TABLE `user_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` bigint(20) unsigned NOT NULL,
  `rol` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_roles_user_foreign` (`user`),
  KEY `user_roles_rol_foreign` (`rol`),
  CONSTRAINT `user_roles_rol_foreign` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`),
  CONSTRAINT `user_roles_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(54,6,1,0),(55,6,2,0),(56,6,3,1),(57,6,5,0),(58,2,1,0),(59,2,2,1),(60,2,3,1),(61,2,5,0),(62,2,9,0),(63,7,1,0),(64,7,2,0),(65,7,3,0),(66,7,5,0),(67,7,9,1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Aurora','Computer System','Administrador','admin@auroracs.com',NULL,'$2y$10$JJdy23MojDPWWvGIloRCXuGsOHqmW.Ch0f9v5nnUhzg8kM/mO66j.',NULL,1,NULL,'2024-08-23 00:34:11'),(2,'Geovanny Fidel','Mendieta Veloz','Geovanny5468','geomendi@gmail.com',NULL,'$2y$10$p5QL8/lqGqnOraEspl0Hr.mk45UW3l87jCmxG.F7oMeqvZdJdlfN6',NULL,1,NULL,'2024-08-22 01:47:27'),(6,'Maria Jimena','Zambrano Vera','mvera0986','mvera0986@gmail.com',NULL,'$2y$10$mxbu.Gg9oHSUniubSWjqruZwpwWO/p9Vgu0KeHTJ6DF9JtErvyL9C',NULL,1,'2024-08-27 00:26:03','2024-09-05 01:45:23'),(7,'Mirian Maria','Zambrano Pacheco','mmaria8293','mmaria8293@gmail.com',NULL,'$2y$10$KEJKKoupYFxI2NbeJR1qyuVZb6E/6Fl/HVEHfcIfq.719f8Fn2i.y',NULL,1,'2024-09-06 01:29:57','2024-11-01 10:30:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-11 23:07:56
