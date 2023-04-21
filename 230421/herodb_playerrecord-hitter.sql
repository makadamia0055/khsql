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
-- Table structure for table `playerrecord-hitter`
--

DROP TABLE IF EXISTS `playerrecord-hitter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerrecord-hitter` (
  `ph_num` int NOT NULL AUTO_INCREMENT,
  `ph_tp_num` int NOT NULL,
  `ph_mr_num` int NOT NULL,
  `ph_single_hits` int NOT NULL DEFAULT '0',
  `ph_twobase_hits` int NOT NULL DEFAULT '0',
  `ph_threebase_hits` int NOT NULL DEFAULT '0',
  `ph_homeruns` int NOT NULL DEFAULT '0',
  `ph_errors` int NOT NULL DEFAULT '0',
  `ph_steals` int NOT NULL DEFAULT '0',
  `ph_fail_steals` int NOT NULL DEFAULT '0',
  `ph_fourballs` int NOT NULL DEFAULT '0',
  `ph_strike_outs` int NOT NULL DEFAULT '0',
  `ph_hits` int NOT NULL DEFAULT '0',
  `ph_bats` int NOT NULL DEFAULT '0',
  `ph_doubleplays` int NOT NULL DEFAULT '0',
  `ph_hitbypitches` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ph_num`),
  KEY `FK_team-player_TO_playerrecord-hitter_1` (`ph_tp_num`),
  KEY `FK_match-record_TO_playerrecord-hitter_1` (`ph_mr_num`),
  CONSTRAINT `FK_match-record_TO_playerrecord-hitter_1` FOREIGN KEY (`ph_mr_num`) REFERENCES `match-record` (`mr_num`),
  CONSTRAINT `FK_team-player_TO_playerrecord-hitter_1` FOREIGN KEY (`ph_tp_num`) REFERENCES `team-player` (`tp_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerrecord-hitter`
--

LOCK TABLES `playerrecord-hitter` WRITE;
/*!40000 ALTER TABLE `playerrecord-hitter` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerrecord-hitter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-21 21:03:54
