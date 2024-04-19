-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: realcoder
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `sno` int NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL,
  `phone` int NOT NULL,
  `msg` char(80) NOT NULL,
  `email` char(80) NOT NULL,
  `DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'my name',123456789,'this is a test msg.','myname@gmail.com',NULL),(2,'hello1',1234556,'hello this is me.','hello@gmail.com',NULL),(3,'name1',123456,'kya haal bhai ke.','name@gmail.com',NULL),(4,'hbhbhb',1234567,'jhghfdfdfsswsfdfggfhghgh','yyguuy@gmail.com',NULL),(5,'hgghgh',21233,'ggfwrtryttyugu.','hgyg@gmail.com',NULL),(6,'kuchhbhi',123456875,'kuchh bhi mt bol bhai.','kuchhbhi@gmail.com',NULL),(7,'name1',122252533,'this is also a test male','name1@gmail.com','2024-01-27 00:03:51'),(8,'chetan',12345677,'hii i m chetan.','chetan@gmail.com','2024-01-27 23:31:48'),(9,'afdggh',1234567,'our mail is sent.','fcgfg@gmail.com','2024-02-01 19:18:36'),(10,'afdggh',1234567,'our mail is sent.','fcgfg@gmail.com','2024-02-01 19:19:42'),(11,'afdggh',1234567,'our mail is sent.','fcgfg@gmail.com','2024-02-01 19:21:34'),(12,'mrcoder',1223244,'mail is sent to gmail','mrcoder@gmail.com','2024-02-01 19:42:04'),(13,'sssdd',123456,'swerffgggg','swefwe@gail.com','2024-02-01 20:06:51'),(14,'vggvu',12456889,'ytfugiguhfytdsaqwewzrdtf','guguyy@gmail.com','2024-02-01 21:52:13'),(15,'hhhb',123455,'bhjjnjkniigyfters','guygu@gmail.com','2024-02-01 21:57:38'),(16,'hhhb',123455,'bhjjnjkniigyfters','guygu@gmail.com','2024-02-01 22:01:51'),(17,'hhhb',123455,'bhjjnjkniigyfters','guygu@gmail.com','2024-02-01 22:01:57'),(18,'gghhhj',23456,'hjeetrytyuuy','fgc@gail.com','2024-02-01 22:03:50'),(19,'ggwefywfe',1234556,'cbsdhcddweedw.','svdj@gmail.com','2024-02-02 19:09:01'),(20,'guyuy',12345,'ftfydrsrduu','guygu@gmail.com','2024-02-02 19:10:33'),(21,'helloname',4567823,'this is a test mail to send gmail.','hello@gmail.com','2024-02-02 19:29:36'),(22,'guyuy',12345,'ftfydrsrduu','guygu@gmail.com','2024-02-02 19:29:49'),(23,'hello2',243566,'send ho ja mail pe.','hello2@gmail.com','2024-02-02 19:33:01'),(24,'hello2',243566,'send ho ja mail pe.','hello2@gmail.com','2024-02-02 19:39:29'),(25,'mrsingh',123456,'hello i m mr singh','mrsingh@gmail.com','2024-02-02 19:42:28'),(26,'rohit',23451,'hey bhai i m rohit.','rohit@gmail.com','2024-02-02 22:50:15'),(27,'djkddh',1234556,'hiuhuiehrfoierjfoier','svdj@gmail.com','2024-04-14 19:53:38');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `Sno` int NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `tagline` tinytext NOT NULL,
  `name` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(15) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Sno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'What is World Wide Web (WWW, W3)?','Network of networks.','shivam kumar','first-post','The World Wide Web -- also known as the web, WWW or W3 -- refers to all the public websites or pages that users can access on their local computers and other devices through the internet. These pages and documents are interconnected by means of hyperlinks that users click on for information. This information can be in different formats, including text, images, audio and video.','post1-bg.jpg','2024-04-14 21:39:37'),(2,'THIS IS MY SECOND POST','','RAGHAV SINGH','second-post','This the the second post i m writting on my page.so we will talked about AI.','data.jpg','2024-04-13 14:54:25'),(3,'Lets know about data science','','admin','third-post','Data science is the study of data to extract meaningful insights for business. It is a multidisciplinary approach that combines principles and practices from the fields of mathematics, statistics, artificial intelligence, and computer engineering to analyze large amounts of data.',NULL,'2024-04-13 16:10:46'),(4,'Lets know about artificial intelligence','','sachin','fourth-post','Data science is the study of data to extract meaningful insights for business. It is a multidisciplinary approach that combines principles and practices from the fields of mathematics, statistics, artificial intelligence, and computer engineering to analyze large amounts of data.',NULL,'2024-04-13 16:10:59'),(5,'Lets know about MACHINE LEARNING','','shivam kumar','fifth-post','Data science is the study of data to extract meaningful insights for business. It is a multidisciplinary approach that combines principles and practices from the fields of mathematics, statistics, artificial intelligence, and computer engineering to analyze large amounts of data.',NULL,'2024-04-13 16:13:23');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-15 19:28:46
