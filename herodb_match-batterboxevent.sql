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
-- Table structure for table `match-batterboxevent`
--

DROP TABLE IF EXISTS `match-batterboxevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match-batterboxevent` (
  `mb_num` int NOT NULL AUTO_INCREMENT,
  `mb_inning_order` int NOT NULL,
  `mb_be_num` int NOT NULL,
  `mb_mi_num` int NOT NULL,
  `mb_mp_hitter_num` int NOT NULL,
  `mb_mp_pitcher_num` int NOT NULL,
  PRIMARY KEY (`mb_num`),
  KEY `FK_batterboxevent-type_TO_match-batterboxEvent_1` (`mb_be_num`),
  KEY `FK_match-inning_TO_match-batterboxEvent_1` (`mb_mi_num`),
  KEY `FK_match-partcipate_TO_match-batterboxEvent_1` (`mb_mp_hitter_num`),
  KEY `FK_match-partcipate_TO_match-batterboxEvent_2` (`mb_mp_pitcher_num`),
  CONSTRAINT `FK_batterboxevent-type_TO_match-batterboxEvent_1` FOREIGN KEY (`mb_be_num`) REFERENCES `batterboxevent-type` (`be_num`),
  CONSTRAINT `FK_match-inning_TO_match-batterboxEvent_1` FOREIGN KEY (`mb_mi_num`) REFERENCES `match-inning` (`mi_num`),
  CONSTRAINT `FK_match-partcipate_TO_match-batterboxEvent_1` FOREIGN KEY (`mb_mp_hitter_num`) REFERENCES `match-partcipate` (`mp_num`),
  CONSTRAINT `FK_match-partcipate_TO_match-batterboxEvent_2` FOREIGN KEY (`mb_mp_pitcher_num`) REFERENCES `match-partcipate` (`mp_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match-batterboxevent`
--

LOCK TABLES `match-batterboxevent` WRITE;
/*!40000 ALTER TABLE `match-batterboxevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `match-batterboxevent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-24 21:47:43
