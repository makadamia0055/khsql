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
-- Table structure for table `match-lineup`
--

DROP TABLE IF EXISTS `match-lineup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match-lineup` (
  `ml_num` int NOT NULL AUTO_INCREMENT,
  `ml_ms_num` int NOT NULL,
  `ml_battingorder` int NOT NULL,
  `ml_type` varchar(10) NOT NULL,
  `ml_tp_num` int NOT NULL,
  `ml_po_num` int NOT NULL,
  PRIMARY KEY (`ml_num`),
  KEY `FK_match-schedule_TO_match-lineup_1` (`ml_ms_num`),
  KEY `FK_team-player_TO_match-lineup_1` (`ml_tp_num`),
  KEY `FK_position_TO_match-lineup_1` (`ml_po_num`),
  CONSTRAINT `FK_match-schedule_TO_match-lineup_1` FOREIGN KEY (`ml_ms_num`) REFERENCES `match-schedule` (`ms_num`),
  CONSTRAINT `FK_position_TO_match-lineup_1` FOREIGN KEY (`ml_po_num`) REFERENCES `position` (`po_num`),
  CONSTRAINT `FK_team-player_TO_match-lineup_1` FOREIGN KEY (`ml_tp_num`) REFERENCES `team-player` (`tp_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match-lineup`
--

LOCK TABLES `match-lineup` WRITE;
/*!40000 ALTER TABLE `match-lineup` DISABLE KEYS */;
/*!40000 ALTER TABLE `match-lineup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-11 21:22:13
