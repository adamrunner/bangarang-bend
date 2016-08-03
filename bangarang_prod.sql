-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bangarang-bend_production
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_users_on_email` (`email`),
  UNIQUE KEY `index_admin_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'bryanrunner@gmail.com','$2a$10$EtY6BzkAgmtkRS87xaJYcOHXPGWC9SgA0VnA2goiRt3syDNOLOQKu',NULL,NULL,NULL,16,'2016-03-21 00:30:07','2016-03-21 00:29:45','50.202.79.90','50.202.79.90','2016-02-23 19:35:34','2016-03-21 00:30:07'),(2,'adamrunner@gmail.com','$2a$10$6jBd6Wt5Hj3q/vB99mRGdeI07r./jikPrDzaHu2KP0WPxddOt.Ibq',NULL,NULL,NULL,7,'2016-07-01 05:01:33','2016-03-21 00:29:48','2601:1c0:4000:f9:d32:55a9:47f2:c501','50.202.79.90','2016-02-23 19:35:34','2016-07-01 05:01:33'),(3,'dave@bangarangbend.com','$2a$10$X8UcTqHZJG1czajl5CoW/Oe8JtXW6guHiO9s16RuGtokXdgzfYH.G',NULL,NULL,NULL,40,'2016-07-26 14:19:59','2016-07-20 00:11:18','72.35.140.158','2600:100f:b00a:4e29:0:4d:9b5e:1501','2016-03-01 18:45:00','2016-07-26 14:19:59'),(4,'amy@bangarangbend.com','$2a$10$EeImEqWeNXPWCITQseEPT.eY1.c0xyldDht6EjyRPGl9z3K/kREMq',NULL,NULL,NULL,1,'2016-03-01 18:53:24','2016-03-01 18:53:24','50.202.79.90','50.202.79.90','2016-03-01 18:45:05','2016-03-01 18:53:24');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biography_items`
--

DROP TABLE IF EXISTS `biography_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biography_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_biography_items_on_page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biography_items`
--

LOCK TABLES `biography_items` WRITE;
/*!40000 ALTER TABLE `biography_items` DISABLE KEYS */;
INSERT INTO `biography_items` VALUES (1,1,'Chef Dave Bodi','Chef Dave Bodi is a 4.0 graduate of Le Cordon Bleu, Portland, OR, was the owner/operator of Black Dog Baking Co. and went on to be the Executive Chef for Oregon Bride Magazine’s 2015 Caterer of the Year , statewide. He has customized hundreds of menus in all different styles and cultures of cooking and enjoys taking part in charitable community actions.','/images/headshot_02.jpg','2016-02-23 19:35:37','2016-03-02 23:18:48','20140929-Cookoff-Event-795.jpg'),(2,1,'Amy Bodi','Amy Bodi is a graduate from Oregon State University with a degree in Merchandising and Interior Design. With over fifteen years in customer service, building and maintaining relationships is at the forefront of every interaction. Event coordination from logistics to décor is available with any booking.','/images/headshot_01.jpg','2016-02-23 19:35:37','2016-03-09 21:38:47','DSC_0010.JPG');
/*!40000 ALTER TABLE `biography_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catering_menus`
--

DROP TABLE IF EXISTS `catering_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catering_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_catering_menus_on_page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catering_menus`
--

LOCK TABLES `catering_menus` WRITE;
/*!40000 ALTER TABLE `catering_menus` DISABLE KEYS */;
INSERT INTO `catering_menus` VALUES (1,3,'catered fare','Have a work luncheon or in home party? Our menu is seasonally inspired and changes with farmers market availability, so keep an eye out for exiting new dishes! ','2016-02-23 19:35:37','2016-03-16 16:19:49'),(2,3,'food truck','Our mobile restaurant menu changes constantly and is based on seasonally available ingredients and anything that inspires us!','2016-03-07 08:18:14','2016-05-04 13:26:37');
/*!40000 ALTER TABLE `catering_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_items`
--

DROP TABLE IF EXISTS `event_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_event_items_on_page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_items`
--

LOCK TABLES `event_items` WRITE;
/*!40000 ALTER TABLE `event_items` DISABLE KEYS */;
INSERT INTO `event_items` VALUES (1,4,'June',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(2,4,'July',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(3,4,'August',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(4,4,'September',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(5,4,'April','','2016-03-15 05:36:39','2016-03-15 05:36:39'),(6,4,'May','','2016-03-15 05:39:34','2016-03-15 05:39:34'),(7,4,'October','My favorite time of year in the garden.  All of the Summer produce has peaked and Winter squash has begun. Let the braising begin! ','2016-03-15 05:45:05','2016-03-15 05:45:05');
/*!40000 ALTER TABLE `event_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_items_produce_items`
--

DROP TABLE IF EXISTS `event_items_produce_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_items_produce_items` (
  `event_item_id` int(11) DEFAULT NULL,
  `event_produce_item_id` int(11) DEFAULT NULL,
  KEY `index_event_items_produce_items_on_event_item_id` (`event_item_id`),
  KEY `index_event_items_produce_items_on_event_produce_item_id` (`event_produce_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_items_produce_items`
--

LOCK TABLES `event_items_produce_items` WRITE;
/*!40000 ALTER TABLE `event_items_produce_items` DISABLE KEYS */;
INSERT INTO `event_items_produce_items` VALUES (1,2),(1,3),(1,4),(1,5),(1,8),(1,9),(1,10),(1,11),(3,36),(3,37),(3,38),(3,15),(3,16),(3,17),(3,3),(3,39),(3,19),(3,20),(3,4),(3,40),(3,5),(3,41),(3,22),(3,25),(3,23),(3,24),(3,8),(3,42),(3,43),(3,44),(3,28),(3,30),(3,45),(3,46),(3,9),(3,47),(3,48),(3,10),(3,49),(3,12),(3,33),(3,34),(3,32),(4,36),(4,50),(4,17),(4,3),(4,51),(4,19),(4,20),(4,4),(4,40),(4,41),(4,22),(4,23),(4,52),(4,53),(4,54),(4,8),(4,55),(4,42),(4,44),(4,30),(4,45),(4,28),(4,56),(4,48),(4,46),(4,10),(4,47),(4,34),(4,32),(1,14),(1,22),(1,56),(1,26),(2,9),(2,11),(2,14),(2,15),(2,23),(2,40),(2,41),(2,1),(1,33),(1,38),(1,39),(1,29),(1,55),(2,33),(2,34),(2,35),(5,1),(5,7),(5,11),(5,36),(5,56),(6,1),(6,4),(6,7),(6,9),(6,11),(6,12),(6,36),(6,56),(7,3),(7,4),(7,7),(7,8),(7,9),(7,13),(7,19),(7,20),(7,22),(7,23),(7,28),(7,29),(7,32),(7,33),(7,34),(7,36),(7,39),(7,41),(7,42),(7,44),(7,45),(7,46),(7,47),(7,52),(7,56);
/*!40000 ALTER TABLE `event_items_produce_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_produce_items`
--

DROP TABLE IF EXISTS `event_produce_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_produce_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_event_produce_items_on_page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_produce_items`
--

LOCK TABLES `event_produce_items` WRITE;
/*!40000 ALTER TABLE `event_produce_items` DISABLE KEYS */;
INSERT INTO `event_produce_items` VALUES (1,4,'asparagus',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(2,4,'boysenberries',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(3,4,'broccoli',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(4,4,'cauliflower',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(5,4,'cherries',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(6,4,'gooseberries',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(7,4,'hazelnuts',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(8,4,'kohlrabi',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(9,4,'radish',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(10,4,'raspberries',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(11,4,'rhubarb',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(12,4,'strawberries',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(13,4,'summer squash',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(14,4,'apricots',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(15,4,'beans',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(16,4,'beets',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(17,4,'blackberries',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(18,4,'blueberries',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(19,4,'cabbage',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(20,4,'carrots',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(21,4,'celery',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(22,4,'cucumber',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(23,4,'eggplant',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(24,4,'figs',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(25,4,'green beans',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(26,4,'melon',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(27,4,'nectarine',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(28,4,'peaches',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(29,4,'parsnip',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(30,4,'peas',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(32,4,'rutabaga',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(33,4,'tomatoes',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(34,4,'turnips',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(35,4,'zucchini blossoms',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(36,4,'apples',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(37,4,'apricot',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(38,4,'Asian pear',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(39,4,'brusselsprouts',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(40,4,'celery root',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(41,4,'corn',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(42,4,'melons',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(43,4,'nectarines',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(44,4,'parsnips',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(45,4,'peppers',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(46,4,'potatoes',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(47,4,'squash',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(48,4,'plums',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(49,4,'sorrel',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(50,4,'artichokes',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(51,4,'brussels',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(52,4,'grapes',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(53,4,'greenbeans',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(54,4,'kiwi',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(55,4,'leek',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(56,4,'pears',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(57,4,'Seabeans','','2016-07-18 16:12:07','2016-07-18 16:12:07'),(58,4,'Garlic Scapes','','2016-07-18 16:12:31','2016-07-18 16:12:31'),(59,4,'Mustard Greens','','2016-07-18 16:12:47','2016-07-18 16:12:47');
/*!40000 ALTER TABLE `event_produce_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_items`
--

DROP TABLE IF EXISTS `featured_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_featured_items_on_page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_items`
--

LOCK TABLES `featured_items` WRITE;
/*!40000 ALTER TABLE `featured_items` DISABLE KEYS */;
INSERT INTO `featured_items` VALUES (10,1,'NWX Farmers Markets','We will be working with market produce every Saturday at NWX from 10-2. You are what you eat...\"Be Oregon\"!',NULL,'2016-03-02 23:08:35','2016-07-17 00:04:02','sm_truck.jpg'),(18,1,'Book our Mobile Kitchen for your next event!','Let us bring some swank to your next party with a seasonal menu sourced from local farms.\r\nCompany Parties, Birthdays, Business Promotions, Wedding Rehearsals....',NULL,'2016-07-09 21:15:26','2016-07-09 21:18:04','book_truck.jpg'),(19,1,'Summer Flavors','Grilled eggplant, Black Garlic dressing, Nancy\'s yogurt, Mustard Greens',NULL,'2016-07-09 21:21:04','2016-07-09 21:22:15','eggplant.jpg');
/*!40000 ALTER TABLE `featured_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imageable_id` int(11) DEFAULT NULL,
  `imageable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_images_on_imageable_type_and_imageable_id` (`imageable_type`,`imageable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'images/background/background_07.jpg',NULL,'background','2016-02-23 19:35:33','2016-02-23 19:35:33',NULL),(2,'images/background/background_03.jpg',NULL,'background','2016-02-23 19:35:33','2016-02-23 19:35:33',NULL),(3,'images/background/background_05.jpg',NULL,'background','2016-02-23 19:35:33','2016-02-23 19:35:33',NULL),(4,'images/background/background_02.jpg',NULL,'background','2016-02-23 19:35:33','2016-02-23 19:35:33',NULL),(5,'images/background/background_01.jpg',NULL,'background','2016-02-23 19:35:33','2016-02-23 19:35:33',NULL);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landings`
--

DROP TABLE IF EXISTS `landings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_landings_on_page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landings`
--

LOCK TABLES `landings` WRITE;
/*!40000 ALTER TABLE `landings` DISABLE KEYS */;
INSERT INTO `landings` VALUES (1,1,'MOBILE KITCHEN & <br> CATERING SERVICES','scaled_truck_1.jpg','2016-03-02 23:51:46','2016-05-22 20:39:55');
/*!40000 ALTER TABLE `landings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_section_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `choices` text COLLATE utf8_unicode_ci,
  `price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_attr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_menu_items_on_menu_section_id` (`menu_section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'French Tart','Spring mushroom, shallot, garlic confit, Parmesan Reggiano, bacon lardons','8',NULL,'2016-02-23 19:35:37','2016-03-09 00:43:34'),(2,1,'Pastry','pancetta leek scone, Queensland pumpkin spice muffins, chocolate banana bread','8',NULL,'2016-02-23 19:35:37','2016-03-02 22:57:34'),(4,2,'Baked camembert','Wrapped in flaky puff pastry and filled with kumquat marmalade. ','3',NULL,'2016-02-23 19:35:37','2016-03-09 00:46:15'),(5,2,'Charcuterie','country pate, pickle, beer mustard, prosciutto, sopressata, marcona almonds, cracker','7',NULL,'2016-02-23 19:35:37','2016-03-02 22:59:30'),(7,2,'Cheese','Willamette Valley pinot crush gouda, Mt. Tam, Cyprus Grove Humbolt Fog, manchego.','8',NULL,'2016-02-23 19:35:37','2016-03-09 00:48:19'),(8,2,'Bread Service','parmesan Reggiano gougeres, country loaves, black truffle butter','3',NULL,'2016-02-23 19:35:37','2016-03-09 00:49:18'),(9,2,'Andouille Soup','forbidden rice, Queensland squash, sage, maple','cup..4 bowl..6',NULL,'2016-02-23 19:35:37','2016-03-02 23:00:25'),(10,2,'Beer Cheese Soup','Dead Guy Ale, Tillamook vintage white cheddar, shallot','cup..4 bowl..6',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(12,3,'Citrus','mache, frisee, blood orange, prosciutto, pomegranate, fennel, ginger kaffir vinaigrette','side..4 entrée..9',NULL,'2016-02-23 19:35:37','2016-03-15 05:18:21'),(13,3,'Bibb','wheat berry, roasted root veggies, pine nut, herbs, anchovy dressing','side..3 entrée..8',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(14,4,'Pot Roast','pulled chuck, carrot and turnip slaw, beer mustard, rustique roll','13',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(15,4,'Grilled Muhammara','rye, pomegranate molasses, sauerkraut, roasted beets, emmantaur','11','V','2016-02-23 19:35:37','2016-02-23 19:35:37'),(17,4,'Kogi','marinated flank, kaffir lime, garlic, mirin, daikon slaw, sticky rice','14',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(19,4,'Oxtail','braised, bolognese, pappardelle, romano','17',NULL,'2016-02-23 19:35:37','2016-03-09 00:51:30'),(20,4,'Fideo','(toasted cut vermicelli), preserved lemon, coconut milk, ras el hanout','12','V','2016-02-23 19:35:37','2016-02-23 19:35:37'),(21,4,'Moussaka','grass fed beef, parsnip, fried russet, romano bechamel, red sauce, tarragon','11',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(22,4,'Pan Roasted Chicken','linguica, charred lime, garlic, thyme, poached brown butter fingerlings','23',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(23,4,'Braised Pork Belly','Honey pomegranate glaze, creamy polenta, braised red cabbage','19',NULL,'2016-02-23 19:35:37','2016-03-15 05:22:21'),(24,4,'Tri Tip Roast','grass fed , espresso rub, mocha stout demi, caramelized root veggies, mash','23',NULL,'2016-02-23 19:35:37','2016-03-02 23:01:24'),(25,4,'Butter Chicken','garam masala, ginger, chilies, cardamom, naan, rice','13',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(26,4,'Turkey Meatball','pork shoulder, red chermoula, black rice','14',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(27,4,'Spaghetti Squash','baby kale pesto, chanterelles, roasted golden beets, garlic confit','13','V','2016-02-23 19:35:37','2016-02-23 19:35:37'),(28,5,'Apple Crisp','pastry cream, salted caramel','7',NULL,'2016-02-23 19:35:37','2016-03-02 23:02:09'),(29,5,'Tiramisu','espresso, ladyfingers, mascarpone','8',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(30,5,'Pudding Cake','Medjool date, sticky toffee','7',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(31,5,'Cookies','chewy oatmeal, kitchen sink, gingersnap','4',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(32,6,'Pellegrino','sparkling, blood orange, pomegranate','2',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(33,6,'Tea','seasonal','2',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(34,6,'Fair Trade Coffee',NULL,'2',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(44,2,'Medjool dates','Wrapped in crispy bacon,  stuffed with brie and drizzled with balsamic glaze.','3',NULL,'2016-03-15 05:15:55','2016-03-15 05:15:55'),(45,5,'Lemon trifle','Meyer lemon curd, rosemary and telicherry pepper shortbread, meringue.','6',NULL,'2016-03-15 05:25:20','2016-03-15 05:25:20'),(55,2,'Smoked salmon cornets','crème fraiche, red onion, in a crisp savory cornet','6',NULL,'2016-03-22 00:40:11','2016-03-22 00:40:47'),(56,4,'Chicken Adobo','Braised chicken thighs garlic, soy, vinegar, cilantro, cashew, and jasmine rice.','13',NULL,'2016-03-22 00:48:33','2016-03-22 00:48:33'),(65,8,'Risotto','mixed squash, blue oyster mushroom, free range chicken','10/13',NULL,'2016-05-17 21:57:02','2016-07-26 14:20:45'),(70,8,'Grilled Eggplant','Black Garlic aioli, mustard greens, summer squash, Nancy\'s Greek yogurt, Crispy garlic','6/10',NULL,'2016-07-16 23:59:49','2016-07-16 23:59:49'),(71,8,'Heirloom','Tomato, burnt miso dressing, arugula, sea beans, lemon confit, thyme','9',NULL,'2016-07-17 00:01:02','2016-07-17 00:01:17'),(72,8,'Crostada','Sumac infused crust, heirloom marinara, mustard greens pesto, reggiano, tomato dust ','9',NULL,'2016-07-20 00:14:12','2016-07-26 14:21:06'),(73,8,'Chicken & Brioche','Herb roast chicken, lavender thyme bread pudding, jus','12',NULL,'2016-07-26 14:22:25','2016-07-26 14:22:25');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_sections`
--

DROP TABLE IF EXISTS `menu_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catering_menu_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_menu_sections_on_catering_menu_id` (`catering_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_sections`
--

LOCK TABLES `menu_sections` WRITE;
/*!40000 ALTER TABLE `menu_sections` DISABLE KEYS */;
INSERT INTO `menu_sections` VALUES (1,1,'fuel',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(2,1,'Primers ',NULL,'2016-02-23 19:35:37','2016-03-09 00:42:59'),(3,1,'harvest',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(4,1,'bounty',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(5,1,'rewards',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(6,1,'nectar',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(8,2,'Spring',NULL,'2016-03-20 19:19:55','2016-05-04 13:27:14');
/*!40000 ALTER TABLE `menu_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `copy_text` text COLLATE utf8_unicode_ci,
  `show_copy_text` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'home','home','Create, Update, and Delete Featured Items on the Homepage. Also update your Biographies.','2016-02-23 19:35:34','2016-02-23 19:35:34',NULL,0),(2,'services','services','Create, Update, and Delete items from your Services Offered list.','2016-02-23 19:35:34','2016-03-15 23:14:16',NULL,0),(3,'catering_menus','menus','Create, Update and Delete whole entire Catering Menus, as well as their sections and menu items.','2016-02-23 19:35:34','2016-03-15 21:45:09',NULL,0),(4,'events','the farms','Manage which local produce will be available during each month. Also Create, Update and Delete items from your produce list. ','2016-02-23 19:35:34','2016-07-18 22:51:11','We utilize a handful of exceptional farms who are passionate about their organic, sustainable practices and who have committed their lives to setting farm practices right.\r<br/>These farms grow and raise what makes sense for the health of the earth that gives back year after year.\r<br/>We take what they yield and give it continued respect through our culinary techniques.\r<br/>Because of this our menus are constantly adapting to what the land has given us.',1),(5,'philosophy','philosophy','Changed your way of thinking? Let your users know! Create, Update and Delete your philosophies here.','2016-02-23 19:35:34','2016-02-23 19:35:34',NULL,0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `philosophy_items`
--

DROP TABLE IF EXISTS `philosophy_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `philosophy_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_philosophy_items_on_page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `philosophy_items`
--

LOCK TABLES `philosophy_items` WRITE;
/*!40000 ALTER TABLE `philosophy_items` DISABLE KEYS */;
INSERT INTO `philosophy_items` VALUES (1,5,'Micro-seasonality/real ingredients','Our food is sourced from the Northwest with the vast majority coming from Oregon. We work with a diligent and committed group of organic farms who take pride in their practices. Great food always starts at this level. We take what the farms are pulling from the earth on a weekly basis and build our menus around those items. This translates to a perfect taste of the micro-seasons. Many of us have forgotten what food is supposed to taste like or have never had the opportunity to taste real food. This is due to old school farm ethics being compromised causing flavorless abundance driven by the bottom line. We are here to set it right.','2016-02-23 19:35:37','2016-07-18 22:39:17'),(3,5,'Environmentally Conscious ','Sustainability in a time of enlightenment should be important to us all. At BANGARANG we strive to utilize whole products while composting the unusable portions. We purchase from low impact purveyors and recycle everything possible.  Our food truck uses a real china for those dining in and has rejected the use of plastic bottles. For those taking their cuisine with them we offer a highly compostable, renewable disposable made from steam pressed palm leaves and a product created from sugar cane fiber.  Support us in keeping our beautiful Central Oregon the place we have come to love.','2016-02-23 19:35:37','2016-07-18 15:46:26'),(4,5,'Evolution ','We acknowledge the fact that with new science comes new information and with that \"facts\" that were once believed can be turned on their heads. We are committed to the constant pursuit of sustainable evolution. As we absorb new information from our environment we will evaluate and respond to that information by updating our business practices. This is the infinite goal of BANGARANG Haute Cuisine.','2016-02-23 19:35:37','2016-07-18 22:40:40');
/*!40000 ALTER TABLE `philosophy_items` ENABLE KEYS */;
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
INSERT INTO `schema_migrations` VALUES ('20160106190709'),('20160106191910'),('20160106192919'),('20160108041516'),('20160203180537'),('20160205185503'),('20160205185800'),('20160205185806'),('20160205185923'),('20160205185934'),('20160205190227'),('20160205190252'),('20160205190304'),('20160205205336'),('20160209181900'),('20160209182115'),('20160209182615'),('20160209182942'),('20160209184322'),('20160209190946'),('20160209192437'),('20160224210328'),('20160224230227'),('20160225185711'),('20160301231038'),('20160310203243'),('20160311174447'),('20160315220902');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_items`
--

DROP TABLE IF EXISTS `service_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_service_items_on_page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_items`
--

LOCK TABLES `service_items` WRITE;
/*!40000 ALTER TABLE `service_items` DISABLE KEYS */;
INSERT INTO `service_items` VALUES (1,2,'pick up or drop off','Stop by at your convenience or let us deliver, assemble, and clean up your buffet when your event is finished.','2016-02-23 19:35:34','2016-03-09 00:35:00'),(2,2,'Buffet','We will assemble and staff your buffet keeping it looking fresh until you event is over.','2016-02-23 19:35:34','2016-03-09 00:34:50'),(3,2,'family style','Let our wait staff deliver platters to your tables for your guests to share. ','2016-02-23 19:35:34','2016-03-15 05:11:55'),(4,2,'butlered','We will hand pass any number of your hor dourves throughout your party as your guests mingle.','2016-02-23 19:35:34','2016-03-09 00:38:07'),(5,2,'plated service','This is our premiere restaurant style service where we will serve each one of your guests’ entrees at their table.','2016-02-23 19:35:34','2016-03-09 00:38:16'),(6,2,'Food Truck','We will customize a menu based around Central Oregon ingerients and serve your guests out of our full scale mobile kitchen! ','2016-03-07 08:11:26','2016-07-11 14:35:54');
/*!40000 ALTER TABLE `service_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-01 14:10:29
