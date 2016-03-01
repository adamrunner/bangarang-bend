-- MySQL dump 10.13  Distrib 5.6.28, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bangarang-bend_development
-- ------------------------------------------------------
-- Server version	5.6.28-0ubuntu0.15.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'bryanrunner@gmail.com','$2a$10$vvMFNcOGrgAFWRrxgtl9b.I3q0UFG0sgi4Yd3IlzPm9s5sVT/7upW',NULL,NULL,NULL,8,'2016-03-01 18:01:56','2016-02-29 17:30:18','127.0.0.1','127.0.0.1','2016-02-23 19:35:34','2016-03-01 18:01:56'),(2,'adamrunner@gmail.com','$2a$10$5uZo0paQdrHcA9XqENTgrube05jFRzYWVVWmmGUVlcggqLILplkhm',NULL,NULL,NULL,1,'2016-02-24 01:42:45','2016-02-24 01:42:45','24.22.93.229','24.22.93.229','2016-02-23 19:35:34','2016-02-24 01:42:45');
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
INSERT INTO `biography_items` VALUES (1,1,'Chef Dave Bodi','Chef Dave Bodi is a 4.0 graduate of Le Cordon Bleu, Portland, OR, was the owner/operator of Black Dog Baking Co. and went on to be the Executive Chef for Oregon Bride Magazine’s 2015 Caterer of the Year , statewide. He has customized hundreds of menus in all different styles and cultures of cooking and enjoys taking part in charitable community actions.','/images/headshot_02.jpg','2016-02-23 19:35:37','2016-02-25 20:32:15','rambo_b.jpg'),(2,1,'Amy Bodi','Amy Bodi is a graduate from Oregon State University with a degree in Merchandising and Interior Design. With over fifteen years in customer service, building and maintaining relationships is at the forefront of every interaction. Event coordination from logistics to décor is available with any booking.','/images/headshot_01.jpg','2016-02-23 19:35:37','2016-02-25 20:12:06','headshot_01.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catering_menus`
--

LOCK TABLES `catering_menus` WRITE;
/*!40000 ALTER TABLE `catering_menus` DISABLE KEYS */;
INSERT INTO `catering_menus` VALUES (1,3,'Default Menu','Lorem ipsum dolor sit amet, an odio reque dicat duo, vis ea impedit delicatissimi. No nec laoreet argumentum. Viris euripidis usu ea, consul cetero voluptaria cum et. Legere meliore ad sed.','2016-02-23 19:35:37','2016-02-29 23:14:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_items`
--

LOCK TABLES `event_items` WRITE;
/*!40000 ALTER TABLE `event_items` DISABLE KEYS */;
INSERT INTO `event_items` VALUES (1,4,'June',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(2,4,'July',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(3,4,'August',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(4,4,'September',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35');
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
INSERT INTO `event_items_produce_items` VALUES (1,2),(1,3),(1,4),(1,5),(1,8),(1,9),(1,10),(1,11),(3,36),(3,37),(3,38),(3,15),(3,16),(3,17),(3,3),(3,39),(3,19),(3,20),(3,4),(3,40),(3,5),(3,41),(3,22),(3,25),(3,23),(3,24),(3,8),(3,42),(3,43),(3,44),(3,28),(3,30),(3,45),(3,46),(3,9),(3,47),(3,48),(3,10),(3,49),(3,12),(3,33),(3,34),(3,32),(4,36),(4,50),(4,17),(4,3),(4,51),(4,19),(4,20),(4,4),(4,40),(4,41),(4,22),(4,23),(4,52),(4,53),(4,54),(4,8),(4,55),(4,42),(4,44),(4,30),(4,45),(4,28),(4,56),(4,48),(4,46),(4,10),(4,47),(4,34),(4,32),(1,14),(1,22),(1,56),(1,26),(2,9),(2,11),(2,14),(2,15),(2,23),(2,40),(2,41),(2,1),(1,33),(1,38),(1,39),(1,29),(1,55),(2,33),(2,34),(2,35);
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_produce_items`
--

LOCK TABLES `event_produce_items` WRITE;
/*!40000 ALTER TABLE `event_produce_items` DISABLE KEYS */;
INSERT INTO `event_produce_items` VALUES (1,4,'asparagus',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(2,4,'boysenberries',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(3,4,'broccoli',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(4,4,'cauliflower',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(5,4,'cherries',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(6,4,'gooseberries',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(7,4,'hazelnuts',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(8,4,'kohlrabi',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(9,4,'radish',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(10,4,'raspberries',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(11,4,'rhubarb',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(12,4,'strawberries',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(13,4,'summer squash',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(14,4,'apricots',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(15,4,'beans',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(16,4,'beets',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(17,4,'blackberries',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(18,4,'blueberries',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(19,4,'cabbage',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(20,4,'carrots',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(21,4,'celery',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(22,4,'cucumber',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(23,4,'eggplant',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(24,4,'figs',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(25,4,'green beans',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(26,4,'melon',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(27,4,'nectarine',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(28,4,'peaches',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(29,4,'parsnip',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(30,4,'peas',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(32,4,'rutabaga',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(33,4,'tomatoes',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(34,4,'turnips',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(35,4,'zucchini blossoms',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(36,4,'apples',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(37,4,'apricot',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(38,4,'Asian pear',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(39,4,'brusselsprouts',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(40,4,'celery root',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(41,4,'corn',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(42,4,'melons',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(43,4,'nectarines',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(44,4,'parsnips',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(45,4,'peppers',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(46,4,'potatoes',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(47,4,'squash',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(48,4,'plums',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(49,4,'sorrel',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(50,4,'artichokes',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(51,4,'brussels',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(52,4,'grapes',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(53,4,'greenbeans',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(54,4,'kiwi',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(55,4,'leek',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35'),(56,4,'pears',NULL,'2016-02-23 19:35:35','2016-02-23 19:35:35');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_items`
--

LOCK TABLES `featured_items` WRITE;
/*!40000 ALTER TABLE `featured_items` DISABLE KEYS */;
INSERT INTO `featured_items` VALUES (1,1,'Brides and Grooms­-To-­Be','Book your catering with us by March 15th and we will waive ALL gratuities! Call to set up your tasting.',NULL,'2016-02-23 19:35:34','2016-02-25 20:11:25','featured_01.jpg'),(2,1,'Oregon Black Truffles in season','We are working with a few purveyors in the valley who take on the laborious task of collecting these beauties. We will be rocking Gougeres and Truffle butter for the next two months!',NULL,'2016-02-23 19:35:35','2016-02-25 20:11:33','featured_02.jpg'),(3,1,'Stay tuned for the winning couple from the CO Bridal Show','Their bridal party will be sipping on bold Napa Valley reds and tasting French cheese while cooking with Chef Dave. What do the groomsmen get out of the deal? Beer and butchery! Need we say more?',NULL,'2016-02-23 19:35:35','2016-02-25 20:11:40','featured_03.jpg'),(6,1,'testing it out','sdsdsdsds',NULL,'2016-02-25 20:06:26','2016-02-25 21:31:40','contact.jpg'),(7,1,'Rambo','Rambo is pretty awesome.',NULL,'2016-02-25 20:31:33','2016-02-25 20:31:33','rambo_a.jpg'),(8,1,'imageless test','testing out not having an image uploaded for this featured item to see if it breaks or still works. ',NULL,'2016-02-26 18:23:07','2016-02-26 18:23:07',NULL),(9,1,'Lorem ipsum','Lorem ipsum dolor sit amet, tellus mattis. A neque, auctor purus bibendum. Ipsum pharetra. Doloribus vel odio, amet nulla. Molestie ut do. Accumsan risus, diam diam sed, a neque felis. Ac dui, dictum tellus ipsum, fermentum ac. Nam in, sed et vestibulum.',NULL,'2016-02-27 07:30:00','2016-02-29 17:31:41','cooking-1013455_1920.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'French Tart','winter mushroom, shallot, garlic confit, Parmesan Reggiano, bacon lardons','8',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(2,1,'Pastry','pancetta leek scone, Queensland pumpkin spice muffins, black currant brioche rolls','8',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(3,2,'Muhammara','roasted red beet, challah toast points, caramelized veg','3',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(4,2,'Chicken Pate','roasted, fine herbs, micros, brioche round','3',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(5,2,'Charcuterie','country pate, pickle, beer mustard, duck prosciutto, sopressata','5',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(6,2,'Quail Egg','brioche, pancetta, micro arugula','3',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(7,2,'Cheese','Willamette Valley pinot crush gouda, Mt. Tam, chevre, manchego','4',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(8,2,'Bread Service','parmesan Reggiano gougeres, Brazilian cheese bread, challah, black truffle butter','3',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(9,2,'Andouille Soup','wheat berry, Queensland squash, sage, maple','cup..4 bowl..6',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(10,2,'Beer Cheese Soup','Dead Guy Ale, Tillamook vintage white cheddar, shallot','cup..4 bowl..6',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(11,2,'Country Bread Bowl Addition','','2',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(12,3,'Citrus','mache, frisee, blood orange, prosciutto, pomegranate, fennel, yuzu kaffir vinaigrette','side..4 entrée..9',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(13,3,'Bibb','wheat berry, roasted root veggies, pine nut, herbs, anchovy dressing','side..3 entrée..8',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(14,4,'Pot Roast','pulled chuck, carrot and turnip slaw, beer mustard, rustique roll','13',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(15,4,'Grilled Muhammara','rye, pomegranate molasses, sauerkraut, roasted beets, emmantaur','11','V','2016-02-23 19:35:37','2016-02-23 19:35:37'),(16,4,'Turkey Meatball Roll','country roll, pork shoulder, red chermoula, mozzarella','13',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(17,4,'Kogi','marinated flank, kaffir lime, garlic, mirin, daikon slaw, sticky rice','14',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(18,4,'Agnolotti','butternut squash , brown butter, roasted fennel, herbs','16','V','2016-02-23 19:35:37','2016-02-23 19:35:37'),(19,4,'Oxtail','braised, bolognese, pappardelle, romano','13',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(20,4,'Fideo','(toasted cut vermicelli), preserved lemon, coconut milk, ras el hanout','12','V','2016-02-23 19:35:37','2016-02-23 19:35:37'),(21,4,'Moussaka','grass fed beef, parsnip, fried russet, romano bechamel, red sauce, tarragon','11',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(22,4,'Pan Roasted Chicken','linguica, charred lime, garlic, thyme, poached brown butter fingerlings','23',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(23,4,'Braised Pork Belly','wheat-berries, tart apple, red cabbage','19',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(24,4,'Tri Tip Roast','grass fed , espresso rub, mocha stout demi, caramelized root veggies, mash','25',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(25,4,'Butter Chicken','garam masala, ginger, chilies, cardamom, naan, rice','13',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(26,4,'Turkey Meatball','pork shoulder, red chermoula, black rice','14',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(27,4,'Spaghetti Squash','baby kale pesto, chanterelles, roasted golden beets, garlic confit','13','V','2016-02-23 19:35:37','2016-02-23 19:35:37'),(28,5,'Apple Crisp','hard cider, salted caramel','7',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(29,5,'Tiramisu','espresso, ladyfingers, mascarpone','8',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(30,5,'Pudding Cake','Medjool date, sticky toffee','7',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(31,5,'Cookies','chewy oatmeal, kitchen sink, gingersnap','4',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(32,6,'Pellegrino','sparkling, blood orange, pomegranate','2',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(33,6,'Tea','seasonal','2',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(34,6,'Fair Trade Coffee',NULL,'2',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_sections`
--

LOCK TABLES `menu_sections` WRITE;
/*!40000 ALTER TABLE `menu_sections` DISABLE KEYS */;
INSERT INTO `menu_sections` VALUES (1,1,'fuel',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(2,1,'primers',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(3,1,'harvest',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(4,1,'bounty',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(5,1,'rewards',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37'),(6,1,'nectar',NULL,'2016-02-23 19:35:37','2016-02-23 19:35:37');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'home','home','Create, Update, and Delete Featured Items on the Homepage. Also update your Biographies.','2016-02-23 19:35:34','2016-02-23 19:35:34'),(2,'services','services','Create, Update, and Delete items from your Services Offered list.','2016-02-23 19:35:34','2016-02-23 19:35:34'),(3,'catering_menus','catering menus','Create, Update and Delete whole entire Catering Menus, as well as their sections and menu items.','2016-02-23 19:35:34','2016-02-23 19:35:34'),(4,'events','personalized events','Manage which local produce will be available during each month. Also Create, Update and Delete items from your produce list. ','2016-02-23 19:35:34','2016-02-23 19:35:34'),(5,'philosophy','philosophy','Changed your way of thinking? Let your users know! Create, Update and Delete your philosophies here.','2016-02-23 19:35:34','2016-02-23 19:35:34');
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
INSERT INTO `philosophy_items` VALUES (1,5,'Seasonality','Our menu is 100% based on seasonally available and organic ingredients and is changing constantly.  If you care about where your food comes from, we may be the caterer for you.','2016-02-23 19:35:37','2016-02-23 19:35:37'),(2,5,'Benefits','When we shop, cook, and eat seasonally we do a number of great things. First, we support our local farms and ranches who bring food  to our tables.  Second, we ensure we are getting products at the best version of themselves and simultaneously at their best values.  We keep a perfect Oregon strawberry exactly where it belongs; signifying the beginning of summer, where it makes the biggest impact on our minds and palates. In the dead of winter, we would serve a perfect pomegranate or quince instead.','2016-02-23 19:35:37','2016-02-23 19:35:37'),(3,5,'Low Impact','Sustainability in a time of enlightenment should be important to us all. At BANGARANG we strive to utilize whole products while composting the unusable portions. We purchase from low impact purveyors and recycle everything possible. In doing this, we have adopted a “no disposables” policy. We have seen firsthand the exorbitant amount of waste that takes place in the restaurant industry and this is an area we can all make an impact in while helping to keep our beautiful Central Oregon the place we have come to love.','2016-02-23 19:35:37','2016-02-23 19:35:37'),(4,5,'Experience','Experience has taught us that certain foods adapt well to catered events while others do not. We center our menu around foods that hold presentation and flavors well. We strive to put forth entrees that will be as delicious at your event as they were the day of your tasting.','2016-02-23 19:35:37','2016-02-23 19:35:37');
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
INSERT INTO `schema_migrations` VALUES ('20160106190709'),('20160106191910'),('20160106192919'),('20160108041516'),('20160203180537'),('20160205185503'),('20160205185800'),('20160205185806'),('20160205185923'),('20160205185934'),('20160205190227'),('20160205190252'),('20160205190304'),('20160205205336'),('20160209181900'),('20160209182115'),('20160209182615'),('20160209182942'),('20160209184322'),('20160209190946'),('20160209192437'),('20160224210328'),('20160224230227'),('20160225185711');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_items`
--

LOCK TABLES `service_items` WRITE;
/*!40000 ALTER TABLE `service_items` DISABLE KEYS */;
INSERT INTO `service_items` VALUES (1,2,'pick up or drop off','Stop by at your convenience or let us deliver, assemble, and clean up your buffet when your event is finished','2016-02-23 19:35:34','2016-02-23 19:35:34'),(2,2,'buffet','We will assemble and staff your buffet keeping it looking fresh until you event is over','2016-02-23 19:35:34','2016-02-23 19:35:34'),(3,2,'family style','Let our servers deliver your spread to your guest tables in a family style dining format','2016-02-23 19:35:34','2016-02-23 19:35:34'),(4,2,'butlered','We will hand pass any number of your hor dourves throughout your party as your guests mingle','2016-02-23 19:35:34','2016-02-23 19:35:34'),(5,2,'plated service','This is our premiere restaurant style service where we will serve each one of your guests’ entrees at their table','2016-02-23 19:35:34','2016-02-23 19:35:34');
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

-- Dump completed on 2016-03-01 10:32:22
