-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: fxvouchers
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Editors'),(1,'Moderators');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (4,1,1),(5,1,2),(6,1,3),(8,1,4),(12,1,5),(13,1,6),(14,1,7),(1,2,1),(2,2,2),(3,2,3),(7,2,4),(9,2,5),(10,2,6),(11,2,7);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add image',2,'add_image'),(2,'Can change image',2,'change_image'),(3,'Can delete image',2,'delete_image'),(4,'Can access Wagtail admin',3,'access_admin'),(5,'Can add document',4,'add_document'),(6,'Can change document',4,'change_document'),(7,'Can delete document',4,'delete_document'),(8,'Can add account currency',5,'add_accountcurrency'),(9,'Can change account currency',5,'change_accountcurrency'),(10,'Can delete account currency',5,'delete_accountcurrency'),(11,'Can view account currency',5,'view_accountcurrency'),(12,'Can add account option',6,'add_accountoption'),(13,'Can change account option',6,'change_accountoption'),(14,'Can delete account option',6,'delete_accountoption'),(15,'Can view account option',6,'view_accountoption'),(16,'Can add account type',7,'add_accounttype'),(17,'Can change account type',7,'change_accounttype'),(18,'Can delete account type',7,'delete_accounttype'),(19,'Can view account type',7,'view_accounttype'),(20,'Can add affiliate',8,'add_affiliate'),(21,'Can change affiliate',8,'change_affiliate'),(22,'Can delete affiliate',8,'delete_affiliate'),(23,'Can view affiliate',8,'view_affiliate'),(24,'Can add attribute',9,'add_attribute'),(25,'Can change attribute',9,'change_attribute'),(26,'Can delete attribute',9,'delete_attribute'),(27,'Can view attribute',9,'view_attribute'),(28,'Can add attribute service',10,'add_attributeservice'),(29,'Can change attribute service',10,'change_attributeservice'),(30,'Can delete attribute service',10,'delete_attributeservice'),(31,'Can view attribute service',10,'view_attributeservice'),(32,'Can add broker type',11,'add_brokertype'),(33,'Can change broker type',11,'change_brokertype'),(34,'Can delete broker type',11,'delete_brokertype'),(35,'Can view broker type',11,'view_brokertype'),(36,'Can add category',12,'add_category'),(37,'Can change category',12,'change_category'),(38,'Can delete category',12,'delete_category'),(39,'Can view category',12,'view_category'),(40,'Can add chat',13,'add_chat'),(41,'Can change chat',13,'change_chat'),(42,'Can delete chat',13,'delete_chat'),(43,'Can view chat',13,'view_chat'),(44,'Can add home page',14,'add_homepage'),(45,'Can change home page',14,'change_homepage'),(46,'Can delete home page',14,'delete_homepage'),(47,'Can view home page',14,'view_homepage'),(48,'Can add license',15,'add_license'),(49,'Can change license',15,'change_license'),(50,'Can delete license',15,'delete_license'),(51,'Can view license',15,'view_license'),(52,'Can add location',16,'add_location'),(53,'Can change location',16,'change_location'),(54,'Can delete location',16,'delete_location'),(55,'Can view location',16,'view_location'),(56,'Can add methodology',17,'add_methodology'),(57,'Can change methodology',17,'change_methodology'),(58,'Can delete methodology',17,'delete_methodology'),(59,'Can view methodology',17,'view_methodology'),(60,'Can add payment method',18,'add_paymentmethod'),(61,'Can change payment method',18,'change_paymentmethod'),(62,'Can delete payment method',18,'delete_paymentmethod'),(63,'Can view payment method',18,'view_paymentmethod'),(64,'Can add platform supported',19,'add_platformsupported'),(65,'Can change platform supported',19,'change_platformsupported'),(66,'Can delete platform supported',19,'delete_platformsupported'),(67,'Can view platform supported',19,'view_platformsupported'),(68,'Can add pricing model',20,'add_pricingmodel'),(69,'Can change pricing model',20,'change_pricingmodel'),(70,'Can delete pricing model',20,'delete_pricingmodel'),(71,'Can view pricing model',20,'view_pricingmodel'),(72,'Can add regulation',21,'add_regulation'),(73,'Can change regulation',21,'change_regulation'),(74,'Can delete regulation',21,'delete_regulation'),(75,'Can view regulation',21,'view_regulation'),(76,'Can add revenue model',22,'add_revenuemodel'),(77,'Can change revenue model',22,'change_revenuemodel'),(78,'Can delete revenue model',22,'delete_revenuemodel'),(79,'Can view revenue model',22,'view_revenuemodel'),(80,'Can add service',23,'add_service'),(81,'Can change service',23,'change_service'),(82,'Can delete service',23,'delete_service'),(83,'Can view service',23,'view_service'),(84,'Can add service page',24,'add_servicepage'),(85,'Can change service page',24,'change_servicepage'),(86,'Can delete service page',24,'delete_servicepage'),(87,'Can view service page',24,'view_servicepage'),(88,'Can add signal alert',25,'add_signalalert'),(89,'Can change signal alert',25,'change_signalalert'),(90,'Can delete signal alert',25,'delete_signalalert'),(91,'Can view signal alert',25,'view_signalalert'),(92,'Can add status',26,'add_status'),(93,'Can change status',26,'change_status'),(94,'Can delete status',26,'delete_status'),(95,'Can view status',26,'view_status'),(96,'Can add supported language',27,'add_supportedlanguage'),(97,'Can change supported language',27,'change_supportedlanguage'),(98,'Can delete supported language',27,'delete_supportedlanguage'),(99,'Can view supported language',27,'view_supportedlanguage'),(100,'Can add system type',28,'add_systemtype'),(101,'Can change system type',28,'change_systemtype'),(102,'Can delete system type',28,'delete_systemtype'),(103,'Can view system type',28,'view_systemtype'),(104,'Can add timezone',29,'add_timezone'),(105,'Can change timezone',29,'change_timezone'),(106,'Can delete timezone',29,'delete_timezone'),(107,'Can view timezone',29,'view_timezone'),(108,'Can add trading instrument',30,'add_tradinginstrument'),(109,'Can change trading instrument',30,'change_tradinginstrument'),(110,'Can delete trading instrument',30,'delete_tradinginstrument'),(111,'Can view trading instrument',30,'view_tradinginstrument'),(112,'Can add trading software',31,'add_tradingsoftware'),(113,'Can change trading software',31,'change_tradingsoftware'),(114,'Can delete trading software',31,'delete_tradingsoftware'),(115,'Can view trading software',31,'view_tradingsoftware'),(116,'Can add trading type',32,'add_tradingtype'),(117,'Can change trading type',32,'change_tradingtype'),(118,'Can delete trading type',32,'delete_tradingtype'),(119,'Can view trading type',32,'view_tradingtype'),(120,'Can add training course',33,'add_trainingcourse'),(121,'Can change training course',33,'change_trainingcourse'),(122,'Can delete training course',33,'delete_trainingcourse'),(123,'Can view training course',33,'view_trainingcourse'),(124,'Can add training tool',34,'add_trainingtool'),(125,'Can change training tool',34,'change_trainingtool'),(126,'Can delete training tool',34,'delete_trainingtool'),(127,'Can view training tool',34,'view_trainingtool'),(128,'Can add training type',35,'add_trainingtype'),(129,'Can change training type',35,'change_trainingtype'),(130,'Can delete training type',35,'delete_trainingtype'),(131,'Can view training type',35,'view_trainingtype'),(132,'Can add voucher',36,'add_voucher'),(133,'Can change voucher',36,'change_voucher'),(134,'Can delete voucher',36,'delete_voucher'),(135,'Can view voucher',36,'view_voucher'),(136,'Can add product',37,'add_product'),(137,'Can change product',37,'change_product'),(138,'Can delete product',37,'delete_product'),(139,'Can view product',37,'view_product'),(140,'Can add option',38,'add_option'),(141,'Can change option',38,'change_option'),(142,'Can delete option',38,'delete_option'),(143,'Can view option',38,'view_option'),(144,'Can add comment',39,'add_comment'),(145,'Can change comment',39,'change_comment'),(146,'Can delete comment',39,'delete_comment'),(147,'Can view comment',39,'view_comment'),(148,'Can add attribute service value',40,'add_attributeservicevalue'),(149,'Can change attribute service value',40,'change_attributeservicevalue'),(150,'Can delete attribute service value',40,'delete_attributeservicevalue'),(151,'Can view attribute service value',40,'view_attributeservicevalue'),(152,'Can add form submission',41,'add_formsubmission'),(153,'Can change form submission',41,'change_formsubmission'),(154,'Can delete form submission',41,'delete_formsubmission'),(155,'Can view form submission',41,'view_formsubmission'),(156,'Can add redirect',42,'add_redirect'),(157,'Can change redirect',42,'change_redirect'),(158,'Can delete redirect',42,'delete_redirect'),(159,'Can view redirect',42,'view_redirect'),(160,'Can add embed',43,'add_embed'),(161,'Can change embed',43,'change_embed'),(162,'Can delete embed',43,'delete_embed'),(163,'Can view embed',43,'view_embed'),(164,'Can add user profile',44,'add_userprofile'),(165,'Can change user profile',44,'change_userprofile'),(166,'Can delete user profile',44,'delete_userprofile'),(167,'Can view user profile',44,'view_userprofile'),(168,'Can view document',4,'view_document'),(169,'Can view image',2,'view_image'),(170,'Can add rendition',45,'add_rendition'),(171,'Can change rendition',45,'change_rendition'),(172,'Can delete rendition',45,'delete_rendition'),(173,'Can view rendition',45,'view_rendition'),(174,'Can add query',46,'add_query'),(175,'Can change query',46,'change_query'),(176,'Can delete query',46,'delete_query'),(177,'Can view query',46,'view_query'),(178,'Can add Query Daily Hits',47,'add_querydailyhits'),(179,'Can change Query Daily Hits',47,'change_querydailyhits'),(180,'Can delete Query Daily Hits',47,'delete_querydailyhits'),(181,'Can view Query Daily Hits',47,'view_querydailyhits'),(182,'Can add page',1,'add_page'),(183,'Can change page',1,'change_page'),(184,'Can delete page',1,'delete_page'),(185,'Can view page',1,'view_page'),(186,'Can add group page permission',48,'add_grouppagepermission'),(187,'Can change group page permission',48,'change_grouppagepermission'),(188,'Can delete group page permission',48,'delete_grouppagepermission'),(189,'Can view group page permission',48,'view_grouppagepermission'),(190,'Can add page revision',49,'add_pagerevision'),(191,'Can change page revision',49,'change_pagerevision'),(192,'Can delete page revision',49,'delete_pagerevision'),(193,'Can view page revision',49,'view_pagerevision'),(194,'Can add page view restriction',50,'add_pageviewrestriction'),(195,'Can change page view restriction',50,'change_pageviewrestriction'),(196,'Can delete page view restriction',50,'delete_pageviewrestriction'),(197,'Can view page view restriction',50,'view_pageviewrestriction'),(198,'Can add site',51,'add_site'),(199,'Can change site',51,'change_site'),(200,'Can delete site',51,'delete_site'),(201,'Can view site',51,'view_site'),(202,'Can add collection',52,'add_collection'),(203,'Can change collection',52,'change_collection'),(204,'Can delete collection',52,'delete_collection'),(205,'Can view collection',52,'view_collection'),(206,'Can add group collection permission',53,'add_groupcollectionpermission'),(207,'Can change group collection permission',53,'change_groupcollectionpermission'),(208,'Can delete group collection permission',53,'delete_groupcollectionpermission'),(209,'Can view group collection permission',53,'view_groupcollectionpermission'),(210,'Can add collection view restriction',54,'add_collectionviewrestriction'),(211,'Can change collection view restriction',54,'change_collectionviewrestriction'),(212,'Can delete collection view restriction',54,'delete_collectionviewrestriction'),(213,'Can view collection view restriction',54,'view_collectionviewrestriction'),(214,'Can add Tag',55,'add_tag'),(215,'Can change Tag',55,'change_tag'),(216,'Can delete Tag',55,'delete_tag'),(217,'Can view Tag',55,'view_tag'),(218,'Can add Tagged Item',56,'add_taggeditem'),(219,'Can change Tagged Item',56,'change_taggeditem'),(220,'Can delete Tagged Item',56,'delete_taggeditem'),(221,'Can view Tagged Item',56,'view_taggeditem'),(222,'Can add log entry',57,'add_logentry'),(223,'Can change log entry',57,'change_logentry'),(224,'Can delete log entry',57,'delete_logentry'),(225,'Can view log entry',57,'view_logentry'),(226,'Can add permission',58,'add_permission'),(227,'Can change permission',58,'change_permission'),(228,'Can delete permission',58,'delete_permission'),(229,'Can view permission',58,'view_permission'),(230,'Can add group',59,'add_group'),(231,'Can change group',59,'change_group'),(232,'Can delete group',59,'delete_group'),(233,'Can view group',59,'view_group'),(234,'Can add user',60,'add_user'),(235,'Can change user',60,'change_user'),(236,'Can delete user',60,'delete_user'),(237,'Can view user',60,'view_user'),(238,'Can add content type',61,'add_contenttype'),(239,'Can change content type',61,'change_contenttype'),(240,'Can delete content type',61,'delete_contenttype'),(241,'Can view content type',61,'view_contenttype'),(242,'Can add session',62,'add_session'),(243,'Can change session',62,'change_session'),(244,'Can delete session',62,'delete_session'),(245,'Can view session',62,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$XpZnFJCp6yMw$PrPg5g6TiwV66Ak4deTbTRjwWQsaHJkc5PLdfajgJi4=','2019-08-28 22:08:57.180280',1,'admin','','','',1,1,'2019-08-28 22:08:42.652945');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_accountcurrency`
--

DROP TABLE IF EXISTS `cms_accountcurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_accountcurrency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_accountcurrency`
--

LOCK TABLES `cms_accountcurrency` WRITE;
/*!40000 ALTER TABLE `cms_accountcurrency` DISABLE KEYS */;
INSERT INTO `cms_accountcurrency` VALUES (1,'AUD'),(2,'BGN'),(3,'BTC'),(4,'CAD'),(5,'CHF'),(6,'CZK'),(7,'DKK'),(8,'EUR'),(9,'GBP'),(10,'GLD'),(11,'HKD'),(12,'HUF'),(13,'ILS'),(14,'JPY'),(15,'KRW'),(16,'MXN'),(17,'NOK'),(18,'NZD'),(19,'PLN'),(20,'RUB'),(21,'RUR'),(22,'SEK'),(23,'SGD'),(24,'THB'),(25,'TWD'),(26,'USD'),(27,'ZAR');
/*!40000 ALTER TABLE `cms_accountcurrency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_accountoption`
--

DROP TABLE IF EXISTS `cms_accountoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_accountoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_accountoption`
--

LOCK TABLES `cms_accountoption` WRITE;
/*!40000 ALTER TABLE `cms_accountoption` DISABLE KEYS */;
INSERT INTO `cms_accountoption` VALUES (1,'Swap Free Account'),(2,'Islamic Account'),(3,'Segregated Account'),(4,'Interest on Margin'),(5,'Managed Account'),(6,'MAM/PAMM'),(7,'Copy Trading'),(8,'Social Trading');
/*!40000 ALTER TABLE `cms_accountoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_accounttype`
--

DROP TABLE IF EXISTS `cms_accounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_accounttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_accounttype`
--

LOCK TABLES `cms_accounttype` WRITE;
/*!40000 ALTER TABLE `cms_accounttype` DISABLE KEYS */;
INSERT INTO `cms_accounttype` VALUES (1,'Standard Account'),(2,'ECN Account'),(3,'Ctrader Account');
/*!40000 ALTER TABLE `cms_accounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_affiliate`
--

DROP TABLE IF EXISTS `cms_affiliate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_affiliate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `cloakedLink` varchar(500) NOT NULL,
  `slug` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_affiliate`
--

LOCK TABLES `cms_affiliate` WRITE;
/*!40000 ALTER TABLE `cms_affiliate` DISABLE KEYS */;
INSERT INTO `cms_affiliate` VALUES (1,'out','http://www.google.com','gooooogl'),(2,'out','http://www.amazon.com','synergy');
/*!40000 ALTER TABLE `cms_affiliate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_attribute`
--

DROP TABLE IF EXISTS `cms_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `section` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_attribute_slug_837f8c74` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_attribute`
--

LOCK TABLES `cms_attribute` WRITE;
/*!40000 ALTER TABLE `cms_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_attribute_categories`
--

DROP TABLE IF EXISTS `cms_attribute_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_attribute_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_attribute_categories_attribute_id_category_id_a8d72138_uniq` (`attribute_id`,`category_id`),
  KEY `cms_attribute_categories_category_id_6453e183_fk_cms_category_id` (`category_id`),
  CONSTRAINT `cms_attribute_catego_attribute_id_dcd7769e_fk_cms_attri` FOREIGN KEY (`attribute_id`) REFERENCES `cms_attribute` (`id`),
  CONSTRAINT `cms_attribute_categories_category_id_6453e183_fk_cms_category_id` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_attribute_categories`
--

LOCK TABLES `cms_attribute_categories` WRITE;
/*!40000 ALTER TABLE `cms_attribute_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_attribute_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_attribute_services`
--

DROP TABLE IF EXISTS `cms_attribute_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_attribute_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_attribute_services_attribute_id_service_id_b81eefed_uniq` (`attribute_id`,`service_id`),
  KEY `cms_attribute_services_service_id_bb8131ff_fk_cms_service_id` (`service_id`),
  CONSTRAINT `cms_attribute_services_attribute_id_3320bd90_fk_cms_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `cms_attribute` (`id`),
  CONSTRAINT `cms_attribute_services_service_id_bb8131ff_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_attribute_services`
--

LOCK TABLES `cms_attribute_services` WRITE;
/*!40000 ALTER TABLE `cms_attribute_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_attribute_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_attributeservice`
--

DROP TABLE IF EXISTS `cms_attributeservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_attributeservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_attributeservice_attribute_id_f038d761_fk_cms_attribute_id` (`attribute_id`),
  KEY `cms_attributeservice_service_id_3789930a` (`service_id`),
  CONSTRAINT `cms_attributeservice_attribute_id_f038d761_fk_cms_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `cms_attribute` (`id`),
  CONSTRAINT `cms_attributeservice_service_id_3789930a_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_attributeservice`
--

LOCK TABLES `cms_attributeservice` WRITE;
/*!40000 ALTER TABLE `cms_attributeservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_attributeservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_attributeservicevalue`
--

DROP TABLE IF EXISTS `cms_attributeservicevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_attributeservicevalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `value` varchar(50) NOT NULL,
  `attributeService_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_attributeservicevalue_option_id_8c339b4c_fk_cms_option_id` (`option_id`),
  KEY `cms_attributeservicevalue_attributeService_id_e970b10a` (`attributeService_id`),
  CONSTRAINT `cms_attributeservice_attributeService_id_e970b10a_fk_cms_attri` FOREIGN KEY (`attributeService_id`) REFERENCES `cms_attributeservice` (`id`),
  CONSTRAINT `cms_attributeservicevalue_option_id_8c339b4c_fk_cms_option_id` FOREIGN KEY (`option_id`) REFERENCES `cms_option` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_attributeservicevalue`
--

LOCK TABLES `cms_attributeservicevalue` WRITE;
/*!40000 ALTER TABLE `cms_attributeservicevalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_attributeservicevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_brokertype`
--

DROP TABLE IF EXISTS `cms_brokertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_brokertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_brokertype`
--

LOCK TABLES `cms_brokertype` WRITE;
/*!40000 ALTER TABLE `cms_brokertype` DISABLE KEYS */;
INSERT INTO `cms_brokertype` VALUES (1,'Dealing Desk','Market Maker via Dealing Desk'),(2,'True ECN','True ECN Execution via Direct Market Access'),(3,'STP','Stright Through Processing via No Dealing Desk'),(4,'STP+ECN','STP+ECN Execution via No Dealing Desk');
/*!40000 ALTER TABLE `cms_brokertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category`
--

DROP TABLE IF EXISTS `cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_category_slug_2811c358` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category`
--

LOCK TABLES `cms_category` WRITE;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
INSERT INTO `cms_category` VALUES (1,'Forex Brokers','forex-brokers'),(2,'Forex Training','forex-training'),(3,'Forex VPS','forex-vps'),(4,'Forex Trading System','forex-trading-system'),(5,'Forex Signals','forex-signals');
/*!40000 ALTER TABLE `cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category_attributes`
--

DROP TABLE IF EXISTS `cms_category_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_category_attributes_category_id_attribute_id_95bf50bc_uniq` (`category_id`,`attribute_id`),
  KEY `cms_category_attribu_attribute_id_38dd3329_fk_cms_attri` (`attribute_id`),
  CONSTRAINT `cms_category_attribu_attribute_id_38dd3329_fk_cms_attri` FOREIGN KEY (`attribute_id`) REFERENCES `cms_attribute` (`id`),
  CONSTRAINT `cms_category_attributes_category_id_edac3a2b_fk_cms_category_id` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category_attributes`
--

LOCK TABLES `cms_category_attributes` WRITE;
/*!40000 ALTER TABLE `cms_category_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_category_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_chat`
--

DROP TABLE IF EXISTS `cms_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_chat`
--

LOCK TABLES `cms_chat` WRITE;
/*!40000 ALTER TABLE `cms_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_comment`
--

DROP TABLE IF EXISTS `cms_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stars` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `review` varchar(500) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_comment_parent_comment_id_3307a682_fk_cms_comment_id` (`parent_comment_id`),
  KEY `cms_comment_service_id_0c8419da_fk_cms_service_id` (`service_id`),
  CONSTRAINT `cms_comment_parent_comment_id_3307a682_fk_cms_comment_id` FOREIGN KEY (`parent_comment_id`) REFERENCES `cms_comment` (`id`),
  CONSTRAINT `cms_comment_service_id_0c8419da_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_comment`
--

LOCK TABLES `cms_comment` WRITE;
/*!40000 ALTER TABLE `cms_comment` DISABLE KEYS */;
INSERT INTO `cms_comment` VALUES (1,4,'dfd','','sdss','2019-08-19 15:47:49.142725','2019-08-19 15:47:49.142768',NULL,1,'',NULL,1);
/*!40000 ALTER TABLE `cms_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_homepage`
--

DROP TABLE IF EXISTS `cms_homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_homepage` (
  `page_ptr_id` int(11) NOT NULL,
  `body` longtext NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `cms_homepage_page_ptr_id_3967ea6a_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_homepage`
--

LOCK TABLES `cms_homepage` WRITE;
/*!40000 ALTER TABLE `cms_homepage` DISABLE KEYS */;
INSERT INTO `cms_homepage` VALUES (1,''),(4,'');
/*!40000 ALTER TABLE `cms_homepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_license`
--

DROP TABLE IF EXISTS `cms_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_license` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_license`
--

LOCK TABLES `cms_license` WRITE;
/*!40000 ALTER TABLE `cms_license` DISABLE KEYS */;
INSERT INTO `cms_license` VALUES (1,'1283c');
/*!40000 ALTER TABLE `cms_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_location`
--

DROP TABLE IF EXISTS `cms_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(4) NOT NULL,
  `continent` varchar(100) NOT NULL,
  `capital` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_location`
--

LOCK TABLES `cms_location` WRITE;
/*!40000 ALTER TABLE `cms_location` DISABLE KEYS */;
INSERT INTO `cms_location` VALUES (2,'Andorra','AD','Europe','Andorra la Vella'),(3,'Afghanistan','AF','Asia','Kabul'),(4,'Antigua and Barbuda','AG','North America','St. John\'s'),(5,'Albania','AL','Europe','Tirana'),(6,'Armenia','AM','Asia','Yerevan'),(7,'Angola','AO','Africa','Luanda'),(8,'Argentina','AR','South America','Buenos Aires'),(9,'Austria','AT','Europe','Vienna'),(10,'Australia','AU','Oceania','Canberra'),(11,'Azerbaijan','AZ','Asia','Baku'),(12,'Barbados','BB','North America','Bridgetown'),(13,'Bangladesh','BD','Asia','Dhaka'),(14,'Belgium','BE','Europe','Brussels'),(15,'Burkina Faso','BF','Africa','Ouagadougou'),(16,'Bulgaria','BG','Europe','Sofia'),(17,'Bahrain','BH','Asia','Manama'),(18,'Burundi','BI','Africa','Bujumbura'),(19,'Benin','BJ','Africa','Porto-Novo'),(20,'Brunei Darussalam','BN','Asia','Bandar Seri Begawan'),(21,'Bolivia','BO','South America','Sucre'),(22,'Brazil','BR','South America','Brasília'),(23,'Bahamas','BS','North America','Nassau'),(24,'Bhutan','BT','Asia','Thimphu'),(25,'Botswana','BW','Africa','Gaborone'),(26,'Belarus','BY','Europe','Minsk'),(27,'Belize','BZ','North America','Belmopan'),(28,'Canada','CA','North America','Ottawa'),(29,'Democratic Republic of the Congo','CD','Africa','Kinshasa'),(30,'Republic of the Congo','CG','Africa','Brazzaville'),(31,'Ivory Coast','CI','Africa','Yamoussoukro'),(32,'Chile','CL','South America','Santiago'),(33,'Cameroon','CM','Africa','Yaoundé'),(34,'People\'s Republic of China','CN','Asia','Beijing'),(35,'Colombia','CO','South America','Bogotá'),(36,'Costa Rica','CR','North America','San José'),(37,'Cuba','CU','North America','Havana'),(38,'Cape Verde','CV','Africa','Praia'),(39,'Cyprus','CY','Asia','Nicosia'),(40,'Czech Republic','CZ','Europe','Prague'),(41,'Germany','DE','Europe','Berlin'),(42,'Djibouti','DJ','Africa','Djibouti City'),(43,'Denmark','DK','Europe','Copenhagen'),(44,'Dominica','DM','North America','Roseau'),(45,'Dominican Republic','DO','North America','Santo Domingo'),(46,'Ecuador','EC','South America','Quito'),(47,'Estonia','EE','Europe','Tallinn'),(48,'Egypt','EG','Africa','Cairo'),(49,'Eritrea','ER','Africa','Asmara'),(50,'Ethiopia','ET','Africa','Addis Ababa'),(51,'Finland','FI','Europe','Helsinki'),(52,'Fiji','FJ','Oceania','Suva'),(53,'France','FR','Europe','Paris'),(54,'Gabon','GA','Africa','Libreville'),(55,'Georgia','GE','Asia','Tbilisi'),(56,'Ghana','GH','Africa','Accra'),(57,'The Gambia','GM','Africa','Banjul'),(58,'Guinea','GN','Africa','Conakry'),(59,'Greece','GR','Europe','Athens'),(60,'Guatemala','GT','North America','Guatemala City'),(61,'Haiti','GT','North America','Port-au-Prince'),(62,'Guinea-Bissau','GW','Africa','Bissau'),(63,'Guyana','GY','South America','Georgetown'),(64,'Honduras','HN','North America','Tegucigalpa'),(65,'Hungary','HU','Europe','Budapest'),(66,'Indonesia','ID','Asia','Jakarta'),(67,'Republic of Ireland','IE','Europe','Dublin'),(68,'Israel','IL','Asia','Jerusalem'),(69,'India','IN','Asia','New Delhi'),(70,'Iraq','IQ','Asia','Baghdad'),(71,'Iran','IR','Asia','Tehran'),(72,'Iceland','IS','Europe','Reykjavík'),(73,'Italy','IT','Europe','Rome'),(74,'Jamaica','JM','North America','Kingston'),(75,'Jordan','JO','Asia','Amman'),(76,'Japan','JP','Asia','Tokyo'),(77,'Kenya','KE','Africa','Nairobi'),(78,'Kyrgyzstan','KG','Asia','Bishkek'),(79,'Kiribati','KI','Oceania','Tarawa'),(80,'North Korea','KP','Asia','Pyongyang'),(81,'South Korea','KR','Asia','Seoul'),(82,'Kuwait','KW','Asia','Kuwait City'),(83,'Lebanon','LB','Asia','Beirut'),(84,'Liechtenstein','LI','Europe','Vaduz'),(85,'Liberia','LR','Africa','Monrovia'),(86,'Lesotho','LS','Africa','Maseru'),(87,'Lithuania','LT','Europe','Vilnius'),(88,'Luxembourg','LU','Europe','Luxembourg City'),(89,'Latvia','LV','Europe','Riga'),(90,'Libya','LY','Africa','Tripoli'),(91,'Madagascar','MG','Africa','Antananarivo'),(92,'Marshall Islands','MH','Oceania','Majuro'),(93,'Macedonia','MK','Europe','Skopje'),(94,'Mali','ML','Africa','Bamako'),(95,'Myanmar','MM','Asia','Naypyidaw'),(96,'Mongolia','MN','Asia','Ulaanbaatar'),(97,'Mauritania','MR','Africa','Nouakchott'),(98,'Malta','MT','Europe','Valletta'),(99,'Mauritius','MU','Africa','Port Louis'),(100,'Maldives','MV','Asia','Malé'),(101,'Malawi','MW','Africa','Lilongwe'),(102,'Mexico','MX','North America','Mexico City'),(103,'Malaysia','MY','Asia','Kuala Lumpur'),(104,'Mozambique','MZ','Africa','Maputo'),(105,'Namibia','NA','Africa','Windhoek'),(106,'Niger','NE','Africa','Niamey'),(107,'Nigeria','NG','Africa','Abuja'),(108,'Nicaragua','NI','North America','Managua'),(109,'Kingdom of the Netherlands','NL','Europe','Amsterdam'),(110,'Norway','NO','Europe','Oslo'),(111,'Nepal','NP','Asia','Kathmandu'),(112,'Nauru','NR','Oceania','Yaren'),(113,'New Zealand','NZ','Oceania','Wellington'),(114,'Oman','OM','Asia','Muscat'),(115,'Panama','PA','North America','Panama City'),(116,'Peru','PE','South America','Lima'),(117,'Papua New Guinea','PG','Oceania','Port Moresby'),(118,'Philippines','PH','Asia','Manila'),(119,'Pakistan','PK','Asia','Islamabad'),(120,'Poland','PL','Europe','Warsaw'),(121,'Portugal','PT','Europe','Lisbon'),(122,'Palau','PW','Oceania','Ngerulmud'),(123,'Paraguay','PY','South America','Asunción'),(124,'Qatar','QA','Asia','Doha'),(125,'Romania','RO','Europe','Bucharest'),(126,'Russia','RU','Europe','Moscow'),(127,'Rwanda','RW','Africa','Kigali'),(128,'Saudi Arabia','SA','Asia','Riyadh'),(129,'Solomon Islands','SB','Oceania','Honiara'),(130,'Seychelles','SC','Africa','Victoria'),(131,'Sudan','SD','Africa','Khartoum'),(132,'Sweden','SE','Europe','Stockholm'),(133,'Singapore','SG','Asia','Singapore'),(134,'Slovenia','SI','Europe','Ljubljana'),(135,'Slovakia','SK','Europe','Bratislava'),(136,'Sierra Leone','SL','Africa','Freetown'),(137,'San Marino','SM','Europe','San Marino'),(138,'Senegal','SN','Africa','Dakar'),(139,'Somalia','SO','Africa','Mogadishu'),(140,'Suriname','SR','South America','Paramaribo'),(141,'São Tomé and Príncipe','ST','Africa','São Tomé'),(142,'Syria','SY','Asia','Damascus'),(143,'Togo','TG','Africa','Lomé'),(144,'Thailand','TH','Asia','Bangkok'),(145,'Tajikistan','TJ','Asia','Dushanbe'),(146,'Turkmenistan','TM','Asia','Ashgabat'),(147,'Tunisia','TN','Africa','Tunis'),(148,'Tonga','TO','Oceania','Nukuʻalofa'),(149,'Turkey','TR','Asia','Ankara'),(150,'Trinidad and Tobago','TT','North America','Port of Spain'),(151,'Tuvalu','TV','Oceania','Funafuti'),(152,'Tanzania','TZ','Africa','Dodoma'),(153,'Ukraine','UA','Europe','Kiev'),(154,'Uganda','UG','Africa','Kampala'),(155,'United States','US','North America','Washington, D.C.'),(156,'Uruguay','UY','South America','Montevideo'),(157,'Uzbekistan','UZ','Asia','Tashkent'),(158,'Vatican City','VA','Europe','Vatican City'),(159,'Venezuela','VE','South America','Caracas'),(160,'Vietnam','VN','Asia','Hanoi'),(161,'Vanuatu','VU','Oceania','Port Vila'),(162,'Yemen','YE','Asia','Sana\'a'),(163,'Zambia','ZM','Africa','Lusaka'),(164,'Zimbabwe','ZW','Africa','Harare'),(165,'Algeria','DZ','Africa','Algiers'),(166,'Bosnia and Herzegovina','BA','Europe','Sarajevo'),(167,'Cambodia','KH','Asia','Phnom Penh'),(168,'Central African Republic','CF','Africa','Bangui'),(169,'Chad','TD','Africa','N\'Djamena'),(170,'Comoros','KM','Africa','Moroni'),(171,'Croatia','HR','Europe','Zagreb'),(172,'East Timor','TL','Asia','Dili'),(173,'El Salvador','SV','North America','San Salvador'),(174,'Equatorial Guinea','GQ','Africa','Malabo'),(175,'Grenada','GD','North America','St. George\'s'),(176,'Kazakhstan','KZ','Asia','Astana'),(177,'Laos','LA','Asia','Vientiane'),(178,'Federated States of Micronesia','FM','Oceania','Palikir'),(179,'Moldova','MD','Europe','Chișinău'),(180,'Monaco','MC','Europe','Monaco'),(181,'Montenegro','ME','Europe','Podgorica'),(182,'Morocco','MA','Africa','Rabat'),(183,'Saint Kitts and Nevis','KN','North America','Basseterre'),(184,'Saint Lucia','LC','North America','Castries'),(185,'Saint Vincent and the Grenadines','VC','North America','Kingstown'),(186,'Samoa','WS','Oceania','Apia'),(187,'Serbia','RS','Europe','Belgrade'),(188,'South Africa','ZA','Africa','Pretoria'),(189,'Spain','ES','Europe','Madrid'),(190,'Sri Lanka','LK','Asia','Sri Jayewardenepura Kotte'),(191,'Swaziland','SZ','Africa','Mbabane'),(192,'Switzerland','CH','Europe','Bern'),(193,'United Arab Emirates','AE','Asia','Abu Dhabi'),(194,'United Kingdom','GB','Europe','London');
/*!40000 ALTER TABLE `cms_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_methodology`
--

DROP TABLE IF EXISTS `cms_methodology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_methodology` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_methodology`
--

LOCK TABLES `cms_methodology` WRITE;
/*!40000 ALTER TABLE `cms_methodology` DISABLE KEYS */;
INSERT INTO `cms_methodology` VALUES (1,'Technical '),(2,'Fundamental'),(3,'Hybrid'),(4,'Systematic'),(5,'Psychological'),(6,'Risk Management');
/*!40000 ALTER TABLE `cms_methodology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_option`
--

DROP TABLE IF EXISTS `cms_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_option_slug_c198708b` (`slug`),
  KEY `cms_option_attribute_id_bfc838a4` (`attribute_id`),
  CONSTRAINT `cms_option_attribute_id_bfc838a4_fk_cms_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `cms_attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_option`
--

LOCK TABLES `cms_option` WRITE;
/*!40000 ALTER TABLE `cms_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_paymentmethod`
--

DROP TABLE IF EXISTS `cms_paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_paymentmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_paymentmethod`
--

LOCK TABLES `cms_paymentmethod` WRITE;
/*!40000 ALTER TABLE `cms_paymentmethod` DISABLE KEYS */;
INSERT INTO `cms_paymentmethod` VALUES (1,'ACH Trasfer'),(2,'Alertpay'),(3,'AliPay'),(4,'Bank Wire'),(5,'Bitcoin'),(6,'BPay'),(7,'BPS'),(8,'Cash'),(9,'cashU'),(10,'Check'),(11,'Credit Card'),(12,'Debit Card'),(13,'e-gold'),(14,'FasaPay'),(15,'iDeal'),(16,'Internal Transfer'),(17,'Local Transfer'),(18,'Mayzus FS'),(19,'Money Order'),(20,'Money Polo'),(21,'MoneyGram'),(22,'Netbank'),(23,'Neteller'),(24,'Okpay'),(25,'Online Check'),(26,'Paypal'),(27,'Payza'),(28,'Perfect Money'),(29,'Qiwi'),(30,'Skrill '),(31,'Sofort Banking'),(32,'TrustPay'),(33,'UnionPay'),(34,'WebMoney'),(35,'WeChat Pay'),(36,'Western Union');
/*!40000 ALTER TABLE `cms_paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_platformsupported`
--

DROP TABLE IF EXISTS `cms_platformsupported`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_platformsupported` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_platformsupported`
--

LOCK TABLES `cms_platformsupported` WRITE;
/*!40000 ALTER TABLE `cms_platformsupported` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_platformsupported` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pricingmodel`
--

DROP TABLE IF EXISTS `cms_pricingmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pricingmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pricingmodel`
--

LOCK TABLES `cms_pricingmodel` WRITE;
/*!40000 ALTER TABLE `cms_pricingmodel` DISABLE KEYS */;
INSERT INTO `cms_pricingmodel` VALUES (1,'Buy Once'),(2,'Subscription'),(3,'Membership');
/*!40000 ALTER TABLE `cms_pricingmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_product`
--

DROP TABLE IF EXISTS `cms_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `slug` varchar(50) NOT NULL,
  `affiliate_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `affiliate_id` (`affiliate_id`),
  KEY `cms_product_service_id_77729560_fk_cms_service_id` (`service_id`),
  KEY `cms_product_slug_592747a2` (`slug`),
  CONSTRAINT `cms_product_affiliate_id_744626e0_fk_cms_affiliate_id` FOREIGN KEY (`affiliate_id`) REFERENCES `cms_affiliate` (`id`),
  CONSTRAINT `cms_product_service_id_77729560_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_product`
--

LOCK TABLES `cms_product` WRITE;
/*!40000 ALTER TABLE `cms_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_regulation`
--

DROP TABLE IF EXISTS `cms_regulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_regulation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `description` varchar(500) NOT NULL,
  `link` varchar(200) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_regulation_location_id_235d1120_fk_cms_location_id` (`location_id`),
  CONSTRAINT `cms_regulation_location_id_235d1120_fk_cms_location_id` FOREIGN KEY (`location_id`) REFERENCES `cms_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_regulation`
--

LOCK TABLES `cms_regulation` WRITE;
/*!40000 ALTER TABLE `cms_regulation` DISABLE KEYS */;
INSERT INTO `cms_regulation` VALUES (1,'FCA','The Financial Conduct Authority','https://www.fca.org.uk/',194),(2,'CNV','The Stock Market National Committee','https://www.fca.org.uk/',194),(3,'ASIC','Australian Securities and Investments Commission','https://www.fca.org.uk/',194),(4,'APRA','Australian Prudential Regulation Authority','https://www.fca.org.uk/',194),(5,'AUSTRAC','AUSTRAC - Australian Transaction Report and Analysis Centre','https://www.fca.org.uk/',194),(6,'FMA','Financial Market Authority','https://www.fca.org.uk/',194),(7,'SCB','Securities Commission of The Bahamas','https://www.fca.org.uk/',194),(8,'CBB','Central Bank of Bahrain','https://www.fca.org.uk/',194),(9,'FSMA','Financial Services and Markets Authority','https://www.fca.org.uk/',194),(10,'IFSC','International Financial Services Commission','https://www.fca.org.uk/',194),(11,'NBFIRA','Non-Bank Financial Institutions Regulatory Authority','https://www.fca.org.uk/',194),(12,'CVM','Securities and Exchange Commission of Brazil','https://www.fca.org.uk/',194),(13,'FSC','Financial Services Commission','https://www.fca.org.uk/',194),(14,'BNB','Bulgarian National Bank','https://www.fca.org.uk/',194),(15,'IIROC','Investment Industry Regulatory Organization of Canada','https://www.fca.org.uk/',194),(16,'CIPF','Canadian Investor Protection Fund','https://www.fca.org.uk/',194),(17,'CIMA','Cayman Islands Monetary Authority','https://www.fca.org.uk/',194),(18,'CSRC','China Securities Regulatory Commission','https://www.fca.org.uk/',194),(19,'FSCEY','Financial Supervisory Commission','https://www.fca.org.uk/',194),(20,'HANFA','Croatian Financial Services Supervisory Agency','https://www.fca.org.uk/',194),(21,'CySEC','Cyprus Securities and Exchange Commission','https://www.fca.org.uk/',194),(22,'CNB','Czech National Bank','https://www.fca.org.uk/',194),(23,'DFSA','Financial Supervision Authority','https://www.fca.org.uk/',194),(24,'EFSA','Egyptian Financial Supervisory Authority','https://www.fca.org.uk/',194),(25,'FSAEE','Financial Supervision Authority','https://www.fca.org.uk/',194),(26,'MKM','Ministry of Economic Affairs and Communications','https://www.fca.org.uk/',194),(27,'FINFSA','Financial Supervision Authority','https://www.fca.org.uk/',194),(28,'AMF','Financial Markets Authority','https://www.fca.org.uk/',194),(29,'CECEI','Credit Institutions and Investment Firms Committee','https://www.fca.org.uk/',194),(30,'REGAFI','The Financial Firms Register','https://www.fca.org.uk/',194),(31,'ACPR','The Prudential Control and Resolution Authority','https://www.fca.org.uk/',194),(32,'BaFin','Federal Financial Supervisory Authority','https://www.fca.org.uk/',194),(33,'FSC','Financial Services Commission','https://www.fca.org.uk/',194),(34,'CMC','Capital Markets Commission','https://www.fca.org.uk/',194),(35,'SFC','The Securities and Futures Commission','https://www.fca.org.uk/',194),(36,'FinCom','The Financial Commission','https://www.fca.org.uk/',194),(37,'HFSA','Hungarian Financial Supervisory Authority','https://www.fca.org.uk/',194),(38,'CBH','Central Bank of Hungary','https://www.fca.org.uk/',194),(39,'SEBI','Securities and Exchange Board of India','https://www.fca.org.uk/',194),(40,'CDSL','Central Depository Services Limited','https://www.fca.org.uk/',194),(41,'NSDL','National Securities Depository','https://www.fca.org.uk/',194),(42,'CoFTRA','Commodity Futures Trading Regulatory Agency','https://www.fca.org.uk/',194),(43,'CBI','Central Bank of Ireland','https://www.fca.org.uk/',194),(44,'ISA','Israel Securities Authority','https://www.fca.org.uk/',194),(45,'CONSOB','National Commission for Companies and the Stock Exchange','https://www.fca.org.uk/',194),(46,'FSC','Financial Services Commission','https://www.fca.org.uk/',194),(47,'JSDA','Japan Securities Dealers Association','https://www.fca.org.uk/',194),(48,'FSA','Financial Services Agency','https://www.fca.org.uk/',194),(49,'JSC','Jordan Securities Commission','https://www.fca.org.uk/',194),(50,'CMA','Kenya Capital Markets Authority','https://www.fca.org.uk/',194),(51,'KCCI','Kuwait Chamber of Commerce & Industry','https://www.fca.org.uk/',194),(52,'FCMC','Financial and Capital Market Commission','https://www.fca.org.uk/',194),(53,'BDL','Central bank of Lebanon','https://www.fca.org.uk/',194),(54,'AFE','The Arab Federation of Exchanges','https://www.fca.org.uk/',194),(55,'LSC','Lithuanian Securities Commission','https://www.fca.org.uk/',194),(56,'CSSF','Commission de Surveillance du Secteur Financier','https://www.fca.org.uk/',194),(57,'MFSA','Malta Financial Services Authority','https://www.fca.org.uk/',194),(58,'FSC','Financial Services Commission','https://www.fca.org.uk/',194),(59,'CNBV','Comision Nacional Bancaria y de Valores','https://www.fca.org.uk/',194),(60,'CDVM','Moroccan Financial markets Authority','https://www.fca.org.uk/',194),(61,'AFM','Financial Markets Authority','https://www.fca.org.uk/',194),(62,'FSPR','Financial Service Providers Register','https://www.fca.org.uk/',194),(63,'NZX','NZX Regulation','https://www.fca.org.uk/',194),(64,'FDRS','Financial Dispute Resolution Service','https://www.fca.org.uk/',194),(65,'CIMA','Cayman Islands Monetary Authority','https://www.fca.org.uk/',194),(66,'NFSA','The Financial Supervisory Authority Of Norway','https://www.fca.org.uk/',194),(67,'SEC','Pakistan Securities and Exchange Commission','https://www.fca.org.uk/',194),(68,'SMV','Superintendence of Securities','https://www.fca.org.uk/',194),(69,'SEC','Philippines Securities and Exchange Commission','https://www.fca.org.uk/',194),(70,'PFSA','Polish Financial Supervision Authority','https://www.fca.org.uk/',194),(71,'CMVM','Portuguese Securities Market Commission','https://www.fca.org.uk/',194),(72,'QCB','Qatar Central Bank','https://www.fca.org.uk/',194),(73,'CNVMR','Romanian National Securities Commission','https://www.fca.org.uk/',194),(74,'FCSM','Federal Commission of Securities Market','https://www.fca.org.uk/',194),(75,'CRFIN','Centre for Regulation in OTC Financial Instruments and Technologies','https://www.fca.org.uk/',194),(76,'Naufor','Naufor - Russian national Association Of Securities Market Participants','https://www.fca.org.uk/',194),(77,'CROFR','Financial Market Relations Regulation Center','https://www.fca.org.uk/',194),(78,'CBR','Central Bank of the Russian Federation','https://www.fca.org.uk/',194),(79,'ARB','Association of Russian Banks','https://www.fca.org.uk/',194),(80,'ASROS','Association of Regional Banks of Russia','https://www.fca.org.uk/',194),(81,'CROFR ','Center for Regulatory Relations in The Financial Markets','https://www.fca.org.uk/',194),(82,'SVGFSA','Financial Services Authority','https://www.fca.org.uk/',194),(83,'CMA','Capital Market Authority','https://www.fca.org.uk/',194),(84,'MAS','Monetary Authority of Singapore','https://www.fca.org.uk/',194),(85,'FSB','Financial Services Board','https://www.fca.org.uk/',194),(86,'CNMV','Spanish Securities Market Commission','https://www.fca.org.uk/',194),(87,'CBSL','Central Bank of Sri Lanka','https://www.fca.org.uk/',194),(88,'SEC','Securities And Exchange commission of Sri Lanka','https://www.fca.org.uk/',194),(89,'FSA','Financial Supervisory Authority','https://www.fca.org.uk/',194),(90,'FINMA','Financial Market Supervisory Authority','https://www.fca.org.uk/',194),(91,'SFSA','Seychelles Financial Services Authority','https://www.fca.org.uk/',194),(92,'SCB','The Siam Commercial Bank Public Company','https://www.fca.org.uk/',194),(93,'BOT','Bank Of Thailand','https://www.fca.org.uk/',194),(94,'CMB [SPK]','Capital Markets Board of Turkey','https://www.fca.org.uk/',194),(95,'NSSMC','National Securities and Stock Market Commission','https://www.fca.org.uk/',194),(96,'UCRFIN','Ukrainian Centre for OTC Financial Instruments and Technologies Development','https://www.fca.org.uk/',194),(97,'DFSA','Dubai Financial Services Authority','https://www.fca.org.uk/',194),(98,'UAE Central Bank','Central Bank of the U.A.E','https://www.fca.org.uk/',194),(99,'SCA','Emirates Securities and Commodities Authority','https://www.fca.org.uk/',194),(100,'VFSC','Vanuatu Financial Services Commission','https://www.fca.org.uk/',194),(101,'FSA','Financial Services Authority','https://www.fca.org.uk/',194),(102,'CFTC','U.S. Commodity Futures Trading Commission','https://www.fca.org.uk/',194),(103,'FINRA','Financial Industry Regulatory Authority','https://www.fca.org.uk/',194),(104,'NFA','National Futures Association','https://www.fca.org.uk/',194),(105,'SEC','Securities and Exchange Commission','https://www.fca.org.uk/',194),(106,'SIPC','Securities Investor Protection Corporation','https://www.fca.org.uk/',194),(107,'FDIC','Federal Deposit Insurance Corporation','https://www.fca.org.uk/',194),(108,'FATCA','Foreign Account Tax Compliance Act','https://www.fca.org.uk/',194);
/*!40000 ALTER TABLE `cms_regulation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_revenuemodel`
--

DROP TABLE IF EXISTS `cms_revenuemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_revenuemodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_revenuemodel`
--

LOCK TABLES `cms_revenuemodel` WRITE;
/*!40000 ALTER TABLE `cms_revenuemodel` DISABLE KEYS */;
INSERT INTO `cms_revenuemodel` VALUES (1,'Fixed Spread'),(2,'Flexible Spread'),(3,'Commission');
/*!40000 ALTER TABLE `cms_revenuemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service`
--

DROP TABLE IF EXISTS `cms_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `premium` tinyint(1) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `founded` int(11) DEFAULT NULL,
  `accept_us_clients` tinyint(1) NOT NULL,
  `accept_eu_clients` tinyint(1) NOT NULL,
  `ea_robots` tinyint(1) NOT NULL,
  `scalping` tinyint(1) NOT NULL,
  `hedging` tinyint(1) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(500) DEFAULT NULL,
  `office_address` varchar(500) DEFAULT NULL,
  `instructor` varchar(500) DEFAULT NULL,
  `frequency` varchar(500) DEFAULT NULL,
  `minimum_deposit` varchar(20) NOT NULL,
  `commission` varchar(20) NOT NULL,
  `leverage` varchar(20) NOT NULL,
  `spread` varchar(20) NOT NULL,
  `swap_free` tinyint(1) NOT NULL,
  `islamic_accounts` tinyint(1) NOT NULL,
  `bonus_policy` tinyint(1) NOT NULL,
  `about` longtext,
  `affiliate_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `logo_id` int(11) DEFAULT NULL,
  `preview_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `timezone_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_service_affiliate_id_2d5f5356_fk_cms_affiliate_id` (`affiliate_id`),
  KEY `cms_service_category_id_25839cb6_fk_cms_category_id` (`category_id`),
  KEY `cms_service_logo_id_3f889414_fk_wagtailimages_image_id` (`logo_id`),
  KEY `cms_service_preview_id_f182e025_fk_wagtailimages_image_id` (`preview_id`),
  KEY `cms_service_slug_55272fe2` (`slug`),
  KEY `cms_service_status_id_e2614e33_fk_cms_status_id` (`status_id`),
  KEY `cms_service_timezone_id_ebd61c1d_fk_cms_timezone_id` (`timezone_id`),
  CONSTRAINT `cms_service_affiliate_id_2d5f5356_fk_cms_affiliate_id` FOREIGN KEY (`affiliate_id`) REFERENCES `cms_affiliate` (`id`),
  CONSTRAINT `cms_service_category_id_25839cb6_fk_cms_category_id` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`id`),
  CONSTRAINT `cms_service_logo_id_3f889414_fk_wagtailimages_image_id` FOREIGN KEY (`logo_id`) REFERENCES `wagtailimages_image` (`id`),
  CONSTRAINT `cms_service_preview_id_f182e025_fk_wagtailimages_image_id` FOREIGN KEY (`preview_id`) REFERENCES `wagtailimages_image` (`id`),
  CONSTRAINT `cms_service_status_id_e2614e33_fk_cms_status_id` FOREIGN KEY (`status_id`) REFERENCES `cms_status` (`id`),
  CONSTRAINT `cms_service_timezone_id_ebd61c1d_fk_cms_timezone_id` FOREIGN KEY (`timezone_id`) REFERENCES `cms_timezone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service`
--

LOCK TABLES `cms_service` WRITE;
/*!40000 ALTER TABLE `cms_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_account_currency`
--

DROP TABLE IF EXISTS `cms_service_account_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_account_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `accountcurrency_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_account_curr_service_id_accountcurren_e5425350_uniq` (`service_id`,`accountcurrency_id`),
  KEY `cms_service_account__accountcurrency_id_81e8ec52_fk_cms_accou` (`accountcurrency_id`),
  CONSTRAINT `cms_service_account__accountcurrency_id_81e8ec52_fk_cms_accou` FOREIGN KEY (`accountcurrency_id`) REFERENCES `cms_accountcurrency` (`id`),
  CONSTRAINT `cms_service_account__service_id_feafd52f_fk_cms_servi` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_account_currency`
--

LOCK TABLES `cms_service_account_currency` WRITE;
/*!40000 ALTER TABLE `cms_service_account_currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_account_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_account_options`
--

DROP TABLE IF EXISTS `cms_service_account_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_account_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `accountoption_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_account_opti_service_id_accountoption_e199ce8b_uniq` (`service_id`,`accountoption_id`),
  KEY `cms_service_account__accountoption_id_7b296883_fk_cms_accou` (`accountoption_id`),
  CONSTRAINT `cms_service_account__accountoption_id_7b296883_fk_cms_accou` FOREIGN KEY (`accountoption_id`) REFERENCES `cms_accountoption` (`id`),
  CONSTRAINT `cms_service_account__service_id_d9d977a5_fk_cms_servi` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_account_options`
--

LOCK TABLES `cms_service_account_options` WRITE;
/*!40000 ALTER TABLE `cms_service_account_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_account_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_account_types`
--

DROP TABLE IF EXISTS `cms_service_account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_account_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `accounttype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_account_type_service_id_accounttype_i_4970f952_uniq` (`service_id`,`accounttype_id`),
  KEY `cms_service_account__accounttype_id_0fbe39db_fk_cms_accou` (`accounttype_id`),
  CONSTRAINT `cms_service_account__accounttype_id_0fbe39db_fk_cms_accou` FOREIGN KEY (`accounttype_id`) REFERENCES `cms_accounttype` (`id`),
  CONSTRAINT `cms_service_account_types_service_id_e700030e_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_account_types`
--

LOCK TABLES `cms_service_account_types` WRITE;
/*!40000 ALTER TABLE `cms_service_account_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_attributes`
--

DROP TABLE IF EXISTS `cms_service_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_attributes_service_id_attribute_id_98169354_uniq` (`service_id`,`attribute_id`),
  KEY `cms_service_attributes_attribute_id_3e58a532_fk_cms_attribute_id` (`attribute_id`),
  CONSTRAINT `cms_service_attributes_attribute_id_3e58a532_fk_cms_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `cms_attribute` (`id`),
  CONSTRAINT `cms_service_attributes_service_id_a5ecf101_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_attributes`
--

LOCK TABLES `cms_service_attributes` WRITE;
/*!40000 ALTER TABLE `cms_service_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_broker_type`
--

DROP TABLE IF EXISTS `cms_service_broker_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_broker_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `brokertype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_broker_type_service_id_brokertype_id_e90e4bdc_uniq` (`service_id`,`brokertype_id`),
  KEY `cms_service_broker_t_brokertype_id_f22fcafb_fk_cms_broke` (`brokertype_id`),
  CONSTRAINT `cms_service_broker_t_brokertype_id_f22fcafb_fk_cms_broke` FOREIGN KEY (`brokertype_id`) REFERENCES `cms_brokertype` (`id`),
  CONSTRAINT `cms_service_broker_type_service_id_06e8dff0_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_broker_type`
--

LOCK TABLES `cms_service_broker_type` WRITE;
/*!40000 ALTER TABLE `cms_service_broker_type` DISABLE KEYS */;
INSERT INTO `cms_service_broker_type` VALUES (4,1,1),(1,1,2),(2,1,3);
/*!40000 ALTER TABLE `cms_service_broker_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_chat`
--

DROP TABLE IF EXISTS `cms_service_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_chat_service_id_chat_id_df11ab93_uniq` (`service_id`,`chat_id`),
  KEY `cms_service_chat_chat_id_5e20f53f_fk_cms_chat_id` (`chat_id`),
  CONSTRAINT `cms_service_chat_chat_id_5e20f53f_fk_cms_chat_id` FOREIGN KEY (`chat_id`) REFERENCES `cms_chat` (`id`),
  CONSTRAINT `cms_service_chat_service_id_ca78a911_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_chat`
--

LOCK TABLES `cms_service_chat` WRITE;
/*!40000 ALTER TABLE `cms_service_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_international_offices`
--

DROP TABLE IF EXISTS `cms_service_international_offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_international_offices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_internationa_service_id_location_id_feecbd94_uniq` (`service_id`,`location_id`),
  KEY `cms_service_internat_location_id_46ff56cf_fk_cms_locat` (`location_id`),
  CONSTRAINT `cms_service_internat_location_id_46ff56cf_fk_cms_locat` FOREIGN KEY (`location_id`) REFERENCES `cms_location` (`id`),
  CONSTRAINT `cms_service_internat_service_id_b9fc3ddb_fk_cms_servi` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_international_offices`
--

LOCK TABLES `cms_service_international_offices` WRITE;
/*!40000 ALTER TABLE `cms_service_international_offices` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_international_offices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_license`
--

DROP TABLE IF EXISTS `cms_service_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_license` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `license_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_license_service_id_license_id_dde92f87_uniq` (`service_id`,`license_id`),
  KEY `cms_service_license_license_id_91265508_fk_cms_license_id` (`license_id`),
  CONSTRAINT `cms_service_license_license_id_91265508_fk_cms_license_id` FOREIGN KEY (`license_id`) REFERENCES `cms_license` (`id`),
  CONSTRAINT `cms_service_license_service_id_6b5e2e8e_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_license`
--

LOCK TABLES `cms_service_license` WRITE;
/*!40000 ALTER TABLE `cms_service_license` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_location`
--

DROP TABLE IF EXISTS `cms_service_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_location_service_id_location_id_d8646886_uniq` (`service_id`,`location_id`),
  KEY `cms_service_location_location_id_f0d75530_fk_cms_location_id` (`location_id`),
  CONSTRAINT `cms_service_location_location_id_f0d75530_fk_cms_location_id` FOREIGN KEY (`location_id`) REFERENCES `cms_location` (`id`),
  CONSTRAINT `cms_service_location_service_id_83a722b7_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_location`
--

LOCK TABLES `cms_service_location` WRITE;
/*!40000 ALTER TABLE `cms_service_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_methodology`
--

DROP TABLE IF EXISTS `cms_service_methodology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_methodology` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `methodology_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_methodology_service_id_methodology_id_58d5d7ff_uniq` (`service_id`,`methodology_id`),
  KEY `cms_service_methodol_methodology_id_96769f4b_fk_cms_metho` (`methodology_id`),
  CONSTRAINT `cms_service_methodol_methodology_id_96769f4b_fk_cms_metho` FOREIGN KEY (`methodology_id`) REFERENCES `cms_methodology` (`id`),
  CONSTRAINT `cms_service_methodology_service_id_41d4eaca_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_methodology`
--

LOCK TABLES `cms_service_methodology` WRITE;
/*!40000 ALTER TABLE `cms_service_methodology` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_methodology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_payment_method`
--

DROP TABLE IF EXISTS `cms_service_payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_payment_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `paymentmethod_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_payment_meth_service_id_paymentmethod_1464338d_uniq` (`service_id`,`paymentmethod_id`),
  KEY `cms_service_payment__paymentmethod_id_f67d1e97_fk_cms_payme` (`paymentmethod_id`),
  CONSTRAINT `cms_service_payment__paymentmethod_id_f67d1e97_fk_cms_payme` FOREIGN KEY (`paymentmethod_id`) REFERENCES `cms_paymentmethod` (`id`),
  CONSTRAINT `cms_service_payment_method_service_id_11b30f40_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_payment_method`
--

LOCK TABLES `cms_service_payment_method` WRITE;
/*!40000 ALTER TABLE `cms_service_payment_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_platforms_supported`
--

DROP TABLE IF EXISTS `cms_service_platforms_supported`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_platforms_supported` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `platformsupported_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_platforms_su_service_id_platformsuppo_49a5db8f_uniq` (`service_id`,`platformsupported_id`),
  KEY `cms_service_platform_platformsupported_id_2440a6e6_fk_cms_platf` (`platformsupported_id`),
  CONSTRAINT `cms_service_platform_platformsupported_id_2440a6e6_fk_cms_platf` FOREIGN KEY (`platformsupported_id`) REFERENCES `cms_platformsupported` (`id`),
  CONSTRAINT `cms_service_platform_service_id_083ce25d_fk_cms_servi` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_platforms_supported`
--

LOCK TABLES `cms_service_platforms_supported` WRITE;
/*!40000 ALTER TABLE `cms_service_platforms_supported` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_platforms_supported` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_pricing_model`
--

DROP TABLE IF EXISTS `cms_service_pricing_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_pricing_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `pricingmodel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_pricing_mode_service_id_pricingmodel__590dc34b_uniq` (`service_id`,`pricingmodel_id`),
  KEY `cms_service_pricing__pricingmodel_id_4b00351c_fk_cms_prici` (`pricingmodel_id`),
  CONSTRAINT `cms_service_pricing__pricingmodel_id_4b00351c_fk_cms_prici` FOREIGN KEY (`pricingmodel_id`) REFERENCES `cms_pricingmodel` (`id`),
  CONSTRAINT `cms_service_pricing_model_service_id_52204bde_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_pricing_model`
--

LOCK TABLES `cms_service_pricing_model` WRITE;
/*!40000 ALTER TABLE `cms_service_pricing_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_pricing_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_regulation`
--

DROP TABLE IF EXISTS `cms_service_regulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_regulation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `regulation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_regulation_service_id_regulation_id_ca45c16d_uniq` (`service_id`,`regulation_id`),
  KEY `cms_service_regulati_regulation_id_45a073e3_fk_cms_regul` (`regulation_id`),
  CONSTRAINT `cms_service_regulati_regulation_id_45a073e3_fk_cms_regul` FOREIGN KEY (`regulation_id`) REFERENCES `cms_regulation` (`id`),
  CONSTRAINT `cms_service_regulation_service_id_3d7c4315_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_regulation`
--

LOCK TABLES `cms_service_regulation` WRITE;
/*!40000 ALTER TABLE `cms_service_regulation` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_regulation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_required_software`
--

DROP TABLE IF EXISTS `cms_service_required_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_required_software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `tradingsoftware_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_required_sof_service_id_tradingsoftwa_da7d8bf5_uniq` (`service_id`,`tradingsoftware_id`),
  KEY `cms_service_required_tradingsoftware_id_060ef7e0_fk_cms_tradi` (`tradingsoftware_id`),
  CONSTRAINT `cms_service_required_service_id_cdbf81b4_fk_cms_servi` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`),
  CONSTRAINT `cms_service_required_tradingsoftware_id_060ef7e0_fk_cms_tradi` FOREIGN KEY (`tradingsoftware_id`) REFERENCES `cms_tradingsoftware` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_required_software`
--

LOCK TABLES `cms_service_required_software` WRITE;
/*!40000 ALTER TABLE `cms_service_required_software` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_required_software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_revenue_model`
--

DROP TABLE IF EXISTS `cms_service_revenue_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_revenue_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `revenuemodel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_revenue_mode_service_id_revenuemodel__34a0a26e_uniq` (`service_id`,`revenuemodel_id`),
  KEY `cms_service_revenue__revenuemodel_id_e1cdd6e3_fk_cms_reven` (`revenuemodel_id`),
  CONSTRAINT `cms_service_revenue__revenuemodel_id_e1cdd6e3_fk_cms_reven` FOREIGN KEY (`revenuemodel_id`) REFERENCES `cms_revenuemodel` (`id`),
  CONSTRAINT `cms_service_revenue_model_service_id_b0c2bdfa_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_revenue_model`
--

LOCK TABLES `cms_service_revenue_model` WRITE;
/*!40000 ALTER TABLE `cms_service_revenue_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_revenue_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_signal_alerts`
--

DROP TABLE IF EXISTS `cms_service_signal_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_signal_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `signalalert_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_signal_alert_service_id_signalalert_i_34c15446_uniq` (`service_id`,`signalalert_id`),
  KEY `cms_service_signal_a_signalalert_id_127f0cad_fk_cms_signa` (`signalalert_id`),
  CONSTRAINT `cms_service_signal_a_signalalert_id_127f0cad_fk_cms_signa` FOREIGN KEY (`signalalert_id`) REFERENCES `cms_signalalert` (`id`),
  CONSTRAINT `cms_service_signal_alerts_service_id_e506e5a4_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_signal_alerts`
--

LOCK TABLES `cms_service_signal_alerts` WRITE;
/*!40000 ALTER TABLE `cms_service_signal_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_signal_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_support_languages`
--

DROP TABLE IF EXISTS `cms_service_support_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_support_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `supportedlanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_support_lang_service_id_supportedlang_6f3f4407_uniq` (`service_id`,`supportedlanguage_id`),
  KEY `cms_service_support__supportedlanguage_id_7c045971_fk_cms_suppo` (`supportedlanguage_id`),
  CONSTRAINT `cms_service_support__service_id_ca60c95e_fk_cms_servi` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`),
  CONSTRAINT `cms_service_support__supportedlanguage_id_7c045971_fk_cms_suppo` FOREIGN KEY (`supportedlanguage_id`) REFERENCES `cms_supportedlanguage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_support_languages`
--

LOCK TABLES `cms_service_support_languages` WRITE;
/*!40000 ALTER TABLE `cms_service_support_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_support_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_system_type`
--

DROP TABLE IF EXISTS `cms_service_system_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_system_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `systemtype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_system_type_service_id_systemtype_id_bd8bb50d_uniq` (`service_id`,`systemtype_id`),
  KEY `cms_service_system_t_systemtype_id_44f65211_fk_cms_syste` (`systemtype_id`),
  CONSTRAINT `cms_service_system_t_systemtype_id_44f65211_fk_cms_syste` FOREIGN KEY (`systemtype_id`) REFERENCES `cms_systemtype` (`id`),
  CONSTRAINT `cms_service_system_type_service_id_86164e8f_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_system_type`
--

LOCK TABLES `cms_service_system_type` WRITE;
/*!40000 ALTER TABLE `cms_service_system_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_system_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_trading_instruments`
--

DROP TABLE IF EXISTS `cms_service_trading_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_trading_instruments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `tradinginstrument_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_trading_inst_service_id_tradinginstru_40bcc7a9_uniq` (`service_id`,`tradinginstrument_id`),
  KEY `cms_service_trading__tradinginstrument_id_5b7f9bfa_fk_cms_tradi` (`tradinginstrument_id`),
  CONSTRAINT `cms_service_trading__service_id_5bb6f3c0_fk_cms_servi` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`),
  CONSTRAINT `cms_service_trading__tradinginstrument_id_5b7f9bfa_fk_cms_tradi` FOREIGN KEY (`tradinginstrument_id`) REFERENCES `cms_tradinginstrument` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_trading_instruments`
--

LOCK TABLES `cms_service_trading_instruments` WRITE;
/*!40000 ALTER TABLE `cms_service_trading_instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_trading_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_trading_software`
--

DROP TABLE IF EXISTS `cms_service_trading_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_trading_software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `tradingsoftware_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_trading_soft_service_id_tradingsoftwa_e29b8675_uniq` (`service_id`,`tradingsoftware_id`),
  KEY `cms_service_trading__tradingsoftware_id_1c4c8477_fk_cms_tradi` (`tradingsoftware_id`),
  CONSTRAINT `cms_service_trading__service_id_aedfc3fc_fk_cms_servi` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`),
  CONSTRAINT `cms_service_trading__tradingsoftware_id_1c4c8477_fk_cms_tradi` FOREIGN KEY (`tradingsoftware_id`) REFERENCES `cms_tradingsoftware` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_trading_software`
--

LOCK TABLES `cms_service_trading_software` WRITE;
/*!40000 ALTER TABLE `cms_service_trading_software` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_trading_software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_trading_type`
--

DROP TABLE IF EXISTS `cms_service_trading_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_trading_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `tradingtype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_trading_type_service_id_tradingtype_id_aa3c0cee_uniq` (`service_id`,`tradingtype_id`),
  KEY `cms_service_trading__tradingtype_id_d6a78ef5_fk_cms_tradi` (`tradingtype_id`),
  CONSTRAINT `cms_service_trading__tradingtype_id_d6a78ef5_fk_cms_tradi` FOREIGN KEY (`tradingtype_id`) REFERENCES `cms_tradingtype` (`id`),
  CONSTRAINT `cms_service_trading_type_service_id_40c77eb7_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_trading_type`
--

LOCK TABLES `cms_service_trading_type` WRITE;
/*!40000 ALTER TABLE `cms_service_trading_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_trading_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_training_courses`
--

DROP TABLE IF EXISTS `cms_service_training_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_training_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `trainingcourse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_training_cou_service_id_trainingcours_8ec44cd3_uniq` (`service_id`,`trainingcourse_id`),
  KEY `cms_service_training_trainingcourse_id_0de073cc_fk_cms_train` (`trainingcourse_id`),
  CONSTRAINT `cms_service_training_service_id_398d63aa_fk_cms_servi` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`),
  CONSTRAINT `cms_service_training_trainingcourse_id_0de073cc_fk_cms_train` FOREIGN KEY (`trainingcourse_id`) REFERENCES `cms_trainingcourse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_training_courses`
--

LOCK TABLES `cms_service_training_courses` WRITE;
/*!40000 ALTER TABLE `cms_service_training_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_training_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_training_tools`
--

DROP TABLE IF EXISTS `cms_service_training_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_training_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `trainingtool_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_training_too_service_id_trainingtool__86ca4cd6_uniq` (`service_id`,`trainingtool_id`),
  KEY `cms_service_training_trainingtool_id_bcb7d94e_fk_cms_train` (`trainingtool_id`),
  CONSTRAINT `cms_service_training_tools_service_id_5ae85551_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`),
  CONSTRAINT `cms_service_training_trainingtool_id_bcb7d94e_fk_cms_train` FOREIGN KEY (`trainingtool_id`) REFERENCES `cms_trainingtool` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_training_tools`
--

LOCK TABLES `cms_service_training_tools` WRITE;
/*!40000 ALTER TABLE `cms_service_training_tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_training_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_training_type`
--

DROP TABLE IF EXISTS `cms_service_training_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_training_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `trainingtype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_training_typ_service_id_trainingtype__b748e129_uniq` (`service_id`,`trainingtype_id`),
  KEY `cms_service_training_trainingtype_id_4e1965d1_fk_cms_train` (`trainingtype_id`),
  CONSTRAINT `cms_service_training_trainingtype_id_4e1965d1_fk_cms_train` FOREIGN KEY (`trainingtype_id`) REFERENCES `cms_trainingtype` (`id`),
  CONSTRAINT `cms_service_training_type_service_id_f36c00d5_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_training_type`
--

LOCK TABLES `cms_service_training_type` WRITE;
/*!40000 ALTER TABLE `cms_service_training_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_training_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_servicepage`
--

DROP TABLE IF EXISTS `cms_servicepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_servicepage` (
  `page_ptr_id` int(11) NOT NULL,
  `body` longtext NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `cms_servicepage_page_ptr_id_1a15dd0a_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_servicepage`
--

LOCK TABLES `cms_servicepage` WRITE;
/*!40000 ALTER TABLE `cms_servicepage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_servicepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_signalalert`
--

DROP TABLE IF EXISTS `cms_signalalert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_signalalert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_signalalert`
--

LOCK TABLES `cms_signalalert` WRITE;
/*!40000 ALTER TABLE `cms_signalalert` DISABLE KEYS */;
INSERT INTO `cms_signalalert` VALUES (1,'Email'),(2,'SMS'),(3,'Whatsapp'),(4,'chat');
/*!40000 ALTER TABLE `cms_signalalert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_status`
--

DROP TABLE IF EXISTS `cms_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_status`
--

LOCK TABLES `cms_status` WRITE;
/*!40000 ALTER TABLE `cms_status` DISABLE KEYS */;
INSERT INTO `cms_status` VALUES (1,'Forex Broker'),(2,'Social Copy Trading'),(3,'Banking Institution'),(4,'White label Broker'),(5,'Introducing Broker'),(6,'Out of Business'),(7,'Suspicious'),(8,'Training Provider');
/*!40000 ALTER TABLE `cms_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_supportedlanguage`
--

DROP TABLE IF EXISTS `cms_supportedlanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_supportedlanguage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_supportedlanguage`
--

LOCK TABLES `cms_supportedlanguage` WRITE;
/*!40000 ALTER TABLE `cms_supportedlanguage` DISABLE KEYS */;
INSERT INTO `cms_supportedlanguage` VALUES (1,'English'),(2,'Spanish'),(3,'French'),(4,'German'),(5,'Portuguese'),(6,'Japanese'),(7,'Italian'),(8,'Greek'),(9,'Russian'),(10,'Hebrew'),(11,'Mandarin'),(12,'Chinese'),(13,'Bangla'),(14,'Estonian'),(15,'Polish'),(16,'Indonesian'),(17,'Malay'),(18,'Lithuanian'),(19,'Thai'),(20,'Arabic'),(21,'Vietnamese'),(22,'Korean'),(23,'Tamil'),(24,'Hungarian'),(25,'Dutch'),(26,'Bulgarian'),(27,'Swedish'),(28,'Urdu'),(29,'Hindi'),(30,'Farsi'),(31,'Czech'),(32,'Slovak'),(33,'Slovene'),(34,'Serbian'),(35,'Croatian'),(36,'Latvian'),(37,'Romanian');
/*!40000 ALTER TABLE `cms_supportedlanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_systemtype`
--

DROP TABLE IF EXISTS `cms_systemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_systemtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_systemtype`
--

LOCK TABLES `cms_systemtype` WRITE;
/*!40000 ALTER TABLE `cms_systemtype` DISABLE KEYS */;
INSERT INTO `cms_systemtype` VALUES (1,'EA Robot'),(2,'Semi-Automated'),(3,'Fully-Automated'),(4,'Rule Based'),(5,'Indicator'),(6,'Manual');
/*!40000 ALTER TABLE `cms_systemtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_timezone`
--

DROP TABLE IF EXISTS `cms_timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_timezone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_timezone`
--

LOCK TABLES `cms_timezone` WRITE;
/*!40000 ALTER TABLE `cms_timezone` DISABLE KEYS */;
INSERT INTO `cms_timezone` VALUES (1,'GMT'),(2,'GMT+1'),(3,'GMT+2'),(4,'GMT+3'),(5,'GMT+3.5'),(6,'GMT+4'),(7,'GMT+4.5'),(8,'GMT+5'),(9,'GMT+5.5'),(10,'GMT+5.75'),(11,'GMT+6'),(12,'GMT+6.5'),(13,'GMT+7'),(14,'GMT+8'),(15,'GMT+9'),(16,'GMT+9.5'),(17,'GMT+10'),(18,'GMT+11'),(19,'GMT+12'),(20,'GMT+-12'),(21,'GMT+-11'),(22,'GMT+-10'),(23,'GMT+-9'),(24,'GMT+-8'),(25,'GMT+-7'),(26,'GMT+-6'),(27,'GMT+-5'),(28,'GMT+-4.4'),(29,'GMT+-4'),(30,'GMT+-3.5'),(31,'GMT+-3'),(32,'GMT+-2'),(33,'GMT+-1');
/*!40000 ALTER TABLE `cms_timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_tradinginstrument`
--

DROP TABLE IF EXISTS `cms_tradinginstrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_tradinginstrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_tradinginstrument`
--

LOCK TABLES `cms_tradinginstrument` WRITE;
/*!40000 ALTER TABLE `cms_tradinginstrument` DISABLE KEYS */;
INSERT INTO `cms_tradinginstrument` VALUES (1,'Stocks'),(2,'Options'),(3,'Bonds'),(4,'Futures'),(5,'Indices'),(6,'Commodities'),(7,'Energies'),(8,'Shares'),(9,'Spread Betting'),(10,'CFDs'),(11,'Binary Options'),(12,'Crypto');
/*!40000 ALTER TABLE `cms_tradinginstrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_tradingsoftware`
--

DROP TABLE IF EXISTS `cms_tradingsoftware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_tradingsoftware` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_tradingsoftware`
--

LOCK TABLES `cms_tradingsoftware` WRITE;
/*!40000 ALTER TABLE `cms_tradingsoftware` DISABLE KEYS */;
INSERT INTO `cms_tradingsoftware` VALUES (1,'Android'),(2,'iPhone'),(3,'Web'),(4,'Metatrader 4'),(5,'Metatrader 4 Special'),(6,'Metatrader 5'),(7,'Ctrader'),(8,'Ctrader Web');
/*!40000 ALTER TABLE `cms_tradingsoftware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_tradingtype`
--

DROP TABLE IF EXISTS `cms_tradingtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_tradingtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_tradingtype`
--

LOCK TABLES `cms_tradingtype` WRITE;
/*!40000 ALTER TABLE `cms_tradingtype` DISABLE KEYS */;
INSERT INTO `cms_tradingtype` VALUES (1,'Scalping'),(2,'Day Trading'),(3,'Swing Trading');
/*!40000 ALTER TABLE `cms_tradingtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_trainingcourse`
--

DROP TABLE IF EXISTS `cms_trainingcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_trainingcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_trainingcourse`
--

LOCK TABLES `cms_trainingcourse` WRITE;
/*!40000 ALTER TABLE `cms_trainingcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_trainingcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_trainingtool`
--

DROP TABLE IF EXISTS `cms_trainingtool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_trainingtool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_trainingtool`
--

LOCK TABLES `cms_trainingtool` WRITE;
/*!40000 ALTER TABLE `cms_trainingtool` DISABLE KEYS */;
INSERT INTO `cms_trainingtool` VALUES (1,'News Feeds'),(2,'Trading Indicators'),(3,'Trading System'),(4,'Premium Tools');
/*!40000 ALTER TABLE `cms_trainingtool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_trainingtype`
--

DROP TABLE IF EXISTS `cms_trainingtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_trainingtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_trainingtype`
--

LOCK TABLES `cms_trainingtype` WRITE;
/*!40000 ALTER TABLE `cms_trainingtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_trainingtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_voucher`
--

DROP TABLE IF EXISTS `cms_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `slug` varchar(50) NOT NULL,
  `affiliate_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `affiliate_id` (`affiliate_id`),
  KEY `cms_voucher_service_id_b1da0f8c_fk_cms_service_id` (`service_id`),
  KEY `cms_voucher_slug_c52a7f6a` (`slug`),
  CONSTRAINT `cms_voucher_affiliate_id_94f685d6_fk_cms_affiliate_id` FOREIGN KEY (`affiliate_id`) REFERENCES `cms_affiliate` (`id`),
  CONSTRAINT `cms_voucher_service_id_b1da0f8c_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_voucher`
--

LOCK TABLES `cms_voucher` WRITE;
/*!40000 ALTER TABLE `cms_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (57,'admin','logentry'),(59,'auth','group'),(58,'auth','permission'),(60,'auth','user'),(5,'cms','accountcurrency'),(6,'cms','accountoption'),(7,'cms','accounttype'),(8,'cms','affiliate'),(9,'cms','attribute'),(10,'cms','attributeservice'),(40,'cms','attributeservicevalue'),(11,'cms','brokertype'),(12,'cms','category'),(13,'cms','chat'),(39,'cms','comment'),(14,'cms','homepage'),(15,'cms','license'),(16,'cms','location'),(17,'cms','methodology'),(38,'cms','option'),(18,'cms','paymentmethod'),(19,'cms','platformsupported'),(20,'cms','pricingmodel'),(37,'cms','product'),(21,'cms','regulation'),(22,'cms','revenuemodel'),(23,'cms','service'),(24,'cms','servicepage'),(25,'cms','signalalert'),(26,'cms','status'),(27,'cms','supportedlanguage'),(28,'cms','systemtype'),(29,'cms','timezone'),(30,'cms','tradinginstrument'),(31,'cms','tradingsoftware'),(32,'cms','tradingtype'),(33,'cms','trainingcourse'),(34,'cms','trainingtool'),(35,'cms','trainingtype'),(36,'cms','voucher'),(61,'contenttypes','contenttype'),(62,'sessions','session'),(55,'taggit','tag'),(56,'taggit','taggeditem'),(3,'wagtailadmin','admin'),(52,'wagtailcore','collection'),(54,'wagtailcore','collectionviewrestriction'),(53,'wagtailcore','groupcollectionpermission'),(48,'wagtailcore','grouppagepermission'),(1,'wagtailcore','page'),(49,'wagtailcore','pagerevision'),(50,'wagtailcore','pageviewrestriction'),(51,'wagtailcore','site'),(4,'wagtaildocs','document'),(43,'wagtailembeds','embed'),(41,'wagtailforms','formsubmission'),(2,'wagtailimages','image'),(45,'wagtailimages','rendition'),(42,'wagtailredirects','redirect'),(46,'wagtailsearch','query'),(47,'wagtailsearch','querydailyhits'),(44,'wagtailusers','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-08-28 22:06:22.333500'),(2,'auth','0001_initial','2019-08-28 22:06:22.538854'),(3,'admin','0001_initial','2019-08-28 22:06:23.100032'),(4,'admin','0002_logentry_remove_auto_add','2019-08-28 22:06:23.227323'),(5,'admin','0003_logentry_add_action_flag_choices','2019-08-28 22:06:23.242700'),(6,'contenttypes','0002_remove_content_type_name','2019-08-28 22:06:23.357061'),(7,'auth','0002_alter_permission_name_max_length','2019-08-28 22:06:23.416914'),(8,'auth','0003_alter_user_email_max_length','2019-08-28 22:06:23.479809'),(9,'auth','0004_alter_user_username_opts','2019-08-28 22:06:23.494435'),(10,'auth','0005_alter_user_last_login_null','2019-08-28 22:06:23.544796'),(11,'auth','0006_require_contenttypes_0002','2019-08-28 22:06:23.549024'),(12,'auth','0007_alter_validators_add_error_messages','2019-08-28 22:06:23.560247'),(13,'auth','0008_alter_user_username_max_length','2019-08-28 22:06:23.619756'),(14,'auth','0009_alter_user_last_name_max_length','2019-08-28 22:06:23.679405'),(15,'auth','0010_alter_group_name_max_length','2019-08-28 22:06:23.752161'),(16,'auth','0011_update_proxy_permissions','2019-08-28 22:06:23.766751'),(17,'wagtailcore','0001_initial','2019-08-28 22:06:24.128664'),(18,'wagtailcore','0002_initial_data','2019-08-28 22:06:24.132520'),(19,'wagtailcore','0003_add_uniqueness_constraint_on_group_page_permission','2019-08-28 22:06:24.136048'),(20,'wagtailcore','0004_page_locked','2019-08-28 22:06:24.139569'),(21,'wagtailcore','0005_add_page_lock_permission_to_moderators','2019-08-28 22:06:24.143755'),(22,'wagtailcore','0006_add_lock_page_permission','2019-08-28 22:06:24.147479'),(23,'wagtailcore','0007_page_latest_revision_created_at','2019-08-28 22:06:24.151559'),(24,'wagtailcore','0008_populate_latest_revision_created_at','2019-08-28 22:06:24.155829'),(25,'wagtailcore','0009_remove_auto_now_add_from_pagerevision_created_at','2019-08-28 22:06:24.160248'),(26,'wagtailcore','0010_change_page_owner_to_null_on_delete','2019-08-28 22:06:24.164230'),(27,'wagtailcore','0011_page_first_published_at','2019-08-28 22:06:24.168294'),(28,'wagtailcore','0012_extend_page_slug_field','2019-08-28 22:06:24.172878'),(29,'wagtailcore','0013_update_golive_expire_help_text','2019-08-28 22:06:24.177398'),(30,'wagtailcore','0014_add_verbose_name','2019-08-28 22:06:24.181648'),(31,'wagtailcore','0015_add_more_verbose_names','2019-08-28 22:06:24.185696'),(32,'wagtailcore','0016_change_page_url_path_to_text_field','2019-08-28 22:06:24.190176'),(33,'wagtailcore','0017_change_edit_page_permission_description','2019-08-28 22:06:24.758809'),(34,'wagtailcore','0018_pagerevision_submitted_for_moderation_index','2019-08-28 22:06:24.796197'),(35,'wagtailcore','0019_verbose_names_cleanup','2019-08-28 22:06:24.846294'),(36,'wagtailcore','0020_add_index_on_page_first_published_at','2019-08-28 22:06:24.883914'),(37,'wagtailcore','0021_capitalizeverbose','2019-08-28 22:06:25.771929'),(38,'wagtailcore','0022_add_site_name','2019-08-28 22:06:25.881714'),(39,'wagtailcore','0023_alter_page_revision_on_delete_behaviour','2019-08-28 22:06:25.972224'),(40,'wagtailcore','0024_collection','2019-08-28 22:06:26.006774'),(41,'wagtailcore','0025_collection_initial_data','2019-08-28 22:06:26.032395'),(42,'wagtailcore','0026_group_collection_permission','2019-08-28 22:06:26.107818'),(43,'taggit','0001_initial','2019-08-28 22:06:26.378022'),(44,'wagtailimages','0001_initial','2019-08-28 22:06:26.727912'),(45,'wagtailimages','0002_initial_data','2019-08-28 22:06:26.731978'),(46,'wagtailimages','0003_fix_focal_point_fields','2019-08-28 22:06:26.736000'),(47,'wagtailimages','0004_make_focal_point_key_not_nullable','2019-08-28 22:06:26.740237'),(48,'wagtailimages','0005_make_filter_spec_unique','2019-08-28 22:06:26.744155'),(49,'wagtailimages','0006_add_verbose_names','2019-08-28 22:06:26.747899'),(50,'wagtailimages','0007_image_file_size','2019-08-28 22:06:26.751860'),(51,'wagtailimages','0008_image_created_at_index','2019-08-28 22:06:26.756329'),(52,'wagtailimages','0009_capitalizeverbose','2019-08-28 22:06:26.760861'),(53,'wagtailimages','0010_change_on_delete_behaviour','2019-08-28 22:06:26.765389'),(54,'wagtailimages','0011_image_collection','2019-08-28 22:06:26.770323'),(55,'wagtailimages','0012_copy_image_permissions_to_collections','2019-08-28 22:06:26.775385'),(56,'wagtailimages','0013_make_rendition_upload_callable','2019-08-28 22:06:26.780446'),(57,'wagtailimages','0014_add_filter_spec_field','2019-08-28 22:06:26.785471'),(58,'wagtailimages','0015_fill_filter_spec_field','2019-08-28 22:06:26.790593'),(59,'wagtailimages','0016_deprecate_rendition_filter_relation','2019-08-28 22:06:26.795907'),(60,'wagtailimages','0017_reduce_focal_point_key_max_length','2019-08-28 22:06:26.800679'),(61,'wagtailimages','0018_remove_rendition_filter','2019-08-28 22:06:26.805329'),(62,'wagtailimages','0019_delete_filter','2019-08-28 22:06:26.809800'),(63,'wagtailimages','0020_add-verbose-name','2019-08-28 22:06:26.814438'),(64,'wagtailimages','0021_image_file_hash','2019-08-28 22:06:26.819431'),(65,'wagtailcore','0027_fix_collection_path_collation','2019-08-28 22:06:27.058570'),(66,'wagtailcore','0024_alter_page_content_type_on_delete_behaviour','2019-08-28 22:06:27.172407'),(67,'wagtailcore','0028_merge','2019-08-28 22:06:27.180989'),(68,'wagtailcore','0029_unicode_slugfield_dj19','2019-08-28 22:06:27.205890'),(69,'wagtailcore','0030_index_on_pagerevision_created_at','2019-08-28 22:06:27.243774'),(70,'wagtailcore','0031_add_page_view_restriction_types','2019-08-28 22:06:27.352871'),(71,'wagtailcore','0032_add_bulk_delete_page_permission','2019-08-28 22:06:27.507025'),(72,'wagtailcore','0033_remove_golive_expiry_help_text','2019-08-28 22:06:27.534308'),(73,'wagtailcore','0034_page_live_revision','2019-08-28 22:06:27.678577'),(74,'wagtailcore','0035_page_last_published_at','2019-08-28 22:06:27.893860'),(75,'wagtailcore','0036_populate_page_last_published_at','2019-08-28 22:06:27.927262'),(76,'wagtailcore','0037_set_page_owner_editable','2019-08-28 22:06:28.028531'),(77,'wagtailcore','0038_make_first_published_at_editable','2019-08-28 22:06:28.049760'),(78,'wagtailcore','0039_collectionviewrestriction','2019-08-28 22:06:28.289121'),(79,'wagtailcore','0040_page_draft_title','2019-08-28 22:06:28.655097'),(80,'wagtailcore','0041_group_collection_permissions_verbose_name_plural','2019-08-28 22:06:28.678221'),(81,'cms','0001_initial','2019-08-28 22:06:31.743841'),(82,'sessions','0001_initial','2019-08-28 22:06:37.000654'),(83,'taggit','0002_auto_20150616_2121','2019-08-28 22:06:37.061675'),(84,'wagtailadmin','0001_create_admin_access_permissions','2019-08-28 22:06:37.180655'),(85,'wagtaildocs','0001_initial','2019-08-28 22:06:37.220978'),(86,'wagtaildocs','0002_initial_data','2019-08-28 22:06:37.362332'),(87,'wagtaildocs','0003_add_verbose_names','2019-08-28 22:06:37.477197'),(88,'wagtaildocs','0004_capitalizeverbose','2019-08-28 22:06:37.617341'),(89,'wagtaildocs','0005_document_collection','2019-08-28 22:06:37.691858'),(90,'wagtaildocs','0006_copy_document_permissions_to_collections','2019-08-28 22:06:37.837601'),(91,'wagtaildocs','0005_alter_uploaded_by_user_on_delete_action','2019-08-28 22:06:37.909733'),(92,'wagtaildocs','0007_merge','2019-08-28 22:06:37.914654'),(93,'wagtaildocs','0008_document_file_size','2019-08-28 22:06:37.982508'),(94,'wagtaildocs','0009_document_verbose_name_plural','2019-08-28 22:06:38.011231'),(95,'wagtaildocs','0010_document_file_hash','2019-08-28 22:06:38.082174'),(96,'wagtailembeds','0001_initial','2019-08-28 22:06:38.146271'),(97,'wagtailembeds','0002_add_verbose_names','2019-08-28 22:06:38.159572'),(98,'wagtailembeds','0003_capitalizeverbose','2019-08-28 22:06:38.171061'),(99,'wagtailembeds','0004_embed_verbose_name_plural','2019-08-28 22:06:38.182771'),(100,'wagtailembeds','0005_specify_thumbnail_url_max_length','2019-08-28 22:06:38.204835'),(101,'wagtailforms','0001_initial','2019-08-28 22:06:38.256072'),(102,'wagtailforms','0002_add_verbose_names','2019-08-28 22:06:38.336043'),(103,'wagtailforms','0003_capitalizeverbose','2019-08-28 22:06:38.363402'),(104,'wagtailredirects','0001_initial','2019-08-28 22:06:38.411046'),(105,'wagtailredirects','0002_add_verbose_names','2019-08-28 22:06:38.677654'),(106,'wagtailredirects','0003_make_site_field_editable','2019-08-28 22:06:38.781289'),(107,'wagtailredirects','0004_set_unique_on_path_and_site','2019-08-28 22:06:38.866095'),(108,'wagtailredirects','0005_capitalizeverbose','2019-08-28 22:06:39.141311'),(109,'wagtailredirects','0006_redirect_increase_max_length','2019-08-28 22:06:39.175679'),(110,'wagtailsearch','0001_initial','2019-08-28 22:06:39.360171'),(111,'wagtailsearch','0002_add_verbose_names','2019-08-28 22:06:39.658015'),(112,'wagtailsearch','0003_remove_editors_pick','2019-08-28 22:06:39.699968'),(113,'wagtailsearch','0004_querydailyhits_verbose_name_plural','2019-08-28 22:06:39.707625'),(114,'wagtailusers','0001_initial','2019-08-28 22:06:39.760351'),(115,'wagtailusers','0002_add_verbose_name_on_userprofile','2019-08-28 22:06:39.874320'),(116,'wagtailusers','0003_add_verbose_names','2019-08-28 22:06:39.889909'),(117,'wagtailusers','0004_capitalizeverbose','2019-08-28 22:06:39.933127'),(118,'wagtailusers','0005_make_related_name_wagtail_specific','2019-08-28 22:06:40.014187'),(119,'wagtailusers','0006_userprofile_prefered_language','2019-08-28 22:06:40.082380'),(120,'wagtailusers','0007_userprofile_current_time_zone','2019-08-28 22:06:40.148848'),(121,'wagtailusers','0008_userprofile_avatar','2019-08-28 22:06:40.215109'),(122,'wagtailusers','0009_userprofile_verbose_name_plural','2019-08-28 22:06:40.240992'),(123,'wagtailimages','0001_squashed_0021','2019-08-28 22:06:40.250124'),(124,'wagtailcore','0001_squashed_0016_change_page_url_path_to_text_field','2019-08-28 22:06:40.255837');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('k3ymkcnl8ufvcvjhk2ayaj5fi5tj6ti2','N2E3Njk5YmU5N2VlNWUyM2M2MmZiZTliNTU2MmY0MmUyODFjZTNhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjVhNGJjMTJiYmY2NTEzYzk3YjNhMWJjMGEyZTg5YTFjNTAzOGNkIn0=','2019-09-11 22:08:57.189673'),('pyrvefao3mzlefbakfhsxsxa08e294vc','NmVlMmJjNTcwZjM4MjUwYTZjZWM3ZDc4OTYzYWQzNWQ5Y2EzZDUxZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YWM4YzBjMTllYzJkNTQwM2ZjMWEwNmZhODBiYjk3YTE0YWUyZTM1In0=','2019-08-28 19:36:50.102115');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_tag`
--

DROP TABLE IF EXISTS `taggit_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
INSERT INTO `taggit_tag` VALUES (1,'synergy-tag','synergy-tag');
/*!40000 ALTER TABLE `taggit_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_taggeditem`
--

DROP TABLE IF EXISTS `taggit_taggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` (`tag_id`),
  KEY `taggit_taggeditem_object_id_e2d7d1df` (`object_id`),
  KEY `taggit_taggeditem_content_type_id_object_id_196cc965_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
INSERT INTO `taggit_taggeditem` VALUES (1,2,4,1);
/*!40000 ALTER TABLE `taggit_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_collection`
--

DROP TABLE IF EXISTS `wagtailcore_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collection`
--

LOCK TABLES `wagtailcore_collection` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collection` DISABLE KEYS */;
INSERT INTO `wagtailcore_collection` VALUES (1,'0001',1,0,'Root');
/*!40000 ALTER TABLE `wagtailcore_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_collectionviewrestriction`
--

DROP TABLE IF EXISTS `wagtailcore_collectionviewrestriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_collectionviewrestriction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restriction_type` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `collection_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_collecti_collection_id_761908ec_fk_wagtailco` (`collection_id`),
  CONSTRAINT `wagtailcore_collecti_collection_id_761908ec_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collectionviewrestriction`
--

LOCK TABLES `wagtailcore_collectionviewrestriction` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_collectionviewrestriction_groups`
--

DROP TABLE IF EXISTS `wagtailcore_collectionviewrestriction_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_collectionviewrestriction_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collectionviewrestriction_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq` (`collectionviewrestriction_id`,`group_id`),
  KEY `wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou` (`group_id`),
  CONSTRAINT `wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco` FOREIGN KEY (`collectionviewrestriction_id`) REFERENCES `wagtailcore_collectionviewrestriction` (`id`),
  CONSTRAINT `wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collectionviewrestriction_groups`
--

LOCK TABLES `wagtailcore_collectionviewrestriction_groups` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_groupcollectionpermission`
--

DROP TABLE IF EXISTS `wagtailcore_groupcollectionpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_groupcollectionpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq` (`group_id`,`collection_id`,`permission_id`),
  KEY `wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco` (`collection_id`),
  KEY `wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm` (`permission_id`),
  CONSTRAINT `wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  CONSTRAINT `wagtailcore_groupcol_group_id_05d61460_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_groupcollectionpermission`
--

LOCK TABLES `wagtailcore_groupcollectionpermission` WRITE;
/*!40000 ALTER TABLE `wagtailcore_groupcollectionpermission` DISABLE KEYS */;
INSERT INTO `wagtailcore_groupcollectionpermission` VALUES (2,1,1,1),(4,1,1,2),(6,1,1,5),(8,1,1,6),(1,1,2,1),(3,1,2,2),(5,1,2,5),(7,1,2,6);
/*!40000 ALTER TABLE `wagtailcore_groupcollectionpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_grouppagepermission`
--

DROP TABLE IF EXISTS `wagtailcore_grouppagepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_grouppagepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_type` varchar(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_grouppageper_group_id_page_id_permiss_0898bdf8_uniq` (`group_id`,`page_id`,`permission_type`),
  KEY `wagtailcore_grouppag_page_id_710b114a_fk_wagtailco` (`page_id`),
  CONSTRAINT `wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_grouppag_page_id_710b114a_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_grouppagepermission`
--

LOCK TABLES `wagtailcore_grouppagepermission` WRITE;
/*!40000 ALTER TABLE `wagtailcore_grouppagepermission` DISABLE KEYS */;
INSERT INTO `wagtailcore_grouppagepermission` VALUES (1,'add',1,1),(2,'edit',1,1),(6,'lock',1,1),(3,'publish',1,1),(4,'add',2,1),(5,'edit',2,1);
/*!40000 ALTER TABLE `wagtailcore_grouppagepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_page`
--

DROP TABLE IF EXISTS `wagtailcore_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `live` tinyint(1) NOT NULL,
  `has_unpublished_changes` tinyint(1) NOT NULL,
  `url_path` longtext NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `show_in_menus` tinyint(1) NOT NULL,
  `search_description` longtext NOT NULL,
  `go_live_at` datetime(6) DEFAULT NULL,
  `expire_at` datetime(6) DEFAULT NULL,
  `expired` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `latest_revision_created_at` datetime(6) DEFAULT NULL,
  `first_published_at` datetime(6) DEFAULT NULL,
  `live_revision_id` int(11) DEFAULT NULL,
  `last_published_at` datetime(6) DEFAULT NULL,
  `draft_title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  KEY `wagtailcore_page_slug_e7c11b8f` (`slug`),
  KEY `wagtailcore_page_first_published_at_2b5dd637` (`first_published_at`),
  KEY `wagtailcore_page_content_type_id_c28424df_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_page_live_revision_id_930bd822_fk_wagtailco` (`live_revision_id`),
  KEY `wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `wagtailcore_page_content_type_id_c28424df_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_page_live_revision_id_930bd822_fk_wagtailco` FOREIGN KEY (`live_revision_id`) REFERENCES `wagtailcore_pagerevision` (`id`),
  CONSTRAINT `wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_page`
--

LOCK TABLES `wagtailcore_page` WRITE;
/*!40000 ALTER TABLE `wagtailcore_page` DISABLE KEYS */;
INSERT INTO `wagtailcore_page` VALUES (1,'0001',1,1,'Root','root',1,0,'/','',0,'',NULL,NULL,0,1,NULL,0,NULL,NULL,NULL,NULL,'Root'),(2,'00010001',2,1,'Welcome to your new Wagtail site!','home',1,0,'/home/','',0,'',NULL,NULL,0,1,NULL,0,NULL,NULL,NULL,NULL,'Welcome to your new Wagtail site!'),(4,'000100010001',3,0,'Forex Vouchers','forex-vouchers',1,0,'/home/forex-vouchers/','',0,'',NULL,NULL,0,14,1,0,'2019-08-28 22:24:26.672825','2019-08-28 22:24:26.750526',2,'2019-08-28 22:24:26.750526','Forex Vouchers');
/*!40000 ALTER TABLE `wagtailcore_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pagerevision`
--

DROP TABLE IF EXISTS `wagtailcore_pagerevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_pagerevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submitted_for_moderation` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `content_json` longtext NOT NULL,
  `approved_go_live_at` datetime(6) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_pagerevision_submitted_for_moderation_c682e44c` (`submitted_for_moderation`),
  KEY `wagtailcore_pagerevision_page_id_d421cc1d_fk_wagtailcore_page_id` (`page_id`),
  KEY `wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id` (`user_id`),
  KEY `wagtailcore_pagerevision_created_at_66954e3b` (`created_at`),
  CONSTRAINT `wagtailcore_pagerevision_page_id_d421cc1d_fk_wagtailcore_page_id` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pagerevision`
--

LOCK TABLES `wagtailcore_pagerevision` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pagerevision` DISABLE KEYS */;
INSERT INTO `wagtailcore_pagerevision` VALUES (2,0,'2019-08-28 22:24:26.672825','{\"pk\": 4, \"path\": \"000100010001\", \"depth\": 3, \"numchild\": 0, \"title\": \"Forex Vouchers\", \"draft_title\": \"Forex Vouchers\", \"slug\": \"forex-vouchers\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/forex-vouchers/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"body\": \"\"}',NULL,4,1);
/*!40000 ALTER TABLE `wagtailcore_pagerevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pageviewrestriction`
--

DROP TABLE IF EXISTS `wagtailcore_pageviewrestriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_pageviewrestriction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `page_id` int(11) NOT NULL,
  `restriction_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco` (`page_id`),
  CONSTRAINT `wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pageviewrestriction`
--

LOCK TABLES `wagtailcore_pageviewrestriction` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pageviewrestriction_groups`
--

DROP TABLE IF EXISTS `wagtailcore_pageviewrestriction_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_pageviewrestriction_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageviewrestriction_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq` (`pageviewrestriction_id`,`group_id`),
  KEY `wagtailcore_pageview_group_id_6460f223_fk_auth_grou` (`group_id`),
  CONSTRAINT `wagtailcore_pageview_group_id_6460f223_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco` FOREIGN KEY (`pageviewrestriction_id`) REFERENCES `wagtailcore_pageviewrestriction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pageviewrestriction_groups`
--

LOCK TABLES `wagtailcore_pageviewrestriction_groups` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_site`
--

DROP TABLE IF EXISTS `wagtailcore_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `is_default_site` tinyint(1) NOT NULL,
  `root_page_id` int(11) NOT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_site_hostname_port_2c626d70_uniq` (`hostname`,`port`),
  KEY `wagtailcore_site_hostname_96b20b46` (`hostname`),
  KEY `wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id` (`root_page_id`),
  CONSTRAINT `wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id` FOREIGN KEY (`root_page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_site`
--

LOCK TABLES `wagtailcore_site` WRITE;
/*!40000 ALTER TABLE `wagtailcore_site` DISABLE KEYS */;
INSERT INTO `wagtailcore_site` VALUES (2,'localhost',80,0,4,NULL);
/*!40000 ALTER TABLE `wagtailcore_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtaildocs_document`
--

DROP TABLE IF EXISTS `wagtaildocs_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtaildocs_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `uploaded_by_user_id` int(11) DEFAULT NULL,
  `collection_id` int(11) NOT NULL,
  `file_size` int(10) unsigned DEFAULT NULL,
  `file_hash` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtaildocs_document_collection_id_23881625_fk_wagtailco` (`collection_id`),
  KEY `wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user` (`uploaded_by_user_id`),
  CONSTRAINT `wagtaildocs_document_collection_id_23881625_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  CONSTRAINT `wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtaildocs_document`
--

LOCK TABLES `wagtaildocs_document` WRITE;
/*!40000 ALTER TABLE `wagtaildocs_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtaildocs_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailembeds_embed`
--

DROP TABLE IF EXISTS `wagtailembeds_embed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailembeds_embed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `max_width` smallint(6) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `html` longtext NOT NULL,
  `title` longtext NOT NULL,
  `author_name` longtext NOT NULL,
  `provider_name` longtext NOT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `last_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailembeds_embed_url_max_width_8a2922d8_uniq` (`url`,`max_width`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailembeds_embed`
--

LOCK TABLES `wagtailembeds_embed` WRITE;
/*!40000 ALTER TABLE `wagtailembeds_embed` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailembeds_embed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailforms_formsubmission`
--

DROP TABLE IF EXISTS `wagtailforms_formsubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailforms_formsubmission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_data` longtext NOT NULL,
  `submit_time` datetime(6) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco` (`page_id`),
  CONSTRAINT `wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailforms_formsubmission`
--

LOCK TABLES `wagtailforms_formsubmission` WRITE;
/*!40000 ALTER TABLE `wagtailforms_formsubmission` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailforms_formsubmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailimages_image`
--

DROP TABLE IF EXISTS `wagtailimages_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailimages_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `focal_point_x` int(10) unsigned DEFAULT NULL,
  `focal_point_y` int(10) unsigned DEFAULT NULL,
  `focal_point_width` int(10) unsigned DEFAULT NULL,
  `focal_point_height` int(10) unsigned DEFAULT NULL,
  `uploaded_by_user_id` int(11) DEFAULT NULL,
  `file_size` int(10) unsigned DEFAULT NULL,
  `collection_id` int(11) NOT NULL,
  `file_hash` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user_id` (`uploaded_by_user_id`),
  KEY `wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco` (`collection_id`),
  KEY `wagtailimages_image_created_at_86fa6cd4` (`created_at`),
  CONSTRAINT `wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  CONSTRAINT `wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user_id` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailimages_image`
--

LOCK TABLES `wagtailimages_image` WRITE;
/*!40000 ALTER TABLE `wagtailimages_image` DISABLE KEYS */;
INSERT INTO `wagtailimages_image` VALUES (1,'ic-markets-logo-1-original.jpg','original_images/ic-markets-logo-1-original.jpg',851,427,'2019-08-15 01:37:59.817239',NULL,NULL,NULL,NULL,1,26910,1,'f8689f4ea241d40e96c6fa4c4e4afb6c55942675'),(2,'synergy-fx.jpg','original_images/synergy-fx.jpg',115,70,'2019-08-15 21:21:49.428593',NULL,NULL,NULL,NULL,1,4541,1,'deed93a0a6ae7ddd19f27113c0fa6c4a12d33bbc'),(3,'ic-markets-logo-1.jpg','original_images/ic-markets-logo-1-original_22ogjS8.jpg',851,427,'2019-08-15 22:19:29.022649',NULL,NULL,NULL,NULL,1,26910,1,'f8689f4ea241d40e96c6fa4c4e4afb6c55942675'),(4,'synergyfx_preview.jpg','original_images/synergyfx_preview.jpg',730,438,'2019-08-16 17:09:16.311114',NULL,NULL,NULL,NULL,1,65242,1,'012ca2e6c1c3fba9404820564097efe3413aface'),(5,'syergyfx_logo.jpeg','original_images/syergyfx_logo.jpeg',267,189,'2019-08-16 17:19:34.041667',NULL,NULL,NULL,NULL,1,3975,1,'541150884890775c4f913eb807dc2d94c1d752a2'),(6,'sybergyfx_logo-3.jpeg','original_images/sybergyfx_logo-3.jpeg',500,122,'2019-08-16 21:16:04.353355',NULL,NULL,NULL,NULL,1,45213,1,'95b5897bc7d3b60b175c8e45ad29f0fd7c8b4326'),(7,'synergy-fx.jpg','original_images/synergy-fx_31OH4S0.jpg',115,70,'2019-08-20 07:04:06.783758',NULL,NULL,NULL,NULL,1,4541,1,'deed93a0a6ae7ddd19f27113c0fa6c4a12d33bbc'),(8,'synergyfx_preview.jpg','original_images/synergyfx_preview_2gYqO9c.jpg',730,438,'2019-08-20 07:04:43.419880',NULL,NULL,NULL,NULL,1,65242,1,'012ca2e6c1c3fba9404820564097efe3413aface');
/*!40000 ALTER TABLE `wagtailimages_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailimages_rendition`
--

DROP TABLE IF EXISTS `wagtailimages_rendition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailimages_rendition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `focal_point_key` varchar(16) NOT NULL,
  `filter_spec` varchar(255) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq` (`image_id`,`filter_spec`,`focal_point_key`),
  KEY `wagtailimages_rendition_filter_spec_1cba3201` (`filter_spec`),
  CONSTRAINT `wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim` FOREIGN KEY (`image_id`) REFERENCES `wagtailimages_image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailimages_rendition`
--

LOCK TABLES `wagtailimages_rendition` WRITE;
/*!40000 ALTER TABLE `wagtailimages_rendition` DISABLE KEYS */;
INSERT INTO `wagtailimages_rendition` VALUES (1,'images/ic-markets-logo-1-original.max-165x165.jpg',165,82,'','max-165x165',1),(2,'images/synergy-fx.max-165x165.jpg',115,70,'','max-165x165',2),(3,'images/synergy-fx.width-400.jpg',115,70,'','width-400',2),(4,'images/synergy-fx.width-600.jpg',115,70,'','width-600',2),(5,'images/ic-markets-logo-1-original_22ogjS8.max-165x165.jpg',165,82,'','max-165x165',3),(6,'images/ic-markets-logo-1-original_22ogjS8.width-600.jpg',600,301,'','width-600',3),(7,'images/ic-markets-logo-1-original_22ogjS8.width-450.jpg',450,225,'','width-450',3),(8,'images/ic-markets-logo-1-original_22ogjS8.width-250.jpg',250,125,'','width-250',3),(9,'images/ic-markets-logo-1-original_22ogjS8.width-300.jpg',300,150,'','width-300',3),(10,'images/synergyfx_preview.max-165x165.jpg',165,99,'','max-165x165',4),(11,'images/synergyfx_preview.width-400.jpg',400,240,'','width-400',4),(12,'images/synergy-fx.max-220x136.jpg',115,70,'','max-220x136',2),(13,'images/synergyfx_preview.max-380x236.jpg',380,228,'','max-380x236',4),(14,'images/syergyfx_logo.max-165x165.jpg',165,116,'','max-165x165',5),(15,'images/syergyfx_logo.max-220x136.jpg',192,136,'','max-220x136',5),(16,'images/syergyfx_logo.max-112x70.jpg',98,70,'','max-112x70',5),(17,'images/synergyfx_preview.max-285x177.jpg',285,171,'','max-285x177',4),(18,'images/synergyfx_preview.max-258x160.jpg',258,154,'','max-258x160',4),(19,'images/sybergyfx_logo-3.max-165x165.jpg',165,40,'','max-165x165',6),(20,'images/sybergyfx_logo-3.max-220x136.jpg',220,53,'','max-220x136',6),(21,'images/sybergyfx_logo-3.max-112x70.jpg',112,27,'','max-112x70',6),(22,'images/ic-markets-logo-1-original_22ogjS8.max-112x70.jpg',112,56,'','max-112x70',3),(23,'images/synergy-fx_31OH4S0.max-165x165.jpg',115,70,'','max-165x165',7),(24,'images/synergyfx_preview_2gYqO9c.max-165x165.jpg',165,99,'','max-165x165',8),(25,'images/synergy-fx_31OH4S0.max-220x136.jpg',115,70,'','max-220x136',7),(26,'images/synergyfx_preview_2gYqO9c.max-258x160.jpg',258,154,'','max-258x160',8),(27,'images/synergy-fx_31OH4S0.max-112x70.jpg',112,68,'','max-112x70',7),(28,'images/synergyfx_preview_2gYqO9c.max-800x600.jpg',730,438,'','max-800x600',8),(29,'images/synergyfx_preview_2gYqO9c.width-800.jpg',730,438,'','width-800',8);
/*!40000 ALTER TABLE `wagtailimages_rendition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailredirects_redirect`
--

DROP TABLE IF EXISTS `wagtailredirects_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailredirects_redirect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_path` varchar(255) NOT NULL,
  `is_permanent` tinyint(1) NOT NULL,
  `redirect_link` varchar(255) NOT NULL,
  `redirect_page_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailredirects_redirect_old_path_site_id_783622d7_uniq` (`old_path`,`site_id`),
  KEY `wagtailredirects_redirect_old_path_bb35247b` (`old_path`),
  KEY `wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco` (`redirect_page_id`),
  KEY `wagtailredirects_red_site_id_780a0e1e_fk_wagtailco` (`site_id`),
  CONSTRAINT `wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco` FOREIGN KEY (`redirect_page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailredirects_red_site_id_780a0e1e_fk_wagtailco` FOREIGN KEY (`site_id`) REFERENCES `wagtailcore_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailredirects_redirect`
--

LOCK TABLES `wagtailredirects_redirect` WRITE;
/*!40000 ALTER TABLE `wagtailredirects_redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailredirects_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailsearch_editorspick`
--

DROP TABLE IF EXISTS `wagtailsearch_editorspick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailsearch_editorspick` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `description` longtext NOT NULL,
  `page_id` int(11) NOT NULL,
  `query_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailsearch_editor_query_id_c6eee4a0_fk_wagtailse` (`query_id`),
  KEY `wagtailsearch_editor_page_id_28cbc274_fk_wagtailco` (`page_id`),
  CONSTRAINT `wagtailsearch_editor_page_id_28cbc274_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailsearch_editor_query_id_c6eee4a0_fk_wagtailse` FOREIGN KEY (`query_id`) REFERENCES `wagtailsearch_query` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailsearch_editorspick`
--

LOCK TABLES `wagtailsearch_editorspick` WRITE;
/*!40000 ALTER TABLE `wagtailsearch_editorspick` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailsearch_editorspick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailsearch_query`
--

DROP TABLE IF EXISTS `wagtailsearch_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailsearch_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query_string` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `query_string` (`query_string`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailsearch_query`
--

LOCK TABLES `wagtailsearch_query` WRITE;
/*!40000 ALTER TABLE `wagtailsearch_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailsearch_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailsearch_querydailyhits`
--

DROP TABLE IF EXISTS `wagtailsearch_querydailyhits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailsearch_querydailyhits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `hits` int(11) NOT NULL,
  `query_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailsearch_querydailyhits_query_id_date_1dd232e6_uniq` (`query_id`,`date`),
  CONSTRAINT `wagtailsearch_queryd_query_id_2185994b_fk_wagtailse` FOREIGN KEY (`query_id`) REFERENCES `wagtailsearch_query` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailsearch_querydailyhits`
--

LOCK TABLES `wagtailsearch_querydailyhits` WRITE;
/*!40000 ALTER TABLE `wagtailsearch_querydailyhits` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailsearch_querydailyhits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailusers_userprofile`
--

DROP TABLE IF EXISTS `wagtailusers_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailusers_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submitted_notifications` tinyint(1) NOT NULL,
  `approved_notifications` tinyint(1) NOT NULL,
  `rejected_notifications` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `preferred_language` varchar(10) NOT NULL,
  `current_time_zone` varchar(40) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailusers_userprofile`
--

LOCK TABLES `wagtailusers_userprofile` WRITE;
/*!40000 ALTER TABLE `wagtailusers_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailusers_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-28 19:26:26
