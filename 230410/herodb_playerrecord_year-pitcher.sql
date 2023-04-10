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
-- Table structure for table `playerrecord_year-pitcher`
--

DROP TABLE IF EXISTS `playerrecord_year-pitcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerrecord_year-pitcher` (
  `yp_num` int NOT NULL AUTO_INCREMENT,
  `yp_tp_num` int NOT NULL,
  `yp_year` int NOT NULL,
  `yp_sort` varchar(5) NOT NULL,
  `yp_innings` int NOT NULL DEFAULT (0),
  `yp_hits` int NOT NULL DEFAULT (0),
  `yp_homeruns` int NOT NULL DEFAULT (0),
  `yp_hitters` int NOT NULL DEFAULT (0),
  `yp_shutouts` int NOT NULL DEFAULT (0),
  `yp_completegame` int NOT NULL DEFAULT (0),
  `yp_saves` int NOT NULL DEFAULT (0),
  `yp_holds` int NOT NULL DEFAULT (0),
  `yp_fourballs` int NOT NULL DEFAULT (0),
  `yp_hitbypitches` int NOT NULL DEFAULT (0),
  `yp_strikeouts` int NOT NULL DEFAULT (0),
  `yp_losepoints` int NOT NULL DEFAULT (0),
  `yp_earnedruns` int NOT NULL DEFAULT (0),
  `yp_balks` int NOT NULL DEFAULT (0),
  `yp_wildpitchs` int NOT NULL DEFAULT (0),
  `yp_pitches` int NOT NULL DEFAULT (0),
  PRIMARY KEY (`yp_num`),
  KEY `FK_team-player_TO_playerrecord_year-pitcher_1` (`yp_tp_num`),
  CONSTRAINT `FK_team-player_TO_playerrecord_year-pitcher_1` FOREIGN KEY (`yp_tp_num`) REFERENCES `team-player` (`tp_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerrecord_year-pitcher`
--

LOCK TABLES `playerrecord_year-pitcher` WRITE;
/*!40000 ALTER TABLE `playerrecord_year-pitcher` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerrecord_year-pitcher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-10 17:19:20
