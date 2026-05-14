-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: hajj_company
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `hajji_id` int DEFAULT NULL,
  `package_id` int DEFAULT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `total_price` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`booking_id`),
  KEY `bookings_hajji_id_fkey` (`hajji_id`),
  KEY `bookings_package_id_fkey` (`package_id`),
  CONSTRAINT `bookings_hajji_id_fkey` FOREIGN KEY (`hajji_id`) REFERENCES `hajj_applicants` (`hajj_id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_package_id_fkey` FOREIGN KEY (`package_id`) REFERENCES `packages` (`package_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,1,1,'Pending',2500.00),(2,2,2,'pending',1500.00),(3,1,2,'cancelled',2000.00);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaigns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,'Main Hajj Campaign','Makkah','campaign@example.com'),(2,'2nd ','almadinah','almadina@gmail.com');
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `continent` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Palestine','ILS/JOD','Arabic','Asia'),(2,'Saudi Arabia','SAR','Arabic','Asia');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_messages`
--

DROP TABLE IF EXISTS `employee_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_messages` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int DEFAULT NULL,
  `sender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'Admin',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'Unread',
  PRIMARY KEY (`message_id`),
  KEY `employee_messages_emp_id_fkey` (`emp_id`),
  CONSTRAINT `employee_messages_emp_id_fkey` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_messages`
--

LOCK TABLES `employee_messages` WRITE;
/*!40000 ALTER TABLE `employee_messages` DISABLE KEYS */;
INSERT INTO `employee_messages` VALUES (1,1,'Admin','Please check the new booking requests.','2026-05-08 17:22:07','Read'),(6,1,'admin','do the task number 6','2026-05-13 09:08:41','Read'),(7,1,'Employee','ok','2026-05-13 12:49:04','Unread'),(8,1,'admin','hyyyyyyyyyyyyyyyy','2026-05-13 15:10:59','Read'),(9,1,'Employee','adasdas','2026-05-13 15:11:28','Unread'),(10,1,'Employee','asdasdasd','2026-05-13 15:11:33','Unread'),(11,1,'admin','zzzzzzzzzzzz','2026-05-13 15:17:35','Read'),(12,1,'Employee','eeeeeeeeeeeeeeeee','2026-05-13 15:18:09','Unread');
/*!40000 ALTER TABLE `employee_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employee_messagess`
--

DROP TABLE IF EXISTS `employee_messagess`;
/*!50001 DROP VIEW IF EXISTS `employee_messagess`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_messagess` AS SELECT 
 1 AS `message_id`,
 1 AS `emp_id`,
 1 AS `sender`,
 1 AS `message`,
 1 AS `sent_at`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee_tasks`
--

DROP TABLE IF EXISTS `employee_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_tasks` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `due_date` date DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `employee_tasks_emp_id_fkey` (`emp_id`),
  CONSTRAINT `employee_tasks_emp_id_fkey` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_tasks`
--

LOCK TABLES `employee_tasks` WRITE;
/*!40000 ALTER TABLE `employee_tasks` DISABLE KEYS */;
INSERT INTO `employee_tasks` VALUES (1,1,'Check bookings','Review customer bookings for today','Done','2026-05-11'),(2,1,'Prepare report','Prepare weekly hajj report','Done','2026-05-15'),(3,1,'a','b','Done','2026-05-20');
/*!40000 ALTER TABLE `employee_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'ali','noor','ahmad@example.com','Male',700.00),(2,'ameen','emad','ameen@gmail.com','male',100.00);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hajj_applicants`
--

DROP TABLE IF EXISTS `hajj_applicants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hajj_applicants` (
  `hajj_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `supervisor_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`hajj_id`),
  KEY `hajj_applicants_country_id_fkey` (`country_id`),
  KEY `hajj_applicants_supervisor_id_fkey` (`supervisor_id`),
  KEY `hajj_applicants_user_id_fkey` (`user_id`),
  CONSTRAINT `hajj_applicants_country_id_fkey` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE SET NULL,
  CONSTRAINT `hajj_applicants_supervisor_id_fkey` FOREIGN KEY (`supervisor_id`) REFERENCES `supervisor` (`supervisor_id`) ON DELETE SET NULL,
  CONSTRAINT `hajj_applicants_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hajj_applicants`
--

LOCK TABLES `hajj_applicants` WRITE;
/*!40000 ALTER TABLE `hajj_applicants` DISABLE KEYS */;
INSERT INTO `hajj_applicants` VALUES (1,3,'Customer','User','Male','555555','2000-01-01','Pending',1,1),(2,3,'mohammed','jaber','male','0569553017','2000-01-01','pending',1,1),(6,3,'mohammed','jaber','Male','0569443017','2005-04-17','Pending',1,1);
/*!40000 ALTER TABLE `hajj_applicants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `hajji_applicants`
--

DROP TABLE IF EXISTS `hajji_applicants`;
/*!50001 DROP VIEW IF EXISTS `hajji_applicants`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `hajji_applicants` AS SELECT 
 1 AS `hajji_id`,
 1 AS `user_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `gender`,
 1 AS `phone`,
 1 AS `dob`,
 1 AS `status`,
 1 AS `supervisor_id`,
 1 AS `country_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hajji_transports`
--

DROP TABLE IF EXISTS `hajji_transports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hajji_transports` (
  `hajji_id` int NOT NULL,
  `transport_id` int NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  PRIMARY KEY (`hajji_id`,`transport_id`),
  KEY `hajji_transports_transport_id_fkey` (`transport_id`),
  CONSTRAINT `hajji_transports_hajji_id_fkey` FOREIGN KEY (`hajji_id`) REFERENCES `hajj_applicants` (`hajj_id`) ON DELETE CASCADE,
  CONSTRAINT `hajji_transports_transport_id_fkey` FOREIGN KEY (`transport_id`) REFERENCES `transports` (`transport_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hajji_transports`
--

LOCK TABLES `hajji_transports` WRITE;
/*!40000 ALTER TABLE `hajji_transports` DISABLE KEYS */;
INSERT INTO `hajji_transports` VALUES (1,1,'Pending'),(2,2,'pending');
/*!40000 ALTER TABLE `hajji_transports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_bookings`
--

DROP TABLE IF EXISTS `hotel_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `hajji_id` int DEFAULT NULL,
  `hotel_id` int DEFAULT NULL,
  `room_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `price` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`booking_id`),
  KEY `hotel_bookings_hajji_id_fkey` (`hajji_id`),
  KEY `hotel_bookings_hotel_id_fkey` (`hotel_id`),
  CONSTRAINT `hotel_bookings_hajji_id_fkey` FOREIGN KEY (`hajji_id`) REFERENCES `hajj_applicants` (`hajj_id`) ON DELETE CASCADE,
  CONSTRAINT `hotel_bookings_hotel_id_fkey` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_bookings`
--

LOCK TABLES `hotel_bookings` WRITE;
/*!40000 ALTER TABLE `hotel_bookings` DISABLE KEYS */;
INSERT INTO `hotel_bookings` VALUES (1,1,1,'Double','2026-06-01','2026-06-10','Pending',800.00);
/*!40000 ALTER TABLE `hotel_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `hotel_id` int NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int DEFAULT '1',
  PRIMARY KEY (`hotel_id`),
  CONSTRAINT `hotels_rating_check` CHECK (((`rating` >= 1) and (`rating` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'Makkah Hotel','123456789','Central Area','24231','Makkah','Makkah Region',5),(2,'palestine hotel','12312345','2nd street','51415','makkah','makkah region',4);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `package_id` int NOT NULL AUTO_INCREMENT,
  `package_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,'Standard Hajj Package','2026-06-01','2026-06-15',2500.00),(2,'2nd package','2025-04-23','2025-06-01',24.86);
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisor` (
  `supervisor_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience_years` int DEFAULT '0',
  PRIMARY KEY (`supervisor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` VALUES (1,'osama','supervisor@example.com','599000000',5);
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_companies`
--

DROP TABLE IF EXISTS `transport_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport_companies` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int DEFAULT '1',
  PRIMARY KEY (`company_id`),
  CONSTRAINT `transport_companies_rating_check` CHECK (((`rating` >= 1) and (`rating` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_companies`
--

LOCK TABLES `transport_companies` WRITE;
/*!40000 ALTER TABLE `transport_companies` DISABLE KEYS */;
INSERT INTO `transport_companies` VALUES (1,'Hajj Transport Co','transport@example.com','555555555',4),(3,'2nd','2nd@gmail.com','0562345234',3);
/*!40000 ALTER TABLE `transport_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transports`
--

DROP TABLE IF EXISTS `transports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transports` (
  `transport_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int DEFAULT NULL,
  `vehicle_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_location` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_location` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  PRIMARY KEY (`transport_id`),
  KEY `transports_company_id_fkey` (`company_id`),
  CONSTRAINT `transports_company_id_fkey` FOREIGN KEY (`company_id`) REFERENCES `transport_companies` (`company_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transports`
--

LOCK TABLES `transports` WRITE;
/*!40000 ALTER TABLE `transports` DISABLE KEYS */;
INSERT INTO `transports` VALUES (1,1,'Bus','Jeddah Airport','Makkah','2026-06-01'),(2,1,'plane','palestine','makkah','2026-06-05');
/*!40000 ALTER TABLE `transports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_key` (`username`),
  CONSTRAINT `users_role_check` CHECK ((`role` in (_utf8mb4'admin',_utf8mb4'employee',_utf8mb4'customer')))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin123','admin'),(2,'employee','emp123','employee'),(3,'customer','cust123','customer');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `employee_messagess`
--

/*!50001 DROP VIEW IF EXISTS `employee_messagess`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_messagess` AS select `employee_messages`.`message_id` AS `message_id`,`employee_messages`.`emp_id` AS `emp_id`,`employee_messages`.`sender` AS `sender`,`employee_messages`.`message` AS `message`,`employee_messages`.`sent_at` AS `sent_at`,`employee_messages`.`status` AS `status` from `employee_messages` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `hajji_applicants`
--

/*!50001 DROP VIEW IF EXISTS `hajji_applicants`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hajji_applicants` AS select `hajj_applicants`.`hajj_id` AS `hajji_id`,`hajj_applicants`.`user_id` AS `user_id`,`hajj_applicants`.`first_name` AS `first_name`,`hajj_applicants`.`last_name` AS `last_name`,`hajj_applicants`.`gender` AS `gender`,`hajj_applicants`.`phone` AS `phone`,`hajj_applicants`.`dob` AS `dob`,`hajj_applicants`.`status` AS `status`,`hajj_applicants`.`supervisor_id` AS `supervisor_id`,`hajj_applicants`.`country_id` AS `country_id` from `hajj_applicants` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-13 15:34:18
