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
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `me_id` varchar(13) NOT NULL,
  `me_pw` varchar(20) NOT NULL,
  `me_name` varchar(35) NOT NULL,
  `me_gender` int DEFAULT NULL,
  `me_nickname` varchar(13) NOT NULL,
  `me_tel` varchar(11) DEFAULT NULL,
  `me_mail` varchar(50) NOT NULL,
  `me_siteauth` int DEFAULT (0),
  `me_ma_num` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`me_id`),
  KEY `FK_member-authority_TO_members_1` (`me_ma_num`),
  CONSTRAINT `FK_member-authority_TO_members_1` FOREIGN KEY (`me_ma_num`) REFERENCES `member-authority` (`ma_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('admin123','admin123!','관리자',2,'관리자','01012341234','admin123@admin.admin',9,1),('asd123','asd123','에이에스디',1,'에이에스디','01001010101','makend91',1,1),('asd123123','asd123123','일이삼',2,'일이삼','01001010101','makend91',1,1),('ekfkak123','ekfkak123!','다라마',2,'다라마','01011111113','ekfkak@ekfkak.ekfkak',0,1),('ekfkak234','ekfkak234!','다란마',1,'다란마','01022222222','ekfkak234@ekfkak.ekfkak',0,1),('league123','league123!','리그관리자',1,'리그','01055555555','flrm@flrm.flrm',1,1),('record123','record123!','기록',1,'기록','01099999999','rlfhr@rlfhr.rlfhr',1,4),('rkskek123','rkskek123!','가나다',1,'가나다','01011111111','rkskek@rkskek.rkskek',1,1),('rkskek234','rkskek234!','가난다',1,'가난다','01011111112','rkskek234@rkskek.rkskek',1,1);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
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
