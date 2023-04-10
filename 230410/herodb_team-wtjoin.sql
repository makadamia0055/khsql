CREATE DATABASE  IF NOT EXISTS `herodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `herodb`;
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
-- Table structure for table `team-wtjoin`
--

DROP TABLE IF EXISTS `team-wtjoin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team-wtjoin` (
  `tj_num` int NOT NULL AUTO_INCREMENT,
  `tj_tm_num` int NOT NULL,
  `tj_pl_num` int NOT NULL,
  `tj_register_date` datetime NOT NULL,
  `tj_state` varchar(5) DEFAULT NULL,
  `tj_bo_num` int DEFAULT NULL,
  PRIMARY KEY (`tj_num`),
  KEY `FK_team_TO_team-wtjoin_1` (`tj_tm_num`),
  KEY `FK_player_TO_team-wtjoin_1` (`tj_pl_num`),
  KEY `FK_board_TO_team-wtjoin_1` (`tj_bo_num`),
  CONSTRAINT `FK_board_TO_team-wtjoin_1` FOREIGN KEY (`tj_bo_num`) REFERENCES `board` (`bo_num`),
  CONSTRAINT `FK_player_TO_team-wtjoin_1` FOREIGN KEY (`tj_pl_num`) REFERENCES `player` (`pl_num`),
  CONSTRAINT `FK_team_TO_team-wtjoin_1` FOREIGN KEY (`tj_tm_num`) REFERENCES `team` (`tm_num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team-wtjoin`
--

LOCK TABLES `team-wtjoin` WRITE;
/*!40000 ALTER TABLE `team-wtjoin` DISABLE KEYS */;
INSERT INTO `team-wtjoin` VALUES (4,1,2,'2023-04-10 16:49:16','신청대기',NULL),(5,1,2,'2023-04-10 16:56:40','신청대기',NULL);
/*!40000 ALTER TABLE `team-wtjoin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-10 17:19:23
