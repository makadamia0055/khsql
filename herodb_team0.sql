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
  PRIMARY KEY (`tm_num`),
  UNIQUE KEY `tm_name` (`tm_name`),
  KEY `FK_region_TO_team_1` (`tm_re_num`),
  KEY `FK_members_TO_team_1` (`tm_me_id`),
  CONSTRAINT `FK_members_TO_team_1` FOREIGN KEY (`tm_me_id`) REFERENCES `members` (`me_id`),
  CONSTRAINT `FK_region_TO_team_1` FOREIGN KEY (`tm_re_num`) REFERENCES `region` (`re_num`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'단또즈','2023-03-23','',1,1,1,'asd123','활동중',''),(8,'피그즈','2023-03-27','우린 늘 배고프다.',1,1,1,'asd123','심사중','/2023/03/27/8b731dd2-dc98-4240-8164-99217fefc650_pig.png'),(29,'미스터옥토퍼스','2023-03-28','문어',1,1,1,'asd123','심사중','/2023/03/28/e1cfa9ca-5810-49e8-af8f-f3e65d58f521_1864491.png'),(30,'댕댕즈','2023-03-28','멍ㅁ엉',1,1,1,'asd123','활동중','/2023/03/28/5aa71844-f965-48de-a2c7-613580b63647_강아지.png'),(31,'돌핀즈','2023-03-28','고래고래',1,0,1,'asd123','심사중','/2023/03/28/3fd79c59-e972-4d2a-820a-767ce0ead0ae_돌고래.png'),(32,'dd','2023-03-29','',1,1,1,'asd123','승인불가','/2023/03/29/e66f4c1c-2f56-45f7-8ed1-26093feda8b7_'),(34,'ㅇㄴㅁㅇ','2023-03-29','',1,1,1,'asd123','승인불가','/2023/03/29/7367f520-2f77-4c98-8bbf-7869a2477835_'),(37,'메로나ㅇ','2023-03-29','',1,1,1,'asd123','활동중',NULL),(39,'고래밥','2023-03-29','',1,1,1,'asd123','활동중',NULL),(41,'오리온 고래밥','2023-03-29','',1,1,1,'asd123','활동중',NULL),(43,'도미노피자','2023-03-29','',1,1,1,'asd123','활동중',NULL),(44,'도선동','2023-03-29','',1,1,1,'asd123','활동중',NULL),(45,'스파이더맨','2023-03-29','스파이더맨',2,1,2,'asd123','활동중','/2023/03/29/545a5591-487b-4289-bec3-3e48a90d50fd_다운로드.jpg');
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

-- Dump completed on 2023-03-29 21:49:08
