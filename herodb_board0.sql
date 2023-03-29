-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: herodb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `bo_num` int NOT NULL AUTO_INCREMENT,
  `bo_title` varchar(70) NOT NULL,
  `bo_content` longtext NOT NULL,
  `bo_view` int NOT NULL DEFAULT '0',
  `bo_register_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bo_reply_count` int DEFAULT NULL,
  `bo_up` int NOT NULL DEFAULT '0',
  `bo_down` int NOT NULL DEFAULT '0',
  `bo_bt_num` int NOT NULL,
  `bo_me_id` varchar(13) NOT NULL,
  `bo_bc_num` int DEFAULT NULL,
  PRIMARY KEY (`bo_num`),
  KEY `FK_board-type_TO_board_1` (`bo_bt_num`),
  KEY `FK_members_TO_board_1` (`bo_me_id`),
  KEY `FK_board-category_TO_board_1` (`bo_bc_num`),
  CONSTRAINT `FK_board-category_TO_board_1` FOREIGN KEY (`bo_bc_num`) REFERENCES `board-category` (`bc_num`),
  CONSTRAINT `FK_board-type_TO_board_1` FOREIGN KEY (`bo_bt_num`) REFERENCES `board-type` (`bt_num`),
  CONSTRAINT `FK_members_TO_board_1` FOREIGN KEY (`bo_me_id`) REFERENCES `members` (`me_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-29 21:49:06
