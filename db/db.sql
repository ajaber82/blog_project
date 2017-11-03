-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: blog_db
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `id` int(11) NOT NULL,
  `deleted` char(1) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `file_bath` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attachment_blog_entries_idx` (`blog_id`),
  CONSTRAINT `fk_attachment_blog_entries` FOREIGN KEY (`blog_id`) REFERENCES `blog_entries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_entries`
--

DROP TABLE IF EXISTS `blog_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_title` varchar(1024) DEFAULT NULL,
  `blog_body` text,
  `cat_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_time` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_blog_entries_users_idx` (`user_id`),
  KEY `fk_blog_enries_categories_idx` (`cat_id`),
  CONSTRAINT `fk_blog_enries_categories` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_blog_entries_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_entries`
--

LOCK TABLES `blog_entries` WRITE;
/*!40000 ALTER TABLE `blog_entries` DISABLE KEYS */;
INSERT INTO `blog_entries` VALUES (1,'Ronaldo when france football prize','Ronaldo when france football prizeRonaldo when france football prizeRonaldo when france football prizeRonaldo when france football prizeRonaldo when france football prizeRonaldo when france football prize Ronaldo when france football prize Ronaldo when france football prize',2,1,1508992078,'0'),(2,'صراع إنجليزي إسباني على نجم بايرن ميونخ','شفت تقارير صحفية اليوم الأربعاء، عن اهتمام عملاقين من إسبانيا وإنجلترا، بالتعاقد مع نجم بايرن ميونخ الألماني خلال الفترة المقبلة.',2,2,1508992088,'0');
/*!40000 ALTER TABLE `blog_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_entries_tags_ref`
--

DROP TABLE IF EXISTS `blog_entries_tags_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_entries_tags_ref` (
  `blog_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `deleted` char(1) DEFAULT NULL,
  PRIMARY KEY (`blog_id`,`tag_id`),
  KEY `fk_blog_entries_tags_ref_tags_idx` (`tag_id`),
  CONSTRAINT `fk_blog_entries_tags_ref_blog_entries` FOREIGN KEY (`blog_id`) REFERENCES `blog_entries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_blog_entries_tags_ref_tags` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_entries_tags_ref`
--

LOCK TABLES `blog_entries_tags_ref` WRITE;
/*!40000 ALTER TABLE `blog_entries_tags_ref` DISABLE KEYS */;
INSERT INTO `blog_entries_tags_ref` VALUES (1,1,'0'),(1,2,'0');
/*!40000 ALTER TABLE `blog_entries_tags_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(200) DEFAULT NULL,
  `deleted` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'News',NULL),(2,'Sports',NULL),(3,'news','0'),(4,'news','0'),(5,'news','0'),(6,'news','0'),(7,'news','0');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_body` text,
  `created_time` bigint(20) DEFAULT NULL,
  `deleted` char(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_users_idx` (`user_id`),
  KEY `fk_comments_blog_entries_idx` (`blog_id`),
  CONSTRAINT `fk_comments_blog_entries` FOREIGN KEY (`blog_id`) REFERENCES `blog_entries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'I like this ',1508992078,'0',2,1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(100) DEFAULT NULL,
  `deleted` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Messi','0'),(2,'Ronaldo','0');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `about_me` text,
  `deleted` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'fName','lName','u@xyz.com','pwd','pic1.jpg','something','0'),(2,'abdullah','jaber','ajaber82@hotmail.com','123','ert.jpg','I am software engineer','0'),(10,'fName','lName','u@xyz.com','pwd','pic1.jpg','something','0'),(11,'fName','lName','u@xyz.com','pwd','pic1.jpg','something','0'),(14,'fName','lName','u@xyz.com','pwd','pic1.jpg','something','0'),(15,'fName','lName','u@xyz.com','pwd','pic1.jpg','something','0'),(16,'fName','lName','u@xyz.com','pwd','pic1.jpg','something','0'),(17,'fName','lName','u@xyz.com','pwd','pic1.jpg','something','0'),(18,'fName','lName','u@xyz.com','pwd','pic1.jpg','something','0'),(19,'fName','lName','u@xyz.com','pwd','pic1.jpg','something','0'),(20,'fName','lName','u@xyz.com','pwd','pic1.jpg','something','0'),(21,'fName','lName','u@xyz.com','pwd','pic1.jpg','something','0'),(22,'fName','lName','u@xyz.com','pwd','pic1.jpg','something','0'),(23,'fName','lName','u@xyz.com',NULL,'pic1.jpg','something','1'),(24,'fName','lName','u@xyz.com',NULL,'pic1.jpg','something','1');
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

-- Dump completed on 2017-11-03  0:23:04
