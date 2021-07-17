-- задание 1  Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице)

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'ea',1),(2,'eos',2),(3,'qui',3),(4,'nemo',4),(5,'deserunt',5),(6,'cupiditate',6),(7,'officia',7),(8,'sunt',8),(9,'enim',9),(10,'dolorem',10),(11,'laudantium',11),(12,'temporibus',12),(13,'aut',13),(14,'molestiae',14),(15,'aut',15),(16,'qui',16),(17,'omnis',17),(18,'pariatur',18),(19,'autem',19),(20,'reprehenderit',20),(21,'voluptatem',21),(22,'corporis',22),(23,'eveniet',23),(24,'est',24),(25,'magnam',25),(26,'autem',26),(27,'sapiente',27),(28,'tenetur',28),(29,'voluptas',29),(30,'veniam',30);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`initiator_user_id` <> `target_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,16,'declined','2015-06-05 22:45:16','1994-07-20 21:58:17'),(1,27,'declined','2017-01-24 05:54:38','1987-07-24 15:52:06'),(1,53,'requested','2009-12-21 16:15:07','1987-01-17 11:28:39'),(2,46,'requested','2010-11-15 07:24:26','2020-12-23 14:58:51'),(4,11,'approved','1986-02-09 16:38:45','2017-07-30 04:17:43'),(5,24,'declined','1987-06-21 04:13:29','1994-04-05 23:41:06'),(6,4,'approved','2012-08-05 12:08:13','2003-12-20 07:03:48'),(6,28,'declined','2001-07-01 15:43:55','1971-01-31 10:49:44'),(6,30,'requested','1995-07-28 20:34:43','2013-06-25 22:03:19'),(7,2,'declined','1992-06-04 03:30:52','1982-08-09 20:26:02'),(7,44,'unfriended','2010-05-23 08:28:16','1984-04-26 04:17:29'),(8,47,'unfriended','1972-11-13 23:48:36','1977-10-06 11:22:32'),(9,57,'declined','1995-05-27 19:12:36','2021-01-07 21:37:30'),(13,29,'declined','1985-08-01 15:44:45','1996-12-29 19:14:06'),(13,33,'unfriended','2018-12-14 10:52:13','1988-02-25 16:29:41'),(15,17,'approved','2010-10-23 18:34:44','1999-07-09 17:56:07'),(15,19,'unfriended','1973-04-22 17:21:36','1982-10-13 14:45:04'),(16,6,'approved','1990-12-12 12:34:51','1989-12-22 06:30:00'),(16,13,'declined','1982-06-09 18:52:54','1970-06-03 03:52:23'),(16,38,'unfriended','1991-09-15 14:10:05','2002-09-19 19:00:29'),(17,5,'declined','1988-05-18 17:04:39','2019-12-05 14:43:33'),(17,40,'requested','2004-03-28 05:59:24','1979-03-29 12:08:17'),(18,34,'requested','2009-09-10 12:56:24','1971-10-23 07:46:23'),(21,1,'unfriended','2020-12-05 19:20:26','1974-01-24 20:50:04'),(21,60,'declined','1977-11-22 07:29:33','1983-12-08 20:32:00'),(22,50,'requested','1980-01-15 18:04:35','1974-09-30 04:07:47'),(25,54,'unfriended','2006-12-23 04:03:17','2002-11-05 20:59:17'),(27,12,'requested','2011-04-12 18:30:41','2000-08-02 03:27:24'),(28,23,'approved','2000-08-11 08:11:11','1985-12-23 00:10:54'),(28,52,'approved','1994-02-17 08:08:20','2005-10-15 21:44:34'),(29,15,'unfriended','1972-05-29 09:19:59','1979-01-02 01:18:23'),(29,36,'unfriended','1993-05-09 13:39:31','1996-06-17 17:46:22'),(33,32,'declined','1981-10-18 13:48:52','2016-04-23 05:10:39'),(33,55,'requested','1978-09-05 02:05:12','1981-09-23 17:16:09'),(33,58,'unfriended','1985-06-21 06:14:48','2003-01-07 21:18:33'),(34,37,'requested','1982-10-01 08:43:57','2002-05-04 07:37:21'),(37,39,'approved','2021-01-26 12:05:17','2005-03-25 08:53:11'),(38,35,'unfriended','1991-12-31 07:37:40','1970-08-26 22:17:12'),(41,42,'approved','1976-06-24 19:05:06','1997-12-10 19:57:31'),(42,31,'approved','1998-04-15 20:09:30','2015-08-30 08:45:16'),(45,10,'declined','2017-03-20 16:41:59','1983-05-24 15:05:34'),(45,18,'requested','2003-02-23 07:19:06','2017-02-13 06:41:16'),(46,49,'unfriended','1999-06-08 04:46:14','1984-10-10 00:09:36'),(47,3,'declined','2004-08-02 17:06:46','1996-03-12 21:46:01'),(49,7,'approved','1973-02-07 04:22:20','1994-01-05 04:50:56'),(49,22,'approved','2020-06-29 17:36:39','2013-09-02 13:14:36'),(52,21,'approved','2011-10-26 01:46:58','1973-02-25 11:59:57'),(54,9,'unfriended','1979-11-22 07:34:49','2000-11-01 07:48:03'),(54,26,'unfriended','1986-03-10 05:20:55','1989-02-27 13:01:58'),(55,25,'unfriended','1980-08-03 12:32:40','1985-08-08 21:26:37'),(55,45,'unfriended','1993-04-09 01:00:14','1984-11-04 15:27:52'),(55,56,'approved','2014-02-03 23:29:30','1987-11-16 07:38:19'),(61,41,'declined','2001-02-21 09:57:05','1992-05-10 05:03:15'),(61,59,'requested','1981-06-12 02:54:39','2017-05-06 14:57:39'),(68,51,'declined','2001-10-13 19:46:10','2016-06-03 15:51:36'),(69,48,'unfriended','2012-11-05 13:19:16','1991-07-21 09:55:10'),(70,20,'requested','1985-08-21 01:13:14','1988-02-12 14:28:42');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`,`media_id`),
  UNIQUE KEY `id` (`id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,'1985-12-15 01:41:36'),(71,1,31,'1994-10-10 12:29:16'),(2,2,2,'1977-10-14 06:10:20'),(72,2,32,'1975-02-25 21:44:03'),(3,3,3,'1990-03-05 17:02:41'),(73,3,33,'1986-02-28 18:42:52'),(4,4,4,'2016-11-08 03:23:50'),(74,4,34,'2012-03-24 17:10:59'),(5,5,5,'2009-07-21 13:28:27'),(75,5,35,'1998-01-21 04:35:54'),(6,6,6,'2020-11-10 11:48:32'),(76,6,36,'2002-06-15 20:32:06'),(7,7,7,'1975-11-13 14:34:41'),(77,7,37,'2010-10-04 19:36:24'),(8,8,8,'1997-05-28 21:27:11'),(78,8,38,'1988-07-12 16:45:53'),(9,9,9,'1995-12-13 04:35:26'),(79,9,39,'2001-04-27 04:11:24'),(10,10,10,'1978-11-07 03:25:29'),(80,10,40,'1976-12-27 00:37:46'),(81,11,1,'1991-10-05 05:37:50'),(11,11,11,'2018-09-30 17:05:06'),(82,12,2,'2005-03-29 02:14:50'),(12,12,12,'2009-12-20 14:40:40'),(83,13,3,'2000-04-30 01:32:33'),(13,13,13,'1977-08-22 20:29:28'),(84,14,4,'1995-08-23 20:18:45'),(14,14,14,'2009-01-18 09:57:24'),(85,15,5,'1984-06-25 08:06:31'),(15,15,15,'1981-06-12 01:54:38'),(86,16,6,'1977-07-05 23:11:22'),(16,16,16,'1981-02-23 06:09:31'),(87,17,7,'1974-08-03 06:42:58'),(17,17,17,'1978-01-20 05:26:17'),(88,18,8,'1994-01-14 03:04:30'),(18,18,18,'2015-03-25 02:56:23'),(89,19,9,'2015-01-27 21:13:13'),(19,19,19,'2005-12-17 04:14:08'),(90,20,10,'1977-04-12 18:32:05'),(20,20,20,'1986-03-07 17:27:27'),(91,21,11,'2009-11-08 21:16:12'),(21,21,21,'2000-07-03 22:41:40'),(92,22,12,'1985-06-15 17:53:58'),(22,22,22,'1979-10-18 01:29:40'),(93,23,13,'1989-05-23 19:01:58'),(23,23,23,'1970-08-23 05:37:45'),(94,24,14,'2000-02-26 04:03:55'),(24,24,24,'1995-07-27 16:23:14'),(95,25,15,'1972-01-13 02:28:58'),(25,25,25,'2003-06-09 16:42:12'),(96,26,16,'2019-11-07 04:19:59'),(26,26,26,'2019-09-08 06:01:09'),(97,27,17,'1980-08-26 03:27:45'),(27,27,27,'2018-07-18 09:13:57'),(98,28,18,'2004-08-23 02:19:08'),(28,28,28,'1977-04-03 06:53:12'),(99,29,19,'1996-04-26 23:58:39'),(29,29,29,'1999-05-02 18:42:23'),(100,30,20,'1995-08-04 19:10:58'),(30,30,30,'1995-07-14 17:42:33'),(31,31,31,'2019-09-30 01:17:59'),(32,32,32,'1994-08-23 01:00:45'),(33,33,33,'1976-01-19 08:52:57'),(34,34,34,'2009-12-31 19:10:03'),(35,35,35,'1997-05-23 08:58:24'),(36,36,36,'2003-04-23 12:44:34'),(37,37,37,'1991-07-19 02:33:34'),(38,38,38,'1972-01-25 20:13:42'),(39,39,39,'2001-06-10 06:00:31'),(40,40,40,'1989-05-03 16:14:48'),(41,41,1,'1991-03-15 23:25:25'),(42,42,2,'2015-03-04 03:47:09'),(43,43,3,'1995-03-30 20:56:19'),(44,44,4,'2009-06-30 14:02:18'),(45,45,5,'2006-07-19 08:40:33'),(46,46,6,'2009-05-10 22:49:28'),(47,47,7,'2019-09-18 06:34:44'),(48,48,8,'2000-03-03 16:36:13'),(49,49,9,'2014-10-04 14:37:46'),(50,50,10,'1982-08-21 07:22:43'),(51,51,11,'2021-06-21 08:12:07'),(52,52,12,'1982-02-26 04:10:23'),(53,53,13,'2011-12-11 02:24:49'),(54,54,14,'1977-03-01 12:05:57'),(55,55,15,'2020-08-30 21:30:16'),(56,56,16,'2013-08-12 10:10:37'),(57,57,17,'2012-11-27 00:20:36'),(58,58,18,'1989-07-16 00:16:17'),(59,59,19,'1991-08-26 09:41:56'),(60,60,20,'1972-01-10 01:01:25'),(61,61,21,'2013-04-11 13:30:12'),(62,62,22,'2005-11-13 02:36:46'),(63,63,23,'1987-09-15 19:33:16'),(64,64,24,'1978-02-20 13:13:41'),(65,65,25,'1996-12-07 03:47:13'),(66,66,26,'1989-04-29 18:01:23'),(67,67,27,'2017-12-09 06:43:15'),(68,68,28,'1977-01-28 14:12:55'),(69,69,29,'1981-02-27 20:04:23'),(70,70,30,'1999-02-17 02:53:42');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Eos nesciunt error facere repellat quisquam rerum. Sed similique voluptatibus ullam deserunt minus dolorem aut. Maiores aut odit itaque sit. Velit ea quia vitae et error iusto ut.','debitis',7320,NULL,'1989-08-15 11:24:34','1998-03-15 13:10:00'),(2,2,2,'Quia voluptas ipsa cumque repudiandae et. Mollitia nam aut omnis qui laboriosam. Mollitia temporibus ea et voluptatem alias qui cumque. Harum eius est voluptatibus consequatur libero dolores earum.','vero',792,NULL,'1984-03-03 16:28:24','2019-08-08 07:33:10'),(3,3,3,'Quam libero odit alias magni ad non. Vel aut eaque possimus corrupti officiis magni. Sit aut nostrum adipisci minus. Dolorem placeat repellat aut fugiat molestiae. Omnis amet et vel harum voluptates ut aut natus.','assumenda',611061110,NULL,'1986-02-15 14:31:09','1995-12-28 01:59:52'),(4,4,4,'Harum et consequuntur corporis et aperiam quisquam dolor. Voluptas ipsum necessitatibus inventore quam. Repellat molestias numquam omnis et in et. Quis et dolore reiciendis blanditiis et.','voluptatem',47560,NULL,'2004-06-21 15:56:08','2010-12-20 16:14:24'),(5,1,5,'Placeat maiores totam excepturi impedit saepe consequatur commodi. Quia sapiente velit id autem dolorem. Est aut totam iusto expedita quidem.','accusantium',74,NULL,'1990-04-06 06:28:57','2008-05-06 16:06:51'),(6,2,6,'Omnis saepe nisi culpa officia eos ratione. Libero dicta deserunt maiores aut. Distinctio tempore qui corporis illo doloremque. Voluptatem sed repellat nihil commodi omnis.','beatae',91,NULL,'1991-03-10 14:33:40','1993-12-23 15:31:50'),(7,3,7,'Rem similique aliquid rerum amet consequatur inventore voluptate. Sapiente aut aliquam at ut voluptatem earum repellendus. Ratione dolorem sit ratione quos quas ut sed.','aut',3,NULL,'1983-09-04 16:50:22','1998-12-12 02:48:31'),(8,4,8,'Odio laborum ut sit autem itaque. Hic rerum at cum eveniet nulla nam a. Alias facilis accusantium deleniti. Fugit iste enim corporis possimus amet consequatur voluptate.','voluptas',62,NULL,'1975-03-05 20:35:25','2018-02-28 21:17:44'),(9,1,9,'Quos eos adipisci quam rerum soluta porro possimus. Assumenda repellat occaecati doloribus perferendis eum maiores est. Hic aspernatur amet possimus magni ipsa sapiente.','aut',41,NULL,'2003-12-05 12:49:53','2016-02-08 17:03:43'),(10,2,10,'Molestias deserunt enim et delectus. Rerum sint quidem dolorem veniam saepe sed. Nobis aperiam minima cupiditate ut. Ut eum ut ex praesentium eveniet culpa est aperiam.','possimus',982680840,NULL,'2012-04-22 23:21:42','1977-03-18 15:08:17'),(11,3,11,'Perspiciatis consequatur est nemo consequuntur. Harum ratione esse numquam dolor accusantium. Maiores ut ratione dolorem sint.','non',12065,NULL,'2020-03-11 14:21:16','2010-12-27 12:08:04'),(12,4,12,'Illum doloribus nihil qui sit. Quas quaerat suscipit asperiores dolore autem. Eveniet repellendus tempora earum voluptatem ullam.','ex',82228,NULL,'1980-09-26 20:29:01','1971-05-23 20:36:13'),(13,1,13,'Sit quod ea quas in sed ipsam consectetur. Veniam enim cupiditate vel quis ut est. Dolores nulla est perspiciatis enim. Magni aut libero sit consequatur aliquam.','voluptas',88,NULL,'2002-02-08 05:00:20','2011-04-19 23:53:10'),(14,2,14,'Rerum et in accusamus voluptatum cumque consectetur unde. Mollitia iste sint sit sed. Aut aut voluptatibus provident voluptatem voluptatum recusandae a corporis. Dicta illum quis vero et accusantium.','officiis',0,NULL,'1997-01-23 10:45:25','2016-08-23 18:38:53'),(15,3,15,'Repudiandae ex corrupti tempore et voluptatibus id. Et aperiam neque quia maiores. Quas qui provident temporibus fugit.','nemo',21,NULL,'1971-07-20 00:18:02','1994-05-27 21:24:17'),(16,4,16,'Aut est ab voluptatum aspernatur aut ab omnis. Maiores magni architecto et quae et fugiat. Molestiae voluptatum dolor asperiores sint qui dolores.','tempore',575,NULL,'1978-04-11 05:08:49','1971-10-19 18:06:34'),(17,1,17,'Est aut dolor non eaque modi quo nihil. Ducimus ex porro ut dolor maxime eos. Corrupti ut voluptatem error fugit vero reprehenderit doloremque. Fugiat est ab cumque officiis doloribus dolores et. Omnis nobis consequatur et sit.','deleniti',6850567,NULL,'2019-09-08 14:46:39','2012-06-21 00:27:17'),(18,2,18,'Id vel nemo deleniti vel soluta omnis et. Aut velit recusandae non reiciendis tempore sequi. Consequatur rerum sit nam fugit.','placeat',869688,NULL,'1985-09-27 00:16:23','2011-10-29 17:18:36'),(19,3,19,'Omnis odio tenetur accusamus est aut et. A ex provident rerum fuga quos. Nesciunt voluptas hic et. Temporibus sit ut earum eum.','iure',51910,NULL,'1984-06-11 21:03:10','1970-07-06 05:29:33'),(20,4,20,'Non molestias amet maxime nobis vel qui nihil. Sit dolorum velit et aliquid. Consectetur est est voluptas quis ut repudiandae delectus.','in',0,NULL,'1997-10-07 03:41:07','1970-12-07 08:06:34'),(21,1,21,'Dignissimos iusto aspernatur in dolore. Placeat esse rerum aut quod odit ex. Est reprehenderit ut ut numquam ut dolor reiciendis voluptatum. Alias distinctio quam necessitatibus veniam. Aut quia quidem suscipit aut ipsa.','ad',68,NULL,'1983-12-09 06:33:47','1981-12-05 13:10:49'),(22,2,22,'Sunt dolores qui cumque omnis rerum dolor aut expedita. Vitae dolore dolorem odit. Ut eveniet similique autem veritatis illo. Ea deleniti facilis laborum porro expedita est.','fugiat',1,NULL,'2005-04-12 09:00:28','2009-07-31 13:33:26'),(23,3,23,'Placeat molestiae maxime dolor quia quam. Impedit tempore quaerat nisi omnis id. Impedit explicabo non suscipit consequuntur sit quaerat id eius.','corrupti',7,NULL,'2015-12-06 14:45:15','1976-10-10 01:37:27'),(24,4,24,'Tenetur quibusdam nam necessitatibus qui iusto. Sint occaecati quia molestias aut minus eaque. Sed quo aut quia ea.','eaque',64,NULL,'2004-12-27 01:01:41','1980-01-28 14:11:31'),(25,1,25,'Non autem mollitia culpa quis. Non eos quia reiciendis accusamus et. Rerum qui qui sed non.','architecto',667319918,NULL,'2005-12-19 09:47:16','1979-03-23 21:59:00'),(26,2,26,'Et ut consectetur id et veritatis illum. Debitis minus vel assumenda sint qui. Cupiditate quam maiores rem.','quis',4,NULL,'2004-12-30 03:58:29','1979-09-15 08:56:46'),(27,3,27,'Iste occaecati inventore animi nihil sit. Et voluptatem consequatur labore impedit. Et pariatur dignissimos magni voluptas nesciunt asperiores labore.','aliquid',0,NULL,'1980-01-30 10:16:30','2011-06-22 13:32:55'),(28,4,28,'Nisi incidunt illo sed dolor animi perspiciatis. Temporibus aliquam nesciunt quisquam quibusdam. Laboriosam facere exercitationem ullam deserunt est.','nisi',149,NULL,'2013-03-18 12:35:34','1980-10-05 16:45:08'),(29,1,29,'Eveniet eligendi qui voluptatibus laudantium. Nobis et et repellendus neque ea tempore eum. Dolores recusandae eaque incidunt omnis ea.','laborum',5849592,NULL,'1999-07-30 19:41:52','2011-02-18 07:16:36'),(30,2,30,'Maiores ea in dolor illo earum ut. Expedita laboriosam officiis dolore vel facilis nihil repudiandae. Possimus cupiditate quod corporis rerum sed beatae debitis.','unde',253075,NULL,'1970-08-22 08:19:42','1993-09-03 13:47:46'),(31,3,31,'Iusto sequi fuga officia aperiam expedita ullam est. Quo natus autem quis similique nihil corrupti.','quae',6705107,NULL,'1981-12-31 21:39:40','1982-03-07 17:31:32'),(32,4,32,'Commodi libero occaecati sed praesentium consequatur aut nulla. Quibusdam unde nostrum aut impedit sunt sint qui. Dicta aliquam tempora et et vitae iste sequi.','dignissimos',30,NULL,'1983-05-05 23:36:12','2014-05-01 13:32:07'),(33,1,33,'Expedita illo vitae id voluptas. Rerum atque enim laudantium et accusantium ut. Quia omnis omnis omnis laborum asperiores corporis distinctio.','fuga',646159263,NULL,'1980-08-23 23:52:49','1992-01-13 23:23:28'),(34,2,34,'Quam et aut natus expedita dicta accusantium in. Iste voluptate illo quas molestias odio sint. Culpa rem ea praesentium corrupti. Nihil amet quia ea dolor vitae est aut.','rerum',582491,NULL,'2010-12-29 19:51:44','1979-03-20 16:53:16'),(35,3,35,'Minima et velit cum sunt impedit possimus modi. Quia est eum labore et. Laboriosam sed in atque quisquam molestias.','et',19041073,NULL,'2009-12-04 02:56:31','2003-03-29 22:01:09'),(36,4,36,'Aspernatur suscipit minima illum commodi numquam. Minus aut totam ducimus dolores. Quia qui neque quia reprehenderit at. Ut culpa omnis hic blanditiis.','voluptas',0,NULL,'1992-01-09 03:53:03','2005-11-21 13:32:21'),(37,1,37,'Temporibus quibusdam velit ut sint repellendus dolorum. Culpa ut quasi repudiandae et officia molestiae beatae. Enim quis nostrum hic quidem fuga. Quam facilis nemo doloremque aut animi.','dolores',20189,NULL,'2020-09-22 14:08:36','1979-02-20 10:25:29'),(38,2,38,'Saepe reprehenderit omnis ea veritatis aut. Et quasi quia est. Quia perferendis molestiae officiis voluptas aut quo.','iste',3,NULL,'1986-04-15 23:27:11','1974-12-04 21:05:25'),(39,3,39,'Doloribus velit sint exercitationem quae. Non consequatur et neque et soluta qui fugiat.','vel',953,NULL,'1985-03-01 17:33:24','2019-09-13 15:44:21'),(40,4,40,'Ratione aut nostrum dolorem eum pariatur. Necessitatibus odit et quibusdam cumque consectetur officiis quod. Harum et delectus vel voluptatem. Possimus et sint quae sint.','temporibus',32759751,NULL,'1984-01-15 00:39:37','1973-10-21 21:07:08');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,' photo','1970-11-28 22:30:54','1990-08-19 05:28:08'),(2,'video','1984-12-18 08:32:10','2015-04-03 09:37:04'),(3,' music','2012-10-22 16:14:48','1993-09-04 08:03:56'),(4,'video','2001-07-10 22:01:31','1975-03-19 00:23:44');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,23,'Fuga eaque ipsum alias modi in ad. In ducimus id aut. Quod autem eum aperiam non non. Non corporis magnam sit odit.','1983-08-10 19:34:37'),(2,2,62,'Id velit voluptatem sint atque reprehenderit impedit ea. Dolorem quaerat eos quas rerum culpa qui autem. Voluptatem incidunt doloremque et sint culpa ipsum. Eum natus eos illo fugit optio et numquam aperiam.','2020-12-05 19:49:51'),(3,3,44,'Explicabo odio et architecto perferendis nostrum labore. Mollitia libero esse excepturi exercitationem qui consequuntur qui. Rerum facilis laudantium voluptate nostrum molestiae delectus tempora. Distinctio exercitationem maiores quia ut ipsam.','1980-08-02 20:01:05'),(4,4,51,'Laboriosam ducimus consequatur similique a modi ex. Doloribus neque eum animi id reiciendis accusantium. Voluptatem dolor placeat omnis asperiores.','2002-12-29 14:48:36'),(5,5,28,'Adipisci impedit accusantium quod vel voluptatum. Pariatur sapiente sequi eos qui dolor magnam voluptatem id. Est et quas veritatis est placeat fugit unde. Consequatur at repudiandae voluptas accusamus distinctio cumque atque voluptates.','2006-07-03 04:36:50'),(6,6,6,'Consequatur perferendis sapiente exercitationem est excepturi laborum. Nihil repellendus voluptas beatae est. Eveniet est autem assumenda.','1992-03-02 07:31:43'),(7,7,21,'Architecto praesentium autem fuga incidunt nihil sunt ea. Et quis et labore ratione quidem eligendi enim. Quo saepe consectetur sit fugiat rerum eveniet nemo. Sapiente reiciendis qui esse est qui voluptas.','2014-03-15 22:49:55'),(8,8,69,'Qui libero numquam omnis sed similique. Eius excepturi id voluptatum molestiae sunt animi. Voluptas odit distinctio ullam delectus libero. Ipsa dolorem eaque ad et reiciendis nam accusantium placeat. Doloremque dolorem et vel culpa quasi.','1979-06-04 06:29:05'),(9,9,33,'Modi nam enim aut voluptas tenetur et quia tempora. Sit aut quod doloribus ipsa. Quisquam aliquam et dolor dolorem ea nemo cum itaque. Sed voluptatem rem rerum vero. Vero quibusdam libero ut esse eum incidunt pariatur.','1992-06-27 11:55:58'),(10,10,23,'At id sunt dolorum reiciendis omnis ex aut. Alias vitae neque quibusdam accusantium quia illo.','2008-11-08 22:56:38'),(11,11,67,'Nisi blanditiis cumque dolores non eos asperiores omnis perspiciatis. Quae animi iure voluptas. Animi eius esse et suscipit cumque. Eum laudantium quis suscipit temporibus a.','1971-02-20 14:37:07'),(12,12,59,'Et id molestiae nostrum et reiciendis beatae laboriosam veritatis. Repudiandae sit quaerat et corrupti. Qui inventore deleniti impedit voluptas totam assumenda natus. Officia porro numquam tempora dolor dolores ipsa numquam.','1973-05-19 18:21:39'),(13,13,6,'Qui at sed fugit odio est aut. Pariatur perferendis explicabo sint. Placeat asperiores voluptatem error nesciunt est.','2020-04-24 13:49:22'),(14,14,51,'Quia dignissimos quibusdam sed ad adipisci delectus. Soluta non sed rerum inventore. Atque nihil vitae est provident officia. Quidem optio neque delectus quia.','1972-09-29 12:16:36'),(15,15,13,'Excepturi voluptas dicta aspernatur recusandae voluptatem. Unde non nesciunt voluptates ratione. Sit nulla rem aut qui et.','1982-08-06 05:57:33'),(16,16,57,'Quia voluptatum dolorem vero dolores molestias animi. Velit recusandae quos et quis expedita eos sit. Accusamus eaque tenetur nihil corporis ea porro. Placeat est est cumque qui eum libero soluta.','1996-02-29 00:55:16'),(17,17,43,'Atque officia sed assumenda qui. Et non vel ut inventore. Nulla recusandae aut deserunt deleniti.','2004-07-31 12:02:58'),(18,18,33,'Omnis sequi aut laboriosam praesentium. Quia porro eaque unde nisi voluptatem omnis nulla. Sequi illum qui ex et id. Ad consectetur quo est voluptatem.','2012-02-03 00:58:41'),(19,19,36,'Cumque est rerum est blanditiis dolores. Aut quam quo facilis ducimus tenetur. Quia tenetur ut minus qui vero earum. Id illum nesciunt libero aut exercitationem consequatur doloremque.','2007-04-12 22:20:58'),(20,20,5,'Dolorem minima est nesciunt qui tempora praesentium qui. Ut nulla et quia perspiciatis. Saepe ut ratione aut earum labore est. Et blanditiis et quo odio et quo.','1987-09-10 22:33:31'),(21,21,18,'Placeat maxime consequatur amet animi ea. Explicabo quibusdam libero quod ex temporibus architecto. Et natus architecto cumque inventore. Nihil vitae ut consectetur repellat et vel.','1999-08-31 07:09:22'),(22,22,25,'Vero natus sed atque quisquam. Magnam facere deserunt dolorem. Delectus eaque sit labore qui temporibus quo ea.','1982-01-17 18:04:50'),(23,23,43,'Qui velit aliquid quam nemo. Dolores sed eum vero autem. Autem officiis repellat reiciendis voluptatem quo ut.','2012-06-12 22:14:08'),(24,24,59,'Repellendus nihil impedit assumenda provident dolores aut. Et cumque fugiat accusantium ipsum molestias rerum molestias autem. Accusamus temporibus quis blanditiis sapiente dolorum. Sed reprehenderit consequatur omnis molestias. Aut id ut accusantium doloribus provident reprehenderit.','2013-03-07 19:30:14'),(25,25,15,'Ea amet numquam dolorem at quas quia. Sunt quod vel aperiam doloremque deserunt maiores. Voluptatem iusto eligendi tempore praesentium hic.','1975-01-11 23:19:28'),(26,26,42,'Illum blanditiis repellendus ut porro illo nulla dolores. Illum natus consectetur debitis ullam rem id molestiae sint. Dolores quibusdam eos laboriosam. Labore omnis aut et architecto.','2000-12-19 08:02:24'),(27,27,14,'Nulla ut quasi est aliquid quod maxime. Qui consequatur ut quod illo. Eos voluptatem minima illo fugit molestias quas dignissimos. Cumque quis illum modi.','1977-09-28 04:12:39'),(28,28,62,'Ea omnis quasi vero qui ducimus cum quod. Ex qui unde voluptatem et excepturi aperiam. Quos nam at impedit et.','2001-12-28 06:33:25'),(29,29,36,'Fuga ratione earum distinctio nihil adipisci soluta. Perspiciatis dolore fuga accusamus exercitationem accusamus sit. Qui fugiat et recusandae quibusdam facilis quidem.','1985-06-11 22:11:57'),(30,30,23,'Sunt omnis ut asperiores optio consequuntur mollitia. Voluptas quasi eos quod distinctio labore deleniti. Sit sed ratione et.','1993-09-23 22:59:07'),(31,31,33,'Nulla quod enim aut tenetur illum perferendis. Quae pariatur velit sed optio quaerat aut. Omnis quaerat qui quas cumque.','2009-09-29 19:34:19'),(32,32,59,'Molestias eveniet id cum hic. Sit eos ab minus ut itaque excepturi. Ut aut id nisi quos.','2007-12-14 14:57:49'),(33,33,14,'Nihil ut voluptatem et quod sit. Est accusamus dolorum atque molestiae vel illum voluptatem. Voluptas corrupti rem esse nulla ipsam. Saepe perferendis provident aliquid ipsum non similique maiores.','1974-05-17 02:09:54'),(34,34,7,'Sapiente dolores porro eaque autem omnis impedit. Hic voluptate doloremque laudantium. Iure temporibus qui sit est ex omnis possimus. Voluptatem id enim earum omnis odio est quis.','1975-05-22 08:31:32'),(35,35,39,'Et sunt quasi quam iure ex fuga harum. Est enim ipsa dolor. Voluptas commodi asperiores minima sequi rerum ducimus repellendus. Nemo reprehenderit fugiat ut id voluptates officia velit eligendi.','2011-09-07 11:39:02'),(36,36,42,'Consectetur tempore ut aperiam. Dolorem voluptatem et et vel corrupti.','1990-09-09 22:34:35'),(37,37,12,'Non fugiat deleniti enim nam sint ea. Beatae possimus quos numquam reiciendis eum facilis. Non molestiae inventore rerum velit incidunt. Beatae et minima asperiores sapiente ipsa et eos sed.','2000-06-14 06:19:35'),(38,38,59,'Sunt iusto aut sed dolorem ipsam rerum. Ducimus non minima sapiente provident temporibus numquam cupiditate. Enim quam vero impedit optio aut. Praesentium consectetur totam sint aliquid non officiis non consequatur.','1976-07-06 20:05:43'),(39,39,40,'Nam dolore exercitationem id beatae alias unde dolore. Non id pariatur facere ratione odit at. Asperiores qui expedita quos atque rem non.','1978-01-04 17:32:36'),(40,40,44,'Consectetur laborum eos excepturi. Voluptates assumenda rem nesciunt maiores. Qui unde nihil dolor vero facilis asperiores nesciunt.','1976-10-29 20:36:05'),(41,41,11,'Et praesentium totam suscipit laborum ipsum. Animi ea et voluptatum amet rerum a. Cumque ut est fugit natus et temporibus cum.','2020-03-24 15:49:12'),(42,42,37,'Corporis corporis est omnis debitis eos enim ut ducimus. Minima hic sit ipsam dolore cum exercitationem optio. Porro quisquam voluptates doloribus sed est commodi similique ut. Cum quo sed est quis debitis nesciunt in.','2019-10-20 20:08:29'),(43,43,33,'Soluta impedit dolorem incidunt quia sed repudiandae. Id eligendi corporis alias in possimus. Id eaque laudantium pariatur sit sequi. Et labore ad necessitatibus aut aut ipsa at.','1983-04-23 17:59:37'),(44,44,16,'Eum deserunt qui sint molestiae. Aut eligendi et nostrum numquam. Assumenda eum molestias qui autem ea asperiores. Omnis mollitia neque reiciendis ut nulla accusamus voluptas.','1996-06-14 08:04:39'),(45,45,18,'Vel quidem et dicta incidunt et maxime. Id odit distinctio tempore doloribus est ex et magni. Aut est repellendus nulla exercitationem consectetur minus dolore. Dignissimos ad molestiae tempore ullam nihil.','1979-10-25 22:53:50'),(46,46,45,'Velit nihil quasi alias harum quia cupiditate. Ratione veritatis qui aut harum repudiandae cumque autem incidunt. Praesentium adipisci iste voluptates rerum.','2004-04-29 00:35:37'),(47,47,3,'Quisquam velit saepe sed. Quia eum pariatur delectus et. Quaerat optio quia voluptas pariatur quo. Ea nesciunt quo ratione in doloribus et explicabo.','2012-12-20 12:51:16'),(48,48,60,'Minus aut corporis voluptatem dolores doloribus at omnis vitae. Praesentium cumque possimus autem iste veniam eum aliquid. Ipsa eos illum placeat est.','1972-08-23 12:07:53'),(49,49,8,'Optio libero animi vel. Facere non unde quo saepe in ea alias. Eius iste autem placeat sint dolorem. Laboriosam doloribus deserunt rem aperiam sapiente est eaque.','1990-10-19 20:09:39'),(50,50,39,'Cumque reiciendis nulla fugiat quibusdam possimus. Placeat qui ab dolor ut ad. Quae saepe eum tempore eum.','1992-05-10 02:00:10'),(51,51,65,'Officia quibusdam ab ipsum possimus nam molestias hic. Soluta vitae dolor enim quod. Sed laborum ut eius ea. Sit quo odio dicta soluta.','2000-06-06 05:42:27'),(52,52,25,'Ut eum eligendi nesciunt nobis ea fugiat. Est rerum maxime non aut sed aliquam ut facere. Quo voluptas architecto eaque delectus perspiciatis consequatur. Est quo sit est dolore.','1997-08-14 06:44:14'),(53,53,63,'Optio et dolorem iusto dolor. Itaque rerum iste soluta facere cum tempora. Nam reiciendis quibusdam et labore. Officiis velit ducimus ut corporis ratione dolor deleniti.','1997-04-24 07:17:18'),(54,54,37,'Ullam natus aut quia error aperiam atque. Vel culpa esse nisi dolor veniam soluta distinctio. Et consequatur ratione praesentium esse.','2002-10-24 01:38:09'),(55,55,14,'Et voluptates incidunt sit veritatis ducimus suscipit. Voluptatem odio similique non consequatur eveniet ad assumenda. Ut est distinctio laborum ea maxime. Sit vitae atque placeat et quae itaque. Laboriosam soluta reiciendis quae.','2010-07-28 21:06:45'),(56,56,7,'Ut aut eligendi laudantium. Laborum nihil et quia consectetur est. Architecto earum et velit dolorem. Suscipit id voluptatem sapiente.','2016-12-20 17:03:23'),(57,57,9,'Voluptate in libero temporibus quaerat quia quaerat. Ut perferendis ut iure. Qui beatae laudantium nam eum est necessitatibus architecto.','1984-09-20 20:51:48'),(58,58,27,'Autem rerum quisquam harum fugit dolorum ut. Et natus est quos quis rem tempore. Veritatis minus sed incidunt vel rerum iure. Libero eos impedit aut laboriosam ea omnis.','2009-06-23 03:25:37'),(59,59,68,'Quis odit quisquam rerum pariatur dolores. Alias voluptas corporis ut consequuntur. Temporibus hic minus repellendus sunt sed repellat omnis. Ut dignissimos et aliquam fuga quasi sequi quis quibusdam. Distinctio itaque architecto nihil omnis vero tempora.','1970-09-30 01:47:06'),(60,60,44,'Molestiae consequatur et sed omnis. Ipsum suscipit est facilis dolor et vitae. Rem dolorem et alias eligendi. Reiciendis aliquid doloremque consequatur qui. Voluptas officiis voluptatem iure voluptatem voluptates aliquid.','1981-08-24 06:14:01'),(61,61,50,'Odio eveniet optio odio quasi ea. Delectus sunt cumque accusamus consequatur asperiores. Voluptas nisi sint enim et numquam unde.','1988-09-06 17:07:56'),(62,62,31,'Aut deserunt ab voluptatem ipsum consequatur. Repellendus ducimus laboriosam at maxime vero dolorem. Officiis eligendi debitis nostrum facilis perferendis autem ut.','2016-06-01 00:46:34'),(63,63,32,'Labore illum molestias beatae inventore veritatis asperiores aut quas. A et unde et molestiae iusto. Quae et expedita blanditiis quia voluptas et nihil. Ipsum architecto minus blanditiis porro omnis dolor voluptas.','1985-12-21 07:33:47'),(64,64,64,'Assumenda autem atque debitis et. Velit recusandae necessitatibus quibusdam facilis. Voluptates possimus amet doloribus laudantium quia amet est.','1973-07-28 05:21:00'),(65,65,37,'Earum debitis et nulla quaerat. Sequi eaque quia ea sit. Quasi impedit a unde aut. Similique iure nam totam accusantium consequatur doloremque et.','1976-05-16 21:39:24'),(66,66,1,'Optio debitis ullam porro et inventore dolorem est quas. Qui enim rerum dolores aperiam id dolore voluptas omnis. Tempora non mollitia vitae officiis ut et modi.','2017-03-14 20:19:03'),(67,67,35,'Dolor dolor molestiae maxime eius optio et debitis. Saepe consectetur doloremque ratione expedita perspiciatis est nihil.','1982-06-27 09:20:05'),(68,68,48,'Odio nisi culpa et rerum aut velit in maxime. Mollitia ipsa suscipit nam explicabo corrupti illo ipsa. Sint enim blanditiis et doloribus nam.','1975-11-24 20:46:15'),(69,69,60,'Vitae eaque architecto quod laudantium excepturi laudantium nihil suscipit. Necessitatibus veniam nesciunt sit quia. Aut error cupiditate sint ipsa recusandae molestiae eligendi odio. Quia quis commodi non ducimus. Aut enim expedita magni consequatur necessitatibus officia.','1981-10-14 17:13:17'),(70,70,4,'Nam suscipit culpa dolor pariatur. Recusandae iste qui voluptas dolores repellat officia. Eum repudiandae ut ipsam. Est facilis a autem placeat nesciunt qui.','1984-07-25 12:54:58'),(71,1,22,'Delectus praesentium id ea molestiae neque molestiae sed aut. Harum ut consequatur odio ipsum in et. Nemo mollitia consectetur repudiandae maiores rerum architecto sit laboriosam. Et quisquam tempore praesentium.','1998-02-10 03:57:58'),(72,2,1,'Eos voluptatem in aliquam dolor rerum tempora. Aut accusamus voluptatum perspiciatis est nam dolorum. In harum eos soluta enim enim qui et. Expedita rerum aut et quam ipsam repudiandae sunt.','2009-02-27 07:12:16'),(73,3,41,'Et aliquam qui hic eius fuga commodi. Neque rerum qui odit facilis aspernatur enim. Numquam expedita praesentium et provident praesentium similique dolores.','1977-07-22 17:11:08'),(74,4,54,'Est vel eius unde. Dicta quia nulla officia aliquam et. Ipsum harum sapiente sint et. Vero molestias corporis sequi porro.','2016-09-09 07:21:40'),(75,5,16,'Accusantium aut minus assumenda ab dolor velit quia id. Nulla molestiae quia vel minima et tempora saepe. Qui ut quam occaecati ea rerum.','1979-06-10 08:59:31'),(76,6,58,'Nihil eligendi occaecati eos natus et delectus qui rerum. Commodi hic neque velit dolore.','1991-07-23 05:21:45'),(77,7,29,'Odit sunt dolorem error. Et molestiae vero sapiente praesentium quod dolores quia. Repellat quia dicta est repellendus.','2018-05-29 12:51:20'),(78,8,19,'Tenetur ipsa iure praesentium. Vitae vel nihil alias enim. Rerum et cumque explicabo quos quo qui.','2012-06-16 01:22:11'),(79,9,47,'Fugit cupiditate sit quo. Ut repudiandae minima et facere quis error et. Voluptatem fugiat dolorum quibusdam nihil.','1989-06-28 22:19:37'),(80,10,36,'Sunt dolor ducimus fugiat repudiandae dolore culpa tempore sint. Numquam ut voluptas non sit laborum rem consequatur. Distinctio alias et possimus magnam consequuntur et et. Nihil quia debitis corrupti alias deserunt libero consequatur.','2000-01-13 12:10:06');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'qui',1),(2,'enim',2),(3,'ab',3),(4,'deserunt',4),(5,'quasi',5),(6,'in',6),(7,'molestias',7),(8,'animi',8),(9,'sunt',9),(10,'aspernatur',10),(11,'enim',11),(12,'eum',12),(13,'et',13),(14,'voluptatem',14),(15,'enim',15),(16,'nostrum',16),(17,'et',17),(18,'qui',18),(19,'illum',19),(20,'aliquam',20),(21,'sunt',21),(22,'ipsa',22),(23,'veniam',23),(24,'nobis',24),(25,'temporibus',25),(26,'alias',26),(27,'amet',27),(28,'facilis',28),(29,'hic',29),(30,'unde',30),(31,'placeat',31),(32,'accusantium',32),(33,'qui',33),(34,'ut',34),(35,'quia',35),(36,'praesentium',36),(37,'iste',37),(38,'aperiam',38),(39,'suscipit',39),(40,'dolores',40),(41,'omnis',41),(42,'ipsa',42),(43,'fugit',43),(44,'esse',44),(45,'deserunt',45),(46,'laboriosam',46),(47,'animi',47),(48,'numquam',48),(49,'cum',49),(50,'amet',50),(51,'nihil',51),(52,'aperiam',52),(53,'qui',53),(54,'nemo',54),(55,'nesciunt',55),(56,'incidunt',56),(57,'voluptas',57),(58,'porro',58),(59,'fuga',59),(60,'commodi',60),(61,'molestiae',61),(62,'accusantium',62),(63,'assumenda',63),(64,'quaerat',64),(65,'recusandae',65),(66,'distinctio',66),(67,'qui',67),(68,'placeat',68),(69,'voluptas',69),(70,'error',70),(71,'rerum',1),(72,'iure',2),(73,'architecto',3),(74,'qui',4),(75,'recusandae',5),(76,'dolor',6),(77,'qui',7),(78,'a',8),(79,'blanditiis',9),(80,'dolores',10),(81,'tenetur',11),(82,'iste',12),(83,'nisi',13),(84,'eligendi',14),(85,'est',15);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),(36,36,36),(37,37,37),(38,38,38),(39,39,39),(40,40,40),(41,41,1),(42,42,2),(43,43,3),(44,44,4),(45,45,5),(46,46,6),(47,47,7),(48,48,8),(49,49,9),(50,50,10),(51,51,11),(52,52,12),(53,53,13),(54,54,14),(55,55,15),(56,56,16),(57,57,17),(58,58,18),(59,59,19),(60,60,20),(61,61,21),(62,62,22),(63,63,23),(64,64,24),(65,65,25),(66,66,26),(67,67,27),(68,68,28),(69,69,29),(70,70,30),(71,71,31),(72,72,32),(73,73,33),(74,74,34),(75,75,35),(76,76,36),(77,77,37),(78,78,38),(79,79,39),(80,80,40),(81,81,1),(82,82,2),(83,83,3),(84,84,4),(85,85,5),(86,1,6),(87,2,7),(88,3,8),(89,4,9),(90,5,10),(91,6,11),(92,7,12),(93,8,13),(94,9,14),(95,10,15),(96,11,16),(97,12,17),(98,13,18),(99,14,19),(100,15,20);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'P','2000-03-24',1,'2009-02-06 18:10:50',NULL),(2,'M','2007-02-01',2,'2016-01-24 18:10:48',NULL),(3,'M','2021-04-02',3,'2015-12-24 03:19:42',NULL),(4,'D','2016-07-24',4,'2002-12-07 22:11:03',NULL),(5,'D','1996-05-20',5,'2003-01-27 15:54:39',NULL),(6,'D','1994-03-28',6,'2020-06-05 19:21:19',NULL),(7,'M','2011-10-28',7,'1994-08-01 05:46:18',NULL),(8,'P','2012-07-31',8,'2013-12-05 22:51:19',NULL),(9,'M','1973-06-25',9,'2002-08-19 07:48:26',NULL),(10,'M','2010-04-16',10,'2002-05-08 06:10:04',NULL),(11,'M','2014-09-03',11,'1984-05-31 21:41:31',NULL),(12,'D','1986-07-24',12,'1998-11-28 08:08:07',NULL),(13,'D','1985-12-10',13,'1986-03-24 20:09:33',NULL),(14,'D','1996-04-29',14,'2019-09-07 01:09:17',NULL),(15,'P','1975-06-05',15,'1999-06-06 07:39:53',NULL),(16,'M','1982-04-16',16,'1978-01-28 17:50:33',NULL),(17,'M','1998-09-28',17,'1988-02-20 14:03:22',NULL),(18,'P','1974-07-23',18,'2006-01-29 21:39:03',NULL),(19,'M','2011-04-01',19,'1991-01-01 16:53:32',NULL),(20,'P','1981-10-02',20,'1986-03-08 08:04:54',NULL),(21,'M','2002-05-19',21,'2005-01-01 22:16:05',NULL),(22,'P','1989-02-28',22,'2008-02-01 01:28:46',NULL),(23,'M','1984-04-22',23,'2002-09-24 22:14:46',NULL),(24,'M','2002-02-14',24,'1997-03-07 02:18:31',NULL),(25,'D','2007-05-22',25,'1974-11-05 04:30:34',NULL),(26,'P','2010-01-24',26,'1972-02-03 17:10:08',NULL),(27,'P','1989-11-07',27,'1975-12-24 14:13:12',NULL),(28,'P','2000-07-09',28,'1985-06-02 21:07:06',NULL),(29,'M','2011-10-01',29,'2010-08-22 17:19:22',NULL),(30,'M','2007-01-17',30,'2005-06-16 13:31:49',NULL),(31,'M','2007-11-30',31,'2010-08-02 12:54:56',NULL),(32,'D','1971-02-15',32,'1987-02-28 15:42:42',NULL),(33,'M','1980-08-20',33,'2002-11-07 03:50:36',NULL),(34,'D','1996-01-17',34,'1980-07-18 13:11:09',NULL),(35,'D','1974-04-11',35,'1971-01-26 17:05:13',NULL),(36,'D','1976-12-08',36,'2019-05-07 09:58:55',NULL),(37,'D','2002-01-17',37,'1990-04-16 18:59:45',NULL),(38,'D','1984-10-01',38,'1978-11-10 16:46:53',NULL),(39,'M','2014-08-24',39,'2011-12-05 19:07:48',NULL),(40,'P','2019-10-11',40,'1990-12-08 18:20:40',NULL),(41,'M','2017-10-21',41,'2010-04-14 09:44:56',NULL),(42,'D','2017-02-03',42,'1980-04-25 22:34:30',NULL),(43,'M','1981-07-14',43,'1983-01-04 03:40:35',NULL),(44,'D','2009-08-19',44,'1992-03-19 00:18:38',NULL),(45,'P','1982-04-02',45,'1999-12-29 05:27:25',NULL),(46,'D','1995-05-13',46,'2002-06-24 14:45:50',NULL),(47,'D','1970-11-18',47,'2007-12-09 18:52:00',NULL),(48,'P','2015-10-31',48,'1988-01-05 01:58:53',NULL),(49,'M','2018-09-24',49,'1984-09-20 20:13:05',NULL),(50,'P','2003-02-19',50,'2005-02-21 23:17:29',NULL),(51,'M','1983-03-15',51,'2019-12-31 03:37:46',NULL),(52,'D','2020-01-19',52,'2008-06-08 07:56:00',NULL),(53,'D','2013-04-23',53,'1978-01-14 01:59:10',NULL),(54,'M','2003-06-14',54,'2003-02-26 21:48:36',NULL),(55,'M','2003-06-16',55,'1974-03-02 15:01:54',NULL),(56,'M','2013-03-09',56,'1975-08-21 19:59:52',NULL),(57,'M','1996-06-04',57,'1979-08-24 17:42:22',NULL),(58,'D','2016-02-13',58,'2001-04-21 17:34:54',NULL),(59,'M','1991-10-24',59,'1981-03-23 08:56:14',NULL),(60,'D','2006-07-03',60,'1982-07-14 15:37:30',NULL),(61,'M','1996-11-11',61,'2014-03-08 14:27:26',NULL),(62,'D','1975-05-31',62,'1981-02-22 16:28:48',NULL),(63,'M','1995-04-07',63,'1985-08-08 11:04:28',NULL),(64,'M','2002-09-06',64,'1999-03-10 08:20:41',NULL),(65,'M','2016-06-25',65,'1986-03-28 21:13:00',NULL),(66,'D','2012-02-25',66,'2009-06-30 00:02:34',NULL),(67,'P','2012-06-30',67,'2001-11-16 07:55:08',NULL),(68,'D','2015-02-10',68,'1992-08-07 15:49:15',NULL),(69,'D','1993-01-20',69,'2007-07-30 13:51:20',NULL),(70,'D','1985-08-06',70,'2003-04-18 16:01:07',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Concepcion','Beier','iwisoky@example.com','e441f2d26261f65ecaeae0c9053a43a853548603',89250259309),(2,'Jean','Jacobson','ebahringer@example.net','37d4f5ffd599c0ed685f7d400c00207f85152ccb',89287329009),(3,'Alejandrin','Tremblay','misael64@example.net','f9a00747c5fbf0491c85b28335a3d159cf9a53a1',89262068815),(4,'Elliott','Weber','bernard32@example.net','9d296745493c4e0b25187c2f9ff33b705f009388',89223999625),(5,'Maia','Smith','mschultz@example.org','0fc0e161975ab074184e62267edd4ac3f054c89d',89255780087),(6,'Ali','McClure','kuhic.marianna@example.org','9e2e4ba217fe82e0bf2cb63e29a2b59f88340838',89201813245),(7,'Rosanna','Runte','eleanora.hahn@example.org','7c72913dc968ad2f4c32a2a6261f35f3c635985b',89241754934),(8,'Ricky','Cremin','libbie.thiel@example.org','aee45a433076b81300bcd9e1736692e32e8b9aad',89275350938),(9,'Belle','Goldner','ericka.welch@example.net','4c25355627342de49d6e3715f0fdceee99848886',89296144934),(10,'Evert','Smitham','josianne.anderson@example.org','8f0951ccce8749985810d9f64d8ffaa3128f873c',89290926672),(11,'Marge','Grant','demond71@example.net','78d427c34e26987d1a3662971d4c2d4c71b9c8b4',89297884499),(12,'Hudson','Harvey','wuckert.ken@example.org','0adbbcda2a788467ead24836effc1c263e569d3a',89239179120),(13,'Elenor','Lang','kturcotte@example.net','b807a40995c389244662700c7be2e8b9fadc4403',89262419582),(14,'Rosalind','Tromp','oral.mills@example.net','f1ff91f9f11df86091d0c1c59e85880223013142',89255438634),(15,'Shaun','Dicki','nicole.welch@example.net','a618dfd2bac963869a9287f4b8c2bfebbf822b9e',89263982350),(16,'Marquise','Borer','olen.bergstrom@example.com','b31fbced00e1738e789e877fe542ea9e4dc95504',89285597750),(17,'Kathlyn','Metz','vkuhn@example.com','452f387bbbd6dd6f9bc46d835813fbd1d2480095',89202918702),(18,'Rosemarie','Lynch','nina.mraz@example.com','9f03f9b7052b6d33a461b87ec2429e3bb9887a09',89276339805),(19,'Ethyl','Lueilwitz','lhauck@example.org','15549923ad4bbd4e1b45c76ace7da4caaaf1b971',89286755905),(20,'Leone','Lindgren','fabiola.doyle@example.net','ade8db98e7722e5879592264733f171fe103ae00',89227338551),(21,'Katherine','Sanford','fay.joey@example.org','e4d71c42b62b6a483307431def64d74f6c2ab0c7',89275674710),(22,'Eudora','Kuhic','ghane@example.org','4b3aa92193a87207b7c0c6b2028ee3d95a194ddc',89259608533),(23,'Tyson','Goldner','fay76@example.org','faf9f7022872620641102cd02748b62510203130',89298761876),(24,'Sheridan','Gutmann','evan72@example.org','f33420ab2f4fd06cbf8453da98632e72504af773',89255514758),(25,'Stefan','Kris','hilton.thiel@example.org','e21787d28f5f0267ddcd6cf1def346170944c095',89272312635),(26,'Savannah','Reilly','carroll.tanya@example.com','6af10512c312702c86baf3554c8276a358dc1b75',89231420301),(27,'Payton','Kessler','aufderhar.flavie@example.org','46f20cecd756c92204a783fce501e462fc36bbb5',89287197077),(28,'Rollin','Bradtke','bcorwin@example.org','dc8d0d297f781ea1f979b93ae2f8e486de64e6b8',89204386969),(29,'Retta','Larson','agustina58@example.org','55c1feeab72ad8163abdbcce6e145443b7ccf408',89279555102),(30,'Mireille','VonRueden','cfeeney@example.com','c7eef905b923d2e43acbca75ebcf5932ca5372a5',89275944433),(31,'Lowell','Durgan','pterry@example.com','3012af41018d3dc48296ea514c83c17570f1322f',89204882895),(32,'Alta','Gutkowski','laura.ryan@example.com','51877c7498a823f9047a640214e9bd885cb32c54',89258422585),(33,'Vivien','Hettinger','jbednar@example.org','a313a113fea952f35c64fef80d0eaec7868614b6',89251149886),(34,'Aubrey','Dibbert','kylie.howell@example.net','0749abad9538cf6cd1afe23618063ba8db013da1',89212268275),(35,'Neal','Corwin','schultz.teresa@example.com','a1372be9ad9a041d67278a00b600b7805bb64d8d',89212850793),(36,'Mose','Daugherty','witting.santino@example.net','8d2233556880f3f12b174568ecee2c18b03dfd27',89287531441),(37,'Gina','Zboncak','greenholt.freeman@example.org','3ee36922be9004147f17cf386114af4f7438e87d',89272840311),(38,'Larue','Weber','ettie.mclaughlin@example.com','3c3ebc435842532de4708970f9c69801f08d39d3',89268459115),(39,'Laisha','Willms','ddare@example.net','f91169e1d1305db84f68fb22ca1c379662aa12e4',89214660087),(40,'Granville','Russel','lea91@example.org','29e9954abcebea5c10b04305f59e98d0622d9282',89278158756),(41,'Irma','Konopelski','darrel.goodwin@example.net','d6c62e2b911bcec25b3679a9a4a3ca3069ea1b2b',89222526398),(42,'Green','Spencer','wiza.emmalee@example.net','7045a0d1977a2767ed506c821e3acfc262a52ef6',89212488747),(43,'Nedra','Corkery','edmond.gulgowski@example.org','e815ff7de6b94e4e09fd446f6d34b548f4e02a11',89273990225),(44,'Bonita','Yost','pietro.runolfsson@example.net','9ce6e395c010ac57bf320bb39d9b5840016eddc8',89298354313),(45,'Giles','Nader','ramiro10@example.net','059f75fdc8fa0bc92c41ec444d87dccf0f610faa',89204166937),(46,'Korbin','Huels','burley72@example.net','98693e2491ef189f47f5d070c03512ee39f628fe',89272852835),(47,'Kylie','Predovic','florida.koch@example.org','332021263fb284b591fe0bceceb4c7f953ce3de3',89251099020),(48,'Estelle','Kilback','xwiegand@example.com','142c8787632d652fbd3c849838fcee4bbe1e0e81',89205221386),(49,'Wilburn','Hintz','kunze.kenna@example.net','6d17fe35643d8ef88e1736e4eb945d3c0a2f9abb',89279256818),(50,'Frankie','Littel','deion.bosco@example.net','d1c2f003ab114bb28385df5da5de587ae3abd06d',89242353910),(51,'Talon','Price','esther04@example.org','6fa73c7210a2457653c14def84d99d4ea0400383',89277484612),(52,'Titus','Cronin','natalie.toy@example.net','f1484d28fcf6ac8d230cdfe878cd52dce3fc55b4',89282502992),(53,'Arch','Sawayn','georgianna.lesch@example.net','451436d9ef410de0283cfde6ca5dac9b08a03a1e',89273068624),(54,'Micaela','Torphy','destany80@example.net','3a0cabd7e3d196f68d5910287d106456193f39fe',89279433729),(55,'Maryse','Dooley','o\'hara.cloyd@example.com','fab6817e31495b6625d33db07f261aaa3bb57765',89274241123),(56,'Joany','Ortiz','megane91@example.org','44d98596a7036485417c817becc2e3c39238c3bb',89246327808),(57,'Rasheed','Reichel','kasandra.ernser@example.net','977245d6dadc78cf043bf0f1723ebf1f49ca80ab',89288616243),(58,'Maymie','Kunze','cindy15@example.com','8b3113c6bffca16a6b3522c42bef4ab977f76df9',89246810534),(59,'Fatima','Pacocha','nicole.armstrong@example.net','fa0670d7c8142680ccf9a1c4fa287e0c49b5ab40',89298747697),(60,'Dejuan','Lang','sunny.wisozk@example.com','79b8328fc18c69738f7ef669ffc48e4d8b050948',89231414496),(61,'Virginia','Williamson','kenneth.rosenbaum@example.net','a8257bba40af491f28409c093e50ff6a07c31a3a',89255992408),(62,'Rachael','Zieme','harry14@example.net','68eb6e9d5cb6fa3c5b055faea04fc1eb6e925323',89223502717),(63,'Yasmin','Schamberger','jakubowski.kaley@example.net','d54acd899005aeb8f077659ed3c7412fba0256aa',89252158810),(64,'Darryl','Metz','vfunk@example.org','7cdd106601a8c47c033f573764c24efac92e9641',89285047194),(65,'Kieran','Vandervort','lionel39@example.org','792b9967c385653a474480ba984a8e177aec792c',89233013328),(66,'Gino','Batz','andre48@example.com','f8486725c43f2ea72d07da8f55fa63cfb5390400',89292545787),(67,'Karl','Bashirian','yfadel@example.org','812400ca95740059d751ef5560f254c88cfc70d6',89256692183),(68,'Marianne','O\'Hara','keanu54@example.com','92501502d2798c2a432e2c4466f3c5e445fcf09d',89206403983),(69,'Claire','Luettgen','jolie.feeney@example.org','2c6689a222cfa8a120ea8d6d2a4ea5a56d8d9df1',89227307097),(70,'Rylee','Predovic','pauer@example.com','ad3c5f3f9a16dd8e051cc1439787b571c072e445',89272527855);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,1),(1,11),(2,2),(2,12),(3,3),(3,13),(4,4),(4,14),(5,5),(5,15),(6,6),(6,16),(7,7),(7,17),(8,8),(8,18),(9,9),(9,19),(10,10),(10,20),(11,11),(11,21),(12,12),(12,22),(13,13),(13,23),(14,14),(14,24),(15,15),(15,25),(16,16),(16,26),(17,17),(17,27),(18,18),(18,28),(19,19),(19,29),(20,20),(20,30),(21,1),(21,21),(22,2),(22,22),(23,3),(23,23),(24,4),(24,24),(25,5),(25,25),(26,6),(26,26),(27,7),(27,27),(28,8),(28,28),(29,9),(29,29),(30,10),(30,30),(31,1),(32,2),(33,3),(34,4),(35,5),(36,6),(37,7),(38,8),(39,9),(40,10),(41,11),(42,12),(43,13),(44,14),(45,15),(46,16),(47,17),(48,18),(49,19),(50,20),(51,21),(52,22),(53,23),(54,24),(55,25),(56,26),(57,27),(58,28),(59,29),(60,30),(61,1),(62,2),(63,3),(64,4),(65,5),(66,6),(67,7),(68,8),(69,9),(70,10);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-29 13:22:25


-- задание 2 Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке

SELECT DISTINCT firstname 
FROM users 
ORDER BY firstname ASC;

-- задание 3 Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false).
-- Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)

ALTER TABLE profiles 
ADD is_active bIT DEFAULT 1;

UPDATE profiles 
SET 
	is_active = FALSE 
	WHERE (birthday + INTERVAL 18 YEAR) > now();

-- задание 4 Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)

DELETE FROM messages
WHERE created_at > CURRENT_DATE();





































