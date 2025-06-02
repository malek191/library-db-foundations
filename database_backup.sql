/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mfahmy1
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `Authors`
--

DROP TABLE IF EXISTS `Authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Authors` (
  `author_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authors`
--

LOCK TABLES `Authors` WRITE;
/*!40000 ALTER TABLE `Authors` DISABLE KEYS */;
INSERT INTO `Authors` VALUES (1,'George Orwell'),(2,'Jane Austen'),(3,'Mark Twain'),(4,'J.K. Rowling'),(5,'Ernest Hemingway'),(6,'New Author');
/*!40000 ALTER TABLE `Authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Authors_List`
--

DROP TABLE IF EXISTS `Authors_List`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Authors_List` (
  `list_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`list_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `Authors_List_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authors_List`
--

LOCK TABLES `Authors_List` WRITE;
/*!40000 ALTER TABLE `Authors_List` DISABLE KEYS */;
INSERT INTO `Authors_List` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `Authors_List` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books` (
  `book_id` varchar(10) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `Authors_List_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `publisher_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `Authors_List_id` (`Authors_List_id`),
  KEY `publisher_id` (`publisher_id`),
  CONSTRAINT `Books_ibfk_1` FOREIGN KEY (`Authors_List_id`) REFERENCES `Authors` (`author_id`),
  CONSTRAINT `Books_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `Publisher` (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `Books` VALUES ('A8','Harry Potter and the Sorcerer’s Stone',4,1997,'P3'),('B7','The Old Man and the Sea',5,1992,'P4'),('C3','Pride and Prejudice',2,1813,'P1'),('D6','Adventures of Huckleberry Finn',3,1884,'P2'),('L1','2025',1,1949,'C3'),('N1','The Test Book',6,2023,'P6'),('N3','Animal Farm',1,1945,'C3');
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fines`
--

DROP TABLE IF EXISTS `Fines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fines` (
  `fine_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id` varchar(10) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `paid_date` date DEFAULT NULL,
  PRIMARY KEY (`fine_id`),
  KEY `loan_id` (`loan_id`),
  CONSTRAINT `Fines_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `Loans` (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fines`
--

LOCK TABLES `Fines` WRITE;
/*!40000 ALTER TABLE `Fines` DISABLE KEYS */;
INSERT INTO `Fines` VALUES (1,'aok#513',5.00,'2025-03-30'),(2,'aok#727',10.00,NULL),(3,'aok#306',15.00,NULL),(4,'aok#727',20.00,NULL),(5,'aok#999',25.00,NULL);
/*!40000 ALTER TABLE `Fines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Loans`
--

DROP TABLE IF EXISTS `Loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Loans` (
  `loan_id` varchar(10) NOT NULL,
  `book_id` varchar(10) DEFAULT NULL,
  `member_id` varchar(10) DEFAULT NULL,
  `loan_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `book_id` (`book_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `Loans_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`),
  CONSTRAINT `Loans_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `Members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Loans`
--

LOCK TABLES `Loans` WRITE;
/*!40000 ALTER TABLE `Loans` DISABLE KEYS */;
INSERT INTO `Loans` VALUES ('aok#306','L1','#21','2025-01-10','2025-01-24','2025-01-20'),('aok#458','C3','#22','2025-02-01','2025-02-15','2025-02-10'),('aok#513','D6','#23','2025-03-05','2025-03-19','2025-03-25'),('aok#690','A8','#24','2025-04-12','2025-04-26','2025-04-30'),('aok#727','B7','#25','2025-05-20','2025-06-03',NULL),('aok#999','L1','#21','2024-01-10','2024-01-24',NULL);
/*!40000 ALTER TABLE `Loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `MemberFines`
--

DROP TABLE IF EXISTS `MemberFines`;
/*!50001 DROP VIEW IF EXISTS `MemberFines`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `MemberFines` AS SELECT
 1 AS `name`,
  1 AS `total_fines`,
  1 AS `fine_amount` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Members`
--

DROP TABLE IF EXISTS `Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Members` (
  `member_id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Members`
--

LOCK TABLES `Members` WRITE;
/*!40000 ALTER TABLE `Members` DISABLE KEYS */;
INSERT INTO `Members` VALUES ('#21','Alice Johnson'),('#22','Bob Smith'),('#23','Carol Davis'),('#24','David Lee'),('#25','Eva Brown');
/*!40000 ALTER TABLE `Members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `OverdueBooks`
--

DROP TABLE IF EXISTS `OverdueBooks`;
/*!50001 DROP VIEW IF EXISTS `OverdueBooks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `OverdueBooks` AS SELECT
 1 AS `book_id`,
  1 AS `title`,
  1 AS `member_name`,
  1 AS `due_date` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Publisher`
--

DROP TABLE IF EXISTS `Publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publisher` (
  `publisher_id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publisher`
--

LOCK TABLES `Publisher` WRITE;
/*!40000 ALTER TABLE `Publisher` DISABLE KEYS */;
INSERT INTO `Publisher` VALUES ('C3','Secker & Warburg'),('P1','T. Egerton'),('P2','Chatto & Windus'),('P3','Bloomsbury'),('P4','Charles Scribner\'s Sons'),('P6','New Publisher');
/*!40000 ALTER TABLE `Publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `MemberFines`
--

/*!50001 DROP VIEW IF EXISTS `MemberFines`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mfahmy1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `MemberFines` AS select `Members`.`name` AS `name`,count(`Fines`.`fine_id`) AS `total_fines`,sum(`Fines`.`amount`) AS `fine_amount` from ((`Members` join `Loans` on(`Members`.`member_id` = `Loans`.`member_id`)) join `Fines` on(`Loans`.`loan_id` = `Fines`.`loan_id`)) where `Loans`.`due_date` < curdate() and `Loans`.`return_date` is null group by `Members`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `OverdueBooks`
--

/*!50001 DROP VIEW IF EXISTS `OverdueBooks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mfahmy1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `OverdueBooks` AS select `Books`.`book_id` AS `book_id`,`Books`.`title` AS `title`,`Members`.`name` AS `member_name`,`Loans`.`due_date` AS `due_date` from ((`Loans` join `Books` on(`Loans`.`book_id` = `Books`.`book_id`)) join `Members` on(`Loans`.`member_id` = `Members`.`member_id`)) where `Loans`.`due_date` < curdate() and `Loans`.`return_date` is null */;
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

-- Dump completed on 2025-02-28 23:47:50
