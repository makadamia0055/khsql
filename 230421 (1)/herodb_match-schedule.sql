CREATE DATABASE  IF NOT EXISTS `herodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `herodb`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: herodb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `match-schedule`
--

DROP TABLE IF EXISTS `match-schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match-schedule` (
  `ms_num` int NOT NULL AUTO_INCREMENT,
  `ms_datetime` datetime NOT NULL,
  `ms_match_sort` varchar(10) NOT NULL,
  `ms_tm_home_num` int NOT NULL,
  `ms_tm_away_num` int NOT NULL,
  `ms_rv_num` int NOT NULL,
  `ms_me_id` varchar(13) NOT NULL,
  PRIMARY KEY (`ms_num`),
  KEY `FK_team_TO_match-schedule_1` (`ms_tm_home_num`),
  KEY `FK_team_TO_match-schedule_2` (`ms_tm_away_num`),
  KEY `FK_reservation_TO_match-schedule_1` (`ms_rv_num`),
  KEY `FK_members_TO_match-schedule_1` (`ms_me_id`),
  CONSTRAINT `FK_members_TO_match-schedule_1` FOREIGN KEY (`ms_me_id`) REFERENCES `members` (`me_id`),
  CONSTRAINT `FK_reservation_TO_match-schedule_1` FOREIGN KEY (`ms_rv_num`) REFERENCES `reservation` (`rv_num`),
  CONSTRAINT `FK_team_TO_match-schedule_1` FOREIGN KEY (`ms_tm_home_num`) REFERENCES `team` (`tm_num`),
  CONSTRAINT `FK_team_TO_match-schedule_2` FOREIGN KEY (`ms_tm_away_num`) REFERENCES `team` (`tm_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match-schedule`
--

LOCK TABLES `match-schedule` WRITE;
/*!40000 ALTER TABLE `match-schedule` DISABLE KEYS */;
INSERT INTO `match-schedule` VALUES (1,'2023-04-29 16:13:05','친선',1,1,1,'asd123');
/*!40000 ALTER TABLE `match-schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-21 21:04:49
