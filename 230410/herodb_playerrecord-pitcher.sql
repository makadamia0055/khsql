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
-- Table structure for table `playerrecord-pitcher`
--

DROP TABLE IF EXISTS `playerrecord-pitcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerrecord-pitcher` (
  `pp_num` int NOT NULL AUTO_INCREMENT,
  `pp_tp_num` int NOT NULL,
  `pp_mr_num` int NOT NULL,
  `pp_innings` int NOT NULL DEFAULT '0',
  `pp_hits` int NOT NULL DEFAULT '0',
  `pp_homeruns` int NOT NULL DEFAULT '0',
  `pp_hitters` int NOT NULL DEFAULT '0',
  `pp_shutouts` int NOT NULL DEFAULT '0',
  `pp_completegame` int NOT NULL DEFAULT '0',
  `pp_saves` int NOT NULL DEFAULT '0',
  `pp_holds` int NOT NULL DEFAULT '0',
  `pp_fourballs` int NOT NULL DEFAULT '0',
  `pp_hitbypitches` int NOT NULL DEFAULT '0',
  `pp_strikeouts` int NOT NULL DEFAULT '0',
  `pp_losepoints` int NOT NULL DEFAULT '0',
  `pp_earnedruns` int NOT NULL DEFAULT '0',
  `pp_balks` int NOT NULL DEFAULT '0',
  `pp_wildpitchs` int NOT NULL DEFAULT '0',
  `pp_pitches` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`pp_num`),
  KEY `FK_team-player_TO_playerrecord-pitcher_1` (`pp_tp_num`),
  KEY `FK_match-record_TO_playerrecord-pitcher_1` (`pp_mr_num`),
  CONSTRAINT `FK_match-record_TO_playerrecord-pitcher_1` FOREIGN KEY (`pp_mr_num`) REFERENCES `match-record` (`mr_num`),
  CONSTRAINT `FK_team-player_TO_playerrecord-pitcher_1` FOREIGN KEY (`pp_tp_num`) REFERENCES `team-player` (`tp_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerrecord-pitcher`
--

LOCK TABLES `playerrecord-pitcher` WRITE;
/*!40000 ALTER TABLE `playerrecord-pitcher` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerrecord-pitcher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-10 17:19:18
