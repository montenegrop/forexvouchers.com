-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: fxvouchers
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Editors'),(1,'Moderators'),(3,'translator-es'),(4,'translator-fr');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (4,1,1),(5,1,2),(6,1,3),(8,1,4),(12,1,5),(13,1,6),(14,1,7),(1,2,1),(2,2,2),(3,2,3),(7,2,4),(9,2,5),(10,2,6),(11,2,7),(15,3,4),(16,4,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add image',2,'add_image'),(2,'Can change image',2,'change_image'),(3,'Can delete image',2,'delete_image'),(4,'Can access Wagtail admin',3,'access_admin'),(5,'Can add document',4,'add_document'),(6,'Can change document',4,'change_document'),(7,'Can delete document',4,'delete_document'),(8,'Can add account currency',5,'add_accountcurrency'),(9,'Can change account currency',5,'change_accountcurrency'),(10,'Can delete account currency',5,'delete_accountcurrency'),(11,'Can view account currency',5,'view_accountcurrency'),(12,'Can add account option',6,'add_accountoption'),(13,'Can change account option',6,'change_accountoption'),(14,'Can delete account option',6,'delete_accountoption'),(15,'Can view account option',6,'view_accountoption'),(16,'Can add account type',7,'add_accounttype'),(17,'Can change account type',7,'change_accounttype'),(18,'Can delete account type',7,'delete_accounttype'),(19,'Can view account type',7,'view_accounttype'),(20,'Can add affiliate',8,'add_affiliate'),(21,'Can change affiliate',8,'change_affiliate'),(22,'Can delete affiliate',8,'delete_affiliate'),(23,'Can view affiliate',8,'view_affiliate'),(24,'Can add attribute',9,'add_attribute'),(25,'Can change attribute',9,'change_attribute'),(26,'Can delete attribute',9,'delete_attribute'),(27,'Can view attribute',9,'view_attribute'),(28,'Can add attribute service',10,'add_attributeservice'),(29,'Can change attribute service',10,'change_attributeservice'),(30,'Can delete attribute service',10,'delete_attributeservice'),(31,'Can view attribute service',10,'view_attributeservice'),(32,'Can add broker type',11,'add_brokertype'),(33,'Can change broker type',11,'change_brokertype'),(34,'Can delete broker type',11,'delete_brokertype'),(35,'Can view broker type',11,'view_brokertype'),(36,'Can add category',12,'add_category'),(37,'Can change category',12,'change_category'),(38,'Can delete category',12,'delete_category'),(39,'Can view category',12,'view_category'),(40,'Can add chat',13,'add_chat'),(41,'Can change chat',13,'change_chat'),(42,'Can delete chat',13,'delete_chat'),(43,'Can view chat',13,'view_chat'),(44,'Can add home page',14,'add_homepage'),(45,'Can change home page',14,'change_homepage'),(46,'Can delete home page',14,'delete_homepage'),(47,'Can view home page',14,'view_homepage'),(48,'Can add license',15,'add_license'),(49,'Can change license',15,'change_license'),(50,'Can delete license',15,'delete_license'),(51,'Can view license',15,'view_license'),(52,'Can add location',16,'add_location'),(53,'Can change location',16,'change_location'),(54,'Can delete location',16,'delete_location'),(55,'Can view location',16,'view_location'),(56,'Can add methodology',17,'add_methodology'),(57,'Can change methodology',17,'change_methodology'),(58,'Can delete methodology',17,'delete_methodology'),(59,'Can view methodology',17,'view_methodology'),(60,'Can add payment method',18,'add_paymentmethod'),(61,'Can change payment method',18,'change_paymentmethod'),(62,'Can delete payment method',18,'delete_paymentmethod'),(63,'Can view payment method',18,'view_paymentmethod'),(64,'Can add platform supported',19,'add_platformsupported'),(65,'Can change platform supported',19,'change_platformsupported'),(66,'Can delete platform supported',19,'delete_platformsupported'),(67,'Can view platform supported',19,'view_platformsupported'),(68,'Can add pricing model',20,'add_pricingmodel'),(69,'Can change pricing model',20,'change_pricingmodel'),(70,'Can delete pricing model',20,'delete_pricingmodel'),(71,'Can view pricing model',20,'view_pricingmodel'),(72,'Can add regulation',21,'add_regulation'),(73,'Can change regulation',21,'change_regulation'),(74,'Can delete regulation',21,'delete_regulation'),(75,'Can view regulation',21,'view_regulation'),(76,'Can add revenue model',22,'add_revenuemodel'),(77,'Can change revenue model',22,'change_revenuemodel'),(78,'Can delete revenue model',22,'delete_revenuemodel'),(79,'Can view revenue model',22,'view_revenuemodel'),(80,'Can add service',23,'add_service'),(81,'Can change service',23,'change_service'),(82,'Can delete service',23,'delete_service'),(83,'Can view service',23,'view_service'),(84,'Can add service page',24,'add_servicepage'),(85,'Can change service page',24,'change_servicepage'),(86,'Can delete service page',24,'delete_servicepage'),(87,'Can view service page',24,'view_servicepage'),(88,'Can add signal alert',25,'add_signalalert'),(89,'Can change signal alert',25,'change_signalalert'),(90,'Can delete signal alert',25,'delete_signalalert'),(91,'Can view signal alert',25,'view_signalalert'),(92,'Can add status',26,'add_status'),(93,'Can change status',26,'change_status'),(94,'Can delete status',26,'delete_status'),(95,'Can view status',26,'view_status'),(96,'Can add supported language',27,'add_supportedlanguage'),(97,'Can change supported language',27,'change_supportedlanguage'),(98,'Can delete supported language',27,'delete_supportedlanguage'),(99,'Can view supported language',27,'view_supportedlanguage'),(100,'Can add system type',28,'add_systemtype'),(101,'Can change system type',28,'change_systemtype'),(102,'Can delete system type',28,'delete_systemtype'),(103,'Can view system type',28,'view_systemtype'),(104,'Can add timezone',29,'add_timezone'),(105,'Can change timezone',29,'change_timezone'),(106,'Can delete timezone',29,'delete_timezone'),(107,'Can view timezone',29,'view_timezone'),(108,'Can add trading instrument',30,'add_tradinginstrument'),(109,'Can change trading instrument',30,'change_tradinginstrument'),(110,'Can delete trading instrument',30,'delete_tradinginstrument'),(111,'Can view trading instrument',30,'view_tradinginstrument'),(112,'Can add trading software',31,'add_tradingsoftware'),(113,'Can change trading software',31,'change_tradingsoftware'),(114,'Can delete trading software',31,'delete_tradingsoftware'),(115,'Can view trading software',31,'view_tradingsoftware'),(116,'Can add trading type',32,'add_tradingtype'),(117,'Can change trading type',32,'change_tradingtype'),(118,'Can delete trading type',32,'delete_tradingtype'),(119,'Can view trading type',32,'view_tradingtype'),(120,'Can add training course',33,'add_trainingcourse'),(121,'Can change training course',33,'change_trainingcourse'),(122,'Can delete training course',33,'delete_trainingcourse'),(123,'Can view training course',33,'view_trainingcourse'),(124,'Can add training tool',34,'add_trainingtool'),(125,'Can change training tool',34,'change_trainingtool'),(126,'Can delete training tool',34,'delete_trainingtool'),(127,'Can view training tool',34,'view_trainingtool'),(128,'Can add training type',35,'add_trainingtype'),(129,'Can change training type',35,'change_trainingtype'),(130,'Can delete training type',35,'delete_trainingtype'),(131,'Can view training type',35,'view_trainingtype'),(132,'Can add voucher',36,'add_voucher'),(133,'Can change voucher',36,'change_voucher'),(134,'Can delete voucher',36,'delete_voucher'),(135,'Can view voucher',36,'view_voucher'),(136,'Can add product',37,'add_product'),(137,'Can change product',37,'change_product'),(138,'Can delete product',37,'delete_product'),(139,'Can view product',37,'view_product'),(140,'Can add option',38,'add_option'),(141,'Can change option',38,'change_option'),(142,'Can delete option',38,'delete_option'),(143,'Can view option',38,'view_option'),(144,'Can add comment',39,'add_comment'),(145,'Can change comment',39,'change_comment'),(146,'Can delete comment',39,'delete_comment'),(147,'Can view comment',39,'view_comment'),(148,'Can add attribute service value',40,'add_attributeservicevalue'),(149,'Can change attribute service value',40,'change_attributeservicevalue'),(150,'Can delete attribute service value',40,'delete_attributeservicevalue'),(151,'Can view attribute service value',40,'view_attributeservicevalue'),(152,'Can add form submission',41,'add_formsubmission'),(153,'Can change form submission',41,'change_formsubmission'),(154,'Can delete form submission',41,'delete_formsubmission'),(155,'Can view form submission',41,'view_formsubmission'),(156,'Can add redirect',42,'add_redirect'),(157,'Can change redirect',42,'change_redirect'),(158,'Can delete redirect',42,'delete_redirect'),(159,'Can view redirect',42,'view_redirect'),(160,'Can add embed',43,'add_embed'),(161,'Can change embed',43,'change_embed'),(162,'Can delete embed',43,'delete_embed'),(163,'Can view embed',43,'view_embed'),(164,'Can add user profile',44,'add_userprofile'),(165,'Can change user profile',44,'change_userprofile'),(166,'Can delete user profile',44,'delete_userprofile'),(167,'Can view user profile',44,'view_userprofile'),(168,'Can view document',4,'view_document'),(169,'Can view image',2,'view_image'),(170,'Can add rendition',45,'add_rendition'),(171,'Can change rendition',45,'change_rendition'),(172,'Can delete rendition',45,'delete_rendition'),(173,'Can view rendition',45,'view_rendition'),(174,'Can add query',46,'add_query'),(175,'Can change query',46,'change_query'),(176,'Can delete query',46,'delete_query'),(177,'Can view query',46,'view_query'),(178,'Can add Query Daily Hits',47,'add_querydailyhits'),(179,'Can change Query Daily Hits',47,'change_querydailyhits'),(180,'Can delete Query Daily Hits',47,'delete_querydailyhits'),(181,'Can view Query Daily Hits',47,'view_querydailyhits'),(182,'Can add page',1,'add_page'),(183,'Can change page',1,'change_page'),(184,'Can delete page',1,'delete_page'),(185,'Can view page',1,'view_page'),(186,'Can add group page permission',48,'add_grouppagepermission'),(187,'Can change group page permission',48,'change_grouppagepermission'),(188,'Can delete group page permission',48,'delete_grouppagepermission'),(189,'Can view group page permission',48,'view_grouppagepermission'),(190,'Can add page revision',49,'add_pagerevision'),(191,'Can change page revision',49,'change_pagerevision'),(192,'Can delete page revision',49,'delete_pagerevision'),(193,'Can view page revision',49,'view_pagerevision'),(194,'Can add page view restriction',50,'add_pageviewrestriction'),(195,'Can change page view restriction',50,'change_pageviewrestriction'),(196,'Can delete page view restriction',50,'delete_pageviewrestriction'),(197,'Can view page view restriction',50,'view_pageviewrestriction'),(198,'Can add site',51,'add_site'),(199,'Can change site',51,'change_site'),(200,'Can delete site',51,'delete_site'),(201,'Can view site',51,'view_site'),(202,'Can add collection',52,'add_collection'),(203,'Can change collection',52,'change_collection'),(204,'Can delete collection',52,'delete_collection'),(205,'Can view collection',52,'view_collection'),(206,'Can add group collection permission',53,'add_groupcollectionpermission'),(207,'Can change group collection permission',53,'change_groupcollectionpermission'),(208,'Can delete group collection permission',53,'delete_groupcollectionpermission'),(209,'Can view group collection permission',53,'view_groupcollectionpermission'),(210,'Can add collection view restriction',54,'add_collectionviewrestriction'),(211,'Can change collection view restriction',54,'change_collectionviewrestriction'),(212,'Can delete collection view restriction',54,'delete_collectionviewrestriction'),(213,'Can view collection view restriction',54,'view_collectionviewrestriction'),(214,'Can add Tag',55,'add_tag'),(215,'Can change Tag',55,'change_tag'),(216,'Can delete Tag',55,'delete_tag'),(217,'Can view Tag',55,'view_tag'),(218,'Can add Tagged Item',56,'add_taggeditem'),(219,'Can change Tagged Item',56,'change_taggeditem'),(220,'Can delete Tagged Item',56,'delete_taggeditem'),(221,'Can view Tagged Item',56,'view_taggeditem'),(222,'Can add log entry',57,'add_logentry'),(223,'Can change log entry',57,'change_logentry'),(224,'Can delete log entry',57,'delete_logentry'),(225,'Can view log entry',57,'view_logentry'),(226,'Can add permission',58,'add_permission'),(227,'Can change permission',58,'change_permission'),(228,'Can delete permission',58,'delete_permission'),(229,'Can view permission',58,'view_permission'),(230,'Can add group',59,'add_group'),(231,'Can change group',59,'change_group'),(232,'Can delete group',59,'delete_group'),(233,'Can view group',59,'view_group'),(234,'Can add user',60,'add_user'),(235,'Can change user',60,'change_user'),(236,'Can delete user',60,'delete_user'),(237,'Can view user',60,'view_user'),(238,'Can add content type',61,'add_contenttype'),(239,'Can change content type',61,'change_contenttype'),(240,'Can delete content type',61,'delete_contenttype'),(241,'Can view content type',61,'view_contenttype'),(242,'Can add session',62,'add_session'),(243,'Can change session',62,'change_session'),(244,'Can delete session',62,'delete_session'),(245,'Can view session',62,'view_session'),(246,'Can add discount',63,'add_discount'),(247,'Can change discount',63,'change_discount'),(248,'Can delete discount',63,'delete_discount'),(249,'Can view discount',63,'view_discount'),(250,'Can add promo code',64,'add_promocode'),(251,'Can change promo code',64,'change_promocode'),(252,'Can delete promo code',64,'delete_promocode'),(253,'Can view promo code',64,'view_promocode'),(254,'Can add offer',65,'add_offer'),(255,'Can change offer',65,'change_offer'),(256,'Can delete offer',65,'delete_offer'),(257,'Can view offer',65,'view_offer'),(258,'Can add compare',66,'add_compare'),(259,'Can change compare',66,'change_compare'),(260,'Can delete compare',66,'delete_compare'),(261,'Can view compare',66,'view_compare'),(262,'Can add trading tool',67,'add_tradingtool'),(263,'Can change trading tool',67,'change_tradingtool'),(264,'Can delete trading tool',67,'delete_tradingtool'),(265,'Can view trading tool',67,'view_tradingtool'),(266,'Can add security of funds',68,'add_securityoffunds'),(267,'Can change security of funds',68,'change_securityoffunds'),(268,'Can delete security of funds',68,'delete_securityoffunds'),(269,'Can view security of funds',68,'view_securityoffunds'),(270,'Can add Language',69,'add_language'),(271,'Can change Language',69,'change_language'),(272,'Can delete Language',69,'delete_language'),(273,'Can view Language',69,'view_language'),(274,'Can add Translatable page',70,'add_translatablepage'),(275,'Can change Translatable page',70,'change_translatablepage'),(276,'Can delete Translatable page',70,'delete_translatablepage'),(277,'Can view Translatable page',70,'view_translatablepage'),(278,'Can add translatable site root page',71,'add_translatablesiterootpage'),(279,'Can change translatable site root page',71,'change_translatablesiterootpage'),(280,'Can delete translatable site root page',71,'delete_translatablesiterootpage'),(281,'Can view translatable site root page',71,'view_translatablesiterootpage'),(282,'Can add Site languages',72,'add_sitelanguages'),(283,'Can change Site languages',72,'change_sitelanguages'),(284,'Can delete Site languages',72,'delete_sitelanguages'),(285,'Can view Site languages',72,'view_sitelanguages'),(286,'Can add vouchers filter page',73,'add_vouchersfilterpage'),(287,'Can change vouchers filter page',73,'change_vouchersfilterpage'),(288,'Can delete vouchers filter page',73,'delete_vouchersfilterpage'),(289,'Can view vouchers filter page',73,'view_vouchersfilterpage'),(290,'Can add compare page',74,'add_comparepage'),(291,'Can change compare page',74,'change_comparepage'),(292,'Can delete compare page',74,'delete_comparepage'),(293,'Can view compare page',74,'view_comparepage'),(294,'Can add voucher page',75,'add_voucherpage'),(295,'Can change voucher page',75,'change_voucherpage'),(296,'Can delete voucher page',75,'delete_voucherpage'),(297,'Can view voucher page',75,'view_voucherpage'),(298,'Can add forex page',76,'add_forexpage'),(299,'Can change forex page',76,'change_forexpage'),(300,'Can delete forex page',76,'delete_forexpage'),(301,'Can view forex page',76,'view_forexpage'),(302,'Can add services list page',77,'add_serviceslistpage'),(303,'Can change services list page',77,'change_serviceslistpage'),(304,'Can delete services list page',77,'delete_serviceslistpage'),(305,'Can view services list page',77,'view_serviceslistpage'),(306,'Can add blog page',78,'add_blogpage'),(307,'Can change blog page',78,'change_blogpage'),(308,'Can delete blog page',78,'delete_blogpage'),(309,'Can view blog page',78,'view_blogpage'),(310,'Can add static page',79,'add_staticpage'),(311,'Can change static page',79,'change_staticpage'),(312,'Can delete static page',79,'delete_staticpage'),(313,'Can view static page',79,'view_staticpage'),(314,'Can add general settings',80,'add_generalsettings'),(315,'Can change general settings',80,'change_generalsettings'),(316,'Can delete general settings',80,'delete_generalsettings'),(317,'Can view general settings',80,'view_generalsettings'),(318,'Can add news item',81,'add_newsitem'),(319,'Can change news item',81,'change_newsitem'),(320,'Can delete news item',81,'delete_newsitem'),(321,'Can view news item',81,'view_newsitem'),(322,'Can add news settings',82,'add_newssettings'),(323,'Can change news settings',82,'change_newssettings'),(324,'Can delete news settings',82,'delete_newssettings'),(325,'Can view news settings',82,'view_newssettings'),(326,'Can add news source',83,'add_newssource'),(327,'Can change news source',83,'change_newssource'),(328,'Can delete news source',83,'delete_newssource'),(329,'Can view news source',83,'view_newssource'),(330,'Can add menu',84,'add_menu'),(331,'Can change menu',84,'change_menu'),(332,'Can delete menu',84,'delete_menu'),(333,'Can view menu',84,'view_menu'),(334,'Can add menu item',85,'add_menuitem'),(335,'Can change menu item',85,'change_menuitem'),(336,'Can delete menu item',85,'delete_menuitem'),(337,'Can view menu item',85,'view_menuitem'),(338,'Can add language',86,'add_language'),(339,'Can change language',86,'change_language'),(340,'Can delete language',86,'delete_language'),(341,'Can view language',86,'view_language'),(342,'Can add contact page',87,'add_contactpage'),(343,'Can change contact page',87,'change_contactpage'),(344,'Can delete contact page',87,'delete_contactpage'),(345,'Can view contact page',87,'view_contactpage'),(346,'Can add form field',88,'add_formfield'),(347,'Can change form field',88,'change_formfield'),(348,'Can delete form field',88,'delete_formfield'),(349,'Can view form field',88,'view_formfield'),(350,'Can add uploaded image',89,'add_uploadedimage'),(351,'Can change uploaded image',89,'change_uploadedimage'),(352,'Can delete uploaded image',89,'delete_uploadedimage'),(353,'Can view uploaded image',89,'view_uploadedimage'),(354,'Can add url',90,'add_allowedurl'),(355,'Can change url',90,'change_allowedurl'),(356,'Can delete url',90,'delete_allowedurl'),(357,'Can view url',90,'view_allowedurl'),(358,'Can add url',91,'add_disallowedurl'),(359,'Can change url',91,'change_disallowedurl'),(360,'Can delete url',91,'delete_disallowedurl'),(361,'Can view url',91,'view_disallowedurl'),(362,'Can add robots.txt rule',92,'add_rule'),(363,'Can change robots.txt rule',92,'change_rule'),(364,'Can delete robots.txt rule',92,'delete_rule'),(365,'Can view robots.txt rule',92,'view_rule');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$attDunW8Y4KK$2UXd1oKyDXMaJ/Ta80DZOonZqYx9CVj4bRFKyxXqRPc=','2020-07-10 16:10:35.741763',1,'admin','','','',1,1,'2019-08-28 22:08:42.652945'),(2,'pbkdf2_sha256$150000$eZMhIsfq5jLg$dNkt7t+HeQdC7L08jAidWLnJXwSENyu5wt3zaXXnuUI=',NULL,0,'ahmer','Ahmer','Khan','ahmerkhan@live.com',0,1,'2019-10-25 16:51:47.744241');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,2);
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
  `name` varchar(150) NOT NULL,
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
  `name` varchar(150) NOT NULL,
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
  `name` varchar(150) NOT NULL,
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
  `clicks` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_affiliate`
--

LOCK TABLES `cms_affiliate` WRITE;
/*!40000 ALTER TABLE `cms_affiliate` DISABLE KEYS */;
INSERT INTO `cms_affiliate` VALUES (1,'out','http://www.google.com','gooooogl',34),(2,'visit','http://google.com','forexvouchers',58);
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
-- Table structure for table `cms_blogpage`
--

DROP TABLE IF EXISTS `cms_blogpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_blogpage` (
  `page_ptr_id` int(11) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `feed_image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`page_ptr_id`),
  KEY `cms_blogpage_feed_image_id_d0717ffa_fk_wagtailimages_image_id` (`feed_image_id`),
  CONSTRAINT `cms_blogpage_feed_image_id_d0717ffa_fk_wagtailimages_image_id` FOREIGN KEY (`feed_image_id`) REFERENCES `wagtailimages_image` (`id`),
  CONSTRAINT `cms_blogpage_page_ptr_id_f927be8e_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_blogpage`
--

LOCK TABLES `cms_blogpage` WRITE;
/*!40000 ALTER TABLE `cms_blogpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_blogpage` ENABLE KEYS */;
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
  `short_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_category_slug_2811c358` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category`
--

LOCK TABLES `cms_category` WRITE;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
INSERT INTO `cms_category` VALUES (1,'Forex Brokers','forex-brokers','Brokers'),(2,'Forex Training','forex-training','Training'),(3,'Forex VPS','forex-vps','VPS'),(4,'Forex Trading System','forex-trading-system','Systems'),(5,'Forex Signals','forex-signals','Signals'),(6,'Forex Tools','forex-tools','Tools');
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
-- Table structure for table `cms_category_services`
--

DROP TABLE IF EXISTS `cms_category_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_category_services_category_id_service_id_451270aa_uniq` (`category_id`,`service_id`),
  KEY `cms_category_services_service_id_33ef4e85_fk_cms_service_id` (`service_id`),
  CONSTRAINT `cms_category_services_category_id_39d8fb59_fk_cms_category_id` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`id`),
  CONSTRAINT `cms_category_services_service_id_33ef4e85_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category_services`
--

LOCK TABLES `cms_category_services` WRITE;
/*!40000 ALTER TABLE `cms_category_services` DISABLE KEYS */;
INSERT INTO `cms_category_services` VALUES (4,1,3),(8,1,6),(9,1,7),(5,2,2),(2,3,4),(6,4,2),(3,4,4);
/*!40000 ALTER TABLE `cms_category_services` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_comment`
--

LOCK TABLES `cms_comment` WRITE;
/*!40000 ALTER TABLE `cms_comment` DISABLE KEYS */;
INSERT INTO `cms_comment` VALUES (1,4,'dfd','','sdss','2019-08-19 15:47:49.142725','2019-08-19 15:47:49.142768',NULL,1,'',NULL,NULL),(2,4,'Matias','Argentina','This is a test comment','2019-09-30 23:08:00.241728','2019-09-30 23:08:00.241789',NULL,1,'AR',NULL,NULL),(3,4,'Matias','Argentina','This is a great broker','2019-10-02 10:51:47.153116','2019-10-02 10:51:47.153174',NULL,1,'AR',NULL,NULL),(4,2,'dsaf','Argentina','f','2019-10-02 15:22:40.710311','2019-10-02 15:22:40.710361',NULL,1,'AR',NULL,NULL),(5,3,'Matias','Argentina','fdsa','2019-10-02 18:27:25.868388','2019-10-02 18:27:25.868441',NULL,1,'AR',NULL,NULL),(6,5,'Ahmer','Pakistan','Test','2019-10-25 15:06:35.773683','2019-10-25 15:06:35.773754',NULL,1,'PK',NULL,NULL),(7,5,'Test','Pakistan','Good','2019-10-29 16:06:05.995528','2019-10-29 16:06:05.995616',NULL,1,'PK',NULL,NULL),(8,5,'Test1','Pakistan','test','2019-10-29 16:06:37.003260','2019-10-29 16:06:37.003329',NULL,1,'PK',NULL,NULL),(9,5,'Test','Pakistan','test','2019-10-29 16:07:05.886990','2019-10-29 16:07:05.887041',NULL,1,'PK',NULL,NULL),(10,3,'Testing comment','Argentina','testing comment','2020-03-25 15:09:54.975235','2020-03-25 15:09:54.975324',NULL,1,'AR',NULL,6),(11,3,'test1','Argentina','fsda','2020-07-06 20:12:43.662643','2020-07-06 20:12:43.662721',NULL,1,'AR',NULL,6),(12,5,'Ahmer','Pakistan','Great','2020-07-07 00:36:47.179727','2020-07-07 00:36:47.179822',NULL,1,'PK',NULL,6),(13,3,'khan','Pakistan','great','2020-07-10 16:13:37.325727','2020-07-10 16:13:37.325806',NULL,1,'PK',NULL,6),(14,5,'emoun','Pakistan','Great ','2020-07-10 17:26:34.196969','2020-07-10 17:26:34.197026',NULL,1,'PK',NULL,3),(15,5,'emoun','Pakistan','great','2020-07-10 18:46:00.750902','2020-07-10 18:46:00.750977',NULL,1,'PK',NULL,7);
/*!40000 ALTER TABLE `cms_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_compare`
--

DROP TABLE IF EXISTS `cms_compare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_compare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `service1_id` int(11) DEFAULT NULL,
  `service2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_compare_service1_id_bed18b24_fk_cms_service_id` (`service1_id`),
  KEY `cms_compare_service2_id_01a9fe5f_fk_cms_service_id` (`service2_id`),
  CONSTRAINT `cms_compare_service1_id_bed18b24_fk_cms_service_id` FOREIGN KEY (`service1_id`) REFERENCES `cms_service` (`id`),
  CONSTRAINT `cms_compare_service2_id_01a9fe5f_fk_cms_service_id` FOREIGN KEY (`service2_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_compare`
--

LOCK TABLES `cms_compare` WRITE;
/*!40000 ALTER TABLE `cms_compare` DISABLE KEYS */;
INSERT INTO `cms_compare` VALUES (1,32,4,NULL),(2,74,3,7),(3,54,2,NULL),(4,38,3,6),(5,31,6,7),(6,22,2,4);
/*!40000 ALTER TABLE `cms_compare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_comparepage`
--

DROP TABLE IF EXISTS `cms_comparepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_comparepage` (
  `page_ptr_id` int(11) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `cms_comparepage_page_ptr_id_68f6694a_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_comparepage`
--

LOCK TABLES `cms_comparepage` WRITE;
/*!40000 ALTER TABLE `cms_comparepage` DISABLE KEYS */;
INSERT INTO `cms_comparepage` VALUES (35,'');
/*!40000 ALTER TABLE `cms_comparepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_contactpage`
--

DROP TABLE IF EXISTS `cms_contactpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_contactpage` (
  `page_ptr_id` int(11) NOT NULL,
  `to_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Thank_you_box` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Thank_you_follow` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Thank_you_mail` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `cms_contactpage_page_ptr_id_f3a66d8f_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_contactpage`
--

LOCK TABLES `cms_contactpage` WRITE;
/*!40000 ALTER TABLE `cms_contactpage` DISABLE KEYS */;
INSERT INTO `cms_contactpage` VALUES (60,'admin@forexvouchers.com','admin@forexvouchers.com','contact-email','Thanks for contacting us! We will be in touch with you shortly.','You may also send an email to us at support@forexvouchers.com','support@forexvouchers.com','Contact us');
/*!40000 ALTER TABLE `cms_contactpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_discount`
--

DROP TABLE IF EXISTS `cms_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_discount` (
  `voucher_ptr_id` int(11) NOT NULL,
  `discount_percent` int(11) DEFAULT NULL,
  PRIMARY KEY (`voucher_ptr_id`),
  CONSTRAINT `cms_discount_voucher_ptr_id_975a995f_fk_cms_voucher_id` FOREIGN KEY (`voucher_ptr_id`) REFERENCES `cms_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_discount`
--

LOCK TABLES `cms_discount` WRITE;
/*!40000 ALTER TABLE `cms_discount` DISABLE KEYS */;
INSERT INTO `cms_discount` VALUES (3,32),(4,21);
/*!40000 ALTER TABLE `cms_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forexpage`
--

DROP TABLE IF EXISTS `cms_forexpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forexpage` (
  `page_ptr_id` int(11) NOT NULL,
  `script` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `cms_forexpage_page_ptr_id_0da4be96_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forexpage`
--

LOCK TABLES `cms_forexpage` WRITE;
/*!40000 ALTER TABLE `cms_forexpage` DISABLE KEYS */;
INSERT INTO `cms_forexpage` VALUES (40,'List of useful charts'),(41,'<!-- TradingView Widget BEGIN -->\r\n<div class=\"tradingview-widget-container\">\r\n  <div id=\"tradingview_f5992\"></div>\r\n  <div class=\"tradingview-widget-copyright\"><a href=\"https://es.tradingview.com/symbols/USD/OANDA-EURUSD/\" rel=\"noopener\" target=\"_blank\"><span class=\"blue-text\">EURUSD Gráfico</span></a> por TradingView</div>\r\n  <script type=\"text/javascript\" src=\"https://s3.tradingview.com/tv.js\"></script>\r\n  <script type=\"text/javascript\">\r\n  new TradingView.widget(\r\n  {\r\n  \"width\": 980,\r\n  \"height\": 610,\r\n  \"symbol\": \"USD/OANDA:EURUSD\",\r\n  \"interval\": \"D\",\r\n  \"timezone\": \"Etc/UTC\",\r\n  \"theme\": \"Light\",\r\n  \"style\": \"1\",\r\n  \"locale\": \"es\",\r\n  \"toolbar_bg\": \"#f1f3f6\",\r\n  \"enable_publishing\": false,\r\n  \"allow_symbol_change\": true,\r\n  \"container_id\": \"tradingview_f5992\"\r\n}\r\n  );\r\n  </script>\r\n</div>\r\n<!-- TradingView Widget END -->');
/*!40000 ALTER TABLE `cms_forexpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_formfield`
--

DROP TABLE IF EXISTS `cms_formfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_formfield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL,
  `choices` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `help_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_formfield_page_id_0c959edf` (`page_id`),
  CONSTRAINT `cms_formfield_page_id_0c959edf_fk_cms_contactpage_page_ptr_id` FOREIGN KEY (`page_id`) REFERENCES `cms_contactpage` (`page_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_formfield`
--

LOCK TABLES `cms_formfield` WRITE;
/*!40000 ALTER TABLE `cms_formfield` DISABLE KEYS */;
INSERT INTO `cms_formfield` VALUES (1,0,'Name','singleline',1,'','','',60),(3,1,'Email','email',1,'','','',60),(5,2,'Message','multiline',1,'','','You may also send us email via support@forexvouchers.com',60),(6,3,'subscribe','checkbox',0,'','','Send me special discount vouchers occasionally. NO SPAM!',60);
/*!40000 ALTER TABLE `cms_formfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_generalsettings`
--

DROP TABLE IF EXISTS `cms_generalsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_generalsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facebook` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_custom_text` longtext COLLATE utf8mb4_unicode_ci,
  `site_id` int(11) NOT NULL,
  `recaptcha_secret_key` longtext COLLATE utf8mb4_unicode_ci,
  `recaptcha_site_key` longtext COLLATE utf8mb4_unicode_ci,
  `mailchimp_api_key` longtext COLLATE utf8mb4_unicode_ci,
  `mailchimp_list_id` longtext COLLATE utf8mb4_unicode_ci,
  `smtp_host` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_use_ssl` tinyint(1) NOT NULL,
  `smtp_username` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_use_tls` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`),
  CONSTRAINT `cms_generalsettings_site_id_e859fd2f_fk_wagtailcore_site_id` FOREIGN KEY (`site_id`) REFERENCES `wagtailcore_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_generalsettings`
--

LOCK TABLES `cms_generalsettings` WRITE;
/*!40000 ALTER TABLE `cms_generalsettings` DISABLE KEYS */;
INSERT INTO `cms_generalsettings` VALUES (1,'https://facebook.com/forexvouchers','https://twitter.com/forexvouchers','https://instagram.com/forex.vouchers','<p></p><p>Forex Vouchers address and details, and other information will be published here</p><p>(This can be edited from the admin) Settings &gt; General Settings</p>',4,'6LdfMe4UAAAAAC6zURzt_96hS4jiW9FKA43l_vik','6LdfMe4UAAAAAGi1RqlTG0He4Ei1shUpWNd3OuSX','fab5fb0382d48fea8199c9ec41ff1afe-us20','27579da9ca','smtp.yandex.com','Admin@123',465,1,'admin@forexvouchers.com',0);
/*!40000 ALTER TABLE `cms_generalsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_homepage`
--

DROP TABLE IF EXISTS `cms_homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_homepage` (
  `page_ptr_id` int(11) NOT NULL,
  `banner_body` longtext NOT NULL,
  `banner_title` varchar(100) NOT NULL,
  `banner_image_id` int(11) DEFAULT NULL,
  `translatablepage_ptr_id` int(11) NOT NULL,
  UNIQUE KEY `translatablepage_ptr_id` (`translatablepage_ptr_id`),
  KEY `cms_homepage_banner_image_id_38632050_fk_wagtailimages_image_id` (`banner_image_id`),
  CONSTRAINT `cms_homepage_banner_image_id_38632050_fk_wagtailimages_image_id` FOREIGN KEY (`banner_image_id`) REFERENCES `wagtailimages_image` (`id`),
  CONSTRAINT `cms_translatablepage_ptr_id_fk_wagtailtrans_translatable_page_id` FOREIGN KEY (`translatablepage_ptr_id`) REFERENCES `wagtailtrans_translatablepage` (`translatable_page_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_homepage`
--

LOCK TABLES `cms_homepage` WRITE;
/*!40000 ALTER TABLE `cms_homepage` DISABLE KEYS */;
INSERT INTO `cms_homepage` VALUES (1,'','',NULL,1),(24,'<p>We provide real-time forex deals &amp; discounts</p>','The ultimate source of forex vouchers!',13,24),(25,'<p>Instant discount vouchers are available for all forex services.<br/> Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>','Home Page',13,25),(26,'<p>Al instante, descuentos en vouchers disponibles para todos lo servicios forex</p><p> Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>','Bienvenido a Forex Vouchers',13,26);
/*!40000 ALTER TABLE `cms_homepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_language`
--

DROP TABLE IF EXISTS `cms_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag_code` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_code_id` int(11),
  PRIMARY KEY (`id`),
  KEY `cms_language_language_code_id_b3aa397f_fk_wagtailtr` (`language_code_id`),
  CONSTRAINT `cms_language_language_code_id_b3aa397f_fk_wagtailtr` FOREIGN KEY (`language_code_id`) REFERENCES `wagtailtrans_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_language`
--

LOCK TABLES `cms_language` WRITE;
/*!40000 ALTER TABLE `cms_language` DISABLE KEYS */;
INSERT INTO `cms_language` VALUES (1,'English','gb',1),(2,'French','fr',3),(3,'Spanish','es',2);
/*!40000 ALTER TABLE `cms_language` ENABLE KEYS */;
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
-- Table structure for table `cms_menu`
--

DROP TABLE IF EXISTS `cms_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_menu_slug_b268378b` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_menu`
--

LOCK TABLES `cms_menu` WRITE;
/*!40000 ALTER TABLE `cms_menu` DISABLE KEYS */;
INSERT INTO `cms_menu` VALUES (1,'navbar','navbar'),(2,'Vouchers','vouchers'),(3,'services','services'),(4,'information','information');
/*!40000 ALTER TABLE `cms_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_menuitem`
--

DROP TABLE IF EXISTS `cms_menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_menuitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `link_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_in_new_tab` tinyint(1) NOT NULL,
  `link_page_id` int(11) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `sub_menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_menuitem_link_page_id_d4cca8f9_fk_wagtailcore_page_id` (`link_page_id`),
  KEY `cms_menuitem_page_id_c86f0026` (`page_id`),
  KEY `cms_menuitem_sub_menu_id_a52632d8_fk_cms_menu_id` (`sub_menu_id`),
  CONSTRAINT `cms_menuitem_link_page_id_d4cca8f9_fk_wagtailcore_page_id` FOREIGN KEY (`link_page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `cms_menuitem_page_id_c86f0026_fk_cms_menu_id` FOREIGN KEY (`page_id`) REFERENCES `cms_menu` (`id`),
  CONSTRAINT `cms_menuitem_sub_menu_id_a52632d8_fk_cms_menu_id` FOREIGN KEY (`sub_menu_id`) REFERENCES `cms_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_menuitem`
--

LOCK TABLES `cms_menuitem` WRITE;
/*!40000 ALTER TABLE `cms_menuitem` DISABLE KEYS */;
INSERT INTO `cms_menuitem` VALUES (1,0,'Vouchers','',0,NULL,1,2),(2,0,'Discounts','/vouchers?type=discount',0,NULL,2,NULL),(3,1,'Offers','/vouchers?type=offer',0,NULL,2,NULL),(4,2,'Promocodes','/vouchers?type=promocode',0,NULL,2,NULL),(5,1,'Brokers','/brokers',0,NULL,1,NULL),(6,2,'Services','',0,NULL,1,3),(7,0,'VPS','/services/?categories=3',0,NULL,3,NULL),(8,1,'Trading System','/services/?categories=4',0,NULL,3,NULL),(9,2,'Training','/services/?categories=2',0,NULL,3,NULL),(10,3,'Signals','/services/?categories=5',0,NULL,3,NULL),(11,0,'About','',0,48,4,NULL),(12,1,'Privacy Policy','',0,54,4,NULL),(13,2,'Disclaimer','',0,51,4,NULL),(15,3,'Contact us','',0,60,1,NULL),(23,3,'Contact us','',0,60,4,NULL);
/*!40000 ALTER TABLE `cms_menuitem` ENABLE KEYS */;
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
-- Table structure for table `cms_newsitem`
--

DROP TABLE IF EXISTS `cms_newsitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_newsitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `date` datetime(6) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_newsitem_source_id_ebda0288_fk_cms_newssource_id` (`source_id`),
  CONSTRAINT `cms_newsitem_source_id_ebda0288_fk_cms_newssource_id` FOREIGN KEY (`source_id`) REFERENCES `cms_newssource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=266463 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_newsitem`
--

LOCK TABLES `cms_newsitem` WRITE;
/*!40000 ALTER TABLE `cms_newsitem` DISABLE KEYS */;
INSERT INTO `cms_newsitem` VALUES (266373,'AUD/USD Price Analysis: The market struggles again at 0,70','https://www.fxstreet.com/news/aud-usd-price-analysis-the-market-struggles-again-at-0-70-202007102017','Read more on https://www.fxstreet.com','2020-07-10 20:17:41.000000',1),(266374,'United States CFTC S&P 500 NC Net Positions rose from previous $-49.6K to $-36.2K','https://www.fxstreet.com/news/united-states-cftc-sp-500-nc-net-positions-rose-from-previous-496k-to-362k-202007101959','Read more on https://www.fxstreet.com','2020-07-10 19:59:53.000000',1),(266375,'Australia CFTC AUD NC Net Positions rose from previous $-3K to $-0.7K','https://www.fxstreet.com/news/australia-cftc-aud-nc-net-positions-rose-from-previous-3k-to-07k-202007101959','Read more on https://www.fxstreet.com','2020-07-10 19:59:44.000000',1),(266376,'United States CFTC Gold NC Net Positions: $267.4K  vs $266.7K','https://www.fxstreet.com/news/united-states-cftc-gold-nc-net-positions-2674k-vs-2667k-202007101959','Read more on https://www.fxstreet.com','2020-07-10 19:59:35.000000',1),(266377,'Japan CFTC JPY NC Net Positions declined to ¥16.8K from previous ¥24K','https://www.fxstreet.com/news/japan-cftc-jpy-nc-net-positions-declined-to-y168k-from-previous-y24k-202007101959','Read more on https://www.fxstreet.com','2020-07-10 19:59:29.000000',1),(266378,'United States CFTC Oil NC Net Positions dipped from previous 543.8K to 535.3K','https://www.fxstreet.com/news/united-states-cftc-oil-nc-net-positions-dipped-from-previous-5438k-to-5353k-202007101959','Read more on https://www.fxstreet.com','2020-07-10 19:59:22.000000',1),(266379,'European Monetary Union CFTC EUR NC Net Positions increased to €103.6K from previous €99K','https://www.fxstreet.com/news/european-monetary-union-cftc-eur-nc-net-positions-increased-to-eu1036k-from-previous-eu99k-202007101959','Read more on https://www.fxstreet.com','2020-07-10 19:59:12.000000',1),(266380,'United Kingdom CFTC GBP NC Net Positions up to £-16.4K from previous £-21K','https://www.fxstreet.com/news/united-kingdom-cftc-gbp-nc-net-positions-up-to-ps-164k-from-previous-ps-21k-202007101959','Read more on https://www.fxstreet.com','2020-07-10 19:59:04.000000',1),(266381,'Dollar Index Price Analysis: The DXY continues to resist moves lower','https://www.fxstreet.com/news/dollar-index-price-analysis-the-dxy-continues-to-resist-moves-lower-202007101920','Read more on https://www.fxstreet.com','2020-07-10 19:20:58.000000',1),(266382,'USD/CAD Price Analysis: More sideways action but the price is close to some important zones','https://www.fxstreet.com/news/usd-cad-price-analysis-more-sideways-action-but-the-price-is-close-to-some-important-zones-202007101845','Read more on https://www.fxstreet.com','2020-07-10 18:45:59.000000',1),(266383,'USD/SEK with scope to weaken further, more losses seen under 9.1292 – MUFG','https://www.fxstreet.com/news/usd-sek-with-scope-to-weaken-further-more-losses-seen-under-91292-mufg-202007101834','Read more on https://www.fxstreet.com','2020-07-10 18:34:19.000000',1),(266384,'EUR/USD: Upside risk to persist, 3-month target at 1.15 – Danske Bank','https://www.fxstreet.com/news/eur-usd-upside-risk-to-persist-3-month-target-at-115-danske-bank-202007101830','Read more on https://www.fxstreet.com','2020-07-10 18:30:02.000000',1),(266385,'GBP/USD Price Analysis: The bulls have not managed to crack the previous wave high','https://www.fxstreet.com/news/gbp-usd-price-analysis-the-bulls-have-not-managed-to-crack-the-previous-wave-high-202007101810','Read more on https://www.fxstreet.com','2020-07-10 18:10:32.000000',1),(266386,'USD/JPY: BoJ meeting unlikely to trigger volatility – MUFG','https://www.fxstreet.com/news/usd-jpy-boj-meeting-unlikely-to-trigger-volatility-mufg-202007101807','Read more on https://www.fxstreet.com','2020-07-10 18:07:37.000000',1),(266387,'Canada: BoC meeting, the key event next week – NFB','https://www.fxstreet.com/news/canada-boc-meeting-the-key-event-next-week-nfb-202007101757','Read more on https://www.fxstreet.com','2020-07-10 17:57:57.000000',1),(266388,'GBP/USD: Pound had become one of the most undervalued currencies according to valuation models – MUFG','https://www.fxstreet.com/news/gbp-usd-pound-had-become-one-of-the-most-undervalued-currencies-according-to-valuation-models-mufg-202007101751','Read more on https://www.fxstreet.com','2020-07-10 17:51:38.000000',1),(266389,'USD/MXN ends week modestly higher, ZAR outperforms among EM','https://www.fxstreet.com/news/usd-mxn-ends-week-modestly-higher-zar-outperforms-among-em-202007101741','Read more on https://www.fxstreet.com','2020-07-10 17:41:02.000000',1),(266390,'S&P 500 top movers: Cruise liner stocks surge higher, Netflix up more than 6%','https://www.fxstreet.com/news/sp-500-top-movers-cruise-liner-stocks-surge-higher-netflix-up-more-than-6-202007101709','Read more on https://www.fxstreet.com','2020-07-10 17:09:27.000000',1),(266391,'United States Baker Hughes US Oil Rig Count down to 181 from previous 185','https://www.fxstreet.com/news/united-states-baker-hughes-us-oil-rig-count-down-to-181-from-previous-185-202007101702','Read more on https://www.fxstreet.com','2020-07-10 17:02:16.000000',1),(266392,'Oil Price Analysis: WTI once again breaks $40 per barrel after trading lower in early EU trade','https://www.fxstreet.com/news/oil-price-analysis-wti-once-again-breaks-40-per-barrel-after-trading-lower-in-early-eu-trade-202007101701','Read more on https://www.fxstreet.com','2020-07-10 17:01:07.000000',1),(266393,'Canada: Employment report was consistent with a gradual re-opening of the economy – NFB','https://www.fxstreet.com/news/canada-employment-report-was-consistent-with-a-gradual-re-opening-of-the-economy-nfb-202007101607','Read more on https://www.fxstreet.com','2020-07-10 16:07:42.000000',1),(266394,'US Pres. Trump: Not even thinking about phase two of US trade deal with China','https://www.fxstreet.com/news/us-pres-trump-not-even-thinking-about-phase-two-of-us-trade-deal-with-china-202007101605','Read more on https://www.fxstreet.com','2020-07-10 16:05:36.000000',1),(266395,'US PPI: Price pressure remains fairly tame – Wells Fargo','https://www.fxstreet.com/news/us-ppi-price-pressure-remains-fairly-tame-wells-fargo-202007101556','Read more on https://www.fxstreet.com','2020-07-10 15:56:35.000000',1),(266396,'NZD/USD Price Analysis: Kiwi getting tired of pressuring near recent top at the 0.6600 area','https://www.fxstreet.com/news/nzd-usd-price-analysis-kiwi-getting-tired-of-pressuring-near-recent-top-at-the-06600-area-202007101544','Read more on https://www.fxstreet.com','2020-07-10 15:44:30.000000',1),(266397,'Coronavirus update US: Arizona cases rise by 4,221 to 116,892','https://www.fxstreet.com/news/coronavirus-update-us-arizona-cases-rise-by-4-221-to-116-892-202007101530','Read more on https://www.fxstreet.com','2020-07-10 15:30:49.000000',1),(266398,'NY Fed\'s GDP Nowcast for Q2 2020 stands at -15.3%','https://www.fxstreet.com/news/ny-feds-gdp-nowcast-for-q2-2020-stands-at-153-202007101520','Read more on https://www.fxstreet.com','2020-07-10 15:20:52.000000',1),(266399,'UK PM Johnson: Not certain about a V-shaped economic recovery','https://www.fxstreet.com/news/uk-pm-johnson-not-certain-about-a-v-shaped-economic-recovery-202007101516','Read more on https://www.fxstreet.com','2020-07-10 15:16:04.000000',1),(266400,'S&P 500 Index: Faces fierce resistance as Remdesivir hopes battle COVID-19 data – Confluence Detector','https://www.fxstreet.com/news/sp-500-index-faces-fierce-resistance-as-remdesivir-hopes-battle-covid-19-data-confluence-detector-202007101512','Read more on https://www.fxstreet.com','2020-07-10 15:12:45.000000',1),(266401,'Dutch PM Rutte: Will seek guarantees on budget reforms at recovery fund talks','https://www.fxstreet.com/news/dutch-pm-rutte-will-seek-guarantees-on-budget-reforms-at-recovery-fund-talks-202007101511','Read more on https://www.fxstreet.com','2020-07-10 15:11:51.000000',1),(266402,'USD/JPY slumps to fresh two-week lows near 106.70','https://www.fxstreet.com/news/usd-jpy-slumps-to-fresh-two-week-lows-near-10670-202007101503','Read more on https://www.fxstreet.com','2020-07-10 15:03:12.000000',1),(266403,'Market Snapshot: Dow adds nearly 400 points, Nasdaq sets another record, and stocks notch weekly gains','http://www.marketwatch.com/news/story.asp?guid=%7B21003575-02D4-D4B5-4572-D34D343AC256%7D&siteid=rss&rss=1','U.S. stocks closed sharply higher Friday on optimism about a coronavirus treatment.<div class=\"feedflare\">\n<a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=Q0PA1aKdqMY:K9miFp9Copo:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=Q0PA1aKdqMY:K9miFp9Copo:F7zBnMyn0Lo\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=Q0PA1aKdqMY:K9miFp9Copo:F7zBnMyn0Lo\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=Q0PA1aKdqMY:K9miFp9Copo:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=Q0PA1aKdqMY:K9miFp9Copo:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=Q0PA1aKdqMY:K9miFp9Copo:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=qj6IDK7rITs\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/marketwatch/topstories/~4/Q0PA1aKdqMY\" height=\"1\" width=\"1\" alt=\"\"/>','2020-07-10 20:25:00.000000',2),(266404,': Tesla stock tops $1,500 to end at record','http://www.marketwatch.com/news/story.asp?guid=%7B21003575-02D4-D4B5-4572-D3A6D942B217%7D&siteid=rss&rss=1','<div class=\"feedflare\">\n<a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=JE2uOadC5OA:6xOI9zES0jk:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=JE2uOadC5OA:6xOI9zES0jk:F7zBnMyn0Lo\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=JE2uOadC5OA:6xOI9zES0jk:F7zBnMyn0Lo\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=JE2uOadC5OA:6xOI9zES0jk:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=JE2uOadC5OA:6xOI9zES0jk:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=JE2uOadC5OA:6xOI9zES0jk:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=qj6IDK7rITs\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/marketwatch/topstories/~4/JE2uOadC5OA\" height=\"1\" width=\"1\" alt=\"\"/>','2020-07-10 20:20:00.000000',2),(266405,'Bond Report: 30-year Treasury yield books biggest weekly drop in a month','http://www.marketwatch.com/news/story.asp?guid=%7B21003575-02D4-D4B5-4572-D3569C2E441C%7D&siteid=rss&rss=1','U.S.  Treasury yields rebound on Friday as concerns about the impact of rising American coronavirus cases ebbed, pulling investors into stocks at the expense of government bonds.<div class=\"feedflare\">\n<a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=X1OPUqKDuFM:L_xeQB647zc:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=X1OPUqKDuFM:L_xeQB647zc:F7zBnMyn0Lo\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=X1OPUqKDuFM:L_xeQB647zc:F7zBnMyn0Lo\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=X1OPUqKDuFM:L_xeQB647zc:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=X1OPUqKDuFM:L_xeQB647zc:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=X1OPUqKDuFM:L_xeQB647zc:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=qj6IDK7rITs\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/marketwatch/topstories/~4/X1OPUqKDuFM\" height=\"1\" width=\"1\" alt=\"\"/>','2020-07-10 20:18:00.000000',2),(266406,'The cost of Biden’s economic plan to the stock market is more than you might think','http://www.marketwatch.com/news/story.asp?guid=%7B024DB6B4-C2C3-11EA-B5C1-1D55841A4EF0%7D&siteid=rss&rss=1','Higher taxes and more regulations would cut corporate profits.<div class=\"feedflare\">\n<a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=_4Tg7urAdvw:C9AjVfTRg2Y:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=_4Tg7urAdvw:C9AjVfTRg2Y:F7zBnMyn0Lo\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=_4Tg7urAdvw:C9AjVfTRg2Y:F7zBnMyn0Lo\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=_4Tg7urAdvw:C9AjVfTRg2Y:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=_4Tg7urAdvw:C9AjVfTRg2Y:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=_4Tg7urAdvw:C9AjVfTRg2Y:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=qj6IDK7rITs\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/marketwatch/topstories/~4/_4Tg7urAdvw\" height=\"1\" width=\"1\" alt=\"\"/>','2020-07-10 20:12:23.000000',2),(266407,'A ‘Hippocratic oath’ for financial advisers? The SEC’s new ‘Regulation Best Interest’ gets mixed reviews.','http://www.marketwatch.com/news/story.asp?guid=%7BD4652212-BAFE-11EA-8A2F-EA37A4E09CE0%7D&siteid=rss&rss=1','It’s always been hard to get good investment advice and critics say a new SEC rule won’t help.<div class=\"feedflare\">\n<a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=WgeubYSv6x8:hNfPLpAtUJs:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=WgeubYSv6x8:hNfPLpAtUJs:F7zBnMyn0Lo\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=WgeubYSv6x8:hNfPLpAtUJs:F7zBnMyn0Lo\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=WgeubYSv6x8:hNfPLpAtUJs:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=WgeubYSv6x8:hNfPLpAtUJs:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=WgeubYSv6x8:hNfPLpAtUJs:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=qj6IDK7rITs\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/marketwatch/topstories/~4/WgeubYSv6x8\" height=\"1\" width=\"1\" alt=\"\"/>','2020-07-10 20:02:41.000000',2),(266408,'Will Vanguard step on the SPDR? This technology ETF just dethroned the industry leader','http://www.marketwatch.com/news/story.asp?guid=%7B514D548E-C08B-11EA-8375-B127F8279466%7D&siteid=rss&rss=1','In one S&P 500 sector fund category, Vanguard’s assets just topped those of the industry titan, State Street Global Advisors’ SPDR suite.<div class=\"feedflare\">\n<a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=_usc2s42Ye8:H4X1sPvN504:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=_usc2s42Ye8:H4X1sPvN504:F7zBnMyn0Lo\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=_usc2s42Ye8:H4X1sPvN504:F7zBnMyn0Lo\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=_usc2s42Ye8:H4X1sPvN504:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=_usc2s42Ye8:H4X1sPvN504:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=_usc2s42Ye8:H4X1sPvN504:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=qj6IDK7rITs\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/marketwatch/topstories/~4/_usc2s42Ye8\" height=\"1\" width=\"1\" alt=\"\"/>','2020-07-10 19:25:57.000000',2),(266409,'CityWatch: New York City’s 4,000 nail salons face uphill battle after reopening','http://www.marketwatch.com/news/story.asp?guid=%7BF0F42A20-C2DF-11EA-9309-095339FF535B%7D&siteid=rss&rss=1','The long-term prospects for these businesses — and the safety of their workers and customers — is uncertain.<div class=\"feedflare\">\n<a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=jhV_-uiVLQo:FSsGjnxdbwU:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=jhV_-uiVLQo:FSsGjnxdbwU:F7zBnMyn0Lo\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=jhV_-uiVLQo:FSsGjnxdbwU:F7zBnMyn0Lo\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=jhV_-uiVLQo:FSsGjnxdbwU:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=jhV_-uiVLQo:FSsGjnxdbwU:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=jhV_-uiVLQo:FSsGjnxdbwU:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=qj6IDK7rITs\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/marketwatch/topstories/~4/jhV_-uiVLQo\" height=\"1\" width=\"1\" alt=\"\"/>','2020-07-10 19:17:02.000000',2),(266410,'Futures Movers: Oil climbs, but U.S. benchmark ends lower for the week as IEA warns of coronavirus risk','http://www.marketwatch.com/news/story.asp?guid=%7B215EBCFE-C25C-11EA-B5C1-1D55841A4EF0%7D&siteid=rss&rss=1','Oil futures climb on Friday, but U.S. prices finish lower for the week as a report from the International Energy Agency cautioned that weaker demand caused by the coronavirus pandemic will linger, even if the worst of the hit to economies has subsided.<div class=\"feedflare\">\n<a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=7K_GVW3SPP0:BU9_hjMtMVI:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=7K_GVW3SPP0:BU9_hjMtMVI:F7zBnMyn0Lo\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=7K_GVW3SPP0:BU9_hjMtMVI:F7zBnMyn0Lo\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=7K_GVW3SPP0:BU9_hjMtMVI:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=7K_GVW3SPP0:BU9_hjMtMVI:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=7K_GVW3SPP0:BU9_hjMtMVI:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=qj6IDK7rITs\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/marketwatch/topstories/~4/7K_GVW3SPP0\" height=\"1\" width=\"1\" alt=\"\"/>','2020-07-10 19:15:09.000000',2),(266411,'Gilead says coronavirus drug remdesivir can reduce risk of death, but analysts need more proof','http://www.marketwatch.com/news/story.asp?guid=%7BB1FCCA9C-C2D1-11EA-9309-095339FF535B%7D&siteid=rss&rss=1','Shares of Gilead Sciences Inc. gained 2.0% on Friday after the drugmaker shared potentially promising data about remdesivir that indicates the experimental COVID-19 drug may reduce deaths, though it noted the findings need to be confirmed.<div class=\"feedflare\">\n<a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=2fP-bem4FJg:9zpTosLFa04:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=2fP-bem4FJg:9zpTosLFa04:F7zBnMyn0Lo\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=2fP-bem4FJg:9zpTosLFa04:F7zBnMyn0Lo\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=2fP-bem4FJg:9zpTosLFa04:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=2fP-bem4FJg:9zpTosLFa04:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=2fP-bem4FJg:9zpTosLFa04:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=qj6IDK7rITs\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/marketwatch/topstories/~4/2fP-bem4FJg\" height=\"1\" width=\"1\" alt=\"\"/>','2020-07-10 18:40:15.000000',2),(266412,'Therese Poletti\'s Tech Tales: This California legislator is taking on SmileDirectClub','http://www.marketwatch.com/news/story.asp?guid=%7B94CD88A0-9AF2-11EA-BDF3-BA053E0FE0F1%7D&siteid=rss&rss=1','Assemblymember Evan Low is not what most people would consider anti-technology. But in the past year, he has become a rare legislator willing to take on the controversial and litigious tele-dentistry company, SmileDirectClub Inc.<div class=\"feedflare\">\n<a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=omTDDsBgCzs:t7qOz5hgJ8c:yIl2AUoC8zA\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=yIl2AUoC8zA\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=omTDDsBgCzs:t7qOz5hgJ8c:F7zBnMyn0Lo\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=omTDDsBgCzs:t7qOz5hgJ8c:F7zBnMyn0Lo\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=omTDDsBgCzs:t7qOz5hgJ8c:V_sGLiPBpWU\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?i=omTDDsBgCzs:t7qOz5hgJ8c:V_sGLiPBpWU\" border=\"0\"></img></a> <a href=\"http://feeds.marketwatch.com/~ff/marketwatch/topstories?a=omTDDsBgCzs:t7qOz5hgJ8c:qj6IDK7rITs\"><img src=\"http://feeds.feedburner.com/~ff/marketwatch/topstories?d=qj6IDK7rITs\" border=\"0\"></img></a>\n</div><img src=\"http://feeds.feedburner.com/~r/marketwatch/topstories/~4/omTDDsBgCzs\" height=\"1\" width=\"1\" alt=\"\"/>','2020-07-10 18:20:39.000000',2),(266413,'Safe Havens Rise on Coronavirus Surge - 10 July 2020','https://www.dailyforex.com/forex-news/2020/07/safe-havens-rise-on-coronavirus-surge/146834','In the US, a resurgence of new cases of Coronavirus undermined the Trump administration\'s hope for a swift return to economic normalcy.','2020-07-10 07:10:46.000000',3),(266414,'Pound Makes Headway Against Rivals','https://www.dailyforex.com/forex-news/2020/07/pound-makes-headway-against-rivals-july-9-2020/146825','The Pound Sterling made headway against its US rival after the finance minister announced his plans to provide a boost to the struggling economy.','2020-07-09 13:39:46.000000',3),(266415,'Oil Markets Gained In Light of Increase in Energy Demand','https://www.dailyforex.com/forex-news/2020/07/oil-markets-gained-in-light-of-increase-in-energy-demand-july-9-2020/146768','Oil markets advanced yesterday in light of an increase in energy demand.','2020-07-09 08:36:31.000000',3),(266416,'Forex Today: Gold Breaks $1800','https://www.dailyforex.com/forex-news/2020/07/forex-today-gold-breaks-1800-july-9-2020/146746','Precious metals hit record highs; U.S. coronavirus cases pass 3 million; Stocks higher with NASDAQ making new all-time high','2020-07-09 06:14:11.000000',3),(266417,'Pound Steadies in London Trade','https://www.dailyforex.com/forex-news/2020/07/pound-steadies-in-london-trade/146736','The Pound Sterling steadied during London trade on Wednesday after touching a 3-week peak on Tuesday against its main rivals, the greenback and Euro.','2020-07-08 11:57:19.000000',3),(266418,'Oil Futures Drop as Fears for Economic Troubles Take Over','https://www.dailyforex.com/forex-news/2020/07/oil-futures-drop-as-fears-for-economic-troubles-take-over-july-8-2020/146687','Yesterday oil futures markets dropped in light of a possible slower decline of world oil production and the fact that U.S. crude oil inventories increased, contradicting the analysts\' expectations.','2020-07-08 07:33:57.000000',3),(266419,'Forex Today: Gold Closes at Another 8-Year High','https://www.dailyforex.com/forex-news/2020/07/forex-today-gold-closes-at-another-8-year-high-july-8-2020/146670','Stock markets mixed; Precious metals remain strong; Brazilian president test positive for coronavirus as disease rages','2020-07-08 06:15:59.000000',3),(266420,'Pound Straining for Traction','https://www.dailyforex.com/forex-news/2020/07/pound-straining-for-traction/146647','The Pound Sterling traded close to a 3-week peak versus the US Dollar and moved higher on the Euro as FX traders await further details from the UK government on how they will provide additional support for the economy.','2020-07-07 12:26:55.000000',3),(266421,'Oil, Stocks Advance Despite Risks of Coronavirus Peak','https://www.dailyforex.com/forex-news/2020/07/oil-stocks-advance-despite-risks-of-coronavirus-peak-july-7-2020/146610','Yesterday the oil markets advanced, in light of a possible increase in the oil demand and tighter supply.','2020-07-07 09:47:18.000000',3),(266422,'Forex Today: NASDAQ & Gold Close at Record Highs','https://www.dailyforex.com/forex-news/2020/07/forex-today-nasdaq-gold-close-at-record-highs-july-7-2020/146571','U.S. stocks up but Asian markets mixed; RBA leaves rates unchanged; India has third highest number of coronavirus cases globally','2020-07-07 06:23:05.000000',3),(266423,'Oil Futures Struggle as Second Wave Weighs','https://www.dailyforex.com/forex-news/2020/07/oil-futures-struggle-as-second-wave-weighs-july-6-2020/146559','Oil prices started the week higher on Monday, boosted by positive economic data that showed signs of global economic recovery even as the number of global coronavirus cases continues to rise across the globe.','2020-07-06 12:42:41.000000',3),(266424,'Pound Higher Despite Brexit Concerns','https://www.dailyforex.com/forex-news/2020/07/pound-higher-despite-brexit-concerns-july-6-2020/146557','The Pound Sterling gained some positive momentum versus its US counterpart and its EU rival, the common currency Euro, even as FX traders gauge the upcoming Brexit talks and the announcement of additional support measures from the UK government.','2020-07-06 12:35:25.000000',3),(266425,'German Manufacturing Sector Contraction Slowed Down in May','https://www.dailyforex.com/forex-news/2020/07/german-manufacturing-sector-contraction-slowed-down-in-may-july-6-2020/145514','COVID-19 has the potential to disrupt Brexit planning including impacting client readiness.','2020-07-06 09:03:29.000000',3),(266426,'Forex Today: Stocks Keep Rising','https://www.dailyforex.com/forex-news/2020/07/forex-today-stocks-keep-rising-july-6-2020/145486','Japanese stock market index strongly higher; U.S. Dollar weaker, Risk currencies up; Friday sees record high daily global number of new coronavirus cases','2020-07-06 06:19:27.000000',3),(266427,'Dollar Struggles as Pandemic Fears Grow','https://www.dailyforex.com/forex-news/2020/07/dollar-struggles-as-pandemic-fears-grow/145411','The US Dollar traded within a narrow trading band during Asian trade on Friday with traders wary of the growing numbers of cases of the Coronavirus in the US.','2020-07-03 06:30:11.000000',3),(266428,'Signs of Recovery Contradict Lingering Fears','https://www.dailyforex.com/forex-news/2020/07/signs-of-recovery-contradict-lingering-fears/145389','The Dow Jones Industrial Average closed Q2 2020 at record highs, and oil prices had their best quarter in 30 years in Q2.','2020-07-02 11:48:22.000000',3),(266429,'Dollar Broadly Lower on Risk Appetite Shift','https://www.dailyforex.com/forex-news/2020/07/dollar-broadly-lower-on-risk-appetite-shift/145381','The U.S. Dollar fell against its main rivals during London trade on Thursday, generally on improved risk appetite and growing hope that a vaccine breakthrough to halt the spread','2020-07-02 11:06:12.000000',3),(266430,'Oil Futures and US Stocks Recovered After Positive Data','https://www.dailyforex.com/forex-news/2020/07/oil-futures-and-us-stocks-recovered-after-positive-data-july-2-2020/145352','Oil futures markets recovered yesterday after the markets learned that the US oil stockpiles fell more than expected and despite the fears for the second wave of Covid-19.','2020-07-02 08:50:30.000000',3),(266431,'Forex Today: NASDAQ Hits New All-Time High','https://www.dailyforex.com/forex-news/2020/07/forex-today-nasdaq-hits-new-all-time-high-july-2-2020/145317','Stock markets firm; U.S. Dollar weaker; U.S. jobs forecast seen lower; Record high daily number of global new coronavirus cases','2020-07-02 06:16:57.000000',3),(266432,'Global Manufacturing Posts Surprising Growth','https://www.dailyforex.com/forex-news/2020/07/global-manufacturing-posts-surprising-growth/145284','Global manufacturing took a huge hit in recent months as the global coronavirus pandemic kept both factories and stores closed.','2020-07-01 11:10:28.000000',3),(266433,'Pound Steadies after PMI','https://www.dailyforex.com/forex-news/2020/07/pound-steadies-after-pmi-july-1-2020/145281','The Pound Sterling steadied against its US counterpart after an unexpectedly improved manufacturing survey showed an increase in output','2020-07-01 11:06:26.000000',3),(266434,'Oil Markets Give Up Gains, US Stocks Closes Best Quarter','https://www.dailyforex.com/forex-news/2020/07/oil-markets-give-up-gains-us-stocks-closes-best-quarter/145264','Yesterday, oil markets moved backwards giving up part of yesterday\'s gains, in light of the possible return of Lybian production and the advance of the Covid-19','2020-07-01 09:48:36.000000',3),(266435,'Forex Today: Gold Hits New 8-Year High','https://www.dailyforex.com/forex-news/2020/07/forex-today-gold-hits-new-8-year-high-july-1-2020/145214','Gold trades at $1786 per ounce; Stocks weaken somewhat; U.S. Dollar strong','2020-07-01 06:30:29.000000',3),(266436,'Pound Slides After GDP Data','https://www.dailyforex.com/forex-news/2020/06/pound-slides-after-gdp-data-june-30-2020/145164','The Pound Sterling was broadly lower in London trading on Tuesday as FX traders await news of the government\'s plans regarding infrastructural spending given the latest growth data.','2020-06-30 10:53:19.000000',3),(266437,'Oil Markets, US Stocks Recover as Optimism Takes Over Market','https://www.dailyforex.com/forex-news/2020/06/oil-markets-us-stocks-recover-as-optimism-takes-over-market/145126','Yesterday, oil markets recovered after two consecutive days of losses, as demand for crude recovers and despite the fears for a second wave of the coronavirus.','2020-06-30 08:48:31.000000',3),(266438,'Forex Today: Risk Appetite Recovers','https://www.dailyforex.com/forex-news/2020/06/forex-today-risk-appetite-recovers-june-30-2020/145096','Stock markets rise shrugging off coronavirus fears; Fed’s Powell warns of “extraordinary uncertainty”; Gold stays strong','2020-06-30 06:10:52.000000',3),(266439,'Pound Struggles for Traction on PM Promise','https://www.dailyforex.com/forex-news/2020/06/pound-struggles-for-traction-on-pm-promise-june-29-2020/145086','During London trade on Monday, the Pound Sterling remained within striking distance of the recently struck 1-month trough after the Prime Minister hinted that it was his strong intent to increase investment in public infrastructure as an attempt to recover from the hard-hit economy which is struggling in the wake of the Coronavirus pandemic.','2020-06-29 12:38:59.000000',3),(266440,'Oil Markets Drop, Fears for Second Wave Dominate the Market','https://www.dailyforex.com/forex-news/2020/06/oil-markets-drop-fears-for-second-wave-dominate-the-market-june-29-2020/145043','This week, the oil markets remained in the negative territory, as fears for a second wave of the corona-virus surged given the increase of cases in certain places.','2020-06-29 09:19:51.000000',3),(266441,'Forex Today: Stocks Falling on Coronavirus Milestones','https://www.dailyforex.com/forex-news/2020/06/forex-today-stocks-falling-on-coronavirus-milestones/144995','Stock markets falling as new cases climb strongly in U.S.; 10 million cases, Half a million deaths; Gold hits new 8-year high; Forex seeing short-term risk recovery as week begins','2020-06-29 06:17:48.000000',3),(266442,'Markets Remain Muddled as COVID Cases Rise','https://www.dailyforex.com/forex-news/2020/06/markets-remain-muddled-as-covid-cases-rise/144923','The U.S. struggled on Friday afternoon in Asia, trading around 97.35 as of 1:58 p.m. HK/SIN. The greenback fell against the yen,','2020-06-26 06:43:14.000000',3),(266443,'Market Insights Podcast (Episode 120)','https://www.marketpulse.com/20200710/market-insights-podcast-episode-120/','Jazz FM Business Breakfast presenter Jonny Hart looks back on the week&#8217;s business and markets news with OANDA Senior Market Analysts Craig Erlam and Jeffrey Halley. This week they discuss why markets are struggling for direction, rising tensions with China over Hong Kong&#8217;s national security law, TikTok, the UK Summer Statement and the week ahead.','2020-07-10 15:36:09.000000',4),(266444,'Week Ahead – Bring on Earnings Season','https://www.marketpulse.com/20200710/week-ahead-bring-earnings-season/','No Shortage of Event Risk Next week sees earnings season get underway in the US, with the major banks all reporting on the second quarter and offering insight &#8211; if they have any &#8211; into the rest of the year. Understandably, US corporates were a little shy on the guidance last quarter but investors may [&#8230;]','2020-07-10 15:22:49.000000',4),(266445,'EU Close: Modest de-risking ahead of Earnings Season and on US virus concerns, Oil rises, Gold holds $1800 level','https://www.marketpulse.com/20200710/eu-close-modest-de-risking-ahead-earnings-season-us-virus-concerns-oil-rises-gold-holds-1800-level/','Second quarter results will be awful for many companies and Wall Street will now get a clearer picture of how bad the labor market got for corporate America.  The economic recovery is struggling and with the virus not under control in the US, large corporations are likely to announce massive job cuts over the coming [&#8230;]','2020-07-10 15:19:43.000000',4),(266446,'USD/CAD yawns as Canada job growth sparkles','https://www.marketpulse.com/20200710/usd-cad-yawns-as-canada-job-growth-sparkles/','USD/CAD is showing little movement on Friday, but that has changed early in the North American session, with the release of key events on both sides of the border. In Canada, employment numbers were mixed. In the US, the Producer Price Index declined for the fourth time in five months. The headline figure came in [&#8230;]','2020-07-10 12:48:27.000000',4),(266447,'AUD/USD flirts with the 70-mark, what’s next?','https://www.marketpulse.com/20200710/aud-usd-flirts-with-the-70-mark-whats-next/','For currency traders with an appetite for action, look no further than the Australian dollar. AUD/USD has been on a hyper-coaster ride in the first half of 2020. The pair was abysmal in Q1, falling 13.1 percent. Yet the plucky Aussie has clawed its way back and managed to recover almost all of these losses [&#8230;]','2020-07-10 10:48:35.000000',4),(266448,'Gold consolidates above US 1800 but oil retreats','https://www.marketpulse.com/20200710/gold-consolidates-oil-retreats/','Oil retreats as short-term bullish sentiment fade Both Brent crude and WTI retreated overnight as the short-term noise from equity markets spilt over into energy markets. Brent crude fell by 3.15% to USD 39.60 a barrel. The falls overnight, however, look more to do with position adjustments and short-term tail chasing, rather than a structural [&#8230;]','2020-07-10 09:29:55.000000',4),(266449,'Dollar dance continues, yuan breaks below 7.00','https://www.marketpulse.com/20200710/dollar-dance-continues-yuan-breaks-below-7-00/','The US dollar posts modest gains overnight The US dollar continues its dance in both directions, as the global stock markets are also looking for firmer footing. Will the greenback continue to show a lack of a trend in the Friday session? Having teased markets earlier this week with the possibility of a downside US [&#8230;]','2020-07-10 09:19:27.000000',4),(266450,'European Open – A Testing Day For Stocks','https://www.marketpulse.com/20200710/european-open-testing-day-stocks/','Indices Near Major Support The week got off to a promising start but its all been downhill from there and stock markets are on course to spend another day in the red on Friday, with some indices potentially testing major support levels. The obvious exception here is the Nasdaq which continues to defy gravity thanks [&#8230;]','2020-07-10 08:10:20.000000',4),(266451,'China equities slip on US sanctions','https://www.marketpulse.com/20200710/china-equities-slip-on-us-sanctions/','Equities ease in Asia after a mixed session on Wall Street The short-term FOMO herd continued chasing its tail in New York overnight, as they have been doing all week. Yesterday it was the turn of Covid-19 to doom the world again. Interestingly the herd chose a new strategy, sell traditional stocks and hedge via [&#8230;]','2020-07-10 07:46:37.000000',4),(266452,'Stuck in a lifeboat with a Peloton bike','https://www.marketpulse.com/20200710/stuck-in-a-lifeboat-with-a-peloton-bike/','Financial markets show consolidation The Covid-19 hand-wringing is out in force again overnight, with North American markets mostly giving back the previous day’s gains across asset classes. Contrast that with Wednesday, where all was light and sunshine, having endured another end of days Covid-19 session on Tuesday. As the dust settles on this week, I [&#8230;]','2020-07-10 07:32:17.000000',4),(266453,'USD/CAD dips despite strong housing data','https://www.marketpulse.com/20200709/usd-cad-dips-despite-strong-housing-data/','USD/CAD has posted gains in Thursday trade. In the North American session, the pair is trading at 1.3564, up 0.38% on the day. On the release front, Canada Housing Starts improved to 212 thousand, above expectations. In the US, jobless claims fell for a 13th straight week, to 1.31 million. On Friday, Canada will release [&#8230;]','2020-07-09 16:07:54.000000',4),(266454,'US Open – Jobless claims continue to head in right direction, Biden’s economic plan, Oil anchored, Gold shines','https://www.marketpulse.com/20200709/us-open-jobless-claims-continue-head-right-direction-bidens-economic-plan-oil-anchored-gold-shines/','Risk appetite is struggling as the coronavirus spread is still not under control in most parts of the world and as geopolitical tensions between China and the West intensify. Australia’s decision to suspend the extradition treaty with Hong Kong in response to their new security law shows the US could have international support in dealing [&#8230;]','2020-07-09 13:10:51.000000',4),(266455,'GBP/USD up on mini-budget, Brexit talks next','https://www.marketpulse.com/20200709/cable-mini-budget-brexit-talks-resume/','With the US dollar continuing to underperform, the British pound has taken advantage and racked up gains of 1.2% this week. Currently, GBP/USD is trading at 1.2649, up 0.32% on the day. This week&#8217;s economic data has been mostly of the second-tier variety, so the markets had more time to focus on the UK summer [&#8230;]','2020-07-09 12:48:55.000000',4),(266456,'Gold punches past USD1800, oil drifts','https://www.marketpulse.com/20200709/gold-punches-past-usd-1800-oil-drifts/','Oil drifts higher as range-trading continues A fall in US gasoline inventories by 4.85 million barrels overnight offset the unexpected rise in official crude inventories by 5.65 million barrels. That limited any negative sentiment and reassured investors that petroleum consumption remains robust in the US, despite the economic hit caused by the increase in Covid-19 [&#8230;]','2020-07-09 11:03:54.000000',4),(266457,'Normal service is resumed','https://www.marketpulse.com/20200709/normal-service-resumed/','Financial Markets Recover As quickly as it appeared, the doom and gloom of yesterday was consigned to the financial market&#8217;s dustbin, with normal service resuming on Wall Street overnight. US equities recorded a strong session led by the usual suspects, big tech. The US dollar continued its gentle move lower while energy markets crept higher. [&#8230;]','2020-07-09 10:48:05.000000',4),(266458,'US dollar dips lower','https://www.marketpulse.com/20200709/us-dollar-dips-lower/','The US dollar resumes its slow move lower With equity markets returning to FOMO v-shaped recovery mode, the green light was given for the US dollar sell-off to resume, after pausing on Tuesday. Price action was orderly though, with the US index falling just 0.40% to 96.50. The US sold 10-year notes at a record [&#8230;]','2020-07-09 10:42:26.000000',4),(266459,'Asian stock markets in consolidation mode','https://www.marketpulse.com/20200709/asian-stock-markets-in-consolidation-mode/','Equities are trading sideways in the Asia-Pacific region US equity markets continue to show movement in both directions, but we are not seeing this trend in the Asian markets in Thursday trade. Equity markets across the region showed solidity yesterday, refusing to bow to the schizophrenic noise from Wall Street. With the former having taken [&#8230;]','2020-07-09 10:24:48.000000',4),(266460,'European Open – Easing into earning season','https://www.marketpulse.com/20200709/european-open-easing-earning-season/','The Stimulus Keeps Coming European stock markets are off to a decent start on Thursday, following a couple of days of declines as indices continue to linger close to recent highs. There&#8217;s no doubt that the bounceback has stalled but, encouragingly, we&#8217;re not yet in reverse despite the growing concerns about Covid second waves. Naturally, [&#8230;]','2020-07-09 09:12:38.000000',4),(266461,'Business Breakfast Podcast (Episode 57)','https://www.marketpulse.com/20200709/business-breakfast-podcast-episode-57/','OANDA Senior Market Analyst Craig Erlam previews the day&#8217;s business and market news with Jazz FM Business Breakfast presenter Michael Wilson. This morning they discuss the UK summer statement and how the markets are trading going into earnings season.','2020-07-09 07:53:52.000000',4),(266462,'Gold – Time to shine?','https://www.marketpulse.com/20200708/gold-time-shine/','OANDA Senior Market Analyst Craig Erlam discusses gold as it tests long term resistance at $1,800 after grinding higher for months.','2020-07-08 19:48:15.000000',4);
/*!40000 ALTER TABLE `cms_newsitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_newssettings`
--

DROP TABLE IF EXISTS `cms_newssettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_newssettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`),
  CONSTRAINT `cms_newssettings_site_id_42afd89e_fk_wagtailcore_site_id` FOREIGN KEY (`site_id`) REFERENCES `wagtailcore_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_newssettings`
--

LOCK TABLES `cms_newssettings` WRITE;
/*!40000 ALTER TABLE `cms_newssettings` DISABLE KEYS */;
INSERT INTO `cms_newssettings` VALUES (1,4);
/*!40000 ALTER TABLE `cms_newssettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_newssource`
--

DROP TABLE IF EXISTS `cms_newssource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_newssource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `setting_id` int(11) NOT NULL,
  `url_site` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_newssource_setting_id_38766d56` (`setting_id`),
  CONSTRAINT `cms_newssource_setting_id_38766d56_fk_cms_newssettings_id` FOREIGN KEY (`setting_id`) REFERENCES `cms_newssettings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_newssource`
--

LOCK TABLES `cms_newssource` WRITE;
/*!40000 ALTER TABLE `cms_newssource` DISABLE KEYS */;
INSERT INTO `cms_newssource` VALUES (1,0,'Fx Street','http://xml.fxstreet.com/news/forex-news/index.xml',1,1,'http://fxstreet.com'),(2,1,'Market Watch','http://feeds.marketwatch.com/marketwatch/topstories/',1,1,'http://marketwatch.com'),(3,2,'Daily forex','https://www.dailyforex.com/rss/forexnews.xml',1,1,'https://www.dailyforex.com'),(4,3,'Market pulse','https://www.marketpulse.com/feed/',1,1,'https://www.marketpulse.com');
/*!40000 ALTER TABLE `cms_newssource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_offer`
--

DROP TABLE IF EXISTS `cms_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_offer` (
  `voucher_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`voucher_ptr_id`),
  CONSTRAINT `cms_offer_voucher_ptr_id_ba67497f_fk_cms_voucher_id` FOREIGN KEY (`voucher_ptr_id`) REFERENCES `cms_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_offer`
--

LOCK TABLES `cms_offer` WRITE;
/*!40000 ALTER TABLE `cms_offer` DISABLE KEYS */;
INSERT INTO `cms_offer` VALUES (2);
/*!40000 ALTER TABLE `cms_offer` ENABLE KEYS */;
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
  `name` varchar(150) NOT NULL,
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
  `slug` varchar(50) DEFAULT NULL,
  `affiliate_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `logo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_product_service_id_77729560_fk_cms_service_id` (`service_id`),
  KEY `cms_product_slug_592747a2` (`slug`),
  KEY `cms_product_affiliate_id_744626e0` (`affiliate_id`),
  CONSTRAINT `cms_product_service_id_77729560_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_product`
--

LOCK TABLES `cms_product` WRITE;
/*!40000 ALTER TABLE `cms_product` DISABLE KEYS */;
INSERT INTO `cms_product` VALUES (1,'MT4 ECN Account','<ol><li>Test</li><li>Test</li><li>Test</li><li>Test</li></ol>','mt4-ecn-account',2,NULL,NULL);
/*!40000 ALTER TABLE `cms_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_promocode`
--

DROP TABLE IF EXISTS `cms_promocode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_promocode` (
  `voucher_ptr_id` int(11) NOT NULL,
  `code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`voucher_ptr_id`),
  CONSTRAINT `cms_promocode_voucher_ptr_id_37250ff8_fk_cms_voucher_id` FOREIGN KEY (`voucher_ptr_id`) REFERENCES `cms_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_promocode`
--

LOCK TABLES `cms_promocode` WRITE;
/*!40000 ALTER TABLE `cms_promocode` DISABLE KEYS */;
INSERT INTO `cms_promocode` VALUES (1,'sdsdsdsdsd'),(5,'4545');
/*!40000 ALTER TABLE `cms_promocode` ENABLE KEYS */;
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
INSERT INTO `cms_regulation` VALUES (1,'FCA','The Financial Conduct Authority','https://www.fca.org.uk/',194),(2,'CNV','The Stock Market National Committee','https://www.fca.org.uk/',194),(3,'ASIC','Australian Securities and Investments Commission','https://asic.gov.au/',10),(4,'APRA','Australian Prudential Regulation Authority','https://www.fca.org.uk/',194),(5,'AUSTRAC','AUSTRAC - Australian Transaction Report and Analysis Centre','https://www.fca.org.uk/',194),(6,'FMA','Financial Market Authority','https://www.fca.org.uk/',194),(7,'SCB','Securities Commission of The Bahamas','https://www.fca.org.uk/',194),(8,'CBB','Central Bank of Bahrain','https://www.fca.org.uk/',194),(9,'FSMA','Financial Services and Markets Authority','https://www.fca.org.uk/',194),(10,'IFSC','International Financial Services Commission','https://www.fca.org.uk/',194),(11,'NBFIRA','Non-Bank Financial Institutions Regulatory Authority','https://www.fca.org.uk/',194),(12,'CVM','Securities and Exchange Commission of Brazil','https://www.fca.org.uk/',194),(13,'FSC','Financial Services Commission','https://www.fca.org.uk/',194),(14,'BNB','Bulgarian National Bank','https://www.fca.org.uk/',194),(15,'IIROC','Investment Industry Regulatory Organization of Canada','https://www.fca.org.uk/',194),(16,'CIPF','Canadian Investor Protection Fund','https://www.fca.org.uk/',194),(17,'CIMA','Cayman Islands Monetary Authority','https://www.fca.org.uk/',194),(18,'CSRC','China Securities Regulatory Commission','https://www.fca.org.uk/',194),(19,'FSCEY','Financial Supervisory Commission','https://www.fca.org.uk/',194),(20,'HANFA','Croatian Financial Services Supervisory Agency','https://www.fca.org.uk/',194),(21,'CySEC','Cyprus Securities and Exchange Commission','https://www.cysec.gov.cy/',39),(22,'CNB','Czech National Bank','https://www.fca.org.uk/',194),(23,'DFSA','Financial Supervision Authority','https://www.fca.org.uk/',194),(24,'EFSA','Egyptian Financial Supervisory Authority','https://www.fca.org.uk/',194),(25,'FSAEE','Financial Supervision Authority','https://www.fca.org.uk/',194),(26,'MKM','Ministry of Economic Affairs and Communications','https://www.fca.org.uk/',194),(27,'FINFSA','Financial Supervision Authority','https://www.fca.org.uk/',194),(28,'AMF','Financial Markets Authority','https://www.fca.org.uk/',194),(29,'CECEI','Credit Institutions and Investment Firms Committee','https://www.fca.org.uk/',194),(30,'REGAFI','The Financial Firms Register','https://www.fca.org.uk/',194),(31,'ACPR','The Prudential Control and Resolution Authority','https://www.fca.org.uk/',194),(32,'BaFin','Federal Financial Supervisory Authority','https://www.fca.org.uk/',194),(33,'FSC','Financial Services Commission','https://www.fca.org.uk/',194),(34,'CMC','Capital Markets Commission','https://www.fca.org.uk/',194),(35,'SFC','The Securities and Futures Commission','https://www.fca.org.uk/',194),(36,'FinCom','The Financial Commission','https://www.fca.org.uk/',194),(37,'HFSA','Hungarian Financial Supervisory Authority','https://www.fca.org.uk/',194),(38,'CBH','Central Bank of Hungary','https://www.fca.org.uk/',194),(39,'SEBI','Securities and Exchange Board of India','https://www.fca.org.uk/',194),(40,'CDSL','Central Depository Services Limited','https://www.fca.org.uk/',194),(41,'NSDL','National Securities Depository','https://www.fca.org.uk/',194),(42,'CoFTRA','Commodity Futures Trading Regulatory Agency','https://www.fca.org.uk/',194),(43,'CBI','Central Bank of Ireland','https://www.fca.org.uk/',194),(44,'ISA','Israel Securities Authority','https://www.fca.org.uk/',194),(45,'CONSOB','National Commission for Companies and the Stock Exchange','https://www.fca.org.uk/',194),(46,'FSC','Financial Services Commission','https://www.fca.org.uk/',194),(47,'JSDA','Japan Securities Dealers Association','https://www.fca.org.uk/',194),(48,'FSA','Financial Services Agency','https://www.fca.org.uk/',194),(49,'JSC','Jordan Securities Commission','https://www.fca.org.uk/',194),(50,'CMA','Kenya Capital Markets Authority','https://www.fca.org.uk/',194),(51,'KCCI','Kuwait Chamber of Commerce & Industry','https://www.fca.org.uk/',194),(52,'FCMC','Financial and Capital Market Commission','https://www.fca.org.uk/',194),(53,'BDL','Central bank of Lebanon','https://www.fca.org.uk/',194),(54,'AFE','The Arab Federation of Exchanges','https://www.fca.org.uk/',194),(55,'LSC','Lithuanian Securities Commission','https://www.fca.org.uk/',194),(56,'CSSF','Commission de Surveillance du Secteur Financier','https://www.fca.org.uk/',194),(57,'MFSA','Malta Financial Services Authority','https://www.fca.org.uk/',194),(58,'FSC','Financial Services Commission','https://www.fca.org.uk/',194),(59,'CNBV','Comision Nacional Bancaria y de Valores','https://www.fca.org.uk/',194),(60,'CDVM','Moroccan Financial markets Authority','https://www.fca.org.uk/',194),(61,'AFM','Financial Markets Authority','https://www.fca.org.uk/',194),(62,'FSPR','Financial Service Providers Register','https://www.fca.org.uk/',194),(63,'NZX','NZX Regulation','https://www.fca.org.uk/',194),(64,'FDRS','Financial Dispute Resolution Service','https://www.fca.org.uk/',194),(65,'CIMA','Cayman Islands Monetary Authority','https://www.fca.org.uk/',194),(66,'NFSA','The Financial Supervisory Authority Of Norway','https://www.fca.org.uk/',194),(67,'SEC','Pakistan Securities and Exchange Commission','https://www.fca.org.uk/',194),(68,'SMV','Superintendence of Securities','https://www.fca.org.uk/',194),(69,'SEC','Philippines Securities and Exchange Commission','https://www.fca.org.uk/',194),(70,'PFSA','Polish Financial Supervision Authority','https://www.fca.org.uk/',194),(71,'CMVM','Portuguese Securities Market Commission','https://www.fca.org.uk/',194),(72,'QCB','Qatar Central Bank','https://www.fca.org.uk/',194),(73,'CNVMR','Romanian National Securities Commission','https://www.fca.org.uk/',194),(74,'FCSM','Federal Commission of Securities Market','https://www.fca.org.uk/',194),(75,'CRFIN','Centre for Regulation in OTC Financial Instruments and Technologies','https://www.fca.org.uk/',194),(76,'Naufor','Naufor - Russian national Association Of Securities Market Participants','https://www.fca.org.uk/',194),(77,'CROFR','Financial Market Relations Regulation Center','https://www.fca.org.uk/',194),(78,'CBR','Central Bank of the Russian Federation','https://www.fca.org.uk/',194),(79,'ARB','Association of Russian Banks','https://www.fca.org.uk/',194),(80,'ASROS','Association of Regional Banks of Russia','https://www.fca.org.uk/',194),(81,'CROFR ','Center for Regulatory Relations in The Financial Markets','https://www.fca.org.uk/',194),(82,'SVGFSA','Financial Services Authority','https://www.fca.org.uk/',194),(83,'CMA','Capital Market Authority','https://www.fca.org.uk/',194),(84,'MAS','Monetary Authority of Singapore','https://www.fca.org.uk/',194),(85,'FSB','Financial Services Board','https://www.fca.org.uk/',194),(86,'CNMV','Spanish Securities Market Commission','https://www.fca.org.uk/',194),(87,'CBSL','Central Bank of Sri Lanka','https://www.fca.org.uk/',194),(88,'SEC','Securities And Exchange commission of Sri Lanka','https://www.fca.org.uk/',194),(89,'FSA','Financial Supervisory Authority','https://www.fca.org.uk/',194),(90,'FINMA','Financial Market Supervisory Authority','https://www.fca.org.uk/',194),(91,'SFSA','Seychelles Financial Services Authority','https://www.fca.org.uk/',194),(92,'SCB','The Siam Commercial Bank Public Company','https://www.fca.org.uk/',194),(93,'BOT','Bank Of Thailand','https://www.fca.org.uk/',194),(94,'CMB [SPK]','Capital Markets Board of Turkey','https://www.fca.org.uk/',194),(95,'NSSMC','National Securities and Stock Market Commission','https://www.fca.org.uk/',194),(96,'UCRFIN','Ukrainian Centre for OTC Financial Instruments and Technologies Development','https://www.fca.org.uk/',194),(97,'DFSA','Dubai Financial Services Authority','https://www.fca.org.uk/',194),(98,'UAE Central Bank','Central Bank of the U.A.E','https://www.fca.org.uk/',194),(99,'SCA','Emirates Securities and Commodities Authority','https://www.fca.org.uk/',194),(100,'VFSC','Vanuatu Financial Services Commission','https://www.fca.org.uk/',194),(101,'FSA','Financial Services Authority','https://www.fca.org.uk/',194),(102,'CFTC','U.S. Commodity Futures Trading Commission','https://www.fca.org.uk/',194),(103,'FINRA','Financial Industry Regulatory Authority','https://www.fca.org.uk/',194),(104,'NFA','National Futures Association','https://www.fca.org.uk/',194),(105,'SEC','Securities and Exchange Commission','https://www.fca.org.uk/',194),(106,'SIPC','Securities Investor Protection Corporation','https://www.fca.org.uk/',194),(107,'FDIC','Federal Deposit Insurance Corporation','https://www.fca.org.uk/',194),(108,'FATCA','Foreign Account Tax Compliance Act','https://www.fca.org.uk/',194);
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
  `name` varchar(150) NOT NULL,
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
-- Table structure for table `cms_securityoffunds`
--

DROP TABLE IF EXISTS `cms_securityoffunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_securityoffunds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_securityoffunds`
--

LOCK TABLES `cms_securityoffunds` WRITE;
/*!40000 ALTER TABLE `cms_securityoffunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_securityoffunds` ENABLE KEYS */;
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
  `ea_robots` tinyint(1) NOT NULL,
  `scalping` tinyint(1) NOT NULL,
  `hedging` tinyint(1) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(500) DEFAULT NULL,
  `office_address` varchar(500) DEFAULT NULL,
  `minimum_deposit` varchar(20) NOT NULL,
  `commission` varchar(20) NOT NULL,
  `leverage` varchar(20) NOT NULL,
  `spread` varchar(20) NOT NULL,
  `about` longtext,
  `affiliate_id` int(11) DEFAULT NULL,
  `logo_id` int(11) DEFAULT NULL,
  `preview_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `timezone_id` int(11) DEFAULT NULL,
  `avg_rate` double DEFAULT NULL,
  `count_rate` int(11) DEFAULT NULL,
  `min_lot_size` varchar(20) NOT NULL,
  `news_trading` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `meta_description` varchar(3000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_service_affiliate_id_2d5f5356_fk_cms_affiliate_id` (`affiliate_id`),
  KEY `cms_service_logo_id_3f889414_fk_wagtailimages_image_id` (`logo_id`),
  KEY `cms_service_preview_id_f182e025_fk_wagtailimages_image_id` (`preview_id`),
  KEY `cms_service_slug_55272fe2` (`slug`),
  KEY `cms_service_status_id_e2614e33_fk_cms_status_id` (`status_id`),
  KEY `cms_service_timezone_id_ebd61c1d_fk_cms_timezone_id` (`timezone_id`),
  CONSTRAINT `cms_service_affiliate_id_2d5f5356_fk_cms_affiliate_id` FOREIGN KEY (`affiliate_id`) REFERENCES `cms_affiliate` (`id`),
  CONSTRAINT `cms_service_logo_id_3f889414_fk_wagtailimages_image_id` FOREIGN KEY (`logo_id`) REFERENCES `wagtailimages_image` (`id`),
  CONSTRAINT `cms_service_preview_id_f182e025_fk_wagtailimages_image_id` FOREIGN KEY (`preview_id`) REFERENCES `wagtailimages_image` (`id`),
  CONSTRAINT `cms_service_status_id_e2614e33_fk_cms_status_id` FOREIGN KEY (`status_id`) REFERENCES `cms_status` (`id`),
  CONSTRAINT `cms_service_timezone_id_ebd61c1d_fk_cms_timezone_id` FOREIGN KEY (`timezone_id`) REFERENCES `cms_timezone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service`
--

LOCK TABLES `cms_service` WRITE;
/*!40000 ALTER TABLE `cms_service` DISABLE KEYS */;
INSERT INTO `cms_service` VALUES (2,'synergyfx',1,'syner',3032,1,1,1,'customer@help.com','3343434',NULL,'23','2','23','2','<p>Vivamus eget efficitur sem, in venenatis sapien. Phasellus porta mauris est, vel rutrum neque consectetur id. Mauris iaculis mi odio, eget dapibus ex mollis id. Maecenas eget nibh aliquet, ornare ligula sed, convallis est. Nunc a nisl condimentum, mollis nisi ac, varius orci. Nulla ultrices pellentesque imperdiet. Duis laoreet mauris sed magna viverra, ut euismod diam lobortis. Donec varius volutpat orci vel interdum. Pellentesque eget erat quis neque scelerisque fringilla nec ornare augue. Aenean sit amet purus quis odio egestas pulvinar. In hac habitasse platea dictumst. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p><p>Curabitur dictum libero nec lacus elementum, sed lobortis arcu euismod. Etiam ut ex sit amet tellus tincidunt lobortis a vitae risus. In tempor posuere viverra. Aliquam ac purus commodo ex posuere egestas eu at lectus. Duis diam lectus, elementum id aliquam sed, convallis a velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nec ex ut urna egestas porta. Proin tellus justo, tincidunt vel dolor quis, fringilla ullamcorper quam. Cras tellus nulla, commodo at odio nec, imperdiet tincidunt risus. Proin congue urna at elit iaculis molestie. Praesent accumsan sodales dictum. Duis turpis neque, ullamcorper id sem ac, fringilla congue mauris. Pellentesque vehicula et nunc eget pellentesque. Nulla dignissim leo et ex fringilla fringilla.</p><p>Aenean ultricies diam ligula, eu vulputate sapien ornare non. Proin quis dui et lorem pellentesque vestibulum ut et dolor. Pellentesque lectus leo, tempus vel massa vitae, ultricies ornare mi. Suspendisse sodales tempus bibendum. Curabitur ac fermentum eros. Cras posuere est eleifend, hendrerit magna in, mattis tellus. Sed luctus odio id commodo aliquet. Donec at velit sit amet lorem sagittis sollicitudin et at ipsum. Integer sollicitudin imperdiet neque et suscipit. Maecenas dapibus sem ex, eget varius dolor dictum vel. Aenean a mollis velit, sit amet mollis tellus. Aliquam eget sapien eget orci suscipit eleifend eget quis velit. Suspendisse malesuada ante erat. Nulla quis dolor vel sem feugiat gravida. Maecenas quis bibendum elit.</p>',2,9,14,2,3,NULL,NULL,'',1,'2019-10-08 00:00:00.000000',''),(3,'IC Markets',1,'ic-markets',2007,1,0,1,'eerer@wewe.cssds','3343434','417 W 41st St, 7','200','455','2323','23222','<p>about this broker goes here</p>',1,16,18,1,11,5,1,'22',1,'2019-10-08 00:00:00.000000',''),(4,'MM   A',1,'mm-a',NULL,1,1,1,NULL,NULL,NULL,'','','','','<p>Vivamus eget efficitur sem, in venenatis sapien. Phasellus porta mauris est, vel rutrum neque consectetur id. Mauris iaculis mi odio, eget dapibus ex mollis id. Maecenas eget nibh aliquet, ornare ligula sed, convallis est. Nunc a nisl condimentum, mollis nisi ac, varius orci. Nulla ultrices pellentesque imperdiet. Duis laoreet mauris sed magna viverra, ut euismod diam lobortis. Donec varius volutpat orci vel interdum. Pellentesque eget erat quis neque scelerisque fringilla nec ornare augue. Aenean sit amet purus quis odio egestas pulvinar. In hac habitasse platea dictumst. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p><p>Curabitur dictum libero nec lacus elementum, sed lobortis arcu euismod. Etiam ut ex sit amet tellus tincidunt lobortis a vitae risus. In tempor posuere viverra. Aliquam ac purus commodo ex posuere egestas eu at lectus. Duis diam lectus, elementum id aliquam sed, convallis a velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nec ex ut urna egestas porta. Proin tellus justo, tincidunt vel dolor quis, fringilla ullamcorper quam. Cras tellus nulla, commodo at odio nec, imperdiet tincidunt risus. Proin congue urna at elit iaculis molestie. Praesent accumsan sodales dictum. Duis turpis neque, ullamcorper id sem ac, fringilla congue mauris. Pellentesque vehicula et nunc eget pellentesque. Nulla dignissim leo et ex fringilla fringilla.</p><p>Aenean ultricies diam ligula, eu vulputate sapien ornare non. Proin quis dui et lorem pellentesque vestibulum ut et dolor. Pellentesque lectus leo, tempus vel massa vitae, ultricies ornare mi. Suspendisse sodales tempus bibendum. Curabitur ac fermentum eros. Cras posuere est eleifend, hendrerit magna in, mattis tellus. Sed luctus odio id commodo aliquet. Donec at velit sit amet lorem sagittis sollicitudin et at ipsum. Integer sollicitudin imperdiet neque et suscipit. Maecenas dapibus sem ex, eget varius dolor dictum vel. Aenean a mollis velit, sit amet mollis tellus. Aliquam eget sapien eget orci suscipit eleifend eget quis velit. Suspendisse malesuada ante erat. Nulla quis dolor vel sem feugiat gravida. Maecenas quis bibendum elit.</p>',2,15,4,NULL,NULL,NULL,NULL,'',1,'2019-10-08 00:00:00.000000',''),(6,'broker2',1,'broker2',NULL,1,1,1,NULL,NULL,NULL,'100','7.5','500','0.5','',1,15,NULL,1,NULL,3.5,4,'1.0',1,'2020-01-28 23:50:31.209948','broker2'),(7,'broker3',1,'broker3',NULL,1,1,1,NULL,NULL,NULL,'','','','','',1,15,14,NULL,NULL,5,1,'',1,'2020-01-29 00:00:19.082392','');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_account_currency`
--

LOCK TABLES `cms_service_account_currency` WRITE;
/*!40000 ALTER TABLE `cms_service_account_currency` DISABLE KEYS */;
INSERT INTO `cms_service_account_currency` VALUES (5,2,2),(6,3,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_account_options`
--

LOCK TABLES `cms_service_account_options` WRITE;
/*!40000 ALTER TABLE `cms_service_account_options` DISABLE KEYS */;
INSERT INTO `cms_service_account_options` VALUES (4,2,2),(5,3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_account_types`
--

LOCK TABLES `cms_service_account_types` WRITE;
/*!40000 ALTER TABLE `cms_service_account_types` DISABLE KEYS */;
INSERT INTO `cms_service_account_types` VALUES (4,2,2),(5,3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_broker_type`
--

LOCK TABLES `cms_service_broker_type` WRITE;
/*!40000 ALTER TABLE `cms_service_broker_type` DISABLE KEYS */;
INSERT INTO `cms_service_broker_type` VALUES (2,2,2),(5,3,2),(4,6,3);
/*!40000 ALTER TABLE `cms_service_broker_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_category`
--

DROP TABLE IF EXISTS `cms_service_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_category_service_id_category_id_46f5f048_uniq` (`service_id`,`category_id`),
  KEY `cms_service_category_category_id_a9a7a1ba_fk_cms_category_id` (`category_id`),
  CONSTRAINT `cms_service_category_category_id_a9a7a1ba_fk_cms_category_id` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`id`),
  CONSTRAINT `cms_service_category_service_id_50df7c31_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_category`
--

LOCK TABLES `cms_service_category` WRITE;
/*!40000 ALTER TABLE `cms_service_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_category` ENABLE KEYS */;
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
-- Table structure for table `cms_service_deposit_method`
--

DROP TABLE IF EXISTS `cms_service_deposit_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_deposit_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `paymentmethod_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_deposit_meth_service_id_paymentmethod_9f51bd50_uniq` (`service_id`,`paymentmethod_id`),
  KEY `cms_service_deposit__paymentmethod_id_c7403eee_fk_cms_payme` (`paymentmethod_id`),
  CONSTRAINT `cms_service_deposit__paymentmethod_id_c7403eee_fk_cms_payme` FOREIGN KEY (`paymentmethod_id`) REFERENCES `cms_paymentmethod` (`id`),
  CONSTRAINT `cms_service_deposit_method_service_id_2c97ab0b_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_deposit_method`
--

LOCK TABLES `cms_service_deposit_method` WRITE;
/*!40000 ALTER TABLE `cms_service_deposit_method` DISABLE KEYS */;
INSERT INTO `cms_service_deposit_method` VALUES (1,3,2),(2,6,1),(4,6,7);
/*!40000 ALTER TABLE `cms_service_deposit_method` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_international_offices`
--

LOCK TABLES `cms_service_international_offices` WRITE;
/*!40000 ALTER TABLE `cms_service_international_offices` DISABLE KEYS */;
INSERT INTO `cms_service_international_offices` VALUES (2,2,5),(4,3,130);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_license`
--

LOCK TABLES `cms_service_license` WRITE;
/*!40000 ALTER TABLE `cms_service_license` DISABLE KEYS */;
INSERT INTO `cms_service_license` VALUES (2,2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_location`
--

LOCK TABLES `cms_service_location` WRITE;
/*!40000 ALTER TABLE `cms_service_location` DISABLE KEYS */;
INSERT INTO `cms_service_location` VALUES (3,2,4),(5,3,10);
/*!40000 ALTER TABLE `cms_service_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_operating_system`
--

DROP TABLE IF EXISTS `cms_service_operating_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_operating_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `platformsupported_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_operating_sy_service_id_platformsuppo_1c27b623_uniq` (`service_id`,`platformsupported_id`),
  KEY `cms_service_operatin_platformsupported_id_cd42ce66_fk_cms_platf` (`platformsupported_id`),
  CONSTRAINT `cms_service_operatin_platformsupported_id_cd42ce66_fk_cms_platf` FOREIGN KEY (`platformsupported_id`) REFERENCES `cms_platformsupported` (`id`),
  CONSTRAINT `cms_service_operatin_service_id_64694f3a_fk_cms_servi` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_operating_system`
--

LOCK TABLES `cms_service_operating_system` WRITE;
/*!40000 ALTER TABLE `cms_service_operating_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_operating_system` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_pricing_model`
--

LOCK TABLES `cms_service_pricing_model` WRITE;
/*!40000 ALTER TABLE `cms_service_pricing_model` DISABLE KEYS */;
INSERT INTO `cms_service_pricing_model` VALUES (2,2,2),(1,3,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_regulation`
--

LOCK TABLES `cms_service_regulation` WRITE;
/*!40000 ALTER TABLE `cms_service_regulation` DISABLE KEYS */;
INSERT INTO `cms_service_regulation` VALUES (4,2,3),(8,3,3),(9,3,21),(7,3,48),(6,6,2);
/*!40000 ALTER TABLE `cms_service_regulation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_restrictions`
--

DROP TABLE IF EXISTS `cms_service_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_restrictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_restrictions_service_id_location_id_658d14a1_uniq` (`service_id`,`location_id`),
  KEY `cms_service_restrictions_location_id_672da961_fk_cms_location_id` (`location_id`),
  CONSTRAINT `cms_service_restrictions_location_id_672da961_fk_cms_location_id` FOREIGN KEY (`location_id`) REFERENCES `cms_location` (`id`),
  CONSTRAINT `cms_service_restrictions_service_id_1860bf71_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_restrictions`
--

LOCK TABLES `cms_service_restrictions` WRITE;
/*!40000 ALTER TABLE `cms_service_restrictions` DISABLE KEYS */;
INSERT INTO `cms_service_restrictions` VALUES (3,3,28),(5,3,68),(4,3,71),(2,3,155);
/*!40000 ALTER TABLE `cms_service_restrictions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_revenue_model`
--

LOCK TABLES `cms_service_revenue_model` WRITE;
/*!40000 ALTER TABLE `cms_service_revenue_model` DISABLE KEYS */;
INSERT INTO `cms_service_revenue_model` VALUES (3,2,3),(4,3,2);
/*!40000 ALTER TABLE `cms_service_revenue_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_security_of_funds`
--

DROP TABLE IF EXISTS `cms_service_security_of_funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_security_of_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `securityoffunds_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_security_of__service_id_securityoffun_c27a54ce_uniq` (`service_id`,`securityoffunds_id`),
  KEY `cms_service_security_securityoffunds_id_42c747ac_fk_cms_secur` (`securityoffunds_id`),
  CONSTRAINT `cms_service_security_securityoffunds_id_42c747ac_fk_cms_secur` FOREIGN KEY (`securityoffunds_id`) REFERENCES `cms_securityoffunds` (`id`),
  CONSTRAINT `cms_service_security_service_id_148362be_fk_cms_servi` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_security_of_funds`
--

LOCK TABLES `cms_service_security_of_funds` WRITE;
/*!40000 ALTER TABLE `cms_service_security_of_funds` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_service_security_of_funds` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_support_languages`
--

LOCK TABLES `cms_service_support_languages` WRITE;
/*!40000 ALTER TABLE `cms_service_support_languages` DISABLE KEYS */;
INSERT INTO `cms_service_support_languages` VALUES (1,3,2),(2,3,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_system_type`
--

LOCK TABLES `cms_service_system_type` WRITE;
/*!40000 ALTER TABLE `cms_service_system_type` DISABLE KEYS */;
INSERT INTO `cms_service_system_type` VALUES (2,2,2),(1,3,1);
/*!40000 ALTER TABLE `cms_service_system_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_trading_instrument`
--

DROP TABLE IF EXISTS `cms_service_trading_instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_trading_instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `tradinginstrument_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_trading_inst_service_id_tradinginstru_40bcc7a9_uniq` (`service_id`,`tradinginstrument_id`),
  KEY `cms_service_trading__tradinginstrument_id_5b7f9bfa_fk_cms_tradi` (`tradinginstrument_id`),
  CONSTRAINT `cms_service_trading__service_id_b2759aab_fk_cms_servi` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`),
  CONSTRAINT `cms_service_trading__tradinginstrument_id_f2a7a587_fk_cms_tradi` FOREIGN KEY (`tradinginstrument_id`) REFERENCES `cms_tradinginstrument` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_trading_instrument`
--

LOCK TABLES `cms_service_trading_instrument` WRITE;
/*!40000 ALTER TABLE `cms_service_trading_instrument` DISABLE KEYS */;
INSERT INTO `cms_service_trading_instrument` VALUES (3,2,2),(4,3,2);
/*!40000 ALTER TABLE `cms_service_trading_instrument` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_trading_software`
--

LOCK TABLES `cms_service_trading_software` WRITE;
/*!40000 ALTER TABLE `cms_service_trading_software` DISABLE KEYS */;
INSERT INTO `cms_service_trading_software` VALUES (12,2,2),(7,2,3),(8,2,5),(9,3,2),(10,3,3),(11,3,5),(13,7,5);
/*!40000 ALTER TABLE `cms_service_trading_software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_trading_tools`
--

DROP TABLE IF EXISTS `cms_service_trading_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_trading_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `tradingtool_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_trading_tool_service_id_tradingtool_i_c82cccf3_uniq` (`service_id`,`tradingtool_id`),
  KEY `cms_service_trading__tradingtool_id_ba3356df_fk_cms_tradi` (`tradingtool_id`),
  CONSTRAINT `cms_service_trading__tradingtool_id_ba3356df_fk_cms_tradi` FOREIGN KEY (`tradingtool_id`) REFERENCES `cms_tradingtool` (`id`),
  CONSTRAINT `cms_service_trading_tools_service_id_62993df3_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_trading_tools`
--

LOCK TABLES `cms_service_trading_tools` WRITE;
/*!40000 ALTER TABLE `cms_service_trading_tools` DISABLE KEYS */;
INSERT INTO `cms_service_trading_tools` VALUES (1,3,3);
/*!40000 ALTER TABLE `cms_service_trading_tools` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_trading_type`
--

LOCK TABLES `cms_service_trading_type` WRITE;
/*!40000 ALTER TABLE `cms_service_trading_type` DISABLE KEYS */;
INSERT INTO `cms_service_trading_type` VALUES (2,2,2),(1,3,2);
/*!40000 ALTER TABLE `cms_service_trading_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_service_withdraw_method`
--

DROP TABLE IF EXISTS `cms_service_withdraw_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_service_withdraw_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `paymentmethod_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_service_withdraw_met_service_id_paymentmethod_e5d305e8_uniq` (`service_id`,`paymentmethod_id`),
  KEY `cms_service_withdraw_paymentmethod_id_d2f02cc3_fk_cms_payme` (`paymentmethod_id`),
  CONSTRAINT `cms_service_withdraw_paymentmethod_id_d2f02cc3_fk_cms_payme` FOREIGN KEY (`paymentmethod_id`) REFERENCES `cms_paymentmethod` (`id`),
  CONSTRAINT `cms_service_withdraw_service_id_ea65a3ef_fk_cms_servi` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_service_withdraw_method`
--

LOCK TABLES `cms_service_withdraw_method` WRITE;
/*!40000 ALTER TABLE `cms_service_withdraw_method` DISABLE KEYS */;
INSERT INTO `cms_service_withdraw_method` VALUES (1,3,1);
/*!40000 ALTER TABLE `cms_service_withdraw_method` ENABLE KEYS */;
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
INSERT INTO `cms_servicepage` VALUES (33,''),(34,'');
/*!40000 ALTER TABLE `cms_servicepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_serviceslistpage`
--

DROP TABLE IF EXISTS `cms_serviceslistpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_serviceslistpage` (
  `page_ptr_id` int(11) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `cms_serviceslistpage_page_ptr_id_1c102a18_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_serviceslistpage`
--

LOCK TABLES `cms_serviceslistpage` WRITE;
/*!40000 ALTER TABLE `cms_serviceslistpage` DISABLE KEYS */;
INSERT INTO `cms_serviceslistpage` VALUES (32,''),(36,'');
/*!40000 ALTER TABLE `cms_serviceslistpage` ENABLE KEYS */;
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
-- Table structure for table `cms_staticpage`
--

DROP TABLE IF EXISTS `cms_staticpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_staticpage` (
  `translatablepage_ptr_id` int(11) NOT NULL,
  `page_ptr_id` int(11) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`translatablepage_ptr_id`),
  UNIQUE KEY `page_ptr_id` (`page_ptr_id`),
  CONSTRAINT `cms_staticpage_page_ptr_id_1a769235_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `cms_staticpage_translatablepage_ptr_177ef915_fk_wagtailtr` FOREIGN KEY (`translatablepage_ptr_id`) REFERENCES `wagtailtrans_translatablepage` (`translatable_page_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_staticpage`
--

LOCK TABLES `cms_staticpage` WRITE;
/*!40000 ALTER TABLE `cms_staticpage` DISABLE KEYS */;
INSERT INTO `cms_staticpage` VALUES (48,48,'<p>This is Forex vouchers about page</p>'),(49,49,'<p>This is Forex vouchers about page</p>'),(50,50,'<p>This is Forex vouchers about page</p>'),(51,51,''),(52,52,''),(53,53,'<p>Spanish displaymer</p>'),(54,54,''),(55,55,''),(56,56,'');
/*!40000 ALTER TABLE `cms_staticpage` ENABLE KEYS */;
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
  `name` varchar(150) NOT NULL,
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
-- Table structure for table `cms_tradingtool`
--

DROP TABLE IF EXISTS `cms_tradingtool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_tradingtool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_tradingtool`
--

LOCK TABLES `cms_tradingtool` WRITE;
/*!40000 ALTER TABLE `cms_tradingtool` DISABLE KEYS */;
INSERT INTO `cms_tradingtool` VALUES (1,'News Feeds'),(2,'Trading Indicators'),(3,'Trading System'),(4,'Premium Tools');
/*!40000 ALTER TABLE `cms_tradingtool` ENABLE KEYS */;
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
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `slug` varchar(50) NOT NULL,
  `affiliate_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `logo_id` int(11) DEFAULT NULL,
  `expires` date DEFAULT NULL,
  `never_expires` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `meta_description` varchar(3000) NOT NULL,
  `dislikes` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_voucher_service_id_b1da0f8c_fk_cms_service_id` (`service_id`),
  KEY `cms_voucher_slug_c52a7f6a` (`slug`),
  KEY `cms_voucher_affiliate_id_94f685d6` (`affiliate_id`),
  CONSTRAINT `cms_voucher_affiliate_id_94f685d6_fk_cms_affiliate_id` FOREIGN KEY (`affiliate_id`) REFERENCES `cms_affiliate` (`id`),
  CONSTRAINT `cms_voucher_service_id_b1da0f8c_fk_cms_service_id` FOREIGN KEY (`service_id`) REFERENCES `cms_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_voucher`
--

LOCK TABLES `cms_voucher` WRITE;
/*!40000 ALTER TABLE `cms_voucher` DISABLE KEYS */;
INSERT INTO `cms_voucher` VALUES (1,'25% discount on Synergy FX with promocode','<p>This is a test voucher. This is a test voucher. This is a test voucher. This is a test voucher. This is a test voucher. This is a test voucher. This is a test voucher. This is a test voucher. This is a test voucher. This is a test voucher. This is a test voucher. This is a test voucher. This is a test voucher. </p>','synergyfx',2,6,10,'2019-10-04',1,'2019-10-08 00:00:00.000000','great promocode!',1,6),(2,'First Offer','<p>Testing the offer.</p><p></p>','first-offer',2,NULL,9,'2019-10-28',0,'2019-10-27 19:27:33.182089','',0,0),(3,'great discount','<p>Vivamus eget efficitur sem, in venenatis sapien. Phasellus porta mauris est, vel rutrum neque consectetur id. Mauris iaculis mi odio, eget dapibus ex mollis id. Maecenas eget nibh aliquet, ornare ligula sed, convallis est. Nunc a nisl condimentum, mollis nisi ac, varius orci. Nulla ultrices pellentesque imperdiet. Duis laoreet mauris sed magna viverra, ut euismod diam lobortis. Donec varius volutpat orci vel interdum. Pellentesque eget erat quis neque scelerisque fringilla nec ornare augue. Aenean sit amet purus quis odio egestas pulvinar. In hac habitasse platea dictumst. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p><p>Curabitur dictum libero nec lacus elementum, sed lobortis arcu euismod. Etiam ut ex sit amet tellus tincidunt lobortis a vitae risus. In tempor posuere viverra. Aliquam ac purus commodo ex posuere egestas eu at lectus. Duis diam lectus, elementum id aliquam sed, convallis a velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nec ex ut urna egestas porta. Proin tellus justo, tincidunt vel dolor quis, fringilla ullamcorper quam. Cras tellus nulla, commodo at odio nec, imperdiet tincidunt risus. Proin congue urna at elit iaculis molestie. Praesent accumsan sodales dictum. Duis turpis neque, ullamcorper id sem ac, fringilla congue mauris. Pellentesque vehicula et nunc eget pellentesque. Nulla dignissim leo et ex fringilla fringilla.</p><p>Aenean ultricies diam ligula, eu vulputate sapien ornare non. Proin quis dui et lorem pellentesque vestibulum ut et dolor. Pellentesque lectus leo, tempus vel massa vitae, ultricies ornare mi. Suspendisse </p>','great-discount',2,2,16,'2019-12-06',1,'2019-11-21 09:55:37.698478','',3,2),(4,'promocode','<p>Vivamus eget efficitur sem, in venenatis sapien. Phasellus porta mauris est, vel rutrum neque consectetur id. Mauris iaculis mi odio, eget dapibus ex mollis id. Maecenas eget nibh aliquet, ornare ligula sed, convallis est. Nunc a nisl condimentum, mollis nisi ac, varius orci. Nulla ultrices pellentesque imperdiet. Duis laoreet mauris sed magna viverra, ut euismod diam lobortis. Donec varius volutpat orci vel interdum. Pellentesque eget erat quis neque scelerisque fringilla nec ornare augue. Aenean sit amet purus quis odio egestas pulvinar. In hac habitasse platea dictumst. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p><p>Curabitur dictum libero nec lacus elementum, sed lobortis arcu euismod. Etiam ut ex sit amet tellus tincidunt lobortis a vitae risus. In tempor posuere viverra. Aliquam ac purus commodo ex posuere egestas eu at lectus. Duis diam lectus, elementum id aliquam sed, convallis a velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nec ex ut urna egestas porta. Proin tellus justo, tincidunt vel dolor quis, fringilla ullamcorper quam. Cras tellus nulla, commodo at odio nec, imperdiet tincidunt risus. Proin congue urna at elit iaculis molestie. Praesent accumsan sodales dictum. Duis turpis neque, ullamcorper id sem ac, fringilla congue mauris. Pellentesque vehicula et nunc eget pellentesque. Nulla dignissim leo et ex fringilla fringilla.</p><p>Aenean ultricies diam ligula, eu vulputate sapien ornare non. Proin quis dui et lorem pellentesque vestibulum ut et dolor. Pellentesque lectus leo, tempus vel massa vitae, ultricies ornare mi. Suspendisse </p>','promocode',2,3,17,'2020-01-10',0,'2019-11-21 10:02:26.202653','',0,0),(5,'prmocode4','','prmocode4',1,7,NULL,NULL,1,'2020-05-18 03:43:03.982370','dada',0,3);
/*!40000 ALTER TABLE `cms_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_voucherpage`
--

DROP TABLE IF EXISTS `cms_voucherpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_voucherpage` (
  `page_ptr_id` int(11) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `cms_voucherpage_page_ptr_id_d9629fd7_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_voucherpage`
--

LOCK TABLES `cms_voucherpage` WRITE;
/*!40000 ALTER TABLE `cms_voucherpage` DISABLE KEYS */;
INSERT INTO `cms_voucherpage` VALUES (29,''),(30,''),(31,'');
/*!40000 ALTER TABLE `cms_voucherpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_vouchersfilterpage`
--

DROP TABLE IF EXISTS `cms_vouchersfilterpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_vouchersfilterpage` (
  `page_ptr_id` int(11) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `cms_vouchersfilterpa_page_ptr_id_375472f1_fk_wagtailco` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_vouchersfilterpage`
--

LOCK TABLES `cms_vouchersfilterpage` WRITE;
/*!40000 ALTER TABLE `cms_vouchersfilterpage` DISABLE KEYS */;
INSERT INTO `cms_vouchersfilterpage` VALUES (27,'');
/*!40000 ALTER TABLE `cms_vouchersfilterpage` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (57,'admin','logentry'),(59,'auth','group'),(58,'auth','permission'),(60,'auth','user'),(5,'cms','accountcurrency'),(6,'cms','accountoption'),(7,'cms','accounttype'),(8,'cms','affiliate'),(9,'cms','attribute'),(10,'cms','attributeservice'),(40,'cms','attributeservicevalue'),(78,'cms','blogpage'),(11,'cms','brokertype'),(12,'cms','category'),(13,'cms','chat'),(39,'cms','comment'),(66,'cms','compare'),(74,'cms','comparepage'),(87,'cms','contactpage'),(63,'cms','discount'),(76,'cms','forexpage'),(88,'cms','formfield'),(80,'cms','generalsettings'),(14,'cms','homepage'),(86,'cms','language'),(15,'cms','license'),(16,'cms','location'),(84,'cms','menu'),(85,'cms','menuitem'),(17,'cms','methodology'),(81,'cms','newsitem'),(82,'cms','newssettings'),(83,'cms','newssource'),(65,'cms','offer'),(38,'cms','option'),(18,'cms','paymentmethod'),(19,'cms','platformsupported'),(20,'cms','pricingmodel'),(37,'cms','product'),(64,'cms','promocode'),(21,'cms','regulation'),(22,'cms','revenuemodel'),(68,'cms','securityoffunds'),(23,'cms','service'),(24,'cms','servicepage'),(77,'cms','serviceslistpage'),(25,'cms','signalalert'),(79,'cms','staticpage'),(26,'cms','status'),(27,'cms','supportedlanguage'),(28,'cms','systemtype'),(29,'cms','timezone'),(30,'cms','tradinginstrument'),(31,'cms','tradingsoftware'),(67,'cms','tradingtool'),(32,'cms','tradingtype'),(33,'cms','trainingcourse'),(34,'cms','trainingtool'),(35,'cms','trainingtype'),(36,'cms','voucher'),(75,'cms','voucherpage'),(73,'cms','vouchersfilterpage'),(61,'contenttypes','contenttype'),(90,'robots','allowedurl'),(91,'robots','disallowedurl'),(92,'robots','rule'),(62,'sessions','session'),(55,'taggit','tag'),(56,'taggit','taggeditem'),(3,'wagtailadmin','admin'),(52,'wagtailcore','collection'),(54,'wagtailcore','collectionviewrestriction'),(53,'wagtailcore','groupcollectionpermission'),(48,'wagtailcore','grouppagepermission'),(1,'wagtailcore','page'),(49,'wagtailcore','pagerevision'),(50,'wagtailcore','pageviewrestriction'),(51,'wagtailcore','site'),(4,'wagtaildocs','document'),(43,'wagtailembeds','embed'),(41,'wagtailforms','formsubmission'),(2,'wagtailimages','image'),(45,'wagtailimages','rendition'),(89,'wagtailimages','uploadedimage'),(42,'wagtailredirects','redirect'),(46,'wagtailsearch','query'),(47,'wagtailsearch','querydailyhits'),(69,'wagtailtrans','language'),(72,'wagtailtrans','sitelanguages'),(70,'wagtailtrans','translatablepage'),(71,'wagtailtrans','translatablesiterootpage'),(44,'wagtailusers','userprofile');
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
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-08-28 22:06:22.333500'),(2,'auth','0001_initial','2019-08-28 22:06:22.538854'),(3,'admin','0001_initial','2019-08-28 22:06:23.100032'),(4,'admin','0002_logentry_remove_auto_add','2019-08-28 22:06:23.227323'),(5,'admin','0003_logentry_add_action_flag_choices','2019-08-28 22:06:23.242700'),(6,'contenttypes','0002_remove_content_type_name','2019-08-28 22:06:23.357061'),(7,'auth','0002_alter_permission_name_max_length','2019-08-28 22:06:23.416914'),(8,'auth','0003_alter_user_email_max_length','2019-08-28 22:06:23.479809'),(9,'auth','0004_alter_user_username_opts','2019-08-28 22:06:23.494435'),(10,'auth','0005_alter_user_last_login_null','2019-08-28 22:06:23.544796'),(11,'auth','0006_require_contenttypes_0002','2019-08-28 22:06:23.549024'),(12,'auth','0007_alter_validators_add_error_messages','2019-08-28 22:06:23.560247'),(13,'auth','0008_alter_user_username_max_length','2019-08-28 22:06:23.619756'),(14,'auth','0009_alter_user_last_name_max_length','2019-08-28 22:06:23.679405'),(15,'auth','0010_alter_group_name_max_length','2019-08-28 22:06:23.752161'),(16,'auth','0011_update_proxy_permissions','2019-08-28 22:06:23.766751'),(17,'wagtailcore','0001_initial','2019-08-28 22:06:24.128664'),(18,'wagtailcore','0002_initial_data','2019-08-28 22:06:24.132520'),(19,'wagtailcore','0003_add_uniqueness_constraint_on_group_page_permission','2019-08-28 22:06:24.136048'),(20,'wagtailcore','0004_page_locked','2019-08-28 22:06:24.139569'),(21,'wagtailcore','0005_add_page_lock_permission_to_moderators','2019-08-28 22:06:24.143755'),(22,'wagtailcore','0006_add_lock_page_permission','2019-08-28 22:06:24.147479'),(23,'wagtailcore','0007_page_latest_revision_created_at','2019-08-28 22:06:24.151559'),(24,'wagtailcore','0008_populate_latest_revision_created_at','2019-08-28 22:06:24.155829'),(25,'wagtailcore','0009_remove_auto_now_add_from_pagerevision_created_at','2019-08-28 22:06:24.160248'),(26,'wagtailcore','0010_change_page_owner_to_null_on_delete','2019-08-28 22:06:24.164230'),(27,'wagtailcore','0011_page_first_published_at','2019-08-28 22:06:24.168294'),(28,'wagtailcore','0012_extend_page_slug_field','2019-08-28 22:06:24.172878'),(29,'wagtailcore','0013_update_golive_expire_help_text','2019-08-28 22:06:24.177398'),(30,'wagtailcore','0014_add_verbose_name','2019-08-28 22:06:24.181648'),(31,'wagtailcore','0015_add_more_verbose_names','2019-08-28 22:06:24.185696'),(32,'wagtailcore','0016_change_page_url_path_to_text_field','2019-08-28 22:06:24.190176'),(33,'wagtailcore','0017_change_edit_page_permission_description','2019-08-28 22:06:24.758809'),(34,'wagtailcore','0018_pagerevision_submitted_for_moderation_index','2019-08-28 22:06:24.796197'),(35,'wagtailcore','0019_verbose_names_cleanup','2019-08-28 22:06:24.846294'),(36,'wagtailcore','0020_add_index_on_page_first_published_at','2019-08-28 22:06:24.883914'),(37,'wagtailcore','0021_capitalizeverbose','2019-08-28 22:06:25.771929'),(38,'wagtailcore','0022_add_site_name','2019-08-28 22:06:25.881714'),(39,'wagtailcore','0023_alter_page_revision_on_delete_behaviour','2019-08-28 22:06:25.972224'),(40,'wagtailcore','0024_collection','2019-08-28 22:06:26.006774'),(41,'wagtailcore','0025_collection_initial_data','2019-08-28 22:06:26.032395'),(42,'wagtailcore','0026_group_collection_permission','2019-08-28 22:06:26.107818'),(43,'taggit','0001_initial','2019-08-28 22:06:26.378022'),(44,'wagtailimages','0001_initial','2019-08-28 22:06:26.727912'),(45,'wagtailimages','0002_initial_data','2019-08-28 22:06:26.731978'),(46,'wagtailimages','0003_fix_focal_point_fields','2019-08-28 22:06:26.736000'),(47,'wagtailimages','0004_make_focal_point_key_not_nullable','2019-08-28 22:06:26.740237'),(48,'wagtailimages','0005_make_filter_spec_unique','2019-08-28 22:06:26.744155'),(49,'wagtailimages','0006_add_verbose_names','2019-08-28 22:06:26.747899'),(50,'wagtailimages','0007_image_file_size','2019-08-28 22:06:26.751860'),(51,'wagtailimages','0008_image_created_at_index','2019-08-28 22:06:26.756329'),(52,'wagtailimages','0009_capitalizeverbose','2019-08-28 22:06:26.760861'),(53,'wagtailimages','0010_change_on_delete_behaviour','2019-08-28 22:06:26.765389'),(54,'wagtailimages','0011_image_collection','2019-08-28 22:06:26.770323'),(55,'wagtailimages','0012_copy_image_permissions_to_collections','2019-08-28 22:06:26.775385'),(56,'wagtailimages','0013_make_rendition_upload_callable','2019-08-28 22:06:26.780446'),(57,'wagtailimages','0014_add_filter_spec_field','2019-08-28 22:06:26.785471'),(58,'wagtailimages','0015_fill_filter_spec_field','2019-08-28 22:06:26.790593'),(59,'wagtailimages','0016_deprecate_rendition_filter_relation','2019-08-28 22:06:26.795907'),(60,'wagtailimages','0017_reduce_focal_point_key_max_length','2019-08-28 22:06:26.800679'),(61,'wagtailimages','0018_remove_rendition_filter','2019-08-28 22:06:26.805329'),(62,'wagtailimages','0019_delete_filter','2019-08-28 22:06:26.809800'),(63,'wagtailimages','0020_add-verbose-name','2019-08-28 22:06:26.814438'),(64,'wagtailimages','0021_image_file_hash','2019-08-28 22:06:26.819431'),(65,'wagtailcore','0027_fix_collection_path_collation','2019-08-28 22:06:27.058570'),(66,'wagtailcore','0024_alter_page_content_type_on_delete_behaviour','2019-08-28 22:06:27.172407'),(67,'wagtailcore','0028_merge','2019-08-28 22:06:27.180989'),(68,'wagtailcore','0029_unicode_slugfield_dj19','2019-08-28 22:06:27.205890'),(69,'wagtailcore','0030_index_on_pagerevision_created_at','2019-08-28 22:06:27.243774'),(70,'wagtailcore','0031_add_page_view_restriction_types','2019-08-28 22:06:27.352871'),(71,'wagtailcore','0032_add_bulk_delete_page_permission','2019-08-28 22:06:27.507025'),(72,'wagtailcore','0033_remove_golive_expiry_help_text','2019-08-28 22:06:27.534308'),(73,'wagtailcore','0034_page_live_revision','2019-08-28 22:06:27.678577'),(74,'wagtailcore','0035_page_last_published_at','2019-08-28 22:06:27.893860'),(75,'wagtailcore','0036_populate_page_last_published_at','2019-08-28 22:06:27.927262'),(76,'wagtailcore','0037_set_page_owner_editable','2019-08-28 22:06:28.028531'),(77,'wagtailcore','0038_make_first_published_at_editable','2019-08-28 22:06:28.049760'),(78,'wagtailcore','0039_collectionviewrestriction','2019-08-28 22:06:28.289121'),(79,'wagtailcore','0040_page_draft_title','2019-08-28 22:06:28.655097'),(80,'wagtailcore','0041_group_collection_permissions_verbose_name_plural','2019-08-28 22:06:28.678221'),(81,'cms','0001_initial','2019-08-28 22:06:31.743841'),(82,'sessions','0001_initial','2019-08-28 22:06:37.000654'),(83,'taggit','0002_auto_20150616_2121','2019-08-28 22:06:37.061675'),(84,'wagtailadmin','0001_create_admin_access_permissions','2019-08-28 22:06:37.180655'),(85,'wagtaildocs','0001_initial','2019-08-28 22:06:37.220978'),(86,'wagtaildocs','0002_initial_data','2019-08-28 22:06:37.362332'),(87,'wagtaildocs','0003_add_verbose_names','2019-08-28 22:06:37.477197'),(88,'wagtaildocs','0004_capitalizeverbose','2019-08-28 22:06:37.617341'),(89,'wagtaildocs','0005_document_collection','2019-08-28 22:06:37.691858'),(90,'wagtaildocs','0006_copy_document_permissions_to_collections','2019-08-28 22:06:37.837601'),(91,'wagtaildocs','0005_alter_uploaded_by_user_on_delete_action','2019-08-28 22:06:37.909733'),(92,'wagtaildocs','0007_merge','2019-08-28 22:06:37.914654'),(93,'wagtaildocs','0008_document_file_size','2019-08-28 22:06:37.982508'),(94,'wagtaildocs','0009_document_verbose_name_plural','2019-08-28 22:06:38.011231'),(95,'wagtaildocs','0010_document_file_hash','2019-08-28 22:06:38.082174'),(96,'wagtailembeds','0001_initial','2019-08-28 22:06:38.146271'),(97,'wagtailembeds','0002_add_verbose_names','2019-08-28 22:06:38.159572'),(98,'wagtailembeds','0003_capitalizeverbose','2019-08-28 22:06:38.171061'),(99,'wagtailembeds','0004_embed_verbose_name_plural','2019-08-28 22:06:38.182771'),(100,'wagtailembeds','0005_specify_thumbnail_url_max_length','2019-08-28 22:06:38.204835'),(101,'wagtailforms','0001_initial','2019-08-28 22:06:38.256072'),(102,'wagtailforms','0002_add_verbose_names','2019-08-28 22:06:38.336043'),(103,'wagtailforms','0003_capitalizeverbose','2019-08-28 22:06:38.363402'),(104,'wagtailredirects','0001_initial','2019-08-28 22:06:38.411046'),(105,'wagtailredirects','0002_add_verbose_names','2019-08-28 22:06:38.677654'),(106,'wagtailredirects','0003_make_site_field_editable','2019-08-28 22:06:38.781289'),(107,'wagtailredirects','0004_set_unique_on_path_and_site','2019-08-28 22:06:38.866095'),(108,'wagtailredirects','0005_capitalizeverbose','2019-08-28 22:06:39.141311'),(109,'wagtailredirects','0006_redirect_increase_max_length','2019-08-28 22:06:39.175679'),(110,'wagtailsearch','0001_initial','2019-08-28 22:06:39.360171'),(111,'wagtailsearch','0002_add_verbose_names','2019-08-28 22:06:39.658015'),(112,'wagtailsearch','0003_remove_editors_pick','2019-08-28 22:06:39.699968'),(113,'wagtailsearch','0004_querydailyhits_verbose_name_plural','2019-08-28 22:06:39.707625'),(114,'wagtailusers','0001_initial','2019-08-28 22:06:39.760351'),(115,'wagtailusers','0002_add_verbose_name_on_userprofile','2019-08-28 22:06:39.874320'),(116,'wagtailusers','0003_add_verbose_names','2019-08-28 22:06:39.889909'),(117,'wagtailusers','0004_capitalizeverbose','2019-08-28 22:06:39.933127'),(118,'wagtailusers','0005_make_related_name_wagtail_specific','2019-08-28 22:06:40.014187'),(119,'wagtailusers','0006_userprofile_prefered_language','2019-08-28 22:06:40.082380'),(120,'wagtailusers','0007_userprofile_current_time_zone','2019-08-28 22:06:40.148848'),(121,'wagtailusers','0008_userprofile_avatar','2019-08-28 22:06:40.215109'),(122,'wagtailusers','0009_userprofile_verbose_name_plural','2019-08-28 22:06:40.240992'),(123,'wagtailimages','0001_squashed_0021','2019-08-28 22:06:40.250124'),(124,'wagtailcore','0001_squashed_0016_change_page_url_path_to_text_field','2019-08-28 22:06:40.255837'),(125,'cms','0002_auto_20190830_2225','2019-09-18 04:36:58.568840'),(126,'cms','0003_auto_20190830_2233','2019-09-18 04:46:08.041253'),(127,'cms','0004_auto_20190830_2234','2019-09-18 04:46:08.161721'),(128,'cms','0005_voucher_discount','2019-09-18 04:46:08.261326'),(129,'cms','0006_auto_20190902_2122','2019-09-18 04:46:08.411797'),(130,'cms','0007_auto_20190902_2302','2019-09-18 04:46:08.515546'),(131,'cms','0008_service_avg_rate','2019-09-18 04:46:08.631984'),(132,'cms','0009_auto_20190903_2201','2019-09-18 04:48:24.802921'),(133,'cms','0010_auto_20190903_2203','2019-09-18 04:48:24.879021'),(134,'cms','0011_auto_20190924_2200','2019-09-28 20:13:14.743252'),(135,'cms','0012_offer','2019-09-28 20:13:14.882904'),(136,'cms','0013_auto_20190929_1541','2019-09-30 23:05:13.481467'),(137,'cms','0014_compare','2019-09-30 23:05:13.602825'),(138,'cms','0015_service_count_rate','2019-10-01 15:22:51.865786'),(139,'cms','0016_compareservice','2019-10-02 06:58:17.598351'),(140,'cms','0017_delete_compareservice','2019-10-02 06:58:17.670382'),(141,'cms','0018_auto_20191008_1758','2019-10-10 19:35:55.994581'),(142,'cms','0019_auto_20191115_1928','2019-11-19 19:58:03.230295'),(143,'cms','0019_homepage_banner_image','2019-11-20 22:07:08.546356'),(144,'cms','0020_merge_20191120_1211','2019-11-20 22:07:08.584000'),(145,'cms','0021_auto_20191206_2300','2019-12-23 18:25:47.625620'),(146,'cms','0022_auto_20191210_1856','2019-12-23 18:25:47.925544'),(147,'cms','0023_category_services','2019-12-23 18:25:48.094183'),(148,'cms','0024_auto_20191217_1812','2019-12-23 18:25:48.751033'),(149,'cms','0025_service_restrictions','2019-12-23 18:25:48.951904'),(150,'cms','0026_auto_20191217_1925','2019-12-23 18:25:50.645696'),(151,'cms','0027_auto_20191217_1943','2019-12-23 18:25:52.309495'),(152,'cms','0028_auto_20191217_2147','2019-12-23 18:25:52.538944'),(153,'cms','0029_auto_20200116_2008','2020-01-17 02:41:44.000331'),(154,'cms','0030_service_created_at','2020-01-17 02:41:44.203282'),(155,'cms','0031_category_short_name','2020-01-26 14:26:05.846565'),(156,'wagtailtrans','0001_initial','2020-01-28 06:07:46.650346'),(157,'wagtailtrans','0002_auto_20161106_1231','2020-01-28 06:07:46.819285'),(158,'wagtailtrans','0003_auto_20161121_1211','2020-01-28 06:07:46.959399'),(159,'wagtailtrans','0004_sitelanguages','2020-01-28 06:07:47.102006'),(160,'wagtailtrans','0005_auto_20161130_1310','2020-01-28 06:07:47.389612'),(161,'wagtailtrans','0006_auto_20161212_2020','2020-01-28 06:07:47.685668'),(162,'wagtailtrans','0007_auto_20180327_1127','2020-01-28 06:07:47.861458'),(163,'wagtailtrans','0008_verbose_names','2020-01-28 06:07:47.907324'),(164,'wagtailtrans','0009_create_initial_language','2020-01-28 06:07:48.146402'),(165,'cms','0029_blogpage','2020-01-28 06:07:50.864265'),(166,'cms','0032_merge_20200127_2149','2020-01-28 06:07:50.907815'),(167,'cms','0033_auto_20200127_2352','2020-01-28 06:07:51.373867'),(168,'cms','0034_comparepage_forexpage_staticpage_voucherpage','2020-01-28 06:07:51.903772'),(169,'cms','0035_serviceslistpage_vouchersfilterpage','2020-01-28 06:07:52.355245'),(170,'cms','0036_delete_trainingtool','2020-01-28 22:54:43.420537'),(171,'cms','0036_auto_20200129_0231','2020-01-29 02:38:05.094496'),(172,'cms','0037_merge_20200129_0237','2020-01-29 02:38:05.099363'),(173,'cms','0038_auto_20200206_0430','2020-02-06 14:04:23.091842'),(174,'cms','0039_auto_20200206_0433','2020-02-06 14:04:23.317484'),(175,'cms','0040_auto_20200206_0444','2020-02-06 14:04:23.727621'),(176,'cms','0041_socialmediasettings','2020-02-27 05:43:18.166514'),(177,'cms','0042_auto_20200227_0453','2020-02-27 05:43:18.451486'),(178,'cms','0043_newsitem_newssettings_newssource','2020-03-01 14:37:58.867026'),(179,'cms','0044_newsitem_source','2020-03-01 14:37:59.063949'),(180,'cms','0045_newssource_url_site','2020-03-02 05:03:11.578995'),(181,'cms','0046_auto_20200425_1927','2020-04-27 01:35:09.913021'),(182,'cms','0047_auto_20200501_2055','2020-05-01 21:34:31.571290'),(183,'taggit','0003_taggeditem_add_unique_index','2020-05-02 18:11:29.284723'),(184,'wagtailcore','0042_index_on_pagerevision_approved_go_live_at','2020-05-02 18:11:29.336012'),(185,'wagtailcore','0043_lock_fields','2020-05-02 18:11:29.543426'),(186,'wagtailcore','0044_add_unlock_grouppagepermission','2020-05-02 18:11:29.637014'),(187,'wagtailcore','0045_assign_unlock_grouppagepermission','2020-05-02 18:11:29.893262'),(188,'wagtailforms','0004_add_verbose_name_plural','2020-05-02 18:11:29.915577'),(189,'cms','0048_auto_20200503_1306','2020-05-03 20:09:40.097626'),(190,'cms','0049_menu_menuitem','2020-05-11 04:21:08.961000'),(191,'cms','0050_menuitem_sub_menu','2020-05-11 04:21:09.317425'),(192,'cms','0051_language','2020-05-11 05:57:33.184393'),(193,'cms','0052_auto_20200511_0511','2020-05-11 05:57:33.260293'),(194,'cms','0049_contactpage_formfield','2020-05-11 22:55:27.673759'),(195,'cms','0050_auto_20200511_0949','2020-05-11 22:55:27.919176'),(196,'cms','0051_auto_20200511_0952','2020-05-11 22:55:28.172009'),(197,'cms','0053_merge_20200511_2247','2020-05-11 22:55:28.178918'),(198,'cms','0054_auto_20200511_2357','2020-05-11 23:58:33.807052'),(199,'cms','0055_auto_20200512_0433','2020-05-13 05:01:54.208713'),(200,'cms','0053_auto_20200513_0301','2020-05-13 05:01:54.673766'),(201,'cms','0056_merge_20200513_0500','2020-05-13 05:01:54.678981'),(202,'wagtailimages','0022_uploadedimage','2020-05-16 04:00:40.872294'),(203,'cms','0057_auto_20200516_0528','2020-05-16 06:26:33.748547'),(204,'cms','0058_language_language_code','2020-05-16 06:26:33.982949'),(205,'cms','0056_auto_20200513_2235','2020-05-16 22:15:29.818404'),(206,'cms','0057_merge_20200514_0209','2020-05-16 22:15:29.825773'),(207,'cms','0058_auto_20200516_2043','2020-05-16 22:15:30.277556'),(208,'cms','0059_merge_20200516_2209','2020-05-16 22:15:30.285073'),(209,'cms','0060_auto_20200517_1419','2020-05-17 19:51:19.819933'),(210,'cms','0061_remove_contactpage_intro','2020-05-18 02:58:57.422737'),(211,'cms','0062_contactpage_contact_title','2020-05-18 03:04:26.576344'),(212,'robots','0001_initial','2020-07-04 13:56:45.901692');
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
INSERT INTO `django_session` VALUES ('0rsju0usasep6kfdtgxx2t8z45e6vo20','N2E3Njk5YmU5N2VlNWUyM2M2MmZiZTliNTU2MmY0MmUyODFjZTNhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjVhNGJjMTJiYmY2NTEzYzk3YjNhMWJjMGEyZTg5YTFjNTAzOGNkIn0=','2019-12-04 11:36:49.216165'),('1tw70pna3iv8kbs9jjnd9khcqmyki5h0','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-07-12 17:18:32.834932'),('1x9qqr51b06gie5j0pg6kdd7f1tkfmle','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-07-24 16:10:35.748534'),('2bomu5fu2pvtctn6ysv2nw7bvi6nllur','N2E3Njk5YmU5N2VlNWUyM2M2MmZiZTliNTU2MmY0MmUyODFjZTNhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjVhNGJjMTJiYmY2NTEzYzk3YjNhMWJjMGEyZTg5YTFjNTAzOGNkIn0=','2019-12-04 22:53:55.193704'),('4zln6lf32errf1wql6at6mk2op48bd0p','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-06-03 16:50:11.359327'),('57uf6lltpqt92yuqawm80kajvyicveek','YjJhM2QzMTdjNTY2OGM1NDNkOTUzYzRhOTg0NjZjN2YzNzc3YTY4ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0Iiwid2FndGFpbC1wcmV2aWV3LTUwIjpbImNzcmZtaWRkbGV3YXJldG9rZW49bTVOSmFiajB6VUxpcVE5dndyck83dE9FZGh4U1JLWURHQnZXRjVRVWcwS3VBampYTlZrVzkzSzJqNHBaMjVkYiZuZXh0PSUyRmFkbWluJTJGcGFnZXMlMkYxNiUyRiZ0aXRsZT1BYm91dCZib2R5PSU3QiUyMmJsb2NrcyUyMiUzQSU1QiU3QiUyMmtleSUyMiUzQSUyMmVvaTRqJTIyJTJDJTIydGV4dCUyMiUzQSUyMlRoaXMraXMrRm9yZXgrdm91Y2hlcnMrYWJvdXQrcGFnZSUyMiUyQyUyMnR5cGUlMjIlM0ElMjJ1bnN0eWxlZCUyMiUyQyUyMmRlcHRoJTIyJTNBMCUyQyUyMmlubGluZVN0eWxlUmFuZ2VzJTIyJTNBJTVCJTVEJTJDJTIyZW50aXR5UmFuZ2VzJTIyJTNBJTVCJTVEJTJDJTIyZGF0YSUyMiUzQSU3QiU3RCU3RCU1RCUyQyUyMmVudGl0eU1hcCUyMiUzQSU3QiU3RCU3RCZzbHVnPWFib3V0LWVzJnNlb190aXRsZT0mc2VhcmNoX2Rlc2NyaXB0aW9uPSZnb19saXZlX2F0PSZleHBpcmVfYXQ9Jmxhbmd1YWdlPTImY2Fub25pY2FsX3BhZ2U9NDgiLDE1ODk2MTA2NzEuOTk0NTA1NF19','2020-05-30 06:31:12.041156'),('5w6mpvuxqrckkkdjkf5f05y6ty9xzg33','N2E3Njk5YmU5N2VlNWUyM2M2MmZiZTliNTU2MmY0MmUyODFjZTNhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjVhNGJjMTJiYmY2NTEzYzk3YjNhMWJjMGEyZTg5YTFjNTAzOGNkIn0=','2019-10-20 12:58:21.606852'),('60l02dm51sbl5tat6cyuennzhd628gxq','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-02-20 14:35:37.359072'),('9ljd189cl3jp4kbe3wkp4z0sg3ywxomh','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-06-22 19:37:40.104650'),('al49wmgl46phbp0vseikjsc4bh6kzryc','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-06-03 17:09:39.052588'),('aywhqi5y7oz2e198gzxdcb0ran8ulnup','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-06-20 08:50:16.979070'),('e89lurvws0gix1lgxf5r9m28vclu4l9n','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-04-08 19:18:54.001688'),('g8lm16iuqnbx43divixmmm3trls1sw1k','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-07-18 11:37:55.094681'),('giq8xqhcejl8kvztnkr00s6sgv8x00ne','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2019-12-12 17:43:04.891968'),('gll5ke79i8m6yblr3gl7itcwo5xsxnm9','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-05-25 22:57:05.218024'),('k3ymkcnl8ufvcvjhk2ayaj5fi5tj6ti2','N2E3Njk5YmU5N2VlNWUyM2M2MmZiZTliNTU2MmY0MmUyODFjZTNhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjVhNGJjMTJiYmY2NTEzYzk3YjNhMWJjMGEyZTg5YTFjNTAzOGNkIn0=','2019-09-11 22:08:57.189673'),('kscc165szp8u8amom5ymmn2nf7811eje','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-07-24 00:11:52.658940'),('mlk4o56d5l2195qz754eku6jsj36ctb4','N2E3Njk5YmU5N2VlNWUyM2M2MmZiZTliNTU2MmY0MmUyODFjZTNhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjVhNGJjMTJiYmY2NTEzYzk3YjNhMWJjMGEyZTg5YTFjNTAzOGNkIn0=','2019-10-02 04:34:44.119010'),('nvgivcko2r1o4jhjg70ot0pibln3hn7p','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2019-12-12 17:34:44.812506'),('os4gcbpugpis1fkczfjzn3w22w8lec7o','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-07-16 13:14:04.982317'),('oy7zvrlrr12twlse8ya80z26q0hh0a20','YzA3YjlmODhjZjcyZDAwMjY1OWFkMGZhM2Y3NjBjYmVhYWYwZmE5Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjVhNGJjMTJiYmY2NTEzYzk3YjNhMWJjMGEyZTg5YTFjNTAzOGNkIiwid2FndGFpbC1wcmV2aWV3LTQiOlsiY3NyZm1pZGRsZXdhcmV0b2tlbj1LOTA5RWpzVThYMmdKN0tIWGJPVjA2NW5ZbjA3Q1dsQkxPNHRnb0lTOG1OZjVhRXphcElIQ2tRUmZ5MWlpSXdXJm5leHQ9JnRpdGxlPUZvcmV4K1ZvdWNoZXJzJmJhbm5lcl90aXRsZT1XZWxjb21lK3RvK0ZvcmV4K3ZvdWNoZXJzJmJhbm5lcl9ib2R5PSU3QiUyMmJsb2NrcyUyMiUzQSU1QiU3QiUyMmtleSUyMiUzQSUyMmxjeHhnJTIyJTJDJTIydGV4dCUyMiUzQSUyMllvdStjYW4rZWRpdCt0aGlzK2Zyb20rdGhlK2FkbWluJTIyJTJDJTIydHlwZSUyMiUzQSUyMnVuc3R5bGVkJTIyJTJDJTIyZGVwdGglMjIlM0EwJTJDJTIyaW5saW5lU3R5bGVSYW5nZXMlMjIlM0ElNUIlNUQlMkMlMjJlbnRpdHlSYW5nZXMlMjIlM0ElNUIlNUQlMkMlMjJkYXRhJTIyJTNBJTdCJTdEJTdEJTVEJTJDJTIyZW50aXR5TWFwJTIyJTNBJTdCJTdEJTdEJnNsdWc9Zm9yZXgtdm91Y2hlcnMmc2VvX3RpdGxlPSZzZWFyY2hfZGVzY3JpcHRpb249JmdvX2xpdmVfYXQ9JmV4cGlyZV9hdD0iLDE1NzIxMjI4MzEuMzk3MjM2Nl19','2019-11-09 20:47:11.410750'),('p9py8skuun2ex1enoewm6z51gq5pn6al','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-04-05 10:03:15.436085'),('pfbd89a2zko23tj2barptmilp2g8rjtu','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-03-12 13:36:40.629652'),('pul9qlpz2szro6u6ccbanek8gqqiji4s','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-02-10 22:14:54.657357'),('pyrvefao3mzlefbakfhsxsxa08e294vc','NmVlMmJjNTcwZjM4MjUwYTZjZWM3ZDc4OTYzYWQzNWQ5Y2EzZDUxZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YWM4YzBjMTllYzJkNTQwM2ZjMWEwNmZhODBiYjk3YTE0YWUyZTM1In0=','2019-08-28 19:36:50.102115'),('smqbbq48wz38fvbi7shsv0u4s6n7bv4d','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-02-11 22:16:14.110830'),('umlp7i4ys5bj6hkkakn5uv13pjqwd6ma','N2E3Njk5YmU5N2VlNWUyM2M2MmZiZTliNTU2MmY0MmUyODFjZTNhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjVhNGJjMTJiYmY2NTEzYzk3YjNhMWJjMGEyZTg5YTFjNTAzOGNkIn0=','2019-10-18 16:19:51.067081'),('vb6jzaio9nv9h4wczvmv55wrnx0t5y8g','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-05-11 18:48:08.974941'),('vtcpzpwq1v9x0z5549jpzt70p2pidpfx','N2E3Njk5YmU5N2VlNWUyM2M2MmZiZTliNTU2MmY0MmUyODFjZTNhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjVhNGJjMTJiYmY2NTEzYzk3YjNhMWJjMGEyZTg5YTFjNTAzOGNkIn0=','2019-12-05 07:50:54.428136'),('wa4myuh073ltakz4uivy3i7685sl4tmc','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-05-11 18:19:04.086236'),('wr40nq9w7l5w8gvn544xts1e1cawhbod','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-01-06 18:27:12.700208'),('xjo949s73i7fdvznku3u41x17utlei7i','N2E3Njk5YmU5N2VlNWUyM2M2MmZiZTliNTU2MmY0MmUyODFjZTNhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NjVhNGJjMTJiYmY2NTEzYzk3YjNhMWJjMGEyZTg5YTFjNTAzOGNkIn0=','2019-10-16 10:49:43.302000'),('xm3oeas67420vw34wt5guka07790mmsk','OTE5MjVkZGZmNzRiMzBmZGU2NjQ3YTE5NDA2NzNhM2ExMTUwNzFiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjRiNzM4NDdkZWEyYTg1YmM2NWE2NDZkN2VmZTIzYWI2NmYwYTI0In0=','2020-03-17 14:26:00.944404');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_allowedurl`
--

DROP TABLE IF EXISTS `robots_allowedurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_allowedurl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `robots_allowedurl_rule_id_53c5433b` (`rule_id`),
  CONSTRAINT `robots_allowedurl_rule_id_53c5433b_fk_robots_rule_id` FOREIGN KEY (`rule_id`) REFERENCES `robots_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_allowedurl`
--

LOCK TABLES `robots_allowedurl` WRITE;
/*!40000 ALTER TABLE `robots_allowedurl` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_allowedurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_disallowedurl`
--

DROP TABLE IF EXISTS `robots_disallowedurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_disallowedurl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `robots_disallowedurl_rule_id_eb6cb3b1` (`rule_id`),
  CONSTRAINT `robots_disallowedurl_rule_id_eb6cb3b1_fk_robots_rule_id` FOREIGN KEY (`rule_id`) REFERENCES `robots_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_disallowedurl`
--

LOCK TABLES `robots_disallowedurl` WRITE;
/*!40000 ALTER TABLE `robots_disallowedurl` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_disallowedurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule`
--

DROP TABLE IF EXISTS `robots_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `robot` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crawl_delay` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule`
--

LOCK TABLES `robots_rule` WRITE;
/*!40000 ALTER TABLE `robots_rule` DISABLE KEYS */;
INSERT INTO `robots_rule` VALUES (1,'*',NULL);
/*!40000 ALTER TABLE `robots_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule_sites`
--

DROP TABLE IF EXISTS `robots_rule_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `robots_rule_sites_rule_id_site_id_093f04ea_uniq` (`rule_id`,`site_id`),
  KEY `robots_rule_sites_site_id_efe5be97_fk_wagtailcore_site_id` (`site_id`),
  CONSTRAINT `robots_rule_sites_rule_id_7921a799_fk_robots_rule_id` FOREIGN KEY (`rule_id`) REFERENCES `robots_rule` (`id`),
  CONSTRAINT `robots_rule_sites_site_id_efe5be97_fk_wagtailcore_site_id` FOREIGN KEY (`site_id`) REFERENCES `wagtailcore_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule_sites`
--

LOCK TABLES `robots_rule_sites` WRITE;
/*!40000 ALTER TABLE `robots_rule_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule_sites` ENABLE KEYS */;
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
  UNIQUE KEY `taggit_taggeditem_content_type_id_object_id_tag_id_4bb97a8e_uniq` (`content_type_id`,`object_id`,`tag_id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collection`
--

LOCK TABLES `wagtailcore_collection` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collection` DISABLE KEYS */;
INSERT INTO `wagtailcore_collection` VALUES (1,'0001',1,2,'Root'),(2,'00010001',2,0,'collection-es'),(3,'00010002',2,0,'collection-fr');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_groupcollectionpermission`
--

LOCK TABLES `wagtailcore_groupcollectionpermission` WRITE;
/*!40000 ALTER TABLE `wagtailcore_groupcollectionpermission` DISABLE KEYS */;
INSERT INTO `wagtailcore_groupcollectionpermission` VALUES (2,1,1,1),(4,1,1,2),(6,1,1,5),(8,1,1,6),(1,1,2,1),(3,1,2,2),(5,1,2,5),(7,1,2,6),(13,2,3,1),(12,2,3,2),(14,2,3,3),(9,2,3,5),(10,2,3,6),(11,2,3,7),(19,3,4,1),(18,3,4,2),(20,3,4,3),(15,3,4,5),(16,3,4,6),(17,3,4,7);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_grouppagepermission`
--

LOCK TABLES `wagtailcore_grouppagepermission` WRITE;
/*!40000 ALTER TABLE `wagtailcore_grouppagepermission` DISABLE KEYS */;
INSERT INTO `wagtailcore_grouppagepermission` VALUES (1,'add',1,1),(2,'edit',1,1),(6,'lock',1,1),(3,'publish',1,1),(7,'unlock',1,1),(4,'add',2,1),(5,'edit',2,1);
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
  `locked_at` datetime(6) DEFAULT NULL,
  `locked_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  KEY `wagtailcore_page_slug_e7c11b8f` (`slug`),
  KEY `wagtailcore_page_first_published_at_2b5dd637` (`first_published_at`),
  KEY `wagtailcore_page_content_type_id_c28424df_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_page_live_revision_id_930bd822_fk_wagtailco` (`live_revision_id`),
  KEY `wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id` (`owner_id`),
  KEY `wagtailcore_page_locked_by_id_bcb86245_fk_auth_user_id` (`locked_by_id`),
  CONSTRAINT `wagtailcore_page_content_type_id_c28424df_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_page_live_revision_id_930bd822_fk_wagtailco` FOREIGN KEY (`live_revision_id`) REFERENCES `wagtailcore_pagerevision` (`id`),
  CONSTRAINT `wagtailcore_page_locked_by_id_bcb86245_fk_auth_user_id` FOREIGN KEY (`locked_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_page`
--

LOCK TABLES `wagtailcore_page` WRITE;
/*!40000 ALTER TABLE `wagtailcore_page` DISABLE KEYS */;
INSERT INTO `wagtailcore_page` VALUES (1,'0001',1,1,'Root','root',1,0,'/','',0,'',NULL,NULL,0,1,NULL,0,NULL,NULL,NULL,NULL,'Root',NULL,NULL),(16,'00010001',2,21,'Forex Vouchers','root',1,0,'/root/','',0,'',NULL,NULL,0,71,1,0,'2020-01-28 06:58:50.201518','2020-01-28 06:44:24.083418',56,'2020-01-28 06:58:50.243690','Forex Vouchers',NULL,NULL),(24,'00010001000Q',3,0,'Home','en',1,0,'/root/en/','Forex Vouchers - The ultimate source of forex discounts',0,'Forex Vouchers provides discount vouchers, promocodes, offers on all forex brokers and forex services such as forex signals, trading systems & forex training.',NULL,NULL,0,14,1,0,'2020-05-23 22:51:57.719768','2020-01-28 06:56:11.628288',130,'2020-05-23 22:51:57.772197','Home',NULL,NULL),(25,'000100010002',3,1,'Home Page','fr',1,0,'/root/fr/','',0,'',NULL,NULL,0,14,1,0,'2020-01-28 07:01:55.583242','2020-01-28 06:56:11.452354',58,'2020-01-28 07:01:55.625733','Home Page',NULL,NULL),(26,'000100010003',3,1,'Home Page','es',1,0,'/root/es/','',0,'',NULL,NULL,0,14,1,0,'2020-02-27 20:42:41.732961','2020-01-28 06:56:11.542293',91,'2020-02-27 20:42:41.788987','Home Page',NULL,NULL),(27,'000100010004',3,0,'Vouchers List','vouchers',1,0,'/root/vouchers/','Vouchers',0,'',NULL,NULL,0,73,1,0,'2020-01-28 07:04:25.044732','2020-01-28 07:04:25.066885',61,'2020-01-28 07:04:25.066885','Vouchers List',NULL,NULL),(29,'000100010006',3,0,'Offer','offers',1,0,'/root/offers/','',0,'',NULL,NULL,0,75,1,0,'2020-01-28 07:05:44.292531','2020-01-28 07:05:34.991354',64,'2020-01-28 07:05:44.322400','Offer',NULL,NULL),(30,'000100010005',3,0,'Promocode','promocodes',1,0,'/root/promocodes/','',0,'',NULL,NULL,0,75,1,0,'2020-01-28 07:06:58.395255','2020-01-28 07:06:51.312322',66,'2020-01-28 07:06:58.423105','Promocode',NULL,NULL),(31,'000100010007',3,0,'Discount','discounts',1,0,'/root/discounts/','',0,'',NULL,NULL,0,75,1,0,'2020-01-28 07:09:19.073772','2020-01-28 07:09:19.095946',68,'2020-01-28 07:09:19.095946','Discount',NULL,NULL),(32,'000100010008',3,0,'Services List','services',1,0,'/root/services/','Services List',1,'',NULL,NULL,0,77,1,0,'2020-01-28 07:10:28.083259','2020-01-28 07:10:28.109202',69,'2020-01-28 07:10:28.109202','Services List',NULL,NULL),(33,'000100010009',3,0,'Forex Brokers','forex-brokers',1,0,'/root/forex-brokers/','',1,'',NULL,NULL,0,24,1,0,'2020-05-09 23:00:04.605539','2020-01-28 07:11:39.336346',102,'2020-05-09 23:00:04.685285','Forex Brokers',NULL,NULL),(34,'00010001000A',3,0,'Forex Service','forex-service',1,0,'/root/forex-service/','',0,'',NULL,NULL,0,24,1,0,'2020-01-28 07:11:59.158815','2020-01-28 07:11:59.184438',71,'2020-01-28 07:11:59.184438','Forex Service',NULL,NULL),(35,'00010001000B',3,0,'Compare','compare',1,0,'/root/compare/','',0,'',NULL,NULL,0,74,1,0,'2020-01-28 07:21:26.328917','2020-01-28 07:21:26.351392',73,'2020-01-28 07:21:26.351392','Compare',NULL,NULL),(36,'00010001000C',3,0,'Brokers','brokers',1,0,'/root/brokers/','',0,'',NULL,NULL,0,77,1,0,'2020-01-28 23:46:17.615263','2020-01-28 23:46:17.640705',75,'2020-01-28 23:46:17.640705','Brokers',NULL,NULL),(40,'00010001000D',3,1,'Forex','forex',1,0,'/root/forex/','',0,'',NULL,NULL,0,76,1,0,'2020-01-29 02:40:35.372647','2020-01-29 02:40:35.403237',79,'2020-01-29 02:40:35.403237','Forex',NULL,NULL),(41,'00010001000D0001',4,0,'Euros vs Dollars','euros-vs-dollars',1,0,'/root/forex/euros-vs-dollars/','',0,'',NULL,NULL,0,76,1,0,'2020-01-29 02:40:59.377327','2020-01-29 02:40:59.400106',80,'2020-01-29 02:40:59.400106','Euros vs Dollars',NULL,NULL),(48,'00010001000R',3,0,'About','about',1,0,'/root/about/','',0,'',NULL,NULL,0,79,1,0,'2020-01-29 03:28:36.421282','2020-01-29 03:28:36.451618',90,'2020-01-29 03:28:36.451618','About',NULL,NULL),(49,'0001000100020001',4,0,'About','about-fr',0,0,'/root/fr/about-fr/','',0,'',NULL,NULL,0,79,1,0,'2020-01-29 03:28:36.270990','2020-01-29 03:28:36.270990',88,'2020-01-29 03:28:36.270990','About',NULL,NULL),(50,'0001000100030001',4,0,'About','about-es',1,0,'/root/es/about-es/','',0,'',NULL,NULL,0,79,1,0,'2020-05-16 06:31:20.276608','2020-01-29 03:28:36.364791',111,'2020-05-16 06:31:20.371747','About',NULL,NULL),(51,'00010001000H',3,0,'Disclaimer','disclaimer',1,0,'/root/disclaimer/','',0,'',NULL,NULL,0,79,1,0,'2020-03-02 05:37:07.291091','2020-03-02 05:37:07.335993',94,'2020-03-02 05:37:07.335993','Disclaimer',NULL,NULL),(52,'00010001000I',3,0,'Disclaimer','disclaimer-fr',0,0,'/root/disclaimer-fr/','',0,'',NULL,NULL,0,79,1,0,'2020-03-02 05:37:07.119096','2020-03-02 05:37:07.119096',92,'2020-03-02 05:37:07.119096','Disclaimer',NULL,NULL),(53,'00010001000J',3,0,'Disclaimer','disclaimer-es',1,0,'/root/disclaimer-es/','',0,'',NULL,NULL,0,79,1,0,'2020-05-16 05:45:57.440671','2020-03-02 05:37:07.232350',110,'2020-05-16 05:45:57.503215','Disclaimer',NULL,NULL),(54,'00010001000K',3,0,'Privacy Policy','privacy-policy',1,0,'/root/privacy-policy/','',0,'',NULL,NULL,0,79,1,0,'2020-03-02 05:37:50.199648','2020-03-02 05:37:50.234902',97,'2020-03-02 05:37:50.234902','Privacy Policy',NULL,NULL),(55,'00010001000L',3,0,'Privacy Policy','privacy-policy-fr',0,0,'/root/privacy-policy-fr/','',0,'',NULL,NULL,0,79,1,0,'2020-03-02 05:37:50.056872','2020-03-02 05:37:50.056872',95,'2020-03-02 05:37:50.056872','Privacy Policy',NULL,NULL),(56,'00010001000M',3,0,'Privacy Policy','privacy-policy-es',1,0,'/root/privacy-policy-es/','',0,'',NULL,NULL,0,79,1,0,'2020-05-16 06:31:47.854533','2020-03-02 05:37:50.141297',112,'2020-05-16 06:31:47.919688','Privacy Policy',NULL,NULL),(60,'00010001000S',3,0,'Contact Us','contact-us',1,0,'/root/contact-us/','',0,'',NULL,NULL,0,87,1,0,'2020-05-23 23:03:56.087940','2020-05-11 23:03:04.200592',136,'2020-05-23 23:03:56.147638','Contact Us',NULL,NULL);
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
  KEY `wagtailcore_pagerevision_approved_go_live_at_e56afc67` (`approved_go_live_at`),
  CONSTRAINT `wagtailcore_pagerevision_page_id_d421cc1d_fk_wagtailcore_page_id` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pagerevision`
--

LOCK TABLES `wagtailcore_pagerevision` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pagerevision` DISABLE KEYS */;
INSERT INTO `wagtailcore_pagerevision` VALUES (46,0,'2020-01-28 06:44:24.058616','{\"pk\": 16, \"path\": \"00010001\", \"depth\": 2, \"numchild\": 0, \"title\": \"Root\", \"draft_title\": \"Root\", \"slug\": \"root\", \"content_type\": 71, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,16,1),(50,0,'2020-01-28 06:56:11.452354','{\"pk\": 25, \"path\": \"000100010002\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home Page\", \"draft_title\": \"Home Page\", \"slug\": \"fr\", \"content_type\": 14, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/fr/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"canonical_page\": 24, \"language\": 3, \"page_ptr\": 25, \"banner_title\": \"Home Page\", \"banner_body\": \"<p>Instant discount vouchers are available for all forex services</p><p>Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>\", \"banner_image\": null}',NULL,25,NULL),(51,0,'2020-01-28 06:56:11.542293','{\"pk\": 26, \"path\": \"000100010003\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home Page\", \"draft_title\": \"Home Page\", \"slug\": \"es\", \"content_type\": 14, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/es/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"canonical_page\": 24, \"language\": 2, \"page_ptr\": 26, \"banner_title\": \"Home Page\", \"banner_body\": \"<p>Instant discount vouchers are available for all forex services</p><p>Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>\", \"banner_image\": null}',NULL,26,NULL),(52,0,'2020-01-28 06:56:11.597852','{\"pk\": 24, \"path\": \"000100010001\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home Page\", \"draft_title\": \"Home Page\", \"slug\": \"en\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/en/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 24, \"banner_title\": \"Home Page\", \"banner_body\": \"<p>Instant discount vouchers are available for all forex services</p><p>Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>\", \"banner_image\": null}',NULL,24,1),(53,0,'2020-01-28 06:57:00.958778','{\"pk\": 24, \"path\": \"000100010001\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home Page\", \"draft_title\": \"Home Page\", \"slug\": \"en\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/en/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2020-01-28T06:56:11.628Z\", \"last_published_at\": \"2020-01-28T06:56:11.628Z\", \"latest_revision_created_at\": \"2020-01-28T06:56:11.597Z\", \"live_revision\": 52, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 24, \"banner_title\": \"Home Page\", \"banner_body\": \"<p>Instant discount vouchers are available for all forex services</p><p>Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>\", \"banner_image\": 13}',NULL,24,1),(54,0,'2020-01-28 06:57:10.219820','{\"pk\": 26, \"path\": \"000100010003\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home Page\", \"draft_title\": \"Home Page\", \"slug\": \"es\", \"content_type\": 14, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/es/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2020-01-28T06:56:11.542Z\", \"last_published_at\": \"2020-01-28T06:56:11.542Z\", \"latest_revision_created_at\": \"2020-01-28T06:56:11.542Z\", \"live_revision\": 51, \"canonical_page\": 24, \"language\": 2, \"page_ptr\": 26, \"banner_title\": \"Home Page\", \"banner_body\": \"<p>Instant discount vouchers are available for all forex services</p><p>Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>\", \"banner_image\": 13}',NULL,26,1),(55,0,'2020-01-28 06:57:21.172854','{\"pk\": 25, \"path\": \"000100010002\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home Page\", \"draft_title\": \"Home Page\", \"slug\": \"fr\", \"content_type\": 14, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/fr/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2020-01-28T06:56:11.452Z\", \"last_published_at\": \"2020-01-28T06:56:11.452Z\", \"latest_revision_created_at\": \"2020-01-28T06:56:11.452Z\", \"live_revision\": 50, \"canonical_page\": 24, \"language\": 3, \"page_ptr\": 25, \"banner_title\": \"Home Page\", \"banner_body\": \"<p>Instant discount vouchers are available for all forex services</p><p>Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>\", \"banner_image\": 13}',NULL,25,1),(56,0,'2020-01-28 06:58:50.201518','{\"pk\": 16, \"path\": \"00010001\", \"depth\": 2, \"numchild\": 3, \"title\": \"Forex Vouchers\", \"draft_title\": \"Root\", \"slug\": \"root\", \"content_type\": 71, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2020-01-28T06:44:24.083Z\", \"last_published_at\": \"2020-01-28T06:44:24.083Z\", \"latest_revision_created_at\": \"2020-01-28T06:44:24.058Z\", \"live_revision\": 46}',NULL,16,1),(57,0,'2020-01-28 07:01:30.865946','{\"pk\": 24, \"path\": \"000100010001\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home Page\", \"draft_title\": \"Home Page\", \"slug\": \"en\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/en/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2020-01-28T06:56:11.628Z\", \"last_published_at\": \"2020-01-28T06:57:01.001Z\", \"latest_revision_created_at\": \"2020-01-28T06:57:00.958Z\", \"live_revision\": 53, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 24, \"banner_title\": \"Home Page\", \"banner_body\": \"<p>Instant discount vouchers are available for all forex services. <br/>Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>\", \"banner_image\": 13}',NULL,24,1),(58,0,'2020-01-28 07:01:55.583242','{\"pk\": 25, \"path\": \"000100010002\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home Page\", \"draft_title\": \"Home Page\", \"slug\": \"fr\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/fr/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2020-01-28T06:56:11.452Z\", \"last_published_at\": \"2020-01-28T06:57:21.219Z\", \"latest_revision_created_at\": \"2020-01-28T06:57:21.172Z\", \"live_revision\": 55, \"canonical_page\": 24, \"language\": 3, \"page_ptr\": 25, \"banner_title\": \"Home Page\", \"banner_body\": \"<p>Instant discount vouchers are available for all forex services.<br/> Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>\", \"banner_image\": 13}',NULL,25,1),(59,0,'2020-01-28 07:02:10.743676','{\"pk\": 26, \"path\": \"000100010003\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home Page\", \"draft_title\": \"Home Page\", \"slug\": \"es\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/es/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2020-01-28T06:56:11.542Z\", \"last_published_at\": \"2020-01-28T06:57:10.269Z\", \"latest_revision_created_at\": \"2020-01-28T06:57:10.219Z\", \"live_revision\": 54, \"canonical_page\": 24, \"language\": 2, \"page_ptr\": 26, \"banner_title\": \"Bienvenido a Forex Vouchers\", \"banner_body\": \"<p>Instant discount vouchers are available for all forex services.<br/> Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>\", \"banner_image\": 13}',NULL,26,1),(60,0,'2020-01-28 07:02:20.853306','{\"pk\": 24, \"path\": \"000100010001\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home Page\", \"draft_title\": \"Home Page\", \"slug\": \"en\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/en/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2020-01-28T06:56:11.628Z\", \"last_published_at\": \"2020-01-28T07:01:30.905Z\", \"latest_revision_created_at\": \"2020-01-28T07:01:30.865Z\", \"live_revision\": 57, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 24, \"banner_title\": \"Welcome to Forex vouchers\", \"banner_body\": \"<p>Instant discount vouchers are available for all forex services.<br/> Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>\", \"banner_image\": 13}',NULL,24,1),(61,0,'2020-01-28 07:04:25.044732','{\"pk\": 27, \"path\": \"000100010004\", \"depth\": 3, \"numchild\": 0, \"title\": \"Vouchers List\", \"draft_title\": \"Vouchers List\", \"slug\": \"vouchers\", \"content_type\": 73, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/vouchers/\", \"owner\": 1, \"seo_title\": \"Vouchers\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"body\": \"\"}',NULL,27,1),(63,0,'2020-01-28 07:05:34.968411','{\"pk\": 29, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Offer\", \"draft_title\": \"Offer\", \"slug\": \"offer\", \"content_type\": 75, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/vouchers/offer/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"body\": \"\"}',NULL,29,1),(64,0,'2020-01-28 07:05:44.292531','{\"pk\": 29, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Offer\", \"draft_title\": \"Offer\", \"slug\": \"offers\", \"content_type\": 75, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/vouchers/offer/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2020-01-28T07:05:34.991Z\", \"last_published_at\": \"2020-01-28T07:05:34.991Z\", \"latest_revision_created_at\": \"2020-01-28T07:05:34.968Z\", \"live_revision\": 63, \"body\": \"\"}',NULL,29,1),(65,0,'2020-01-28 07:06:51.281893','{\"pk\": 30, \"path\": \"0001000100040002\", \"depth\": 4, \"numchild\": 0, \"title\": \"Promocode\", \"draft_title\": \"Promocode\", \"slug\": \"promocode\", \"content_type\": 75, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/vouchers/promocode/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"body\": \"\"}',NULL,30,1),(66,0,'2020-01-28 07:06:58.395255','{\"pk\": 30, \"path\": \"0001000100040002\", \"depth\": 4, \"numchild\": 0, \"title\": \"Promocode\", \"draft_title\": \"Promocode\", \"slug\": \"promocodes\", \"content_type\": 75, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/vouchers/promocode/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2020-01-28T07:06:51.312Z\", \"last_published_at\": \"2020-01-28T07:06:51.312Z\", \"latest_revision_created_at\": \"2020-01-28T07:06:51.281Z\", \"live_revision\": 65, \"body\": \"\"}',NULL,30,1),(67,0,'2020-01-28 07:09:09.766266','{\"pk\": 31, \"path\": \"000100010007\", \"depth\": 3, \"numchild\": 0, \"title\": \"Discounts\", \"draft_title\": \"Discounts\", \"slug\": \"discounts\", \"content_type\": 75, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/discounts/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"body\": \"\"}',NULL,31,1),(68,0,'2020-01-28 07:09:19.073772','{\"pk\": 31, \"path\": \"000100010007\", \"depth\": 3, \"numchild\": 0, \"title\": \"Discount\", \"draft_title\": \"Discounts\", \"slug\": \"discounts\", \"content_type\": 75, \"live\": false, \"has_unpublished_changes\": true, \"url_path\": \"/root/discounts/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": \"2020-01-28T07:09:09.766Z\", \"live_revision\": null, \"body\": \"\"}',NULL,31,1),(69,0,'2020-01-28 07:10:28.083259','{\"pk\": 32, \"path\": \"000100010008\", \"depth\": 3, \"numchild\": 0, \"title\": \"Services List\", \"draft_title\": \"Services List\", \"slug\": \"services\", \"content_type\": 77, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/services/\", \"owner\": 1, \"seo_title\": \"Services List\", \"show_in_menus\": true, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"body\": \"\"}',NULL,32,1),(70,0,'2020-01-28 07:11:39.311820','{\"pk\": 33, \"path\": \"000100010009\", \"depth\": 3, \"numchild\": 0, \"title\": \"Forex Brokers\", \"draft_title\": \"Forex Brokers\", \"slug\": \"forex-brokers\", \"content_type\": 24, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/forex-brokers/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"body\": \"\"}',NULL,33,1),(71,0,'2020-01-28 07:11:59.158815','{\"pk\": 34, \"path\": \"00010001000A\", \"depth\": 3, \"numchild\": 0, \"title\": \"Forex Service\", \"draft_title\": \"Forex Service\", \"slug\": \"forex-service\", \"content_type\": 24, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/forex-service/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"body\": \"\"}',NULL,34,1),(72,0,'2020-01-28 07:12:20.070600','{\"pk\": 33, \"path\": \"000100010009\", \"depth\": 3, \"numchild\": 0, \"title\": \"Forex Brokers\", \"draft_title\": \"Forex Brokers\", \"slug\": \"forex-brokers\", \"content_type\": 24, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/forex-brokers/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": true, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2020-01-28T07:11:39.336Z\", \"last_published_at\": \"2020-01-28T07:11:39.336Z\", \"latest_revision_created_at\": \"2020-01-28T07:11:39.311Z\", \"live_revision\": 70, \"body\": \"\"}',NULL,33,1),(73,0,'2020-01-28 07:21:26.328917','{\"pk\": 35, \"path\": \"00010001000B\", \"depth\": 3, \"numchild\": 0, \"title\": \"Compare\", \"draft_title\": \"Compare\", \"slug\": \"compare\", \"content_type\": 74, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/compare/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"body\": \"\"}',NULL,35,1),(74,0,'2020-01-28 23:46:14.346512','{\"pk\": 36, \"path\": \"00010001000C\", \"depth\": 3, \"numchild\": 0, \"title\": \"Brokers\", \"draft_title\": \"Brokers\", \"slug\": \"brokers\", \"content_type\": 77, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/brokers/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"body\": \"\"}',NULL,36,1),(75,0,'2020-01-28 23:46:17.615263','{\"pk\": 36, \"path\": \"00010001000C\", \"depth\": 3, \"numchild\": 0, \"title\": \"Brokers\", \"draft_title\": \"Brokers\", \"slug\": \"brokers\", \"content_type\": 77, \"live\": false, \"has_unpublished_changes\": true, \"url_path\": \"/root/brokers/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": \"2020-01-28T23:46:14.346Z\", \"live_revision\": null, \"body\": \"\"}',NULL,36,1),(79,0,'2020-01-29 02:40:35.372647','{\"pk\": 40, \"path\": \"00010001000D\", \"depth\": 3, \"numchild\": 0, \"title\": \"Forex\", \"draft_title\": \"Forex\", \"slug\": \"forex\", \"content_type\": 76, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/forex/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"script\": \"List of useful charts\"}',NULL,40,1),(80,0,'2020-01-29 02:40:59.377327','{\"pk\": 41, \"path\": \"00010001000D0001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Euros vs Dollars\", \"draft_title\": \"Euros vs Dollars\", \"slug\": \"euros-vs-dollars\", \"content_type\": 76, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/forex/euros-vs-dollars/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"script\": \"<!-- TradingView Widget BEGIN -->\\r\\n<div class=\\\"tradingview-widget-container\\\">\\r\\n  <div id=\\\"tradingview_f5992\\\"></div>\\r\\n  <div class=\\\"tradingview-widget-copyright\\\"><a href=\\\"https://es.tradingview.com/symbols/USD/OANDA-EURUSD/\\\" rel=\\\"noopener\\\" target=\\\"_blank\\\"><span class=\\\"blue-text\\\">EURUSD Gr\\u00e1fico</span></a> por TradingView</div>\\r\\n  <script type=\\\"text/javascript\\\" src=\\\"https://s3.tradingview.com/tv.js\\\"></script>\\r\\n  <script type=\\\"text/javascript\\\">\\r\\n  new TradingView.widget(\\r\\n  {\\r\\n  \\\"width\\\": 980,\\r\\n  \\\"height\\\": 610,\\r\\n  \\\"symbol\\\": \\\"USD/OANDA:EURUSD\\\",\\r\\n  \\\"interval\\\": \\\"D\\\",\\r\\n  \\\"timezone\\\": \\\"Etc/UTC\\\",\\r\\n  \\\"theme\\\": \\\"Light\\\",\\r\\n  \\\"style\\\": \\\"1\\\",\\r\\n  \\\"locale\\\": \\\"es\\\",\\r\\n  \\\"toolbar_bg\\\": \\\"#f1f3f6\\\",\\r\\n  \\\"enable_publishing\\\": false,\\r\\n  \\\"allow_symbol_change\\\": true,\\r\\n  \\\"container_id\\\": \\\"tradingview_f5992\\\"\\r\\n}\\r\\n  );\\r\\n  </script>\\r\\n</div>\\r\\n<!-- TradingView Widget END -->\"}',NULL,41,1),(88,0,'2020-01-29 03:28:36.270990','{\"pk\": 49, \"path\": \"00010001000F\", \"depth\": 3, \"numchild\": 0, \"title\": \"About\", \"draft_title\": \"About\", \"slug\": \"about-fr\", \"content_type\": 79, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/about-fr/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"canonical_page\": 48, \"language\": 3, \"page_ptr\": 49, \"body\": \"<p>This is Forex vouchers about page</p>\"}',NULL,49,NULL),(89,0,'2020-01-29 03:28:36.364791','{\"pk\": 50, \"path\": \"00010001000G\", \"depth\": 3, \"numchild\": 0, \"title\": \"About\", \"draft_title\": \"About\", \"slug\": \"about-es\", \"content_type\": 79, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/about-es/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"canonical_page\": 48, \"language\": 2, \"page_ptr\": 50, \"body\": \"<p>This is Forex vouchers about page</p>\"}',NULL,50,NULL),(90,0,'2020-01-29 03:28:36.421282','{\"pk\": 48, \"path\": \"00010001000E\", \"depth\": 3, \"numchild\": 0, \"title\": \"About\", \"draft_title\": \"About\", \"slug\": \"about\", \"content_type\": 79, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/about/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 48, \"body\": \"<p>This is Forex vouchers about page</p>\"}',NULL,48,1),(91,0,'2020-02-27 20:42:41.732961','{\"pk\": 26, \"path\": \"000100010003\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home Page\", \"draft_title\": \"Home Page\", \"slug\": \"es\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/es/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2020-01-28T06:56:11.542Z\", \"last_published_at\": \"2020-01-28T07:02:10.789Z\", \"latest_revision_created_at\": \"2020-01-28T07:02:10.743Z\", \"live_revision\": 59, \"canonical_page\": 24, \"language\": 2, \"page_ptr\": 26, \"banner_title\": \"Bienvenido a Forex Vouchers\", \"banner_body\": \"<p>Al instante, descuentos en vouchers disponibles para todos lo servicios forex</p><p> Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>\", \"banner_image\": 13}',NULL,26,1),(92,0,'2020-03-02 05:37:07.119096','{\"pk\": 52, \"path\": \"00010001000I\", \"depth\": 3, \"numchild\": 0, \"title\": \"Disclaimer\", \"draft_title\": \"Disclaimer\", \"slug\": \"disclaimer-fr\", \"content_type\": 79, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/disclaimer-fr/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"canonical_page\": 51, \"language\": 3, \"page_ptr\": 52, \"body\": \"\"}',NULL,52,NULL),(93,0,'2020-03-02 05:37:07.232350','{\"pk\": 53, \"path\": \"00010001000J\", \"depth\": 3, \"numchild\": 0, \"title\": \"Disclaimer\", \"draft_title\": \"Disclaimer\", \"slug\": \"disclaimer-es\", \"content_type\": 79, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/disclaimer-es/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"canonical_page\": 51, \"language\": 2, \"page_ptr\": 53, \"body\": \"\"}',NULL,53,NULL),(94,0,'2020-03-02 05:37:07.291091','{\"pk\": 51, \"path\": \"00010001000H\", \"depth\": 3, \"numchild\": 0, \"title\": \"Disclaimer\", \"draft_title\": \"Disclaimer\", \"slug\": \"disclaimer\", \"content_type\": 79, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/disclaimer/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 51, \"body\": \"\"}',NULL,51,1),(95,0,'2020-03-02 05:37:50.056872','{\"pk\": 55, \"path\": \"00010001000L\", \"depth\": 3, \"numchild\": 0, \"title\": \"Privacy Policy\", \"draft_title\": \"Privacy Policy\", \"slug\": \"privacy-policy-fr\", \"content_type\": 79, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/privacy-policy-fr/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"canonical_page\": 54, \"language\": 3, \"page_ptr\": 55, \"body\": \"\"}',NULL,55,NULL),(96,0,'2020-03-02 05:37:50.141297','{\"pk\": 56, \"path\": \"00010001000M\", \"depth\": 3, \"numchild\": 0, \"title\": \"Privacy Policy\", \"draft_title\": \"Privacy Policy\", \"slug\": \"privacy-policy-es\", \"content_type\": 79, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/privacy-policy-es/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"canonical_page\": 54, \"language\": 2, \"page_ptr\": 56, \"body\": \"\"}',NULL,56,NULL),(97,0,'2020-03-02 05:37:50.199648','{\"pk\": 54, \"path\": \"00010001000K\", \"depth\": 3, \"numchild\": 0, \"title\": \"Privacy Policy\", \"draft_title\": \"Privacy Policy\", \"slug\": \"privacy-policy\", \"content_type\": 79, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/privacy-policy/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 54, \"body\": \"\"}',NULL,54,1),(101,0,'2020-05-09 22:59:39.387245','{\"pk\": 33, \"path\": \"000100010009\", \"depth\": 3, \"numchild\": 0, \"title\": \"Forex Brokers\", \"draft_title\": \"Forex Brokers\", \"slug\": \"forex-brokers\", \"content_type\": 24, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/forex-brokers/\", \"owner\": 1, \"seo_title\": \"Test\", \"show_in_menus\": true, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-01-28T07:11:39.336Z\", \"last_published_at\": \"2020-01-28T07:12:20.105Z\", \"latest_revision_created_at\": \"2020-01-28T07:12:20.070Z\", \"live_revision\": 72, \"body\": \"\"}',NULL,33,1),(102,0,'2020-05-09 23:00:04.605539','{\"pk\": 33, \"path\": \"000100010009\", \"depth\": 3, \"numchild\": 0, \"title\": \"Forex Brokers\", \"draft_title\": \"Forex Brokers\", \"slug\": \"forex-brokers\", \"content_type\": 24, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/forex-brokers/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": true, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-01-28T07:11:39.336Z\", \"last_published_at\": \"2020-05-09T22:59:39.436Z\", \"latest_revision_created_at\": \"2020-05-09T22:59:39.387Z\", \"live_revision\": 101, \"body\": \"\"}',NULL,33,1),(103,0,'2020-05-11 06:03:09.133966','{\"pk\": 53, \"path\": \"00010001000J\", \"depth\": 3, \"numchild\": 0, \"title\": \"Disclaimer\", \"draft_title\": \"Disclaimer\", \"slug\": \"disclaimer-es\", \"content_type\": 79, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/disclaimer-es/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-03-02T05:37:07.232Z\", \"last_published_at\": \"2020-03-02T05:37:07.232Z\", \"latest_revision_created_at\": \"2020-03-02T05:37:07.232Z\", \"live_revision\": 93, \"canonical_page\": 51, \"language\": 2, \"page_ptr\": 53, \"body\": \"<p>Spanish displaymer</p>\"}',NULL,53,1),(104,0,'2020-05-11 23:02:27.320998','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"to_address\": \"pablo.rpm@gmail.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"intro\": \"<p>Intro Text</p>\", \"thank_you_text\": \"<p>Thanks for your message</p>\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Enter your name\", \"page\": 60}, {\"pk\": 2, \"sort_order\": 1, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"enter your email\", \"page\": 60}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"message\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}]}',NULL,60,1),(105,0,'2020-05-11 23:03:04.170383','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": false, \"has_unpublished_changes\": true, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": \"2020-05-11T23:02:27.320Z\", \"live_revision\": null, \"to_address\": \"pablo.rpm@gmail.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"intro\": \"<p>Intro Text</p>\", \"thank_you_text\": \"<p>Thanks for your message</p>\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Enter your name\", \"page\": null}, {\"pk\": 2, \"sort_order\": 1, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"enter your email\", \"page\": null}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"message\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}]}',NULL,60,1),(106,0,'2020-05-11 23:22:53.035163','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-11T23:03:04.200Z\", \"latest_revision_created_at\": \"2020-05-11T23:03:04.170Z\", \"live_revision\": 105, \"to_address\": \"pablo.rpm@gmail.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"intro\": \"<p>Intro Text</p>\", \"thank_you_text\": \"<p>Thanks for your message</p>\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Enter your name\", \"page\": 60}, {\"pk\": 2, \"sort_order\": 1, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"enter your email\", \"page\": 60}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"message\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}]}',NULL,60,1),(107,0,'2020-05-11 23:23:00.121388','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": true, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-11T23:03:04.200Z\", \"latest_revision_created_at\": \"2020-05-11T23:22:53.035Z\", \"live_revision\": 105, \"to_address\": \"pablo.rpm@gmail.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"intro\": \"<p>Intro Text</p>\", \"thank_you_text\": \"<p>Thanks for your message</p>\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Enter your name\", \"page\": null}, {\"pk\": 2, \"sort_order\": 1, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"enter your email\", \"page\": null}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"message\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}]}',NULL,60,1),(108,0,'2020-05-12 00:06:23.612253','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-11T23:23:00.167Z\", \"latest_revision_created_at\": \"2020-05-11T23:23:00.121Z\", \"live_revision\": 107, \"to_address\": \"pablo.rpm@gmail.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"intro\": \"<p>Intro Text</p>\", \"thank_you_text\": \"<p>Thanks for your message</p>\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Enter your name\", \"page\": 60}, {\"pk\": 2, \"sort_order\": 1, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"enter your email\", \"page\": 60}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"message\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}]}',NULL,60,1),(109,0,'2020-05-16 05:45:37.664605','{\"pk\": 53, \"path\": \"00010001000J\", \"depth\": 3, \"numchild\": 0, \"title\": \"Disclaimer\", \"draft_title\": \"Disclaimer\", \"slug\": \"disclaimer-es1\", \"content_type\": 79, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/disclaimer-es/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-03-02T05:37:07.232Z\", \"last_published_at\": \"2020-05-11T06:03:09.180Z\", \"latest_revision_created_at\": \"2020-05-11T06:03:09.133Z\", \"live_revision\": 103, \"canonical_page\": 51, \"language\": 2, \"page_ptr\": 53, \"body\": \"<p>Spanish displaymer</p>\"}',NULL,53,1),(110,0,'2020-05-16 05:45:57.440671','{\"pk\": 53, \"path\": \"00010001000J\", \"depth\": 3, \"numchild\": 0, \"title\": \"Disclaimer\", \"draft_title\": \"Disclaimer\", \"slug\": \"disclaimer-es\", \"content_type\": 79, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/disclaimer-es1/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-03-02T05:37:07.232Z\", \"last_published_at\": \"2020-05-16T05:45:37.741Z\", \"latest_revision_created_at\": \"2020-05-16T05:45:37.664Z\", \"live_revision\": 109, \"canonical_page\": 51, \"language\": 2, \"page_ptr\": 53, \"body\": \"<p>Spanish displaymer</p>\"}',NULL,53,1),(111,0,'2020-05-16 06:31:20.276608','{\"pk\": 50, \"path\": \"0001000100030001\", \"depth\": 4, \"numchild\": 0, \"title\": \"About\", \"draft_title\": \"About\", \"slug\": \"about-es\", \"content_type\": 79, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/es/about-es/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-01-29T03:28:36.364Z\", \"last_published_at\": \"2020-01-29T03:28:36.364Z\", \"latest_revision_created_at\": \"2020-01-29T03:28:36.364Z\", \"live_revision\": 89, \"canonical_page\": 48, \"language\": 2, \"page_ptr\": 50, \"body\": \"<p>This is Forex vouchers about page</p>\"}',NULL,50,1),(112,0,'2020-05-16 06:31:47.854533','{\"pk\": 56, \"path\": \"00010001000M\", \"depth\": 3, \"numchild\": 0, \"title\": \"Privacy Policy\", \"draft_title\": \"Privacy Policy\", \"slug\": \"privacy-policy-es\", \"content_type\": 79, \"live\": false, \"has_unpublished_changes\": false, \"url_path\": \"/root/privacy-policy-es/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-03-02T05:37:50.141Z\", \"last_published_at\": \"2020-03-02T05:37:50.141Z\", \"latest_revision_created_at\": \"2020-03-02T05:37:50.141Z\", \"live_revision\": 96, \"canonical_page\": 54, \"language\": 2, \"page_ptr\": 56, \"body\": \"\"}',NULL,56,1),(113,0,'2020-05-16 22:19:17.532257','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-12T00:06:23.667Z\", \"latest_revision_created_at\": \"2020-05-12T00:06:23.612Z\", \"live_revision\": 108, \"to_address\": \"pablo.rpm@gmail.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"intro\": \"<p>Intro Text</p>\", \"Thank_you_box\": \"Thanks for contacting us! We will be in touch with you shortly.\", \"Thank_you_follow\": \"You may also send an email to us at\", \"Thank_you_mail\": \"admin@forexvouchers.com\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"First name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 2, \"sort_order\": 1, \"label\": \"Last name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": null, \"sort_order\": 3, \"label\": \"Phone\", \"field_type\": \"singleline\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": null, \"sort_order\": 4, \"label\": \"Message for us\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": null, \"sort_order\": 5, \"label\": \"subscribe\", \"field_type\": \"checkbox\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Yes, I agree to receive discount vouchers\", \"page\": 60}]}',NULL,60,1),(114,0,'2020-05-16 22:21:10.692954','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": true, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-12T00:06:23.667Z\", \"latest_revision_created_at\": \"2020-05-16T22:19:17.532Z\", \"live_revision\": 108, \"to_address\": \"pablo.rpm@gmail.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"intro\": \"<p>Intro Text</p>\", \"Thank_you_box\": \"Thanks for contacting us! We will be in touch with you shortly.\", \"Thank_you_follow\": \"You may also send an email to us at\", \"Thank_you_mail\": \"admin@forexvouchers.com\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"First name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 2, \"sort_order\": 1, \"label\": \"Last name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": null, \"sort_order\": 3, \"label\": \"Phone\", \"field_type\": \"singleline\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": null, \"sort_order\": 4, \"label\": \"Message for us\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": null, \"sort_order\": 5, \"label\": \"subscribe\", \"field_type\": \"checkbox\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Yes, I agree to receive discount vouchers\", \"page\": 60}]}',NULL,60,1),(115,0,'2020-05-18 02:49:54.456728','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-16T22:21:10.754Z\", \"latest_revision_created_at\": \"2020-05-16T22:21:10.692Z\", \"live_revision\": 114, \"to_address\": \"admin@forexvouchers.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"intro\": \"<p>Intro Text</p>\", \"Thank_you_box\": \"Thanks for contacting us! We will be in touch with you shortly.\", \"Thank_you_follow\": \"You may also send an email to us at\", \"Thank_you_mail\": \"admin@forexvouchers.com\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"First name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 2, \"sort_order\": 1, \"label\": \"Last name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 4, \"sort_order\": 3, \"label\": \"Phone\", \"field_type\": \"singleline\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 5, \"sort_order\": 4, \"label\": \"Message for us\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 6, \"sort_order\": 5, \"label\": \"subscribe\", \"field_type\": \"checkbox\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Yes, I agree to receive discount vouchers\", \"page\": 60}]}',NULL,60,1),(116,0,'2020-05-18 02:50:28.302410','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": true, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-16T22:21:10.754Z\", \"latest_revision_created_at\": \"2020-05-18T02:49:54.456Z\", \"live_revision\": 114, \"to_address\": \"admin@forexvouchers.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"intro\": \"<p>Intro Text</p>\", \"Thank_you_box\": \"Thanks for contacting us! We will be in touch with you shortly.\", \"Thank_you_follow\": \"You may also send an email to us at\", \"Thank_you_mail\": \"admin@forexvouchers.com\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"First name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 2, \"sort_order\": 1, \"label\": \"Last name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 4, \"sort_order\": 3, \"label\": \"Phone\", \"field_type\": \"singleline\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 5, \"sort_order\": 4, \"label\": \"Message for us\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 6, \"sort_order\": 5, \"label\": \"subscribe\", \"field_type\": \"checkbox\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Yes, I agree to receive discount vouchers\", \"page\": null}]}',NULL,60,1),(117,0,'2020-05-18 02:56:50.480447','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Usz\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-18T02:50:28.340Z\", \"latest_revision_created_at\": \"2020-05-18T02:50:28.302Z\", \"live_revision\": 116, \"to_address\": \"admin@forexvouchers.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"intro\": \"\", \"Thank_you_box\": \"Thanks for contacting us! We will be in touch with you shortly.\", \"Thank_you_follow\": \"You may also send an email to us at\", \"Thank_you_mail\": \"admin@forexvouchers.com\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"First name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 2, \"sort_order\": 1, \"label\": \"Last name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 4, \"sort_order\": 3, \"label\": \"Phone\", \"field_type\": \"singleline\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 5, \"sort_order\": 4, \"label\": \"Message for us\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 6, \"sort_order\": 5, \"label\": \"subscribe\", \"field_type\": \"checkbox\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Yes, I agree to receive discount vouchers\", \"page\": 60}]}',NULL,60,1),(118,0,'2020-05-18 03:00:36.523298','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Usz\", \"draft_title\": \"Contact Usz\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-18T02:56:50.548Z\", \"latest_revision_created_at\": \"2020-05-18T02:56:50.480Z\", \"live_revision\": 117, \"to_address\": \"admin@forexvouchers.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"Thank_you_box\": \"Thanks for contacting us! We will be in touch with you shortly.\", \"Thank_you_follow\": \"You may also send an email to us at\", \"Thank_you_mail\": \"admin@forexvouchers.com\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"First name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 2, \"sort_order\": 1, \"label\": \"Last name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 4, \"sort_order\": 3, \"label\": \"Phone\", \"field_type\": \"singleline\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 5, \"sort_order\": 4, \"label\": \"Message for us\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 6, \"sort_order\": 5, \"label\": \"subscribe\", \"field_type\": \"checkbox\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Yes, I agree to receive discount vouchers\", \"page\": 60}]}',NULL,60,1),(119,0,'2020-05-18 03:09:51.744159','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Usz\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": true, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-18T02:56:50.548Z\", \"latest_revision_created_at\": \"2020-05-18T03:00:36.523Z\", \"live_revision\": 117, \"to_address\": \"admin@forexvouchers.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"contact_title\": \"Contact us\", \"Thank_you_box\": \"Thanks for contacting us! We will be in touch with you shortly.\", \"Thank_you_follow\": \"You may also send an email to us at\", \"Thank_you_mail\": \"admin@forexvouchers.com\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"First name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 2, \"sort_order\": 1, \"label\": \"Last name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 4, \"sort_order\": 3, \"label\": \"Phone\", \"field_type\": \"singleline\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 5, \"sort_order\": 4, \"label\": \"Message for us\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 6, \"sort_order\": 5, \"label\": \"subscribe\", \"field_type\": \"checkbox\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Yes, I agree to receive discount vouchers\", \"page\": null}]}',NULL,60,1),(120,0,'2020-05-18 03:13:50.805337','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-18T03:09:51.786Z\", \"latest_revision_created_at\": \"2020-05-18T03:09:51.744Z\", \"live_revision\": 119, \"to_address\": \"admin@forexvouchers.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"contact_title\": \"Contact us2\", \"Thank_you_box\": \"Thanks for contacting us! We will be in touch with you shortly.\", \"Thank_you_follow\": \"You may also send an email to us at\", \"Thank_you_mail\": \"admin@forexvouchers.com\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"First name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 2, \"sort_order\": 1, \"label\": \"Last name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 4, \"sort_order\": 3, \"label\": \"Phone\", \"field_type\": \"singleline\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 5, \"sort_order\": 4, \"label\": \"Message for us\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 6, \"sort_order\": 5, \"label\": \"subscribe\", \"field_type\": \"checkbox\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Yes, I agree to receive discount vouchers\", \"page\": 60}]}',NULL,60,1),(121,0,'2020-05-18 03:34:04.607926','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-18T03:13:50.875Z\", \"latest_revision_created_at\": \"2020-05-18T03:13:50.805Z\", \"live_revision\": 120, \"to_address\": \"admin@forexvouchers.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"contact_title\": \"Contact us\", \"Thank_you_box\": \"Thanks for contacting us! We will be in touch with you shortly.\", \"Thank_you_follow\": \"You may also send an email to us at\", \"Thank_you_mail\": \"admin@forexvouchers.com\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"First name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 2, \"sort_order\": 1, \"label\": \"Last name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 4, \"sort_order\": 3, \"label\": \"Phone\", \"field_type\": \"singleline\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 5, \"sort_order\": 4, \"label\": \"Message for us\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 6, \"sort_order\": 5, \"label\": \"subscribe\", \"field_type\": \"checkbox\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Yes, I agree to receive discount vouchers\", \"page\": 60}]}',NULL,60,1),(122,0,'2020-05-23 22:27:39.638600','{\"pk\": 24, \"path\": \"00010001000Q\", \"depth\": 3, \"numchild\": 0, \"title\": \"Forex Vouchers - Discounts, Promocodes, Offers\", \"draft_title\": \"Home Page\", \"slug\": \"en\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/en/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-01-28T06:56:11.628Z\", \"last_published_at\": \"2020-01-28T07:02:20.900Z\", \"latest_revision_created_at\": \"2020-01-28T07:02:20.853Z\", \"live_revision\": 60, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 24, \"banner_title\": \"Welcome to Forex vouchers\", \"banner_body\": \"<p>Instant discount vouchers are available for all forex services.<br/> Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>\", \"banner_image\": 13}',NULL,24,1),(123,0,'2020-05-23 22:30:00.737506','{\"pk\": 24, \"path\": \"00010001000Q\", \"depth\": 3, \"numchild\": 0, \"title\": \"Forex Vouchers - Discounts, Promocodes, Offers\", \"draft_title\": \"Forex Vouchers - Discounts, Promocodes, Offers\", \"slug\": \"en\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": true, \"url_path\": \"/root/en/\", \"owner\": 1, \"seo_title\": \"Forex Vouchers - Discounts, Promocodes, Offers\", \"show_in_menus\": false, \"search_description\": \"Forex Vouchers provides discount vouchers, promocodes, offers on all forex brokers and forex services such as forex signals, trading systems & forex training.\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-01-28T06:56:11.628Z\", \"last_published_at\": \"2020-01-28T07:02:20.900Z\", \"latest_revision_created_at\": \"2020-05-23T22:27:39.638Z\", \"live_revision\": 60, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 24, \"banner_title\": \"Welcome to Forex vouchers\", \"banner_body\": \"<p>Instant discount vouchers are available for all forex services.<br/> Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>\", \"banner_image\": 13}',NULL,24,1),(124,0,'2020-05-23 22:30:09.354673','{\"pk\": 24, \"path\": \"00010001000Q\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Forex Vouchers - Discounts, Promocodes, Offers\", \"slug\": \"en\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": true, \"url_path\": \"/root/en/\", \"owner\": 1, \"seo_title\": \"Forex Vouchers - Discounts, Promocodes, Offers\", \"show_in_menus\": false, \"search_description\": \"Forex Vouchers provides discount vouchers, promocodes, offers on all forex brokers and forex services such as forex signals, trading systems & forex training.\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-01-28T06:56:11.628Z\", \"last_published_at\": \"2020-01-28T07:02:20.900Z\", \"latest_revision_created_at\": \"2020-05-23T22:30:00.737Z\", \"live_revision\": 60, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 24, \"banner_title\": \"Welcome to Forex vouchers\", \"banner_body\": \"<p>Instant discount vouchers are available for all forex services.<br/> Forex Brokers, Forex Training, Forex Signals, Forex Trading systems &amp; Forex VPS</p>\", \"banner_image\": 13}',NULL,24,1),(125,0,'2020-05-23 22:31:26.453087','{\"pk\": 24, \"path\": \"00010001000Q\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"en\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": true, \"url_path\": \"/root/en/\", \"owner\": 1, \"seo_title\": \"Forex Vouchers - Discounts, Promocodes, Offers\", \"show_in_menus\": false, \"search_description\": \"Forex Vouchers provides discount vouchers, promocodes, offers on all forex brokers and forex services such as forex signals, trading systems & forex training.\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-01-28T06:56:11.628Z\", \"last_published_at\": \"2020-01-28T07:02:20.900Z\", \"latest_revision_created_at\": \"2020-05-23T22:30:09.354Z\", \"live_revision\": 60, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 24, \"banner_title\": \"Forex vouchers!\", \"banner_body\": \"<p>We provide forex discount vouchers for everything related to forex trading<br/></p>\", \"banner_image\": 13}',NULL,24,1),(126,0,'2020-05-23 22:33:54.498244','{\"pk\": 24, \"path\": \"00010001000Q\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"en\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/en/\", \"owner\": 1, \"seo_title\": \"Forex Vouchers - The ultimate source of forex discounts\", \"show_in_menus\": false, \"search_description\": \"Forex Vouchers provides discount vouchers, promocodes, offers on all forex brokers and forex services such as forex signals, trading systems & forex training.\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-01-28T06:56:11.628Z\", \"last_published_at\": \"2020-05-23T22:31:26.512Z\", \"latest_revision_created_at\": \"2020-05-23T22:31:26.453Z\", \"live_revision\": 125, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 24, \"banner_title\": \"Forex vouchers!\", \"banner_body\": \"<p>We provide forex discount vouchers for everything related to forex trading<br/></p>\", \"banner_image\": 13}',NULL,24,1),(127,0,'2020-05-23 22:36:34.247289','{\"pk\": 24, \"path\": \"00010001000Q\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"en\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/en/\", \"owner\": 1, \"seo_title\": \"Forex Vouchers - The ultimate source of forex discounts\", \"show_in_menus\": false, \"search_description\": \"Forex Vouchers provides discount vouchers, promocodes, offers on all forex brokers and forex services such as forex signals, trading systems & forex training.\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-01-28T06:56:11.628Z\", \"last_published_at\": \"2020-05-23T22:33:54.560Z\", \"latest_revision_created_at\": \"2020-05-23T22:33:54.498Z\", \"live_revision\": 126, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 24, \"banner_title\": \"Forex Vouchers!\", \"banner_body\": \"<p>We provide forex discount vouchers for everything related to forex trading<br/></p>\", \"banner_image\": 13}',NULL,24,1),(128,0,'2020-05-23 22:49:08.617329','{\"pk\": 24, \"path\": \"00010001000Q\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"en\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/en/\", \"owner\": 1, \"seo_title\": \"Forex Vouchers - The ultimate source of forex discounts\", \"show_in_menus\": false, \"search_description\": \"Forex Vouchers provides discount vouchers, promocodes, offers on all forex brokers and forex services such as forex signals, trading systems & forex training.\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-01-28T06:56:11.628Z\", \"last_published_at\": \"2020-05-23T22:36:34.306Z\", \"latest_revision_created_at\": \"2020-05-23T22:36:34.247Z\", \"live_revision\": 127, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 24, \"banner_title\": \"Looking for a discount?\", \"banner_body\": \"<p>We bring the best forex vouchers deals<br/></p>\", \"banner_image\": 13}',NULL,24,1),(129,0,'2020-05-23 22:51:04.161833','{\"pk\": 24, \"path\": \"00010001000Q\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"en\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/en/\", \"owner\": 1, \"seo_title\": \"Forex Vouchers - The ultimate source of forex discounts\", \"show_in_menus\": false, \"search_description\": \"Forex Vouchers provides discount vouchers, promocodes, offers on all forex brokers and forex services such as forex signals, trading systems & forex training.\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-01-28T06:56:11.628Z\", \"last_published_at\": \"2020-05-23T22:49:08.681Z\", \"latest_revision_created_at\": \"2020-05-23T22:49:08.617Z\", \"live_revision\": 128, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 24, \"banner_title\": \"Looking for a discount voucher?\", \"banner_body\": \"<p>We provide real-time forex deals &amp; discounts</p>\", \"banner_image\": 13}',NULL,24,1),(130,0,'2020-05-23 22:51:57.719768','{\"pk\": 24, \"path\": \"00010001000Q\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"en\", \"content_type\": 14, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/en/\", \"owner\": 1, \"seo_title\": \"Forex Vouchers - The ultimate source of forex discounts\", \"show_in_menus\": false, \"search_description\": \"Forex Vouchers provides discount vouchers, promocodes, offers on all forex brokers and forex services such as forex signals, trading systems & forex training.\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-01-28T06:56:11.628Z\", \"last_published_at\": \"2020-05-23T22:51:04.225Z\", \"latest_revision_created_at\": \"2020-05-23T22:51:04.161Z\", \"live_revision\": 129, \"canonical_page\": null, \"language\": 1, \"page_ptr\": 24, \"banner_title\": \"The ultimate source of forex vouchers!\", \"banner_body\": \"<p>We provide real-time forex deals &amp; discounts</p>\", \"banner_image\": 13}',NULL,24,1),(131,0,'2020-05-23 22:56:22.581341','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-18T03:34:04.670Z\", \"latest_revision_created_at\": \"2020-05-18T03:34:04.607Z\", \"live_revision\": 121, \"to_address\": \"admin@forexvouchers.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"contact_title\": \"Contact us\", \"Thank_you_box\": \"Thanks for contacting us! We will be in touch with you shortly.\", \"Thank_you_follow\": \"You may also send an email to us at\", \"Thank_you_mail\": \"support@forexvouchers.com\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"Name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 5, \"sort_order\": 2, \"label\": \"Message\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 6, \"sort_order\": 3, \"label\": \"subscribe\", \"field_type\": \"checkbox\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Yes, I agree to receive discount vouchers. No SPAM!\", \"page\": 60}]}',NULL,60,1),(132,0,'2020-05-23 22:58:59.363656','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-23T22:56:22.641Z\", \"latest_revision_created_at\": \"2020-05-23T22:56:22.581Z\", \"live_revision\": 131, \"to_address\": \"admin@forexvouchers.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"contact_title\": \"Contact us\", \"Thank_you_box\": \"Thanks for contacting us! We will be in touch with you shortly.\", \"Thank_you_follow\": \"You may also send an email to us at\", \"Thank_you_mail\": \"support@forexvouchers.com\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"Name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 5, \"sort_order\": 2, \"label\": \"Message\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 6, \"sort_order\": 3, \"label\": \"subscribe\", \"field_type\": \"checkbox\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Yes, I agree to receive discount vouchers. No SPAM!\", \"page\": 60}, {\"pk\": null, \"sort_order\": 4, \"label\": \"You can also send us email via support@forexvouchers.com\", \"field_type\": \"hidden\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}]}',NULL,60,1),(133,0,'2020-05-23 23:00:20.623117','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-23T22:58:59.428Z\", \"latest_revision_created_at\": \"2020-05-23T22:58:59.363Z\", \"live_revision\": 132, \"to_address\": \"admin@forexvouchers.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"contact_title\": \"Contact us\", \"Thank_you_box\": \"Thanks for contacting us! We will be in touch with you shortly.\", \"Thank_you_follow\": \"You may also send an email to us at\", \"Thank_you_mail\": \"support@forexvouchers.com\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"Name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 3, \"sort_order\": 2, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 5, \"sort_order\": 2, \"label\": \"Message\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 6, \"sort_order\": 3, \"label\": \"subscribe\", \"field_type\": \"checkbox\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Send me special discount vouchers. No SPAM!\", \"page\": 60}, {\"pk\": 7, \"sort_order\": 4, \"label\": \"You can also send us email via support@forexvouchers.com\", \"field_type\": \"hidden\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}]}',NULL,60,1),(134,0,'2020-05-23 23:01:41.250689','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": true, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-23T22:58:59.428Z\", \"latest_revision_created_at\": \"2020-05-23T23:00:20.623Z\", \"live_revision\": 132, \"to_address\": \"admin@forexvouchers.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"contact_title\": \"Contact us\", \"Thank_you_box\": \"Thanks for contacting us! We will be in touch with you shortly.\", \"Thank_you_follow\": \"You may also send an email to us at\", \"Thank_you_mail\": \"support@forexvouchers.com\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"Name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 3, \"sort_order\": 1, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 5, \"sort_order\": 2, \"label\": \"Message\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 6, \"sort_order\": 3, \"label\": \"subscribe\", \"field_type\": \"checkbox\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Send me special discount vouchers occasionally. NO SPAM!\", \"page\": 60}, {\"pk\": 7, \"sort_order\": 4, \"label\": \"You can also send us email via support@forexvouchers.com\", \"field_type\": \"singleline\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}]}',NULL,60,1),(135,0,'2020-05-23 23:01:52.640068','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": true, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-23T22:58:59.428Z\", \"latest_revision_created_at\": \"2020-05-23T23:01:41.250Z\", \"live_revision\": 132, \"to_address\": \"admin@forexvouchers.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"contact_title\": \"Contact us\", \"Thank_you_box\": \"Thanks for contacting us! We will be in touch with you shortly.\", \"Thank_you_follow\": \"You may also send an email to us at\", \"Thank_you_mail\": \"support@forexvouchers.com\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"Name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 3, \"sort_order\": 1, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 5, \"sort_order\": 2, \"label\": \"Message\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}, {\"pk\": 6, \"sort_order\": 3, \"label\": \"subscribe\", \"field_type\": \"checkbox\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Send me special discount vouchers occasionally. NO SPAM!\", \"page\": null}, {\"pk\": 7, \"sort_order\": 4, \"label\": \"You can also send us email via support@forexvouchers.com\", \"field_type\": \"singleline\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": null}]}',NULL,60,1),(136,0,'2020-05-23 23:03:56.087940','{\"pk\": 60, \"path\": \"00010001000S\", \"depth\": 3, \"numchild\": 0, \"title\": \"Contact Us\", \"draft_title\": \"Contact Us\", \"slug\": \"contact-us\", \"content_type\": 87, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/root/contact-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"first_published_at\": \"2020-05-11T23:03:04.200Z\", \"last_published_at\": \"2020-05-23T23:01:52.683Z\", \"latest_revision_created_at\": \"2020-05-23T23:01:52.640Z\", \"live_revision\": 135, \"to_address\": \"admin@forexvouchers.com\", \"from_address\": \"admin@forexvouchers.com\", \"subject\": \"contact-email\", \"contact_title\": \"Contact us\", \"Thank_you_box\": \"Thanks for contacting us! We will be in touch with you shortly.\", \"Thank_you_follow\": \"You may also send an email to us at support@forexvouchers.com\", \"Thank_you_mail\": \"support@forexvouchers.com\", \"form_fields\": [{\"pk\": 1, \"sort_order\": 0, \"label\": \"Name\", \"field_type\": \"singleline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 3, \"sort_order\": 1, \"label\": \"Email\", \"field_type\": \"email\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"\", \"page\": 60}, {\"pk\": 5, \"sort_order\": 2, \"label\": \"Message\", \"field_type\": \"multiline\", \"required\": true, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"You may also send us email via support@forexvouchers.com\", \"page\": 60}, {\"pk\": 6, \"sort_order\": 3, \"label\": \"subscribe\", \"field_type\": \"checkbox\", \"required\": false, \"choices\": \"\", \"default_value\": \"\", \"help_text\": \"Send me special discount vouchers occasionally. NO SPAM!\", \"page\": 60}]}',NULL,60,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_site`
--

LOCK TABLES `wagtailcore_site` WRITE;
/*!40000 ALTER TABLE `wagtailcore_site` DISABLE KEYS */;
INSERT INTO `wagtailcore_site` VALUES (4,'forexvouchers.com',443,1,16,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailforms_formsubmission`
--

LOCK TABLES `wagtailforms_formsubmission` WRITE;
/*!40000 ALTER TABLE `wagtailforms_formsubmission` DISABLE KEYS */;
INSERT INTO `wagtailforms_formsubmission` VALUES (1,'{\"name\": \"pablo\", \"email\": \"email@fa.com\", \"message\": \"ada\"}','2020-05-11 23:03:46.684722',60),(2,'{\"name\": \"pablo\", \"email\": \"pablo.rpm@gmail.com\", \"message\": \"adaada\"}','2020-05-11 23:04:19.404607',60),(3,'{\"name\": \"don\", \"email\": \"pablo.rpm@gmail.com\", \"message\": \"asas\"}','2020-05-11 23:09:20.628859',60),(4,'{\"name\": \"don\", \"email\": \"pablo.rpm@gmail.com\", \"message\": \"asas\"}','2020-05-11 23:10:32.291581',60),(5,'{\"name\": \"ad\", \"email\": \"pablo.rpm@gmail.com\", \"message\": \"a\"}','2020-05-11 23:10:38.688015',60),(6,'{\"name\": \"ad\", \"email\": \"pablo.rpm@gmail.com\", \"message\": \"a\"}','2020-05-11 23:11:05.396387',60),(7,'{\"name\": \"pablo\", \"email\": \"pablo.rpm@gmail.com\", \"message\": \"textoD\"}','2020-05-11 23:15:15.487076',60),(8,'{\"name\": \"ada\", \"email\": \"pablo.rpm@gmail.com\", \"message\": \"aa\"}','2020-05-11 23:21:21.026275',60),(9,'{\"name\": \"pablo montenegro\", \"email\": \"pablo.rpm@gmail.com\", \"message\": \"sx\"}','2020-05-11 23:21:59.709511',60),(10,'{\"name\": \"ada\", \"email\": \"pablo.rpm@gmail.com\", \"message\": \"adad\"}','2020-05-11 23:23:14.979589',60),(11,'{\"name\": \"test\", \"email\": \"test@test.com\", \"message\": \"test\"}','2020-05-11 23:41:13.745766',60),(12,'{\"name\": \"pablo montenegro\", \"email\": \"pablo.rpm@gmail.com\", \"message\": \"hi\"}','2020-05-11 23:59:28.170193',60),(13,'{\"name\": \"aa\", \"email\": \"pablo.rpm@gmail.com\", \"message\": \"adada\"}','2020-05-11 23:59:39.056494',60),(14,'{\"name\": \"pablo\", \"email\": \"pablo.rpm@gmail.com\", \"message\": \"aasa\"}','2020-05-12 00:01:16.102547',60),(15,'{\"name\": \"pablo montenegro\", \"email\": \"pablo.rpm@gmail.com\", \"message\": \"dada\"}','2020-05-12 00:04:07.986136',60),(16,'{\"name\": \"pablo montenegro\", \"email\": \"pablo.rpm@gmail.com\", \"message\": \"adada\"}','2020-05-12 00:04:39.232736',60),(17,'{\"name\": \"pablo montenegro\", \"email\": \"pablo.rpm@gmail.com\", \"message\": \"fafa\"}','2020-05-12 00:06:39.241569',60),(18,'{\"name\": \"Ahmer\", \"email\": \"ahmerkhan@live.com\", \"message\": \"Hi, \\r\\n\\r\\nI have a problem with my account and i want to know if you can help me activating it.\\r\\nHow much is the cost?\"}','2020-05-12 08:18:44.223045',60),(19,'{\"name\": \"test\", \"email\": \"test-agent@icracked.com\", \"message\": \"test\"}','2020-05-12 13:45:54.448021',60),(20,'{\"name\": \"khan\", \"email\": \"ahmerkhan@live.com\", \"message\": \"I need to ask you that how this email form is working.\"}','2020-05-12 14:45:41.086716',60),(21,'{\"name\": \"Ahmer\", \"email\": \"ahmerkhan@live.com\", \"message\": \"the main problem is that it works sometimes, so the settings are right. I\'d need to research on this, maybe contacting Yandex support\\r\\n\\r\\nThanks\"}','2020-05-12 15:59:39.360274',60),(22,'{\"name\": \"Ahmer\", \"email\": \"ahmerkhan@live.com\", \"message\": \"I need to check this email\"}','2020-05-13 11:40:51.110190',60),(23,'{\"name\": \"Ahmer\", \"email\": \"ahmerkhan@live.com\", \"message\": \"I need to check\"}','2020-05-13 16:52:02.668620',60),(24,'{\"name\": \"Ahmer\", \"email\": \"ahmerkhan@live.com\", \"message\": \"I want test this functionality to see if it works\"}','2020-05-13 23:58:53.920803',60),(25,'{\"name\": \"Ahmer Khan\", \"email\": \"ahmerkhan@live.com\", \"message\": \"This test message is to check status\"}','2020-05-14 13:14:05.034916',60),(26,'{\"name\": \"Ahmer Khan\", \"email\": \"ahmerkhan@live.com\", \"message\": \"need help\"}','2020-05-14 13:14:28.175673',60),(27,'{\"first-name\": \"Ahmer\", \"last-name\": \"Khan\", \"email\": \"ahmerkhan@live.com\", \"phone\": \"0\", \"message-for-us\": \"What\", \"subscribe\": true}','2020-05-17 13:21:28.031713',60),(28,'{\"first-name\": \"pablo\", \"last-name\": \"monte\", \"email\": \"pablo.rpm@gmail.com\", \"phone\": \"\", \"message-for-us\": \"hello\", \"subscribe\": false}','2020-05-18 02:47:40.960254',60),(29,'{\"first-name\": \"pablo\", \"last-name\": \"monte\", \"email\": \"pablo.rpm@gmail.com\", \"phone\": \"\", \"message-for-us\": \"hello\", \"subscribe\": false}','2020-05-18 02:50:10.901367',60),(30,'{\"first-name\": \"pablo\", \"last-name\": \"montenegro\", \"email\": \"pablo.rpm@gmail.com\", \"phone\": \"\", \"message-for-us\": \"j\", \"subscribe\": false}','2020-05-18 02:50:43.214626',60),(31,'{\"first-name\": \"pablo\", \"last-name\": \"monte\", \"email\": \"pablo.rpm@gmail.com\", \"phone\": \"\", \"message-for-us\": \"hello\", \"subscribe\": false}','2020-05-18 02:52:18.644150',60),(32,'{\"first-name\": \"pablo\", \"last-name\": \"surname\", \"email\": \"pablo.rpm@gmail.com\", \"phone\": \"\", \"message-for-us\": \"adad\", \"subscribe\": false}','2020-05-18 03:08:04.402826',60),(33,'{\"first-name\": \"pablo\", \"last-name\": \"surname\", \"email\": \"pablo.rpm@gmail.com\", \"phone\": \"\", \"message-for-us\": \"hello ahmer\", \"subscribe\": false}','2020-05-18 03:11:41.966749',60),(34,'{\"first-name\": \"pablo\", \"last-name\": \"montenegro\", \"email\": \"pablo.rpm@gmail.com\", \"phone\": \"232\", \"message-for-us\": \"sds\", \"subscribe\": true}','2020-05-18 03:14:23.966892',60),(35,'{\"first-name\": \"pablo\", \"last-name\": \"surname\", \"email\": \"pablo.rpm@gmail.com\", \"phone\": \"\", \"message-for-us\": \"hello ahmer\", \"subscribe\": false}','2020-05-18 03:28:59.747006',60),(36,'{\"first-name\": \"Ahmer\", \"last-name\": \"Khan\", \"email\": \"ahmerkhan@live.com\", \"phone\": \"03332639277\", \"message-for-us\": \"what\", \"subscribe\": true}','2020-05-18 11:03:41.828684',60),(37,'{\"first-name\": \"Eric\", \"last-name\": \"Jones\", \"email\": \"eric@talkwithwebvisitor.com\", \"phone\": \"416-385-3200\", \"message-for-us\": \"Hey, this is Eric and I ran across forexvouchers.com a few minutes ago.\\r\\n\\r\\nLooks great\\u2026 but now what?\\r\\n\\r\\nBy that I mean, when someone like me finds your website \\u2013 either through Search or just bouncing around \\u2013 what happens next?  Do you get a lot of leads from your site, or at least enough to make you happy?\\r\\n\\r\\nHonestly, most business websites fall a bit short when it comes to generating paying customers. Studies show that 70% of a site\\u2019s visitors disappear and are gone forever after just a moment.\\r\\n\\r\\nHere\\u2019s an idea\\u2026\\r\\n \\r\\nHow about making it really EASY for every visitor who shows up to get a personal phone call you as soon as they hit your site\\u2026\\r\\n \\r\\nYou can \\u2013\\r\\n  \\r\\nTalk With Web Visitor is a software widget that\\u2019s works on your site, ready to capture any visitor\\u2019s Name, Email address and Phone Number.  It signals you the moment they let you know they\\u2019re interested \\u2013 so that you can talk to that lead while they\\u2019re literally looking over your site.\\r\\n\\r\\nCLICK HERE http://www.talkwithwebvisitor.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.\\r\\n\\r\\nYou\\u2019ll be amazed - the difference between contacting someone within 5 minutes versus a half-hour or more later could increase your results 100-fold.\\r\\n\\r\\nIt gets even better\\u2026 once you\\u2019ve captured their phone number, with our new SMS Text With Lead feature, you can automatically start a text (SMS) conversation.\\r\\n  \\r\\nThat way, even if you don\\u2019t close a deal right away, you can follow up with text messages for new offers, content links, even just \\u201chow you doing?\\u201d notes to build a relationship.\\r\\n\\r\\nPretty sweet \\u2013 AND effective.\\r\\n\\r\\nCLICK HERE http://www.talkwithwebvisitor.com to discover what Talk With Web Visitor can do for your business.\\r\\n\\r\\nYou could be converting up to 100X more leads today!\\r\\n\\r\\nEric\\r\\nPS: Talk With Web Visitor offers a FREE 14 days trial \\u2013 and it even includes International Long Distance Calling. \\r\\nYou have customers waiting to talk with you right now\\u2026 don\\u2019t keep them waiting. \\r\\nCLICK HERE http://www.talkwithwebvisitor.com to try Talk With Web Visitor now.\\r\\n\\r\\nIf you\'d like to unsubscribe click here http://talkwithwebvisitor.com/unsubscribe.aspx?d=forexvouchers.com\", \"subscribe\": true}','2020-05-18 13:59:39.549858',60),(38,'{\"first-name\": \"Ahmer\", \"last-name\": \"Khan\", \"email\": \"ahmerkhan@live.com\", \"phone\": \"03332639277\", \"message-for-us\": \"test\", \"subscribe\": false}','2020-05-20 22:57:17.747916',60),(39,'{\"first-name\": \"Ahmer\", \"last-name\": \"Khan\", \"email\": \"ahmerkhan@live.com\", \"phone\": \"0\", \"message-for-us\": \"ok\", \"subscribe\": false}','2020-05-20 23:01:00.274149',60);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailimages_image`
--

LOCK TABLES `wagtailimages_image` WRITE;
/*!40000 ALTER TABLE `wagtailimages_image` DISABLE KEYS */;
INSERT INTO `wagtailimages_image` VALUES (1,'ic-markets-logo-1-original.jpg','original_images/ic-markets-logo-1-original.jpg',851,427,'2019-08-15 01:37:59.817239',NULL,NULL,NULL,NULL,1,26910,1,'f8689f4ea241d40e96c6fa4c4e4afb6c55942675'),(2,'synergy-fx.jpg','original_images/synergy-fx.jpg',115,70,'2019-08-15 21:21:49.428593',NULL,NULL,NULL,NULL,1,4541,1,'deed93a0a6ae7ddd19f27113c0fa6c4a12d33bbc'),(3,'ic-markets-logo-1.jpg','original_images/ic-markets-logo-1-original_22ogjS8.jpg',851,427,'2019-08-15 22:19:29.022649',NULL,NULL,NULL,NULL,1,26910,1,'f8689f4ea241d40e96c6fa4c4e4afb6c55942675'),(4,'synergyfx_preview.jpg','original_images/synergyfx_preview.jpg',730,438,'2019-08-16 17:09:16.311114',NULL,NULL,NULL,NULL,1,65242,1,'012ca2e6c1c3fba9404820564097efe3413aface'),(5,'syergyfx_logo.jpeg','original_images/syergyfx_logo.jpeg',267,189,'2019-08-16 17:19:34.041667',NULL,NULL,NULL,NULL,1,3975,1,'541150884890775c4f913eb807dc2d94c1d752a2'),(6,'sybergyfx_logo-3.jpeg','original_images/sybergyfx_logo-3.jpeg',500,122,'2019-08-16 21:16:04.353355',NULL,NULL,NULL,NULL,1,45213,1,'95b5897bc7d3b60b175c8e45ad29f0fd7c8b4326'),(7,'synergy-fx.jpg','original_images/synergy-fx_31OH4S0.jpg',115,70,'2019-08-20 07:04:06.783758',NULL,NULL,NULL,NULL,1,4541,1,'deed93a0a6ae7ddd19f27113c0fa6c4a12d33bbc'),(8,'synergyfx_preview.jpg','original_images/synergyfx_preview_2gYqO9c.jpg',730,438,'2019-08-20 07:04:43.419880',NULL,NULL,NULL,NULL,1,65242,1,'012ca2e6c1c3fba9404820564097efe3413aface'),(9,'images.jpeg','original_images/images.jpeg',229,220,'2019-10-02 10:50:39.730069',NULL,NULL,NULL,NULL,1,6692,1,'d5365015c4e6f9e064b5d93c30972d4e9ac2cdec'),(10,'logo_5a71c5ea8553a.png','original_images/logo_5a71c5ea8553a.png',262,142,'2019-10-04 16:26:46.112614',NULL,NULL,NULL,NULL,1,31748,1,'0763f45e9166f08003949f7ff9db8a137602da47'),(11,'banner-904884_1920.jpg','original_images/banner-904884_1920.jpg',1920,603,'2019-11-20 22:57:23.162274',NULL,NULL,NULL,NULL,1,194405,1,'eef667d1b3ef3e52eff1f4ee1fe5b4bff6159dd6'),(12,'uzmmz1whpoxegubqh5zq.png','original_images/uzmmz1whpoxegubqh5zq.png',1280,640,'2019-11-21 08:01:04.056278',NULL,NULL,NULL,NULL,1,79722,1,'fc0ebf41e419d0e8f3be615f4954a81dc3eee1e7'),(13,'Th8Q9S.jpg','original_images/Th8Q9S.jpg',1200,799,'2019-11-21 09:26:47.013743',598,509,1196,435,1,137936,1,'8e66cd48b06533873149e57f9c570e7418acc8f5'),(14,'synergyfx_preview.jpg','original_images/synergyfx_preview.jpg',730,438,'2019-11-21 09:52:38.943940',NULL,NULL,NULL,NULL,1,65242,1,'012ca2e6c1c3fba9404820564097efe3413aface'),(15,'syergyfx_logo.jpeg','original_images/syergyfx_logo.jpeg',267,189,'2019-11-21 09:54:27.016860',NULL,NULL,NULL,NULL,1,3975,1,'541150884890775c4f913eb807dc2d94c1d752a2'),(16,'logo_5a7342fde026d.png','original_images/logo_5a7342fde026d.png',262,142,'2019-11-21 09:55:34.585093',NULL,NULL,NULL,NULL,1,28056,1,'e38bebdd599316e74eb4b402c7a02e2e66bc9985'),(17,'logo_5a71c5ea8553a.png','original_images/logo_5a71c5ea8553a_TuYnmaj.png',262,142,'2019-11-21 09:56:42.685067',NULL,NULL,NULL,NULL,1,31748,1,'0763f45e9166f08003949f7ff9db8a137602da47'),(18,'IC Markets','original_images/Captura_de_Pantalla_2020-01-28_a_las_23.05.01.png',1306,704,'2020-01-29 02:05:44.281280',NULL,NULL,NULL,NULL,1,447437,1,'f1dc419c3825bc61bf3f23e396cb14420661d5a0');
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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailimages_rendition`
--

LOCK TABLES `wagtailimages_rendition` WRITE;
/*!40000 ALTER TABLE `wagtailimages_rendition` DISABLE KEYS */;
INSERT INTO `wagtailimages_rendition` VALUES (1,'images/ic-markets-logo-1-original.max-165x165.jpg',165,82,'','max-165x165',1),(2,'images/synergy-fx.max-165x165.jpg',115,70,'','max-165x165',2),(3,'images/synergy-fx.width-400.jpg',115,70,'','width-400',2),(4,'images/synergy-fx.width-600.jpg',115,70,'','width-600',2),(5,'images/ic-markets-logo-1-original_22ogjS8.max-165x165.jpg',165,82,'','max-165x165',3),(6,'images/ic-markets-logo-1-original_22ogjS8.width-600.jpg',600,301,'','width-600',3),(7,'images/ic-markets-logo-1-original_22ogjS8.width-450.jpg',450,225,'','width-450',3),(8,'images/ic-markets-logo-1-original_22ogjS8.width-250.jpg',250,125,'','width-250',3),(9,'images/ic-markets-logo-1-original_22ogjS8.width-300.jpg',300,150,'','width-300',3),(10,'images/synergyfx_preview.max-165x165.jpg',165,99,'','max-165x165',4),(11,'images/synergyfx_preview.width-400.jpg',400,240,'','width-400',4),(12,'images/synergy-fx.max-220x136.jpg',115,70,'','max-220x136',2),(13,'images/synergyfx_preview.max-380x236.jpg',380,228,'','max-380x236',4),(14,'images/syergyfx_logo.max-165x165.jpg',165,116,'','max-165x165',5),(15,'images/syergyfx_logo.max-220x136.jpg',192,136,'','max-220x136',5),(16,'images/syergyfx_logo.max-112x70.jpg',98,70,'','max-112x70',5),(17,'images/synergyfx_preview.max-285x177.jpg',285,171,'','max-285x177',4),(18,'images/synergyfx_preview.max-258x160.jpg',258,154,'','max-258x160',4),(19,'images/sybergyfx_logo-3.max-165x165.jpg',165,40,'','max-165x165',6),(20,'images/sybergyfx_logo-3.max-220x136.jpg',220,53,'','max-220x136',6),(21,'images/sybergyfx_logo-3.max-112x70.jpg',112,27,'','max-112x70',6),(22,'images/ic-markets-logo-1-original_22ogjS8.max-112x70.jpg',112,56,'','max-112x70',3),(23,'images/synergy-fx_31OH4S0.max-165x165.jpg',115,70,'','max-165x165',7),(24,'images/synergyfx_preview_2gYqO9c.max-165x165.jpg',165,99,'','max-165x165',8),(25,'images/synergy-fx_31OH4S0.max-220x136.jpg',115,70,'','max-220x136',7),(26,'images/synergyfx_preview_2gYqO9c.max-258x160.jpg',258,154,'','max-258x160',8),(27,'images/synergy-fx_31OH4S0.max-112x70.jpg',112,68,'','max-112x70',7),(28,'images/synergyfx_preview_2gYqO9c.max-800x600.jpg',730,438,'','max-800x600',8),(29,'images/synergyfx_preview_2gYqO9c.width-800.jpg',730,438,'','width-800',8),(30,'images/images.max-165x165.jpg',165,158,'','max-165x165',9),(31,'images/images.height-100.jpg',104,100,'','height-100',9),(32,'images/images.max-220x136.jpg',141,136,'','max-220x136',9),(33,'images/logo_5a71c5ea8553a.max-165x165.png',165,89,'','max-165x165',10),(34,'images/logo_5a71c5ea8553a.2e16d0ba.min-165x98.fill-165x98.png',165,98,'2e16d0ba','min-165x98|fill-165x98',10),(35,'images/logo_5a71c5ea8553a.max-800x600.png',262,142,'','max-800x600',10),(36,'images/logo_5a71c5ea8553a.width-800.png',262,142,'','width-800',10),(37,'images/logo_5a71c5ea8553a.height-100.png',184,100,'','height-100',10),(38,'images/images.height-15.jpg',15,15,'','height-15',9),(39,'images/images.height-80.jpg',83,80,'','height-80',9),(40,'images/banner-904884_1920.max-165x165.jpg',165,51,'','max-165x165',11),(41,'images/banner-904884_1920.width-1024.jpg',1024,321,'','width-1024',11),(42,'images/images.2e16d0ba.min-165x98.fill-165x98.jpg',165,98,'2e16d0ba','min-165x98|fill-165x98',9),(43,'images/uzmmz1whpoxegubqh5zq.max-165x165.png',165,82,'','max-165x165',12),(44,'images/Th8Q9S.max-165x165.jpg',165,109,'','max-165x165',13),(45,'images/Th8Q9S.width-1024.jpg',1024,681,'','width-1024',13),(46,'images/Th8Q9S.original.jpg',1200,799,'','original',13),(47,'images/Th8Q9S.max-800x600.jpg',800,532,'','max-800x600',13),(48,'images/synergyfx_preview.max-165x165.jpg',165,99,'','max-165x165',14),(49,'images/syergyfx_logo.max-165x165.jpg',165,116,'','max-165x165',15),(50,'images/logo_5a7342fde026d.max-165x165.png',165,89,'','max-165x165',16),(51,'images/logo_5a71c5ea8553a_TuYnmaj.max-165x165.png',165,89,'','max-165x165',17),(52,'images/syergyfx_logo.height-100.jpg',141,100,'','height-100',15),(53,'images/logo_5a7342fde026d.height-100.png',184,100,'','height-100',16),(54,'images/syergyfx_logo.max-220x136.jpg',192,136,'','max-220x136',15),(55,'images/synergyfx_preview.max-400x249.jpg',400,240,'','max-400x249',4),(56,'images/images.max-60x37.jpg',38,37,'','max-60x37',9),(57,'images/logo_5a71c5ea8553a_TuYnmaj.height-100.png',184,100,'','height-100',17),(58,'images/logo_5a71c5ea8553a.height-15.png',27,15,'','height-15',10),(59,'images/logo_5a71c5ea8553a.height-80.png',147,80,'','height-80',10),(60,'images/logo_5a7342fde026d.max-60x37.png',60,32,'','max-60x37',16),(61,'images/syergyfx_logo.max-60x37.jpg',52,37,'','max-60x37',15),(62,'images/logo_5a7342fde026d.max-220x136.png',220,119,'','max-220x136',16),(63,'images/syergyfx_logo.max-400x249.jpg',267,189,'','max-400x249',15),(64,'images/synergyfx_preview.max-400x249_MpUksHp.jpg',400,240,'','max-400x249',14),(65,'images/logo_5a7342fde026d.2e16d0ba.min-165x98.fill-165x98.png',165,98,'2e16d0ba','min-165x98|fill-165x98',16),(66,'images/logo_5a71c5ea8553a.max-220x136.png',220,119,'','max-220x136',10),(67,'images/Th8Q9S.max-400x249.jpg',373,249,'','max-400x249',13),(68,'images/logo_5a71c5ea8553a_TuYnm.2e16d0ba.min-165x98.fill-165x98.png',165,98,'2e16d0ba','min-165x98|fill-165x98',17),(69,'images/logo_5a71c5ea8553a.width-100.png',100,54,'','width-100',10),(70,'images/images.width-15.jpg',15,14,'','width-15',9),(71,'images/images.width-80.jpg',80,76,'','width-80',9),(72,'images/logo_5a7342fde026d.width-100.png',100,54,'','width-100',16),(73,'images/logo_5a71c5ea8553a_TuYnmaj.width-100.png',100,54,'','width-100',17),(74,'images/logo_5a71c5ea8553a.width-15.png',15,8,'','width-15',10),(75,'images/logo_5a71c5ea8553a.width-80.png',80,43,'','width-80',10),(76,'images/logo_5a71c5ea8553a.max-60x37.png',60,32,'','max-60x37',10),(77,'images/images.width-100.jpg',100,96,'','width-100',9),(78,'images/syergyfx_logo.width-100.jpg',100,70,'','width-100',15),(79,'images/Captura_de_Pantalla_2020-01-28_a_las_23.05.0.max-165x165.png',165,88,'','max-165x165',18),(80,'images/Captura_de_Pantalla_2020-01-28_a_las_23.05.0.max-400x249.png',400,215,'','max-400x249',18),(81,'images/syergyfx_logo.max-112x70.jpg',98,70,'','max-112x70',15),(82,'images/logo_5a7342fde026d.max-112x70.png',112,60,'','max-112x70',16),(83,'images/images.max-112x70.jpg',72,70,'','max-112x70',9),(84,'images/syergyfx_logo.width-45.jpg',45,31,'','width-45',15),(85,'images/logo_5a7342fde026d.width-45.png',45,24,'','width-45',16),(86,'images/images.width-45.jpg',45,43,'','width-45',9),(87,'images/logo_5a7342fde026d.width-15.png',15,8,'','width-15',16),(88,'images/logo_5a7342fde026d.width-80.png',80,43,'','width-80',16),(89,'images/logo_5a7342fde026d.width-120.png',120,65,'','width-120',16),(90,'images/logo_5a71c5ea8553a.width-45.png',45,24,'','width-45',10),(91,'images/images.width-120.jpg',120,115,'','width-120',9),(92,'images/logo_5a71c5ea8553a_TuYnmaj.width-45.png',45,24,'','width-45',17),(93,'images/syergyfx_logo.width-15.jpg',15,10,'','width-15',15),(94,'images/syergyfx_logo.width-80.jpg',80,56,'','width-80',15),(95,'images/syergyfx_logo.width-120.jpg',120,84,'','width-120',15),(96,'images/images.max-56x35.jpg',36,35,'','max-56x35',9),(97,'images/logo_5a7342fde026d.max-56x35.png',56,30,'','max-56x35',16),(98,'images/syergyfx_logo.max-56x35.jpg',49,35,'','max-56x35',15);
/*!40000 ALTER TABLE `wagtailimages_rendition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailimages_uploadedimage`
--

DROP TABLE IF EXISTS `wagtailimages_uploadedimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailimages_uploadedimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploaded_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailimages_upload_uploaded_by_user_id_85921689_fk_auth_user` (`uploaded_by_user_id`),
  CONSTRAINT `wagtailimages_upload_uploaded_by_user_id_85921689_fk_auth_user` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailimages_uploadedimage`
--

LOCK TABLES `wagtailimages_uploadedimage` WRITE;
/*!40000 ALTER TABLE `wagtailimages_uploadedimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailimages_uploadedimage` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailredirects_redirect`
--

LOCK TABLES `wagtailredirects_redirect` WRITE;
/*!40000 ALTER TABLE `wagtailredirects_redirect` DISABLE KEYS */;
INSERT INTO `wagtailredirects_redirect` VALUES (1,'/',1,'',24,4);
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
-- Table structure for table `wagtailtrans_language`
--

DROP TABLE IF EXISTS `wagtailtrans_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailtrans_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  `live` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailtrans_language`
--

LOCK TABLES `wagtailtrans_language` WRITE;
/*!40000 ALTER TABLE `wagtailtrans_language` DISABLE KEYS */;
INSERT INTO `wagtailtrans_language` VALUES (1,'en',1,0,1),(2,'es',0,1,1),(3,'fr',0,0,1);
/*!40000 ALTER TABLE `wagtailtrans_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailtrans_sitelanguages`
--

DROP TABLE IF EXISTS `wagtailtrans_sitelanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailtrans_sitelanguages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_language_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`),
  KEY `wagtailtrans_sitelan_default_language_id_b3e6e363_fk_wagtailtr` (`default_language_id`),
  CONSTRAINT `wagtailtrans_sitelan_default_language_id_b3e6e363_fk_wagtailtr` FOREIGN KEY (`default_language_id`) REFERENCES `wagtailtrans_language` (`id`),
  CONSTRAINT `wagtailtrans_sitelan_site_id_748cc4e4_fk_wagtailco` FOREIGN KEY (`site_id`) REFERENCES `wagtailcore_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailtrans_sitelanguages`
--

LOCK TABLES `wagtailtrans_sitelanguages` WRITE;
/*!40000 ALTER TABLE `wagtailtrans_sitelanguages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailtrans_sitelanguages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailtrans_sitelanguages_other_languages`
--

DROP TABLE IF EXISTS `wagtailtrans_sitelanguages_other_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailtrans_sitelanguages_other_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sitelanguages_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailtrans_sitelanguag_sitelanguages_id_languag_f1a3bdcb_uniq` (`sitelanguages_id`,`language_id`),
  KEY `wagtailtrans_sitelan_language_id_6818442b_fk_wagtailtr` (`language_id`),
  CONSTRAINT `wagtailtrans_sitelan_language_id_6818442b_fk_wagtailtr` FOREIGN KEY (`language_id`) REFERENCES `wagtailtrans_language` (`id`),
  CONSTRAINT `wagtailtrans_sitelan_sitelanguages_id_8f9803ea_fk_wagtailtr` FOREIGN KEY (`sitelanguages_id`) REFERENCES `wagtailtrans_sitelanguages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailtrans_sitelanguages_other_languages`
--

LOCK TABLES `wagtailtrans_sitelanguages_other_languages` WRITE;
/*!40000 ALTER TABLE `wagtailtrans_sitelanguages_other_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailtrans_sitelanguages_other_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailtrans_translatablepage`
--

DROP TABLE IF EXISTS `wagtailtrans_translatablepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailtrans_translatablepage` (
  `translatable_page_ptr_id` int(11) NOT NULL,
  `canonical_page_id` int(11) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`translatable_page_ptr_id`),
  KEY `wagtailtrans_transla_canonical_page_id_cb26ce68_fk_wagtailtr` (`canonical_page_id`),
  KEY `wagtailtrans_transla_language_id_f3191076_fk_wagtailtr` (`language_id`),
  CONSTRAINT `wagtailtrans_transla_canonical_page_id_cb26ce68_fk_wagtailtr` FOREIGN KEY (`canonical_page_id`) REFERENCES `wagtailtrans_translatablepage` (`translatable_page_ptr_id`),
  CONSTRAINT `wagtailtrans_transla_language_id_f3191076_fk_wagtailtr` FOREIGN KEY (`language_id`) REFERENCES `wagtailtrans_language` (`id`),
  CONSTRAINT `wagtailtrans_transla_translatable_page_pt_ffa53720_fk_wagtailco` FOREIGN KEY (`translatable_page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailtrans_translatablepage`
--

LOCK TABLES `wagtailtrans_translatablepage` WRITE;
/*!40000 ALTER TABLE `wagtailtrans_translatablepage` DISABLE KEYS */;
INSERT INTO `wagtailtrans_translatablepage` VALUES (1,NULL,1),(24,NULL,1),(25,24,3),(26,24,2),(48,NULL,1),(49,48,3),(50,48,2),(51,NULL,1),(52,51,3),(53,51,2),(54,NULL,1),(55,54,3),(56,54,2);
/*!40000 ALTER TABLE `wagtailtrans_translatablepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailtrans_translatablesiterootpage`
--

DROP TABLE IF EXISTS `wagtailtrans_translatablesiterootpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailtrans_translatablesiterootpage` (
  `page_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `wagtailtrans_transla_page_ptr_id_ba7960bb_fk_wagtailco` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailtrans_translatablesiterootpage`
--

LOCK TABLES `wagtailtrans_translatablesiterootpage` WRITE;
/*!40000 ALTER TABLE `wagtailtrans_translatablesiterootpage` DISABLE KEYS */;
INSERT INTO `wagtailtrans_translatablesiterootpage` VALUES (16);
/*!40000 ALTER TABLE `wagtailtrans_translatablesiterootpage` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailusers_userprofile`
--

LOCK TABLES `wagtailusers_userprofile` WRITE;
/*!40000 ALTER TABLE `wagtailusers_userprofile` DISABLE KEYS */;
INSERT INTO `wagtailusers_userprofile` VALUES (1,1,1,1,1,'','','');
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

-- Dump completed on 2020-07-10 21:06:46
