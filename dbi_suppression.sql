-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: localhost    Database: dbi_suppression
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'Category 1','category-1','2022-07-11 20:52:36','2022-07-11 20:52:36'),(2,NULL,1,'Category 2','category-2','2022-07-11 20:52:36','2022-07-11 20:52:36');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(22,4,'id','number','ID',1,0,0,0,0,0,NULL,1),(23,4,'parent_id','select_dropdown','Parent',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(24,4,'order','text','Order',1,1,1,1,1,1,'{\"default\":1}',3),(25,4,'name','text','Name',1,1,1,1,1,1,NULL,4),(26,4,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(27,4,'created_at','timestamp','Created At',0,0,1,0,0,0,NULL,6),(28,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(29,5,'id','number','ID',1,0,0,0,0,0,NULL,1),(30,5,'author_id','text','Author',1,0,1,1,0,1,NULL,2),(31,5,'category_id','text','Category',1,0,1,1,1,0,NULL,3),(32,5,'title','text','Title',1,1,1,1,1,1,NULL,4),(33,5,'excerpt','text_area','Excerpt',1,0,1,1,1,1,NULL,5),(34,5,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,6),(35,5,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(36,5,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',8),(37,5,'meta_description','text_area','Meta Description',1,0,1,1,1,1,NULL,9),(38,5,'meta_keywords','text_area','Meta Keywords',1,0,1,1,1,1,NULL,10),(39,5,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(40,5,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,12),(41,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,13),(42,5,'seo_title','text','SEO Title',0,1,1,1,1,1,NULL,14),(43,5,'featured','checkbox','Featured',1,1,1,1,1,1,NULL,15),(44,6,'id','number','ID',1,0,0,0,0,0,NULL,1),(45,6,'author_id','text','Author',1,0,0,0,0,0,NULL,2),(46,6,'title','text','Title',1,1,1,1,1,1,NULL,3),(47,6,'excerpt','text_area','Excerpt',1,0,1,1,1,1,NULL,4),(48,6,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,5),(49,6,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),(50,6,'meta_description','text','Meta Description',1,0,1,1,1,1,NULL,7),(51,6,'meta_keywords','text','Meta Keywords',1,0,1,1,1,1,NULL,8),(52,6,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(53,6,'created_at','timestamp','Created At',1,1,1,0,0,0,NULL,10),(54,6,'updated_at','timestamp','Updated At',1,0,0,0,0,0,NULL,11),(55,6,'image','image','Page Image',0,1,1,1,1,1,NULL,12),(56,7,'id','text','Id',1,0,0,0,0,0,'{}',1),(57,7,'phone_number','text','Phone Number',1,1,1,1,1,1,'{}',2),(58,7,'title','text','Title',0,1,1,1,1,1,'{}',3),(59,7,'first_name','text','First Name',0,1,1,1,1,1,'{}',4),(60,7,'last_name','text','Last Name',0,1,1,1,1,1,'{}',5),(61,7,'middle_name','text','Middle Name',0,1,1,1,1,1,'{}',6),(62,7,'address1','text','Address1',0,1,1,1,1,1,'{}',7),(63,7,'address2','text','Address2',0,1,1,1,1,1,'{}',8),(64,7,'address3','text','Address3',0,1,1,1,1,1,'{}',9),(65,7,'city','text','City',0,1,1,1,1,1,'{}',10),(66,7,'state','text','State',0,1,1,1,1,1,'{}',11),(67,7,'province','text','Provice',0,1,1,1,1,1,'{}',12),(68,7,'postal_code','text','Postal Code',0,1,1,1,1,1,'{}',13),(69,7,'company','text','Company',0,0,1,1,1,1,'{}',14),(70,7,'email','text','Email',0,0,1,1,1,1,'{}',15),(71,7,'website','text','Website',0,0,1,1,1,1,'{}',16),(72,7,'position','text','Position',0,0,1,1,1,1,'{}',17),(73,7,'product_category','text','Product Category',0,0,1,1,1,1,'{}',18),(74,7,'file_name','text','File Name',0,0,1,1,1,1,'{}',19),(75,7,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',20),(76,7,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',21),(77,8,'id','text','Id',1,0,0,0,0,0,'{}',1),(78,8,'phone','text','Phone',1,1,1,1,1,1,'{}',2),(79,8,'group','text','Group',1,0,1,1,1,1,'{}',4),(80,8,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',5),(81,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(82,10,'id','text','Id',1,1,0,0,0,0,'{}',1),(83,10,'file_name','text','File Name',1,1,1,1,1,1,'{}',2),(84,10,'location','text','Location',0,1,1,1,1,1,'{}',3),(85,10,'count','text','Count',1,1,1,1,1,1,'{}',4),(86,10,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',5),(87,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(88,11,'id','text','Id',1,0,0,0,0,0,'{}',1),(89,11,'campaign','text','Campaign',0,1,1,1,1,1,'{}',2),(90,11,'question','text','Question',0,1,1,1,1,1,'{}',3),(91,11,'group','text','Group',0,1,1,1,1,1,'{}',4),(92,11,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',6),(93,11,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(94,8,'suppression_belongsto_suppression_group_relationship','relationship','Group File',0,1,1,1,1,1,'{\"browse_filter\":true,\"model\":\"App\\\\Models\\\\SuppressionGroup\",\"table\":\"suppression_groups\",\"type\":\"belongsTo\",\"column\":\"group\",\"key\":\"id\",\"label\":\"file_name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',3),(95,11,'question_suppression_belongsto_suppression_group_relationship','relationship','Group File',0,1,1,1,1,1,'{\"browse_filter\":true,\"model\":\"App\\\\Models\\\\SuppressionGroup\",\"table\":\"suppression_groups\",\"type\":\"belongsTo\",\"column\":\"group\",\"key\":\"id\",\"label\":\"file_name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}',5);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2022-07-11 20:52:36','2022-07-11 20:52:36'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2022-07-11 20:52:36','2022-07-11 20:52:36'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2022-07-11 20:52:36','2022-07-11 20:52:36'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,NULL,'2022-07-11 20:52:36','2022-07-11 20:52:36'),(5,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy','','',1,0,NULL,'2022-07-11 20:52:36','2022-07-11 20:52:36'),(6,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,NULL,'2022-07-11 20:52:36','2022-07-11 20:52:36'),(7,'dialers','dialers','Dialer','Dialers','voyager-telephone','App\\Models\\Dialer',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2022-07-11 21:00:45','2022-07-13 02:56:15'),(8,'suppressions','suppressions','Suppression','Suppressions','voyager-window-list','App\\Models\\Suppression',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2022-07-13 08:45:20','2022-07-16 03:46:15'),(10,'suppression_groups','suppression-groups','Suppression Group','Suppression Groups','voyager-rocket','App\\Models\\SuppressionGroup',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2022-07-13 08:45:59','2022-07-13 09:20:46'),(11,'question_suppressions','question-suppressions','Question Suppression','Question Suppressions','voyager-paperclip','App\\Models\\QuestionSuppression',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null,\"extra_details\":{}}','2022-07-16 03:27:16','2022-07-16 03:49:39');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dialers`
--

DROP TABLE IF EXISTS `dialers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dialers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dialers`
--

LOCK TABLES `dialers` WRITE;
/*!40000 ALTER TABLE `dialers` DISABLE KEYS */;
INSERT INTO `dialers` VALUES (1,'11065','Mrs','A','Test ,','A','~','Test ,','Test','Derby',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(2,'11066','Mr','B','Test,','B','`','Test,','Test','Swadlincote',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(3,'11067','Mr','C','Test ,','C','!','Test ,','Test','Ashbourne',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(4,'11068','Mrs','D','Test,','D','@','Test,','Test','Derby',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(5,'11069','Mr','E','Test,','E','#','Test,','Test','Belper',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(6,'11070','Mr','F','Test,','F','$','Test,','Test','Derby',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(7,'11071','Mr','G','Test,','G','%','Test,','Test','Swadlincote',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(8,'11072','Mr','H','Test,','H','^','Test,','Test','Ashbourne',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(9,'11073','Mr','I','Test,','I','&','Test,','Test','Belper',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(10,'11074','Mr','J','Test,','J','*','Test,','Test','Swadlincote',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(11,'11075','Mr','K','Test,','K','(','Test,','Test','Derby',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(12,'11076','Mr','L','Test ,','L',')','Test ,','Test','Ashbourne',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(13,'11077','Mr','M','Test,','M','_','Test,','Test','Ashbourne',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(14,'11078','Mr','N','Test,','N','-','Test,','Test','Derby',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(15,'11079','Mr','O','Test,','O','+','Test,','Test','Swadlincote',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(16,'11080','Mr','P','Test,','P','=','Test,','Test','Belper',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(17,'11081','Mr','Q','Test,','Q','{','Test,','Test','Derby',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(18,'11082','Mr','R','Test,','R','}','Test,','Test','Belper',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(19,'11083','Mr','S','Test,','S','[','Test,','Test','Ashbourne',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(20,'11084','Mr','T','Test ,','T',']','Test ,','Test','Swadlincote',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(21,'11085','Mr','U','Test,','U','|','Test,','Test','Ashbourne',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(22,'11086','Mr','V','Test,','V','\\','Test,','Test','Derby',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(23,'11087','Mr','W','Test,','W','/','Test,','Test','Ashbourne',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(24,'11088','Mr','X','Test,','X','?','Test,','Test','Swadlincote',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(25,'11089','Mr','Y','Test,','Y',':','Test,','Test','Belper',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(26,'11090','Mr','Z','Test,','Z',';','Test,','Test','Ashbourne',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(27,'11091','Mr','AB','Test ,','AB','\"','Test ,','Test','Derby',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(28,'11092','Mr','CD','Test,','CD',' \'','Test,','Test','Belper',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(29,'11093','Mr','EF','Test,','EF','<','Test,','Test','Swadlincote',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(30,'11094','Mr','GH','Test,','GH','>','Test,','Test','Ashbourne',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(31,'11095','Mr','IJ','Test,','IJ',',','Test,','Test','Derby',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02'),(32,'11096','Mr','IJ','Test,','IJ','.','Test,','Test','Derby',NULL,'Derbyshire','Test',NULL,NULL,NULL,NULL,'none',NULL,'2022-07-11 22:01:02','2022-07-11 22:01:02');
/*!40000 ALTER TABLE `dialers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2022-07-11 20:52:36','2022-07-11 20:52:36','voyager.dashboard',NULL),(2,1,1,'Media','','_self','voyager-images',NULL,14,4,'2022-07-11 20:52:36','2022-07-11 20:53:55','voyager.media.index',NULL),(3,1,1,'Users','','_self','voyager-person',NULL,NULL,5,'2022-07-11 20:52:36','2022-07-13 08:46:48','voyager.users.index',NULL),(4,1,1,'Roles','','_self','voyager-lock',NULL,NULL,4,'2022-07-11 20:52:36','2022-07-13 08:46:48','voyager.roles.index',NULL),(5,1,1,'Tools','','_self','voyager-tools',NULL,NULL,6,'2022-07-11 20:52:36','2022-07-13 09:47:29',NULL,NULL),(6,1,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2022-07-11 20:52:36','2022-07-11 20:53:40','voyager.menus.index',NULL),(7,1,1,'Database','','_self','voyager-data',NULL,5,2,'2022-07-11 20:52:36','2022-07-13 08:56:30','voyager.database.index',NULL),(8,1,1,'Compass','','_self','voyager-compass',NULL,5,3,'2022-07-11 20:52:36','2022-07-13 08:56:30','voyager.compass.index',NULL),(9,1,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2022-07-11 20:52:36','2022-07-13 08:56:30','voyager.bread.index',NULL),(10,1,1,'Settings','','_self','voyager-settings',NULL,NULL,7,'2022-07-11 20:52:36','2022-07-13 09:47:29','voyager.settings.index',NULL),(11,1,1,'Categories','','_self','voyager-categories',NULL,14,1,'2022-07-11 20:52:36','2022-07-11 20:53:55','voyager.categories.index',NULL),(12,1,1,'Posts','','_self','voyager-news',NULL,14,3,'2022-07-11 20:52:36','2022-07-11 20:53:55','voyager.posts.index',NULL),(13,1,1,'Pages','','_self','voyager-file-text',NULL,14,2,'2022-07-11 20:52:36','2022-07-11 20:53:55','voyager.pages.index',NULL),(14,1,1,'Other','#','_self','voyager-documentation','#000000',NULL,8,'2022-07-11 20:53:36','2022-07-16 03:27:27',NULL,''),(15,1,1,'Customer Information','','_self','voyager-telephone','#000000',17,1,'2022-07-11 21:00:45','2022-07-11 21:11:39','voyager.dialers.index','null'),(16,1,1,'Import','/admin/dialer/import','_self','voyager-download','#000000',17,2,'2022-07-11 21:10:32','2022-07-11 21:12:08',NULL,''),(17,1,1,'Dialer','#','_self','voyager-telephone','#000000',NULL,2,'2022-07-11 21:10:58','2022-07-11 21:11:10',NULL,''),(18,1,1,'Suppressions','','_self','voyager-window-list',NULL,20,3,'2022-07-13 08:45:20','2022-07-13 09:47:29','voyager.suppressions.index',NULL),(19,1,1,'Suppression Groups','','_self','voyager-rocket',NULL,20,4,'2022-07-13 08:45:59','2022-07-13 09:47:29','voyager.suppression-groups.index',NULL),(20,1,1,'Suppression','#','_self','voyager-rocket','#000000',NULL,3,'2022-07-13 08:46:35','2022-07-13 08:46:56',NULL,''),(21,1,1,'Upload','','_self','voyager-upload','#000000',20,2,'2022-07-13 08:56:21','2022-07-13 09:47:29','voyager.suppression.upload',NULL),(23,1,1,'Assign','','_self','voyager-documentation','#000000',20,1,'2022-07-13 09:47:23','2022-07-13 09:47:29','voyager.suppression.assign.index',NULL),(24,1,1,'Question Suppressions','','_self','voyager-paperclip',NULL,20,5,'2022-07-16 03:27:16','2022-07-16 03:27:27','voyager.question-suppressions.index',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2022-07-11 20:52:36','2022-07-11 20:52:36');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(23,'2019_08_19_000000_create_failed_jobs_table',1),(24,'2019_12_14_000001_create_personal_access_tokens_table',1),(25,'2016_01_01_000000_create_pages_table',2),(26,'2016_01_01_000000_create_posts_table',2),(27,'2016_02_15_204651_create_categories_table',2),(28,'2017_04_11_000000_alter_post_nullable_fields_table',2),(29,'2022_07_12_045649_create_dialers_table',3),(30,'2022_07_13_164241_create_suppressions_table',4),(31,'2022_07_13_164345_create_suppression_groups_table',4),(32,'2022_07_15_172813_create_question_suppressions_table',5),(33,'2020_04_27_000000_add_status_to_menu_items_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,'Hello World','Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.','<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','pages/page1.jpg','hello-world','Yar Meta Description','Keyword1, Keyword2','ACTIVE','2022-07-11 20:52:36','2022-07-11 20:52:36');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2022-07-11 20:52:36','2022-07-11 20:52:36'),(2,'browse_bread',NULL,'2022-07-11 20:52:36','2022-07-11 20:52:36'),(3,'browse_database',NULL,'2022-07-11 20:52:36','2022-07-11 20:52:36'),(4,'browse_media',NULL,'2022-07-11 20:52:36','2022-07-11 20:52:36'),(5,'browse_compass',NULL,'2022-07-11 20:52:36','2022-07-11 20:52:36'),(6,'browse_menus','menus','2022-07-11 20:52:36','2022-07-11 20:52:36'),(7,'read_menus','menus','2022-07-11 20:52:36','2022-07-11 20:52:36'),(8,'edit_menus','menus','2022-07-11 20:52:36','2022-07-11 20:52:36'),(9,'add_menus','menus','2022-07-11 20:52:36','2022-07-11 20:52:36'),(10,'delete_menus','menus','2022-07-11 20:52:36','2022-07-11 20:52:36'),(11,'browse_roles','roles','2022-07-11 20:52:36','2022-07-11 20:52:36'),(12,'read_roles','roles','2022-07-11 20:52:36','2022-07-11 20:52:36'),(13,'edit_roles','roles','2022-07-11 20:52:36','2022-07-11 20:52:36'),(14,'add_roles','roles','2022-07-11 20:52:36','2022-07-11 20:52:36'),(15,'delete_roles','roles','2022-07-11 20:52:36','2022-07-11 20:52:36'),(16,'browse_users','users','2022-07-11 20:52:36','2022-07-11 20:52:36'),(17,'read_users','users','2022-07-11 20:52:36','2022-07-11 20:52:36'),(18,'edit_users','users','2022-07-11 20:52:36','2022-07-11 20:52:36'),(19,'add_users','users','2022-07-11 20:52:36','2022-07-11 20:52:36'),(20,'delete_users','users','2022-07-11 20:52:36','2022-07-11 20:52:36'),(21,'browse_settings','settings','2022-07-11 20:52:36','2022-07-11 20:52:36'),(22,'read_settings','settings','2022-07-11 20:52:36','2022-07-11 20:52:36'),(23,'edit_settings','settings','2022-07-11 20:52:36','2022-07-11 20:52:36'),(24,'add_settings','settings','2022-07-11 20:52:36','2022-07-11 20:52:36'),(25,'delete_settings','settings','2022-07-11 20:52:36','2022-07-11 20:52:36'),(26,'browse_categories','categories','2022-07-11 20:52:36','2022-07-11 20:52:36'),(27,'read_categories','categories','2022-07-11 20:52:36','2022-07-11 20:52:36'),(28,'edit_categories','categories','2022-07-11 20:52:36','2022-07-11 20:52:36'),(29,'add_categories','categories','2022-07-11 20:52:36','2022-07-11 20:52:36'),(30,'delete_categories','categories','2022-07-11 20:52:36','2022-07-11 20:52:36'),(31,'browse_posts','posts','2022-07-11 20:52:36','2022-07-11 20:52:36'),(32,'read_posts','posts','2022-07-11 20:52:36','2022-07-11 20:52:36'),(33,'edit_posts','posts','2022-07-11 20:52:36','2022-07-11 20:52:36'),(34,'add_posts','posts','2022-07-11 20:52:36','2022-07-11 20:52:36'),(35,'delete_posts','posts','2022-07-11 20:52:36','2022-07-11 20:52:36'),(36,'browse_pages','pages','2022-07-11 20:52:36','2022-07-11 20:52:36'),(37,'read_pages','pages','2022-07-11 20:52:36','2022-07-11 20:52:36'),(38,'edit_pages','pages','2022-07-11 20:52:36','2022-07-11 20:52:36'),(39,'add_pages','pages','2022-07-11 20:52:36','2022-07-11 20:52:36'),(40,'delete_pages','pages','2022-07-11 20:52:36','2022-07-11 20:52:36'),(41,'browse_dialers','dialers','2022-07-11 21:00:45','2022-07-11 21:00:45'),(42,'read_dialers','dialers','2022-07-11 21:00:45','2022-07-11 21:00:45'),(43,'edit_dialers','dialers','2022-07-11 21:00:45','2022-07-11 21:00:45'),(44,'add_dialers','dialers','2022-07-11 21:00:45','2022-07-11 21:00:45'),(45,'delete_dialers','dialers','2022-07-11 21:00:45','2022-07-11 21:00:45'),(46,'browse_suppressions','suppressions','2022-07-13 08:45:20','2022-07-13 08:45:20'),(47,'read_suppressions','suppressions','2022-07-13 08:45:20','2022-07-13 08:45:20'),(48,'edit_suppressions','suppressions','2022-07-13 08:45:20','2022-07-13 08:45:20'),(49,'add_suppressions','suppressions','2022-07-13 08:45:20','2022-07-13 08:45:20'),(50,'delete_suppressions','suppressions','2022-07-13 08:45:20','2022-07-13 08:45:20'),(51,'browse_suppression_groups','suppression_groups','2022-07-13 08:45:59','2022-07-13 08:45:59'),(52,'read_suppression_groups','suppression_groups','2022-07-13 08:45:59','2022-07-13 08:45:59'),(53,'edit_suppression_groups','suppression_groups','2022-07-13 08:45:59','2022-07-13 08:45:59'),(54,'add_suppression_groups','suppression_groups','2022-07-13 08:45:59','2022-07-13 08:45:59'),(55,'delete_suppression_groups','suppression_groups','2022-07-13 08:45:59','2022-07-13 08:45:59'),(56,'browse_question_suppressions','question_suppressions','2022-07-16 03:27:16','2022-07-16 03:27:16'),(57,'read_question_suppressions','question_suppressions','2022-07-16 03:27:16','2022-07-16 03:27:16'),(58,'edit_question_suppressions','question_suppressions','2022-07-16 03:27:16','2022-07-16 03:27:16'),(59,'add_question_suppressions','question_suppressions','2022-07-16 03:27:16','2022-07-16 03:27:16'),(60,'delete_question_suppressions','question_suppressions','2022-07-16 03:27:16','2022-07-16 03:27:16');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,0,NULL,'Lorem Ipsum Post',NULL,'This is the excerpt for the Lorem Ipsum Post','<p>This is the body of the lorem ipsum post</p>','posts/post1.jpg','lorem-ipsum-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2022-07-11 20:52:36','2022-07-11 20:52:36'),(2,0,NULL,'My Sample Post',NULL,'This is the excerpt for the sample Post','<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>','posts/post2.jpg','my-sample-post','Meta Description for sample post','keyword1, keyword2, keyword3','PUBLISHED',0,'2022-07-11 20:52:36','2022-07-11 20:52:36'),(3,0,NULL,'Latest Post',NULL,'This is the excerpt for the latest post','<p>This is the body for the latest post</p>','posts/post3.jpg','latest-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2022-07-11 20:52:36','2022-07-11 20:52:36'),(4,0,NULL,'Yarr Post',NULL,'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.','<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>','posts/post4.jpg','yarr-post','this be a meta descript','keyword1, keyword2, keyword3','PUBLISHED',0,'2022-07-11 20:52:36','2022-07-11 20:52:36');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_suppressions`
--

DROP TABLE IF EXISTS `question_suppressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_suppressions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `campaign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question` int DEFAULT NULL,
  `group` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_suppressions`
--

LOCK TABLES `question_suppressions` WRITE;
/*!40000 ALTER TABLE `question_suppressions` DISABLE KEYS */;
INSERT INTO `question_suppressions` VALUES (11,'backup_14June2022_24kbullion',26,1,'2022-07-27 22:31:41','2022-07-27 22:31:41'),(12,'backup_14June2022_24kbullion',26,2,'2022-07-27 22:31:41','2022-07-27 22:31:41');
/*!40000 ALTER TABLE `question_suppressions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2022-07-11 20:52:36','2022-07-11 20:52:36'),(2,'user','Normal User','2022-07-11 20:52:36','2022-07-11 20:52:36');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','DBI Suppression','','text',1,'Site'),(2,'site.description','Site Description',NULL,'','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','DBI Suppression','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppression_groups`
--

DROP TABLE IF EXISTS `suppression_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppression_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppression_groups`
--

LOCK TABLES `suppression_groups` WRITE;
/*!40000 ALTER TABLE `suppression_groups` DISABLE KEYS */;
INSERT INTO `suppression_groups` VALUES (1,'sample-phone.csv',NULL,21,'2022-07-13 09:34:43','2022-07-13 09:34:43'),(2,'sample-phone.csv',NULL,21,'2022-07-15 08:57:48','2022-07-15 08:57:48');
/*!40000 ALTER TABLE `suppression_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppressions`
--

DROP TABLE IF EXISTS `suppressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppressions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppressions`
--

LOCK TABLES `suppressions` WRITE;
/*!40000 ALTER TABLE `suppressions` DISABLE KEYS */;
INSERT INTO `suppressions` VALUES (1,'123','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(2,'124','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(3,'125','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(4,'126','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(5,'127','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(6,'128','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(7,'129','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(8,'130','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(9,'131','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(10,'132','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(11,'133','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(12,'134','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(13,'135','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(14,'136','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(15,'137','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(16,'138','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(17,'139','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(18,'140','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(19,'141','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(20,'142','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(21,'143','1','2022-07-13 09:34:43','2022-07-13 09:34:43'),(22,'123','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(23,'124','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(24,'125','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(25,'126','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(26,'127','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(27,'128','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(28,'129','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(29,'130','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(30,'131','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(31,'132','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(32,'133','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(33,'134','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(34,'135','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(35,'136','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(36,'137','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(37,'138','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(38,'139','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(39,'140','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(40,'141','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(41,'142','2','2022-07-15 08:57:48','2022-07-15 08:57:48'),(42,'143','2','2022-07-15 08:57:48','2022-07-15 08:57:48');
/*!40000 ALTER TABLE `suppressions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',5,'pt','Post','2022-07-11 20:52:36','2022-07-11 20:52:36'),(2,'data_types','display_name_singular',6,'pt','Página','2022-07-11 20:52:36','2022-07-11 20:52:36'),(3,'data_types','display_name_singular',1,'pt','Utilizador','2022-07-11 20:52:36','2022-07-11 20:52:36'),(4,'data_types','display_name_singular',4,'pt','Categoria','2022-07-11 20:52:36','2022-07-11 20:52:36'),(5,'data_types','display_name_singular',2,'pt','Menu','2022-07-11 20:52:36','2022-07-11 20:52:36'),(6,'data_types','display_name_singular',3,'pt','Função','2022-07-11 20:52:36','2022-07-11 20:52:36'),(7,'data_types','display_name_plural',5,'pt','Posts','2022-07-11 20:52:36','2022-07-11 20:52:36'),(8,'data_types','display_name_plural',6,'pt','Páginas','2022-07-11 20:52:36','2022-07-11 20:52:36'),(9,'data_types','display_name_plural',1,'pt','Utilizadores','2022-07-11 20:52:36','2022-07-11 20:52:36'),(10,'data_types','display_name_plural',4,'pt','Categorias','2022-07-11 20:52:36','2022-07-11 20:52:36'),(11,'data_types','display_name_plural',2,'pt','Menus','2022-07-11 20:52:36','2022-07-11 20:52:36'),(12,'data_types','display_name_plural',3,'pt','Funções','2022-07-11 20:52:36','2022-07-11 20:52:36'),(13,'categories','slug',1,'pt','categoria-1','2022-07-11 20:52:36','2022-07-11 20:52:36'),(14,'categories','name',1,'pt','Categoria 1','2022-07-11 20:52:36','2022-07-11 20:52:36'),(15,'categories','slug',2,'pt','categoria-2','2022-07-11 20:52:36','2022-07-11 20:52:36'),(16,'categories','name',2,'pt','Categoria 2','2022-07-11 20:52:36','2022-07-11 20:52:36'),(17,'pages','title',1,'pt','Olá Mundo','2022-07-11 20:52:36','2022-07-11 20:52:36'),(18,'pages','slug',1,'pt','ola-mundo','2022-07-11 20:52:36','2022-07-11 20:52:36'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2022-07-11 20:52:36','2022-07-11 20:52:36'),(20,'menu_items','title',1,'pt','Painel de Controle','2022-07-11 20:52:36','2022-07-11 20:52:36'),(21,'menu_items','title',2,'pt','Media','2022-07-11 20:52:36','2022-07-11 20:52:36'),(22,'menu_items','title',12,'pt','Publicações','2022-07-11 20:52:36','2022-07-11 20:52:36'),(23,'menu_items','title',3,'pt','Utilizadores','2022-07-11 20:52:36','2022-07-11 20:52:36'),(24,'menu_items','title',11,'pt','Categorias','2022-07-11 20:52:36','2022-07-11 20:52:36'),(25,'menu_items','title',13,'pt','Páginas','2022-07-11 20:52:36','2022-07-11 20:52:36'),(26,'menu_items','title',4,'pt','Funções','2022-07-11 20:52:36','2022-07-11 20:52:36'),(27,'menu_items','title',5,'pt','Ferramentas','2022-07-11 20:52:36','2022-07-11 20:52:36'),(28,'menu_items','title',6,'pt','Menus','2022-07-11 20:52:36','2022-07-11 20:52:36'),(29,'menu_items','title',7,'pt','Base de dados','2022-07-11 20:52:36','2022-07-11 20:52:36'),(30,'menu_items','title',10,'pt','Configurações','2022-07-11 20:52:36','2022-07-11 20:52:36');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin','admin@admin.com','users/July2022/QY43faICivdTcKs5ONYO.png',NULL,'$2y$10$2oHGLUSjvWmqSAeTdyH3fu1KMXAUi4n77WqnYUrIm1Ba3SoMKescy','BtugIDkuD0xzxTNGuYFxCynnFF6oqFQrCLrAjTyz6dLJCZY3o9ZeLD441Uoo','{\"locale\":\"en\"}','2022-07-11 20:52:36','2022-07-11 22:30:44');
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

-- Dump completed on 2022-07-28 15:44:42
