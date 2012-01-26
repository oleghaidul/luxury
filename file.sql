-- MySQL dump 10.13  Distrib 5.1.54, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: luxury_development
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `active_admin_comments`
--

DROP TABLE IF EXISTS `active_admin_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_admin_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_admin_notes_on_resource_type_and_resource_id` (`resource_type`,`resource_id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`),
  KEY `index_active_admin_comments_on_author_type_and_author_id` (`author_type`,`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_admin_comments`
--

LOCK TABLES `active_admin_comments` WRITE;
/*!40000 ALTER TABLE `active_admin_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_admin_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_users_on_email` (`email`),
  UNIQUE KEY `index_admin_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin@example.com','$2a$10$A5ZbnSe3lRUVyPeoN3wZFea3TuUgWDtFdk/wDsw4dnpiM/URCiT4u',NULL,NULL,NULL,2,'2012-01-23 15:07:30','2012-01-23 14:26:14','127.0.0.1','127.0.0.1','2012-01-17 13:35:33','2012-01-23 15:07:30','editor'),(2,'admin@admin.ru','$2a$10$HJHy45duyHiYTaC2KjNNrOt.gad6DPhxdX1r9QCHSBrCh6j5LBobe',NULL,NULL,NULL,10,'2012-01-25 06:55:12','2012-01-23 15:29:23','127.0.0.1','127.0.0.1','2012-01-17 14:11:31','2012-01-25 06:55:12','admin');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boutiques`
--

DROP TABLE IF EXISTS `boutiques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boutiques` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_bout` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `admin_user_id` int(11) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `director` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `promo` text COLLATE utf8_unicode_ci,
  `ico_file` blob,
  `ico_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ico_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ico_file_size` int(11) DEFAULT NULL,
  `ico_updated_at` datetime DEFAULT NULL,
  `subdomain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boutiques`
--

LOCK TABLES `boutiques` WRITE;
/*!40000 ALTER TABLE `boutiques` DISABLE KEYS */;
INSERT INTO `boutiques` VALUES (3,'Renommee','renommee','2012-01-17 15:10:55','2012-01-25 06:56:39',2,'+375291234567','+375291234567','','1Of. 306, 31 Mostovaya St., Minsk','renommee.png','image/png',4238,'2012-01-17 15:10:55','<ul>\r\n<li style=\"text-align: center;\"><strong>sdfgsghdh</strong></li>\r\n</ul>','<p><em>Посетите фирменный магазин Reommee в Минске!</em></p>',NULL,'zegna_logo.png','image/png',12440,'2012-01-25 06:56:39',NULL),(4,'Pal Zileri','pal_zileri','2012-01-17 15:12:09','2012-01-25 06:57:05',2,'+375277777777','+375277777777','','1Of. 306, 31 Mostovaya St., Minsk','zileri.png','image/png',5411,'2012-01-17 15:12:09','','',NULL,'zegna_logo.png','image/png',12440,'2012-01-25 06:57:05',NULL),(5,'Gibraud','gibraud','2012-01-17 15:12:59','2012-01-25 06:57:20',2,'+375295689754','+375295689754','','Of. 711-17, Freedom Sq., Minsk','gibraud.png','image/png',4310,'2012-01-17 15:12:58','','',NULL,'zegna_logo.png','image/png',12440,'2012-01-25 06:57:20',NULL),(6,'Ermenegildo Zegna','ermenegildo_zegna','2012-01-17 15:13:50','2012-01-25 06:57:32',2,'+375295689754','+375295689754','','24 Shishkin St., Minsk','zegna.png','image/png',7925,'2012-01-17 15:13:50','','',NULL,'zegna_logo.png','image/png',12440,'2012-01-25 06:57:32',NULL),(7,'Pret a porter','pret_a_porter','2012-01-17 15:14:31','2012-01-25 06:57:43',2,'+375689965865','+375689965865','','1Of. 306, 31 Mostovaya St., Minsk','pret-a-porte.png','image/png',4455,'2012-01-17 15:14:31','','',NULL,'zegna_logo.png','image/png',12440,'2012-01-25 06:57:43',NULL),(8,'Dolcevita','dolcevita','2012-01-17 15:15:03','2012-01-25 06:57:52',2,'+375295689754','+375295689754','','5-1 Mozhaysky St., Minsk','dolcevita.png','image/png',4227,'2012-01-23 10:22:18','','',NULL,'zegna_logo.png','image/png',12440,'2012-01-25 06:57:52',NULL);
/*!40000 ALTER TABLE `boutiques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `boutique_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `admin_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'First brand',3,'2012-01-17 09:27:48','2012-01-17 15:30:36',NULL),(2,'Albione',3,'2012-01-17 13:01:16','2012-01-23 11:29:46',NULL),(3,'Albione',5,'2012-01-23 20:16:36','2012-01-23 20:16:36',NULL),(4,'',3,'2012-01-23 20:28:00','2012-01-23 20:28:00',NULL);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `admin_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Костюмы','2012-01-17 09:29:09','2012-01-17 15:16:26',NULL),(2,'Рубашки','2012-01-17 11:06:32','2012-01-17 15:16:18',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `season` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `boutique_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES (4,'First collection',2012,'winter',3,'2012-01-23 20:44:54','2012-01-24 19:47:14',3),(5,'Second',2012,'spring',2,'2012-01-23 20:45:10','2012-01-24 19:47:10',3),(6,'1',2012,'summer',1,'2012-01-23 20:45:21','2012-01-24 19:41:54',3);
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `structure` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `admin_user_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (10,'Мужской костюм Albione 257DA',6,'2012-01-17 15:25:44','2012-01-23 20:47:23','100% шерсть','<p>Пиджак две пуговицы, приталенный силуэт. Брюки без защипов. Сделано в Италии</p>',2,300,NULL,'male',NULL,2,NULL),(11,'Мужской костюм Albione 271DA ',6,'2012-01-17 16:09:10','2012-01-23 20:47:12','80% шерсть 150\'s, 20% шёлк.','<p>Пиджак две пуговицы, приталенный силуэт. Брюки без защипов. Сделано в Италии.</p>',2,3444,NULL,'male',NULL,1,NULL),(14,'Мужской костюм Albione 256DA',5,'2012-01-18 09:19:33','2012-01-23 20:46:57','78% Шерсть 150\'s, 22% Шелк. Графит.','<p><span style=\"color: #ffffff;\">Пиджак две пуговицы, приталенный силуэт.<br />Брюки без защипов. Сделано в Италии.</span></p>',2,1200,NULL,'male',NULL,2,NULL),(15,'Мужской костюм Albione 258DA ',5,'2012-01-18 09:21:21','2012-01-23 20:46:43','100% шерсть. 130\'s.','<p><span style=\"color: #ffffff;\">Пиджак две пуговицы, приталенный силуэт.<br />Брюки без защипов. Сделано в Италии. <br /></span></p>',2,3000,NULL,'male',NULL,2,NULL),(16,'Мужской костюм Albione 259DA ',4,'2012-01-18 09:23:10','2012-01-23 20:46:32','100% шерсть. 130\'s','<p><span style=\"color: #ffffff;\">Синий, голубая клетка.<br />Пиджак две пуговицы, приталенный силуэт.<br />Брюки без защипов. Сделано в Италии. <br /></span></p>',2,4000,NULL,'male',NULL,1,NULL),(17,'КУРТКА 40 JM',4,'2012-01-23 20:16:05','2012-01-23 20:46:21','90% пух, 10% перо. Подкладка: 100% полиэстер. Ткань: 100% синтетическое волокно.','<p>Состав: 90% пух, 10% перо.</p>\r\n<p>Подкладка: 100% полиэстер.</p>\r\n<p>Ткань: 100% синтетическое волокно.</p>\r\n<p>Цвет синий, черный.</p>',1,34000,10,'male',NULL,2,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (7,'1',10,'04-0_enl.jpg','image/jpeg',211150,'2012-01-23 17:59:46','2012-01-17 15:25:44','2012-01-23 17:59:53'),(8,'2',10,'04-1_enl.jpg','image/jpeg',282776,'2012-01-23 17:59:47','2012-01-17 15:25:44','2012-01-23 17:59:53'),(9,'3',10,'04-2_enl.jpg','image/jpeg',542266,'2012-01-23 17:59:48','2012-01-17 15:25:44','2012-01-23 17:59:53'),(10,'4',10,'04-3_enl.jpg','image/jpeg',259271,'2012-01-23 17:59:48','2012-01-17 15:25:44','2012-01-23 17:59:53'),(11,'5',10,'04-4_enl.jpg','image/jpeg',300509,'2012-01-23 17:59:49','2012-01-17 15:25:44','2012-01-23 17:59:53'),(12,'6',10,'04-5_enl.jpg','image/jpeg',263424,'2012-01-23 17:59:50','2012-01-17 15:25:44','2012-01-23 17:59:53'),(13,'7',10,'04-6_enl.jpg','image/jpeg',167338,'2012-01-23 17:59:50','2012-01-17 15:25:44','2012-01-23 17:59:53'),(14,'8',10,'04-7_enl.jpg','image/jpeg',331757,'2012-01-23 17:59:51','2012-01-17 15:25:44','2012-01-23 17:59:53'),(15,'9',10,'04-8_enl.jpg','image/jpeg',255385,'2012-01-23 17:59:51','2012-01-17 15:25:44','2012-01-23 17:59:53'),(16,'10',10,'04-9_enl.jpg','image/jpeg',167339,'2012-01-23 17:59:52','2012-01-17 15:25:44','2012-01-23 17:59:53'),(17,'1',11,'IMG_3412-Edit_enl.jpg','image/jpeg',240969,'2012-01-23 17:59:00','2012-01-17 16:09:10','2012-01-23 17:59:04'),(18,'2',11,'IMG_3413-Edit-2_enl.jpg','image/jpeg',134533,'2012-01-23 17:59:01','2012-01-17 16:09:10','2012-01-23 17:59:04'),(19,'3',11,'IMG_3417-Edit_enl.jpg','image/jpeg',226943,'2012-01-23 17:59:02','2012-01-17 16:09:10','2012-01-23 17:59:04'),(20,'4',11,'IMG_3418-Edit_enl.jpg','image/jpeg',335509,'2012-01-23 17:59:02','2012-01-17 16:09:10','2012-01-23 17:59:04'),(21,'5',11,'IMG_3419-Edit-3_enl.jpg','image/jpeg',486335,'2012-01-23 17:59:03','2012-01-17 16:09:10','2012-01-23 17:59:04'),(22,'6',11,'IMG_3419-Edit_enl.jpg','image/jpeg',361070,'2012-01-23 17:59:03','2012-01-17 16:09:10','2012-01-23 17:59:04'),(23,'',13,NULL,NULL,NULL,NULL,'2012-01-18 07:53:48','2012-01-18 07:53:48'),(24,'',14,'1.jpg','image/jpeg',327198,'2012-01-23 17:58:20','2012-01-18 09:19:33','2012-01-23 17:58:25'),(25,'',14,'2.jpg','image/jpeg',307930,'2012-01-23 17:58:21','2012-01-18 09:19:33','2012-01-23 17:58:25'),(26,'',14,'3.jpg','image/jpeg',350757,'2012-01-23 17:58:22','2012-01-18 09:19:33','2012-01-23 17:58:25'),(27,'',14,'4.jpg','image/jpeg',388922,'2012-01-23 17:58:22','2012-01-18 09:19:33','2012-01-23 17:58:25'),(28,'',14,'5.jpg','image/jpeg',310745,'2012-01-23 17:58:23','2012-01-18 09:19:33','2012-01-23 17:58:25'),(29,'',14,'6.jpg','image/jpeg',244405,'2012-01-23 17:58:24','2012-01-18 09:19:33','2012-01-23 17:58:26'),(30,'',14,'7.jpg','image/jpeg',233774,'2012-01-23 17:58:24','2012-01-18 09:19:33','2012-01-23 17:58:26'),(31,'',14,'8.jpg','image/jpeg',202452,'2012-01-23 17:58:25','2012-01-18 09:19:33','2012-01-23 17:58:26'),(32,'',15,'1.jpg','image/jpeg',247546,'2012-01-23 17:57:34','2012-01-18 09:21:21','2012-01-23 17:57:38'),(33,'',15,'2.jpg','image/jpeg',244891,'2012-01-23 17:57:34','2012-01-18 09:21:21','2012-01-23 17:57:38'),(34,'',15,'3.jpg','image/jpeg',275764,'2012-01-23 17:57:35','2012-01-18 09:21:21','2012-01-23 17:57:38'),(35,'',15,'4.jpg','image/jpeg',280071,'2012-01-23 17:57:36','2012-01-18 09:21:21','2012-01-23 17:57:38'),(36,'',15,'5.jpg','image/jpeg',243011,'2012-01-23 17:57:36','2012-01-18 09:21:21','2012-01-23 17:57:38'),(37,'',15,'6.jpg','image/jpeg',459694,'2012-01-23 17:57:37','2012-01-18 09:21:21','2012-01-23 17:57:38'),(38,'',15,'7.jpg','image/jpeg',189979,'2012-01-23 17:57:37','2012-01-18 09:21:21','2012-01-23 17:57:38'),(39,'',16,'1.jpg','image/jpeg',269573,'2012-01-23 17:56:42','2012-01-18 09:23:10','2012-01-23 17:56:49'),(40,'',16,'2.jpg','image/jpeg',315819,'2012-01-23 17:56:43','2012-01-18 09:23:10','2012-01-23 17:56:49'),(41,'',16,'3.jpg','image/jpeg',442394,'2012-01-23 17:56:44','2012-01-18 09:23:10','2012-01-23 17:56:49'),(42,'',16,'4.jpg','image/jpeg',241625,'2012-01-23 17:56:44','2012-01-18 09:23:10','2012-01-23 17:56:49'),(43,'',16,'5.jpg','image/jpeg',493424,'2012-01-23 17:56:45','2012-01-18 09:23:10','2012-01-23 17:56:49'),(44,'',16,'6.jpg','image/jpeg',298021,'2012-01-23 17:56:46','2012-01-18 09:23:10','2012-01-23 17:56:49'),(45,'',16,'7.jpg','image/jpeg',288285,'2012-01-23 17:56:46','2012-01-18 09:23:10','2012-01-23 17:56:49'),(46,'',16,'8.jpg','image/jpeg',281907,'2012-01-23 17:56:47','2012-01-18 09:23:10','2012-01-23 17:56:49'),(47,'',16,'9.jpg','image/jpeg',189228,'2012-01-23 17:56:47','2012-01-18 09:23:10','2012-01-23 17:56:49'),(48,'',16,'10.jpg','image/jpeg',229571,'2012-01-23 17:56:48','2012-01-18 09:23:10','2012-01-23 17:56:49'),(49,'',17,'1.jpg','image/jpeg',225630,'2012-01-23 20:16:00','2012-01-23 20:16:05','2012-01-23 20:16:05'),(50,'',17,'2.jpg','image/jpeg',222730,'2012-01-23 20:16:01','2012-01-23 20:16:05','2012-01-23 20:16:05'),(51,'',17,'3.jpg','image/jpeg',254589,'2012-01-23 20:16:02','2012-01-23 20:16:05','2012-01-23 20:16:05'),(52,'',17,'4.jpg','image/jpeg',348697,'2012-01-23 20:16:02','2012-01-23 20:16:05','2012-01-23 20:16:05'),(53,'',17,'5.jpg','image/jpeg',302249,'2012-01-23 20:16:03','2012-01-23 20:16:05','2012-01-23 20:16:05'),(54,'',17,'6.jpg','image/jpeg',230635,'2012-01-23 20:16:03','2012-01-23 20:16:05','2012-01-23 20:16:05'),(55,'',17,'7.jpg','image/jpeg',259534,'2012-01-23 20:16:04','2012-01-23 20:16:05','2012-01-23 20:16:05'),(56,'',17,'8.jpg','image/jpeg',151637,'2012-01-23 20:16:04','2012-01-23 20:16:05','2012-01-23 20:16:05');
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
INSERT INTO `rates` VALUES (1,3,14,'2012-01-18 18:38:42','2012-01-18 18:38:42'),(2,3,10,'2012-01-19 05:52:51','2012-01-19 05:52:51'),(3,5,10,'2012-01-19 05:56:14','2012-01-19 05:56:14'),(4,5,10,'2012-01-19 06:20:43','2012-01-19 06:20:43'),(5,5,10,'2012-01-19 06:28:39','2012-01-19 06:28:39'),(6,4,10,'2012-01-19 06:30:11','2012-01-19 06:30:11'),(7,2,10,'2012-01-19 06:30:51','2012-01-19 06:30:51'),(8,5,10,'2012-01-19 06:31:18','2012-01-19 06:31:18'),(9,2,10,'2012-01-19 06:32:16','2012-01-19 06:32:16'),(10,5,11,'2012-01-19 06:32:20','2012-01-19 06:32:20'),(11,2,11,'2012-01-19 06:32:25','2012-01-19 06:32:25'),(12,5,11,'2012-01-19 06:32:29','2012-01-19 06:32:29'),(13,4,11,'2012-01-19 06:32:31','2012-01-19 06:32:31'),(14,1,10,'2012-01-19 08:17:08','2012-01-19 08:17:08'),(15,5,10,'2012-01-19 08:29:51','2012-01-19 08:29:51'),(16,4,11,'2012-01-19 11:18:11','2012-01-19 11:18:11'),(17,3,10,'2012-01-19 11:59:44','2012-01-19 11:59:44'),(18,5,15,'2012-01-20 06:48:40','2012-01-20 06:48:40'),(19,5,10,'2012-01-20 12:03:21','2012-01-20 12:03:21'),(20,4,10,'2012-01-20 12:03:25','2012-01-20 12:03:25'),(21,5,10,'2012-01-20 14:42:46','2012-01-20 14:42:46'),(22,5,16,'2012-01-21 08:54:17','2012-01-21 08:54:17'),(23,5,15,'2012-01-23 11:20:00','2012-01-23 11:20:00'),(24,5,10,'2012-01-23 19:22:34','2012-01-23 19:22:34'),(25,4,10,'2012-01-24 08:45:40','2012-01-24 08:45:40'),(26,5,10,'2012-01-24 09:11:38','2012-01-24 09:11:38');
/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120117090544'),('20120117090546'),('20120117090548'),('20120117090550'),('20120117090552'),('20120117112841'),('20120117133427'),('20120117163432'),('20120117163433'),('20120117163434'),('20120117163435'),('20120117163436'),('20120117163437'),('20120117163438'),('20120118075618'),('20120118143820'),('20120118165134'),('20120118173133'),('20120123095655'),('20120123101832'),('20120123131610'),('20120123132627'),('20120123151924'),('20120123151931'),('20120123151939'),('20120123204156'),('20120124184558'),('20120124193923'),('20120124195412');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2012-01-26 14:36:01
