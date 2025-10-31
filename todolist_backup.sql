-- MySQL dump 10.13  Distrib 8.0.40, for macos12.7 (arm64)
--
-- Host: 127.0.0.1    Database: todolist
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_logger`
--

DROP TABLE IF EXISTS `activity_logger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logger` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int unsigned NOT NULL,
  `action` varchar(50) NOT NULL,
  `data` text,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_task_id` (`task_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_created_at` (`created_at`),
  CONSTRAINT `fk_logger_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_task` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logger`
--

LOCK TABLES `activity_logger` WRITE;
/*!40000 ALTER TABLE `activity_logger` DISABLE KEYS */;
INSERT INTO `activity_logger` VALUES (5,22,'completed',NULL,4,'2025-10-30 09:49:18'),(6,20,'completed',NULL,4,'2025-10-30 09:52:15'),(7,20,'completed',NULL,4,'2025-10-30 09:52:16'),(8,20,'completed',NULL,4,'2025-10-30 09:52:17'),(9,20,'completed',NULL,4,'2025-10-30 09:52:18'),(10,22,'completed',NULL,4,'2025-10-30 09:52:25'),(11,20,'completed',NULL,4,'2025-10-30 09:52:26'),(12,21,'completed',NULL,4,'2025-10-30 09:52:27'),(13,21,'completed',NULL,4,'2025-10-30 09:52:27'),(22,44,'completed',NULL,4,'2025-10-30 09:58:18'),(43,61,'completed',NULL,4,'2025-10-30 10:20:02'),(48,60,'completed',NULL,4,'2025-10-30 10:45:33'),(49,60,'marked incomplete',NULL,4,'2025-10-30 10:45:34'),(50,57,'completed',NULL,4,'2025-10-30 10:45:43'),(51,55,'completed',NULL,4,'2025-10-30 10:45:45'),(52,61,'marked incomplete',NULL,4,'2025-10-30 10:46:55'),(53,61,'completed',NULL,4,'2025-10-30 10:46:56'),(54,39,'completed',NULL,3,'2025-10-30 10:47:51'),(55,39,'marked incomplete',NULL,3,'2025-10-30 10:48:11'),(56,39,'completed',NULL,3,'2025-10-30 10:48:12'),(57,39,'marked incomplete',NULL,3,'2025-10-30 10:48:13'),(58,38,'completed',NULL,3,'2025-10-30 10:48:14'),(59,38,'marked incomplete',NULL,3,'2025-10-30 10:48:15'),(60,37,'completed',NULL,3,'2025-10-30 10:48:16'),(61,37,'marked incomplete',NULL,3,'2025-10-30 10:48:16'),(62,33,'completed',NULL,3,'2025-10-30 10:48:19'),(63,33,'marked incomplete',NULL,3,'2025-10-30 10:48:20'),(64,39,'completed',NULL,3,'2025-10-30 10:49:02'),(65,39,'marked incomplete',NULL,3,'2025-10-30 10:49:03'),(66,39,'completed',NULL,3,'2025-10-30 10:53:16'),(67,38,'completed',NULL,3,'2025-10-30 10:53:18'),(68,14,'completed',NULL,3,'2025-10-30 10:53:21'),(69,39,'marked incomplete',NULL,3,'2025-10-30 10:53:22'),(70,38,'marked incomplete',NULL,3,'2025-10-30 10:53:23'),(71,14,'marked incomplete',NULL,3,'2025-10-30 10:53:24'),(72,14,'completed',NULL,3,'2025-10-30 10:53:39'),(73,33,'completed',NULL,3,'2025-10-30 10:53:43'),(74,39,'completed',NULL,3,'2025-10-30 10:55:17'),(77,36,'completed',NULL,3,'2025-10-30 10:55:32'),(78,16,'completed',NULL,3,'2025-10-30 11:00:32'),(79,15,'completed',NULL,3,'2025-10-30 11:00:34'),(80,38,'completed',NULL,3,'2025-10-30 11:00:36'),(81,37,'completed',NULL,3,'2025-10-30 11:00:37'),(82,35,'completed',NULL,3,'2025-10-30 11:00:37'),(83,34,'completed',NULL,3,'2025-10-30 11:00:37'),(84,32,'completed',NULL,3,'2025-10-30 11:00:37'),(85,31,'completed',NULL,3,'2025-10-30 11:00:37'),(86,30,'completed',NULL,3,'2025-10-30 11:00:38'),(87,29,'completed',NULL,3,'2025-10-30 11:00:38'),(88,28,'completed',NULL,3,'2025-10-30 11:00:38'),(89,27,'completed',NULL,3,'2025-10-30 11:00:38'),(90,26,'completed',NULL,3,'2025-10-30 11:00:38'),(91,25,'completed',NULL,3,'2025-10-30 11:00:39'),(92,24,'completed',NULL,3,'2025-10-30 11:00:39'),(93,23,'completed',NULL,3,'2025-10-30 11:00:39'),(94,17,'completed',NULL,3,'2025-10-30 11:00:39'),(95,39,'marked incomplete',NULL,3,'2025-10-30 11:00:40'),(96,39,'completed',NULL,3,'2025-10-30 11:00:40'),(97,36,'marked incomplete',NULL,3,'2025-10-30 11:00:40'),(98,36,'completed',NULL,3,'2025-10-30 11:00:40'),(99,33,'marked incomplete',NULL,3,'2025-10-30 11:00:40'),(100,14,'marked incomplete',NULL,3,'2025-10-30 11:00:42'),(101,16,'marked incomplete',NULL,3,'2025-10-30 11:00:42'),(102,38,'marked incomplete',NULL,3,'2025-10-30 11:00:44'),(105,38,'completed',NULL,3,'2025-10-30 11:05:20'),(106,38,'marked incomplete',NULL,3,'2025-10-30 11:05:22'),(107,38,'completed',NULL,3,'2025-10-30 11:36:16'),(124,77,'created',NULL,6,'2025-10-30 13:47:37'),(125,78,'created',NULL,6,'2025-10-30 13:47:51'),(126,78,'completed',NULL,6,'2025-10-30 13:47:53'),(127,77,'completed',NULL,6,'2025-10-30 13:47:54'),(128,78,'marked incomplete',NULL,6,'2025-10-30 13:54:07'),(129,77,'marked incomplete',NULL,6,'2025-10-30 13:54:08'),(130,79,'created',NULL,6,'2025-10-30 13:55:58'),(131,80,'created',NULL,6,'2025-10-30 13:56:02'),(132,81,'created',NULL,5,'2025-10-30 13:57:03'),(133,82,'created',NULL,5,'2025-10-30 13:57:07'),(134,83,'created',NULL,5,'2025-10-30 13:58:41'),(137,83,'completed',NULL,5,'2025-10-30 13:58:49'),(138,82,'completed',NULL,5,'2025-10-30 13:58:50'),(139,81,'completed',NULL,5,'2025-10-30 13:58:51'),(140,83,'marked incomplete',NULL,5,'2025-10-30 13:58:55'),(141,82,'marked incomplete',NULL,5,'2025-10-30 13:59:53'),(142,81,'marked incomplete',NULL,5,'2025-10-30 13:59:54'),(157,135,'created',NULL,7,'2025-10-30 14:14:02'),(158,136,'created',NULL,7,'2025-10-30 14:14:04'),(159,137,'created',NULL,7,'2025-10-30 14:14:05'),(160,138,'created',NULL,7,'2025-10-30 14:14:06'),(161,138,'completed',NULL,7,'2025-10-30 14:15:03'),(162,139,'created',NULL,7,'2025-10-30 14:18:37'),(163,139,'completed',NULL,7,'2025-10-30 14:18:40'),(164,116,'completed',NULL,5,'2025-10-30 14:33:04'),(167,114,'completed',NULL,5,'2025-10-30 14:34:58'),(168,113,'completed',NULL,5,'2025-10-30 14:34:59'),(169,112,'completed',NULL,5,'2025-10-30 14:35:04'),(170,110,'completed',NULL,5,'2025-10-30 14:40:09'),(171,108,'completed',NULL,5,'2025-10-30 14:40:09'),(172,83,'completed',NULL,5,'2025-10-30 14:40:10'),(173,82,'completed',NULL,5,'2025-10-30 14:40:11'),(174,81,'completed',NULL,5,'2025-10-30 14:40:11');
/*!40000 ALTER TABLE `activity_logger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `priority` enum('High','Medium','Low') NOT NULL DEFAULT 'Medium',
  `due` date DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_priority` (`user_id`,`priority`),
  KEY `idx_due` (`due`),
  CONSTRAINT `fk_tasks_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (14,'Buy groceries',0,'Medium',NULL,3),(15,'Read a book',1,'Low',NULL,3),(16,'Prepare presentation',0,'High','2025-11-02',3),(17,'Clean the house',1,'Medium',NULL,3),(20,'Call plumber',1,'High','2025-11-03',4),(21,'Buy birthday gift',1,'Medium','2025-11-10',4),(22,'Plan weekend trip',1,'Low',NULL,4),(23,'Finish project report',1,'High','2025-11-05',3),(24,'Buy groceries',1,'Medium','2025-11-01',3),(25,'Read Python book',1,'Low',NULL,3),(26,'Prepare presentation slides',1,'High','2025-11-07',3),(27,'Clean bedroom',1,'Low','2025-11-02',3),(28,'Update resume',1,'Medium',NULL,3),(29,'Pay electricity bill',1,'High','2025-10-31',3),(30,'Call mom',1,'Medium',NULL,3),(31,'Workout for 30 mins',1,'Low',NULL,3),(32,'Plan weekend trip',1,'Medium','2025-11-08',3),(33,'Send emails to clients',0,'High','2025-11-01',3),(34,'Clean kitchen',1,'Low','2025-11-03',3),(35,'Prepare lunch for tomorrow',1,'Medium',NULL,3),(36,'Backup laptop files',1,'Medium','2025-11-04',3),(37,'Read tech articles',1,'Low',NULL,3),(38,'Organize desk',1,'Low','2025-11-02',3),(39,'Attend online webinar',1,'Medium','2025-11-06',3),(43,'Fix website bugs',0,'High','2025-11-03',4),(44,'Go for a run',1,'Low',NULL,4),(45,'Prepare meeting notes',0,'Medium','2025-11-02',4),(46,'Buy birthday gift',0,'Medium','2025-11-10',4),(47,'Clean living room',0,'Low','2025-11-04',4),(48,'Update LinkedIn profile',0,'Medium',NULL,4),(49,'Pay credit card bill',0,'High','2025-10-31',4),(50,'Call friend',0,'Low',NULL,4),(51,'Prepare dinner',0,'Medium',NULL,4),(52,'Organize wardrobe',0,'Low','2025-11-05',4),(53,'Finish reading book',0,'Low',NULL,4),(54,'Plan weekend hike',0,'Medium','2025-11-09',4),(55,'Submit tax documents',1,'High','2025-11-07',4),(56,'Clean garage',0,'Low','2025-11-06',4),(57,'Prepare project proposal',1,'High','2025-11-08',4),(58,'Watch tutorial videos',0,'Low',NULL,4),(59,'Schedule dentist appointment',0,'Medium','2025-11-12',4),(60,'Organize files on PC',0,'Medium',NULL,4),(61,'Update budget spreadsheet',1,'Medium','2025-11-05',4),(77,'ok so this is test1',0,'Medium',NULL,6),(78,'so this is another  test2',0,'Medium','2025-10-01',6),(79,'test3',0,'Medium',NULL,6),(80,'test3',0,'Medium',NULL,6),(81,'Lets do this today',1,'Medium',NULL,5),(82,'yay',1,'Medium',NULL,5),(83,'test2',1,'Medium',NULL,5),(85,'Finish project report',0,'High','2025-11-05',3),(86,'Buy groceries',0,'Medium','2025-11-02',3),(87,'Call Bob for update',1,'Low','2025-11-03',3),(88,'Schedule doctor appointment',0,'High','2025-11-06',3),(89,'Read AI research paper',0,'Medium','2025-11-07',3),(90,'Update CV',1,'High','2025-11-08',3),(91,'Plan weekend trip',0,'Low','2025-11-09',3),(92,'Fix laptop issue',0,'High','2025-11-04',3),(93,'Organize desk',0,'Low',NULL,3),(94,'Send invoices',1,'Medium','2025-11-05',3),(95,'Prepare presentation',0,'High','2025-11-06',3),(96,'Clean garage',0,'Medium','2025-11-03',4),(97,'Finish homework',1,'High','2025-11-02',4),(98,'Buy birthday gift',0,'High','2025-11-08',4),(99,'Email client',0,'Medium','2025-11-04',4),(100,'Book flight tickets',0,'High','2025-11-10',4),(101,'Water plants',1,'Low',NULL,4),(102,'Gym workout',1,'Medium','2025-11-01',4),(103,'Read new novel',0,'Low','2025-11-06',4),(104,'Update software',0,'High','2025-11-03',4),(105,'Organize photos',0,'Low',NULL,4),(106,'Prepare presentation slides',1,'High','2025-11-07',4),(108,'Finish backend module',1,'High','2025-11-04',5),(109,'Deploy website',1,'High','2025-11-06',5),(110,'Team meeting',1,'Medium','2025-11-03',5),(111,'Buy snacks',1,'Low','2025-11-02',5),(112,'Write blog post',1,'Medium','2025-11-05',5),(113,'Fix bugs in project',1,'High','2025-11-07',5),(114,'Plan weekend activities',1,'Low','2025-11-09',5),(115,'Update GitHub repos',1,'Medium',NULL,5),(116,'Read documentation',1,'High','2025-11-08',5),(117,'Buy groceries',0,'Medium','2025-11-02',6),(118,'Clean desk',1,'Low',NULL,6),(119,'Finish Python course',0,'High','2025-11-06',6),(120,'Call mom',0,'Medium','2025-11-03',6),(121,'Write unit tests',0,'High','2025-11-05',6),(122,'Organize files',0,'Low','2025-11-07',6),(123,'Prepare dinner',1,'Medium','2025-11-01',6),(124,'Update CV',0,'High','2025-11-04',6),(125,'Plan trip',0,'Low','2025-11-09',6),(126,'Check emails',1,'Medium',NULL,6),(127,'Read AI article',0,'High','2025-11-08',6),(135,'test1',0,'Medium',NULL,7),(136,'test2',0,'Medium',NULL,7),(137,'test3',0,'Medium',NULL,7),(138,'test4',1,'Medium',NULL,7),(139,'test4',1,'High',NULL,7);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Alice','alice@example.com','alice123'),(4,'Bob','bob@example.com','bob123'),(5,'Bobzi123','Bobzi123@email.com','$2y$12$IMm8hy3OCWNJPetqRW3Ofu2DJApLX.QN.jMGA/zDmtIhco7scYbwS'),(6,'Bobzi1234','Bobzi1234@gmail.com','$2y$12$/enMaviAiFMYBoRTOPnr8e4e5RCvWGh9UNAyqQ23s75rxlOkzemQ6'),(7,'test1234','test1234@test.com','$2y$12$ltzPuimz6sQNZZZjdv.8lebZ/1xpYgkJTTiDFsBNtoMn8xgER13AG'),(8,'test12345','test12345@email.com','$2y$12$epwCP/Qz5bhKSNrPhhBb.OnWCZJDyToiEeTFayG.xeqd3AHzK/ZW.');
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

-- Dump completed on 2025-10-31 15:21:12
