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
-- Table structure for table `board-category`
--

DROP TABLE IF EXISTS `board-category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board-category` (
  `bc_num` int NOT NULL AUTO_INCREMENT,
  `bc_name` varchar(10) NOT NULL,
  `bc_bt_num` int NOT NULL,
  `bc_auth_sort` varchar(5) NOT NULL,
  `bc_w_auth` int DEFAULT NULL,
  `bc_r_auth` int DEFAULT NULL,
  PRIMARY KEY (`bc_num`),
  KEY `FK_board-type_TO_board-category_1` (`bc_bt_num`),
  CONSTRAINT `FK_board-type_TO_board-category_1` FOREIGN KEY (`bc_bt_num`) REFERENCES `board-type` (`bt_num`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board-category`
--

LOCK TABLES `board-category` WRITE;
/*!40000 ALTER TABLE `board-category` DISABLE KEYS */;
INSERT INTO `board-category` VALUES (1,'공지사항',1,'팀',1,1),(8,'공지사항',2,'팀',4,3),(9,'자유',2,'팀',3,3),(10,'경기관련',2,'팀',3,3),(11,'공지사항',3,'팀',4,3),(12,'자유',3,'팀',3,3),(13,'경기관련',3,'팀',3,3),(14,'공지사항',4,'팀',4,3),(15,'자유',4,'팀',3,3),(16,'경기관련',4,'팀',3,3),(20,'공지사항',6,'팀',4,3),(21,'자유',6,'팀',3,3),(22,'경기관련',6,'팀',3,3),(23,'공지사항',7,'팀',4,3),(24,'자유',7,'팀',3,3),(25,'경기관련',7,'팀',3,3);
/*!40000 ALTER TABLE `board-category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-21 21:04:47
