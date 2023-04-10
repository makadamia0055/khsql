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
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `tm_num` int NOT NULL AUTO_INCREMENT,
  `tm_name` varchar(8) DEFAULT NULL,
  `tm_startday` date DEFAULT NULL,
  `tm_slogan` varchar(25) DEFAULT NULL,
  `tm_re_num` int NOT NULL,
  `tm_openformatch` tinyint(1) DEFAULT NULL,
  `tm_teamgender` int DEFAULT NULL,
  `tm_me_id` varchar(13) NOT NULL,
  `tm_teamstate` varchar(10) DEFAULT NULL,
  `tm_team_img` varchar(255) DEFAULT NULL,
  `tm_team_introduce` longtext,
  PRIMARY KEY (`tm_num`),
  UNIQUE KEY `tm_name` (`tm_name`),
  KEY `FK_region_TO_team_1` (`tm_re_num`),
  KEY `FK_members_TO_team_1` (`tm_me_id`),
  CONSTRAINT `FK_members_TO_team_1` FOREIGN KEY (`tm_me_id`) REFERENCES `members` (`me_id`),
  CONSTRAINT `FK_region_TO_team_1` FOREIGN KEY (`tm_re_num`) REFERENCES `region` (`re_num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'단또즈','2023-03-23','단또단또',1,1,1,'asd123','활동중','/디폴트이미지/고양이로고.png','요호'),(2,'차돌박이','2023-04-10','차돌박이 100g 세일',1,1,1,'asd123123','활동중','/디폴트이미지/흑우즈.png','이히'),(3,'길냥이다','2023-04-10','길냥이다',1,1,1,'rkskek123','활동중','/디폴트이미지/고양이2.png','라아'),(4,'댕댕이야구단','2023-04-20','개같이 플레이 합니다',2,1,1,'rkskek234','활동중','/디폴트이미지/강아지.png','나노'),(5,'항정살가브리살','2023-04-03','돼지입니다',3,0,2,'ekfkak123','활동중','/디폴트이미지/돼지.png','추차'),(6,'양쯔강돌고래','2023-04-06','양쯔강 돌고래 떼죽음',1,0,3,'ekfkak234','활동중','/디폴트이미지/돌고래.png','댜ㅏ');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-10 21:42:22
