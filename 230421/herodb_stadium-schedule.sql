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
-- Table structure for table `stadium-schedule`
--

DROP TABLE IF EXISTS `stadium-schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadium-schedule` (
  `ss_num` int NOT NULL AUTO_INCREMENT,
  `ss_game_date` datetime NOT NULL,
  `ss_st_num` int NOT NULL,
  `ss_rv_num` int NOT NULL,
  PRIMARY KEY (`ss_num`),
  KEY `FK_stadium-timetable_TO_stadium-schedule_1` (`ss_st_num`),
  KEY `FK_reservation_TO_stadium-schedule_1` (`ss_rv_num`),
  CONSTRAINT `FK_reservation_TO_stadium-schedule_1` FOREIGN KEY (`ss_rv_num`) REFERENCES `reservation` (`rv_num`),
  CONSTRAINT `FK_stadium-timetable_TO_stadium-schedule_1` FOREIGN KEY (`ss_st_num`) REFERENCES `stadium-timetable` (`st_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium-schedule`
--

LOCK TABLES `stadium-schedule` WRITE;
/*!40000 ALTER TABLE `stadium-schedule` DISABLE KEYS */;
INSERT INTO `stadium-schedule` VALUES (1,'2023-04-29 19:00:00',1,1);
/*!40000 ALTER TABLE `stadium-schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-21 21:03:55
