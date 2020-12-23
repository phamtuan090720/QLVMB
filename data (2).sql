-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: qlbanvemaybay
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `chuyenbay`
--

DROP TABLE IF EXISTS `chuyenbay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chuyenbay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `thoiDiemKhoiHanh` datetime NOT NULL,
  `thoiGianBay` time NOT NULL,
  `tuyenBayId` int NOT NULL,
  `mayBayId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tuyenBayId` (`tuyenBayId`),
  KEY `mayBayId` (`mayBayId`),
  CONSTRAINT `chuyenbay_ibfk_1` FOREIGN KEY (`tuyenBayId`) REFERENCES `tuyenbay` (`id`),
  CONSTRAINT `chuyenbay_ibfk_2` FOREIGN KEY (`mayBayId`) REFERENCES `maybay` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuyenbay`
--

LOCK TABLES `chuyenbay` WRITE;
/*!40000 ALTER TABLE `chuyenbay` DISABLE KEYS */;
INSERT INTO `chuyenbay` VALUES (1,'2020-12-20 19:30:00','01:00:00',57,1),(2,'2020-12-20 19:30:00','03:00:00',57,2),(7,'2020-12-22 15:29:55','01:30:00',73,1),(8,'2020-12-22 15:29:55','01:30:00',73,1),(9,'2020-12-22 18:30:00','01:30:00',60,1),(10,'2020-12-22 18:15:00','01:30:00',57,1);
/*!40000 ALTER TABLE `chuyenbay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghe`
--

DROP TABLE IF EXISTS `ghe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maGhe` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loaiGhe` enum('Vip','Normal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `trangThai` enum('Đã Đặt','Chưa Đặt') COLLATE utf8mb4_unicode_ci NOT NULL,
  `mayBayId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mayBayId` (`mayBayId`),
  CONSTRAINT `ghe_ibfk_1` FOREIGN KEY (`mayBayId`) REFERENCES `maybay` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=564 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghe`
--

LOCK TABLES `ghe` WRITE;
/*!40000 ALTER TABLE `ghe` DISABLE KEYS */;
INSERT INTO `ghe` VALUES (204,'V0','Vip','Đã Đặt',1),(205,'V1','Vip','Đã Đặt',1),(206,'V2','Vip','Đã Đặt',1),(207,'V3','Vip','Đã Đặt',1),(208,'V4','Vip','Đã Đặt',1),(209,'V5','Vip','Đã Đặt',1),(210,'V6','Vip','Đã Đặt',1),(211,'V7','Vip','Đã Đặt',1),(212,'V8','Vip','Chưa Đặt',1),(213,'V9','Vip','Chưa Đặt',1),(214,'V10','Vip','Chưa Đặt',1),(215,'V11','Vip','Chưa Đặt',1),(216,'V12','Vip','Chưa Đặt',1),(217,'V13','Vip','Chưa Đặt',1),(218,'V14','Vip','Chưa Đặt',1),(219,'V15','Vip','Chưa Đặt',1),(220,'V16','Vip','Chưa Đặt',1),(221,'V17','Vip','Chưa Đặt',1),(222,'V18','Vip','Chưa Đặt',1),(223,'V19','Vip','Chưa Đặt',1),(224,'N0','Normal','Đã Đặt',1),(225,'N1','Normal','Chưa Đặt',1),(226,'N2','Normal','Chưa Đặt',1),(227,'N3','Normal','Chưa Đặt',1),(228,'N4','Normal','Chưa Đặt',1),(229,'N5','Normal','Chưa Đặt',1),(230,'N6','Normal','Chưa Đặt',1),(231,'N7','Normal','Chưa Đặt',1),(232,'N8','Normal','Chưa Đặt',1),(233,'N9','Normal','Chưa Đặt',1),(234,'N10','Normal','Chưa Đặt',1),(235,'N11','Normal','Chưa Đặt',1),(236,'N12','Normal','Chưa Đặt',1),(237,'N13','Normal','Chưa Đặt',1),(238,'N14','Normal','Chưa Đặt',1),(239,'N15','Normal','Chưa Đặt',1),(240,'N16','Normal','Chưa Đặt',1),(241,'N17','Normal','Chưa Đặt',1),(242,'N18','Normal','Chưa Đặt',1),(243,'N19','Normal','Chưa Đặt',1),(244,'N20','Normal','Chưa Đặt',1),(245,'N21','Normal','Chưa Đặt',1),(246,'N22','Normal','Chưa Đặt',1),(247,'N23','Normal','Chưa Đặt',1),(248,'N24','Normal','Chưa Đặt',1),(249,'N25','Normal','Chưa Đặt',1),(250,'N26','Normal','Chưa Đặt',1),(251,'N27','Normal','Chưa Đặt',1),(252,'N28','Normal','Chưa Đặt',1),(253,'N29','Normal','Chưa Đặt',1),(254,'N30','Normal','Chưa Đặt',1),(255,'N31','Normal','Chưa Đặt',1),(256,'N32','Normal','Chưa Đặt',1),(257,'N33','Normal','Chưa Đặt',1),(258,'N34','Normal','Chưa Đặt',1),(259,'N35','Normal','Chưa Đặt',1),(260,'N36','Normal','Chưa Đặt',1),(261,'N37','Normal','Chưa Đặt',1),(262,'N38','Normal','Chưa Đặt',1),(263,'N39','Normal','Chưa Đặt',1),(264,'V0','Vip','Chưa Đặt',1),(265,'V1','Vip','Chưa Đặt',1),(266,'V2','Vip','Chưa Đặt',1),(267,'V3','Vip','Chưa Đặt',1),(268,'V4','Vip','Chưa Đặt',1),(269,'V5','Vip','Chưa Đặt',1),(270,'V6','Vip','Chưa Đặt',1),(271,'V7','Vip','Chưa Đặt',1),(272,'V8','Vip','Chưa Đặt',1),(273,'V9','Vip','Chưa Đặt',1),(274,'V10','Vip','Chưa Đặt',1),(275,'V11','Vip','Chưa Đặt',1),(276,'V12','Vip','Chưa Đặt',1),(277,'V13','Vip','Chưa Đặt',1),(278,'V14','Vip','Chưa Đặt',1),(279,'V15','Vip','Chưa Đặt',1),(280,'V16','Vip','Chưa Đặt',1),(281,'V17','Vip','Chưa Đặt',1),(282,'V18','Vip','Chưa Đặt',1),(283,'V19','Vip','Chưa Đặt',1),(284,'N0','Normal','Chưa Đặt',1),(285,'N1','Normal','Chưa Đặt',1),(286,'N2','Normal','Chưa Đặt',1),(287,'N3','Normal','Chưa Đặt',1),(288,'N4','Normal','Chưa Đặt',1),(289,'N5','Normal','Chưa Đặt',1),(290,'N6','Normal','Chưa Đặt',1),(291,'N7','Normal','Chưa Đặt',1),(292,'N8','Normal','Chưa Đặt',1),(293,'N9','Normal','Chưa Đặt',1),(294,'N10','Normal','Chưa Đặt',1),(295,'N11','Normal','Chưa Đặt',1),(296,'N12','Normal','Chưa Đặt',1),(297,'N13','Normal','Chưa Đặt',1),(298,'N14','Normal','Chưa Đặt',1),(299,'N15','Normal','Chưa Đặt',1),(300,'N16','Normal','Chưa Đặt',1),(301,'N17','Normal','Chưa Đặt',1),(302,'N18','Normal','Chưa Đặt',1),(303,'N19','Normal','Chưa Đặt',1),(304,'N20','Normal','Chưa Đặt',1),(305,'N21','Normal','Chưa Đặt',1),(306,'N22','Normal','Chưa Đặt',1),(307,'N23','Normal','Chưa Đặt',1),(308,'N24','Normal','Chưa Đặt',1),(309,'N25','Normal','Chưa Đặt',1),(310,'N26','Normal','Chưa Đặt',1),(311,'N27','Normal','Chưa Đặt',1),(312,'N28','Normal','Chưa Đặt',1),(313,'N29','Normal','Chưa Đặt',1),(314,'N30','Normal','Chưa Đặt',1),(315,'N31','Normal','Chưa Đặt',1),(316,'N32','Normal','Chưa Đặt',1),(317,'N33','Normal','Chưa Đặt',1),(318,'N34','Normal','Chưa Đặt',1),(319,'N35','Normal','Chưa Đặt',1),(320,'N36','Normal','Chưa Đặt',1),(321,'N37','Normal','Chưa Đặt',1),(322,'N38','Normal','Chưa Đặt',1),(323,'N39','Normal','Chưa Đặt',1),(324,'V0','Vip','Chưa Đặt',1),(325,'V1','Vip','Chưa Đặt',1),(326,'V2','Vip','Chưa Đặt',1),(327,'V3','Vip','Chưa Đặt',1),(328,'V4','Vip','Chưa Đặt',1),(329,'V5','Vip','Chưa Đặt',1),(330,'V6','Vip','Chưa Đặt',1),(331,'V7','Vip','Chưa Đặt',1),(332,'V8','Vip','Chưa Đặt',1),(333,'V9','Vip','Chưa Đặt',1),(334,'V10','Vip','Chưa Đặt',1),(335,'V11','Vip','Chưa Đặt',1),(336,'V12','Vip','Chưa Đặt',1),(337,'V13','Vip','Chưa Đặt',1),(338,'V14','Vip','Chưa Đặt',1),(339,'V15','Vip','Chưa Đặt',1),(340,'V16','Vip','Chưa Đặt',1),(341,'V17','Vip','Chưa Đặt',1),(342,'V18','Vip','Chưa Đặt',1),(343,'V19','Vip','Chưa Đặt',1),(344,'N0','Normal','Chưa Đặt',1),(345,'N1','Normal','Chưa Đặt',1),(346,'V0','Vip','Chưa Đặt',1),(347,'N2','Normal','Chưa Đặt',1),(348,'V1','Vip','Chưa Đặt',1),(349,'N3','Normal','Chưa Đặt',1),(350,'V2','Vip','Chưa Đặt',1),(351,'N4','Normal','Chưa Đặt',1),(352,'V3','Vip','Chưa Đặt',1),(353,'N5','Normal','Chưa Đặt',1),(354,'V4','Vip','Chưa Đặt',1),(355,'N6','Normal','Chưa Đặt',1),(356,'V5','Vip','Chưa Đặt',1),(357,'N7','Normal','Chưa Đặt',1),(358,'V6','Vip','Chưa Đặt',1),(359,'N8','Normal','Chưa Đặt',1),(360,'V7','Vip','Chưa Đặt',1),(361,'N9','Normal','Chưa Đặt',1),(362,'V8','Vip','Chưa Đặt',1),(363,'N10','Normal','Chưa Đặt',1),(364,'V9','Vip','Chưa Đặt',1),(365,'N11','Normal','Chưa Đặt',1),(366,'V10','Vip','Chưa Đặt',1),(367,'N12','Normal','Chưa Đặt',1),(368,'V11','Vip','Chưa Đặt',1),(369,'N13','Normal','Chưa Đặt',1),(370,'V12','Vip','Chưa Đặt',1),(371,'N14','Normal','Chưa Đặt',1),(372,'V13','Vip','Chưa Đặt',1),(373,'N15','Normal','Chưa Đặt',1),(374,'V14','Vip','Chưa Đặt',1),(375,'N16','Normal','Chưa Đặt',1),(376,'V15','Vip','Chưa Đặt',1),(377,'N17','Normal','Chưa Đặt',1),(378,'V16','Vip','Chưa Đặt',1),(379,'N18','Normal','Chưa Đặt',1),(380,'V17','Vip','Chưa Đặt',1),(381,'N19','Normal','Chưa Đặt',1),(382,'V18','Vip','Chưa Đặt',1),(383,'N20','Normal','Chưa Đặt',1),(384,'V19','Vip','Chưa Đặt',1),(385,'N21','Normal','Chưa Đặt',1),(386,'N0','Normal','Chưa Đặt',1),(387,'N22','Normal','Chưa Đặt',1),(388,'N1','Normal','Chưa Đặt',1),(389,'N23','Normal','Chưa Đặt',1),(390,'N2','Normal','Chưa Đặt',1),(391,'N24','Normal','Chưa Đặt',1),(392,'N3','Normal','Chưa Đặt',1),(393,'N25','Normal','Chưa Đặt',1),(394,'N4','Normal','Chưa Đặt',1),(395,'N26','Normal','Chưa Đặt',1),(396,'N5','Normal','Chưa Đặt',1),(397,'N27','Normal','Chưa Đặt',1),(398,'N6','Normal','Chưa Đặt',1),(399,'N28','Normal','Chưa Đặt',1),(400,'N7','Normal','Chưa Đặt',1),(401,'N29','Normal','Chưa Đặt',1),(402,'N8','Normal','Chưa Đặt',1),(403,'N30','Normal','Chưa Đặt',1),(404,'N9','Normal','Chưa Đặt',1),(405,'N31','Normal','Chưa Đặt',1),(406,'N10','Normal','Chưa Đặt',1),(407,'N32','Normal','Chưa Đặt',1),(408,'N11','Normal','Chưa Đặt',1),(409,'N33','Normal','Chưa Đặt',1),(410,'N12','Normal','Chưa Đặt',1),(411,'N34','Normal','Chưa Đặt',1),(412,'N13','Normal','Chưa Đặt',1),(413,'N35','Normal','Chưa Đặt',1),(414,'N14','Normal','Chưa Đặt',1),(415,'N36','Normal','Chưa Đặt',1),(416,'N15','Normal','Chưa Đặt',1),(417,'N37','Normal','Chưa Đặt',1),(418,'N16','Normal','Chưa Đặt',1),(419,'N38','Normal','Chưa Đặt',1),(420,'N17','Normal','Chưa Đặt',1),(421,'N39','Normal','Chưa Đặt',1),(422,'N18','Normal','Chưa Đặt',1),(423,'N19','Normal','Chưa Đặt',1),(424,'N20','Normal','Chưa Đặt',1),(425,'N21','Normal','Chưa Đặt',1),(426,'N22','Normal','Chưa Đặt',1),(427,'N23','Normal','Chưa Đặt',1),(428,'N24','Normal','Chưa Đặt',1),(429,'N25','Normal','Chưa Đặt',1),(430,'N26','Normal','Chưa Đặt',1),(431,'N27','Normal','Chưa Đặt',1),(432,'N28','Normal','Chưa Đặt',1),(433,'N29','Normal','Chưa Đặt',1),(434,'N30','Normal','Chưa Đặt',1),(435,'N31','Normal','Chưa Đặt',1),(436,'N32','Normal','Chưa Đặt',1),(437,'N33','Normal','Chưa Đặt',1),(438,'N34','Normal','Chưa Đặt',1),(439,'N35','Normal','Chưa Đặt',1),(440,'N36','Normal','Chưa Đặt',1),(441,'N37','Normal','Chưa Đặt',1),(442,'N38','Normal','Chưa Đặt',1),(443,'N39','Normal','Chưa Đặt',1),(444,'V0','Vip','Chưa Đặt',1),(445,'V1','Vip','Chưa Đặt',1),(446,'V2','Vip','Chưa Đặt',1),(447,'V3','Vip','Chưa Đặt',1),(448,'V4','Vip','Chưa Đặt',1),(449,'V5','Vip','Chưa Đặt',1),(450,'V6','Vip','Chưa Đặt',1),(451,'V7','Vip','Chưa Đặt',1),(452,'V8','Vip','Chưa Đặt',1),(453,'V9','Vip','Chưa Đặt',1),(454,'V10','Vip','Chưa Đặt',1),(455,'V11','Vip','Chưa Đặt',1),(456,'V12','Vip','Chưa Đặt',1),(457,'V13','Vip','Chưa Đặt',1),(458,'V14','Vip','Chưa Đặt',1),(459,'V15','Vip','Chưa Đặt',1),(460,'V16','Vip','Chưa Đặt',1),(461,'V17','Vip','Chưa Đặt',1),(462,'V18','Vip','Chưa Đặt',1),(463,'V19','Vip','Chưa Đặt',1),(464,'N0','Normal','Chưa Đặt',1),(465,'N1','Normal','Chưa Đặt',1),(466,'N2','Normal','Chưa Đặt',1),(467,'N3','Normal','Chưa Đặt',1),(468,'N4','Normal','Chưa Đặt',1),(469,'N5','Normal','Chưa Đặt',1),(470,'N6','Normal','Chưa Đặt',1),(471,'N7','Normal','Chưa Đặt',1),(472,'N8','Normal','Chưa Đặt',1),(473,'N9','Normal','Chưa Đặt',1),(474,'N10','Normal','Chưa Đặt',1),(475,'N11','Normal','Chưa Đặt',1),(476,'N12','Normal','Chưa Đặt',1),(477,'N13','Normal','Chưa Đặt',1),(478,'N14','Normal','Chưa Đặt',1),(479,'N15','Normal','Chưa Đặt',1),(480,'N16','Normal','Chưa Đặt',1),(481,'N17','Normal','Chưa Đặt',1),(482,'N18','Normal','Chưa Đặt',1),(483,'N19','Normal','Chưa Đặt',1),(484,'N20','Normal','Chưa Đặt',1),(485,'N21','Normal','Chưa Đặt',1),(486,'N22','Normal','Chưa Đặt',1),(487,'N23','Normal','Chưa Đặt',1),(488,'N24','Normal','Chưa Đặt',1),(489,'N25','Normal','Chưa Đặt',1),(490,'N26','Normal','Chưa Đặt',1),(491,'N27','Normal','Chưa Đặt',1),(492,'N28','Normal','Chưa Đặt',1),(493,'N29','Normal','Chưa Đặt',1),(494,'N30','Normal','Chưa Đặt',1),(495,'N31','Normal','Chưa Đặt',1),(496,'N32','Normal','Chưa Đặt',1),(497,'N33','Normal','Chưa Đặt',1),(498,'N34','Normal','Chưa Đặt',1),(499,'N35','Normal','Chưa Đặt',1),(500,'N36','Normal','Chưa Đặt',1),(501,'N37','Normal','Chưa Đặt',1),(502,'N38','Normal','Chưa Đặt',1),(503,'N39','Normal','Chưa Đặt',1),(504,'V0','Vip','Chưa Đặt',1),(505,'V1','Vip','Chưa Đặt',1),(506,'V2','Vip','Chưa Đặt',1),(507,'V3','Vip','Chưa Đặt',1),(508,'V4','Vip','Chưa Đặt',1),(509,'V5','Vip','Chưa Đặt',1),(510,'V6','Vip','Chưa Đặt',1),(511,'V7','Vip','Chưa Đặt',1),(512,'V8','Vip','Chưa Đặt',1),(513,'V9','Vip','Chưa Đặt',1),(514,'V10','Vip','Chưa Đặt',1),(515,'V11','Vip','Chưa Đặt',1),(516,'V12','Vip','Chưa Đặt',1),(517,'V13','Vip','Chưa Đặt',1),(518,'V14','Vip','Chưa Đặt',1),(519,'V15','Vip','Chưa Đặt',1),(520,'V16','Vip','Chưa Đặt',1),(521,'V17','Vip','Chưa Đặt',1),(522,'V18','Vip','Chưa Đặt',1),(523,'V19','Vip','Chưa Đặt',1),(524,'N0','Normal','Chưa Đặt',1),(525,'N1','Normal','Chưa Đặt',1),(526,'N2','Normal','Chưa Đặt',1),(527,'N3','Normal','Chưa Đặt',1),(528,'N4','Normal','Chưa Đặt',1),(529,'N5','Normal','Chưa Đặt',1),(530,'N6','Normal','Chưa Đặt',1),(531,'N7','Normal','Chưa Đặt',1),(532,'N8','Normal','Chưa Đặt',1),(533,'N9','Normal','Chưa Đặt',1),(534,'N10','Normal','Chưa Đặt',1),(535,'N11','Normal','Chưa Đặt',1),(536,'N12','Normal','Chưa Đặt',1),(537,'N13','Normal','Chưa Đặt',1),(538,'N14','Normal','Chưa Đặt',1),(539,'N15','Normal','Chưa Đặt',1),(540,'N16','Normal','Chưa Đặt',1),(541,'N17','Normal','Chưa Đặt',1),(542,'N18','Normal','Chưa Đặt',1),(543,'N19','Normal','Chưa Đặt',1),(544,'N20','Normal','Chưa Đặt',1),(545,'N21','Normal','Chưa Đặt',1),(546,'N22','Normal','Chưa Đặt',1),(547,'N23','Normal','Chưa Đặt',1),(548,'N24','Normal','Chưa Đặt',1),(549,'N25','Normal','Chưa Đặt',1),(550,'N26','Normal','Chưa Đặt',1),(551,'N27','Normal','Chưa Đặt',1),(552,'N28','Normal','Chưa Đặt',1),(553,'N29','Normal','Chưa Đặt',1),(554,'N30','Normal','Chưa Đặt',1),(555,'N31','Normal','Chưa Đặt',1),(556,'N32','Normal','Chưa Đặt',1),(557,'N33','Normal','Chưa Đặt',1),(558,'N34','Normal','Chưa Đặt',1),(559,'N35','Normal','Chưa Đặt',1),(560,'N36','Normal','Chưa Đặt',1),(561,'N37','Normal','Chưa Đặt',1),(562,'N38','Normal','Chưa Đặt',1),(563,'N39','Normal','Chưa Đặt',1);
/*!40000 ALTER TABLE `ghe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenKhachHang` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaySinh` date NOT NULL,
  `diaChi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CMND` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soDienThoai` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (1,'1','2020-12-17','1','123','123'),(10,'Pham Tuan ','2000-09-07','026020643','0363902003','0363902003'),(12,'Pham Tuan ','2020-12-17','026020643','12345678','0363902003'),(13,'Phạm Tuân','2000-07-09','29/3 Tân Hương Tân Phú','123456789','123456789'),(14,'Phạm Tuân','2000-07-09','29/3 Tân Hương Tân Phú','123','0932866623');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maybay`
--

DROP TABLE IF EXISTS `maybay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maybay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maMayBay` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soGheLoai1` int DEFAULT NULL,
  `soGheLoai2` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maybay`
--

LOCK TABLES `maybay` WRITE;
/*!40000 ALTER TABLE `maybay` DISABLE KEYS */;
INSERT INTO `maybay` VALUES (1,'MH370',20,40),(2,'MH3701',20,40);
/*!40000 ALTER TABLE `maybay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regulations`
--

DROP TABLE IF EXISTS `regulations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regulations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `thoiGianChoToiThieu` time DEFAULT NULL,
  `thoiGianChoToiDa` time DEFAULT NULL,
  `soSanBayTrungGian` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regulations`
--

LOCK TABLES `regulations` WRITE;
/*!40000 ALTER TABLE `regulations` DISABLE KEYS */;
INSERT INTO `regulations` VALUES (1,'00:10:00','00:20:00',2);
/*!40000 ALTER TABLE `regulations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanbay`
--

DROP TABLE IF EXISTS `sanbay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanbay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenSanBay` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tinhThanh` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tinhThanh` (`tinhThanh`),
  CONSTRAINT `sanbay_ibfk_1` FOREIGN KEY (`tinhThanh`) REFERENCES `tinhthanh` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanbay`
--

LOCK TABLES `sanbay` WRITE;
/*!40000 ALTER TABLE `sanbay` DISABLE KEYS */;
INSERT INTO `sanbay` VALUES (1,'Sân bay Quốc tế Cần Thơ',10),(2,'Sân bay Quốc tế Đà Nẵng	',4),(3,'Sân bay Quốc tế Cát Bi – Hải Phòng',3),(4,'Sân bay Quốc tế Nội Bài – Hà Nội	',2),(5,'Sân bay Quốc tế Tân Sơn Nhất	',1),(6,'Sân bay Quốc tế Cam Ranhq	',7),(7,'Sân bay Quốc tế Phú Quốc	',6),(8,'Sân bay Quốc tế Vinh – Nghệ An	',9),(9,'Sân bay Quốc tế Phú Bài – Huế',8),(10,'Sân Bay Liên Khương',5);
/*!40000 ALTER TABLE `sanbay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanbaychungchuyen`
--

DROP TABLE IF EXISTS `sanbaychungchuyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanbaychungchuyen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `thoiGianDung` time NOT NULL,
  `ghiChu` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chuyenBayId` int NOT NULL,
  `sanBayId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chuyenBayId` (`chuyenBayId`),
  KEY `sanBayId` (`sanBayId`),
  CONSTRAINT `sanbaychungchuyen_ibfk_1` FOREIGN KEY (`chuyenBayId`) REFERENCES `chuyenbay` (`id`),
  CONSTRAINT `sanbaychungchuyen_ibfk_2` FOREIGN KEY (`sanBayId`) REFERENCES `sanbay` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanbaychungchuyen`
--

LOCK TABLES `sanbaychungchuyen` WRITE;
/*!40000 ALTER TABLE `sanbaychungchuyen` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanbaychungchuyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinhthanh`
--

DROP TABLE IF EXISTS `tinhthanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinhthanh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenTinhThanh` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinhthanh`
--

LOCK TABLES `tinhthanh` WRITE;
/*!40000 ALTER TABLE `tinhthanh` DISABLE KEYS */;
INSERT INTO `tinhthanh` VALUES (1,'Thành phố Hồ Chí Minh'),(2,'Hà Nội'),(3,'Hải Phòng'),(4,'Đà Nẵng'),(5,'Lâm Đồng'),(6,'Kiên Giang'),(7,'Khánh Hòa'),(8,'Thừa Thiên – Huế'),(9,'Nghệ An'),(10,'Cần Thơ');
/*!40000 ALTER TABLE `tinhthanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuyenbay`
--

DROP TABLE IF EXISTS `tuyenbay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuyenbay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sanbayDi` int NOT NULL,
  `sanbayDen` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sanbayDi` (`sanbayDi`),
  KEY `sanbayDen` (`sanbayDen`),
  CONSTRAINT `tuyenbay_ibfk_1` FOREIGN KEY (`sanbayDi`) REFERENCES `sanbay` (`id`),
  CONSTRAINT `tuyenbay_ibfk_2` FOREIGN KEY (`sanbayDen`) REFERENCES `sanbay` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuyenbay`
--

LOCK TABLES `tuyenbay` WRITE;
/*!40000 ALTER TABLE `tuyenbay` DISABLE KEYS */;
INSERT INTO `tuyenbay` VALUES (57,1,2),(58,1,3),(59,1,4),(60,1,5),(61,1,6),(62,1,7),(63,1,8),(64,1,9),(65,1,10),(66,2,1),(67,3,1),(68,4,1),(69,5,1),(70,6,1),(71,7,1),(72,8,1),(73,9,1),(74,10,1),(75,2,3),(76,2,4),(77,2,5),(78,2,6),(79,2,7),(80,2,8),(81,2,9),(82,2,10),(83,3,2),(84,4,2),(85,5,2),(86,6,2),(87,7,2),(88,8,2),(89,9,2),(90,10,2),(91,3,4),(92,3,5),(93,3,6),(94,3,7),(95,3,8),(96,3,9),(97,3,10),(98,4,3),(99,5,3),(100,6,3),(101,7,3),(102,8,3),(103,9,3),(104,10,3),(105,4,5),(106,4,6),(107,4,7),(108,4,8),(109,4,9),(110,4,10),(111,5,4),(112,6,4),(113,7,4),(114,8,4),(115,9,4),(116,10,4),(117,5,6),(118,5,7),(119,5,8),(120,5,9),(121,5,10),(122,6,5),(123,7,5),(124,8,5),(125,9,5),(126,10,5),(127,6,7),(128,6,8),(129,6,9),(130,6,10),(131,7,6),(132,8,6),(133,9,6),(134,10,6),(135,7,8),(136,7,9),(137,7,10),(138,8,7),(139,9,7),(140,10,7),(141,8,9),(142,8,10),(143,9,8),(144,10,8),(145,9,10),(146,10,9);
/*!40000 ALTER TABLE `tuyenbay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sdt` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_role` enum('USER','ADMIN') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Tuân',1,'admin','5aee410122e9d1d76f194496cb2f90de','1','1','ADMIN');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ve`
--

DROP TABLE IF EXISTS `ve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ve` (
  `id` int NOT NULL,
  `ve_khachHang` int DEFAULT NULL,
  `ve_nhanvien` int DEFAULT NULL,
  `ve_chuyenbay` int NOT NULL,
  `ngayXuatVe` datetime DEFAULT NULL,
  `gia` float DEFAULT NULL,
  `trangThaiDat` enum('Đã Đặt','Chưa Đặt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ve_khachHang` (`ve_khachHang`),
  KEY `ve_nhanvien` (`ve_nhanvien`),
  KEY `ve_chuyenbay` (`ve_chuyenbay`),
  CONSTRAINT `ve_ibfk_1` FOREIGN KEY (`id`) REFERENCES `ghe` (`id`),
  CONSTRAINT `ve_ibfk_2` FOREIGN KEY (`ve_khachHang`) REFERENCES `khachhang` (`id`),
  CONSTRAINT `ve_ibfk_3` FOREIGN KEY (`ve_nhanvien`) REFERENCES `user` (`id`),
  CONSTRAINT `ve_ibfk_4` FOREIGN KEY (`ve_chuyenbay`) REFERENCES `chuyenbay` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ve`
--

LOCK TABLES `ve` WRITE;
/*!40000 ALTER TABLE `ve` DISABLE KEYS */;
INSERT INTO `ve` VALUES (204,10,1,1,'2020-12-18 16:03:53',10,'Đã Đặt'),(205,10,1,1,'2020-12-18 16:04:00',10,'Đã Đặt'),(206,13,1,1,'2020-12-19 00:00:00',10,'Đã Đặt'),(207,13,1,1,'2020-12-19 18:06:51',10,'Đã Đặt'),(208,13,1,1,'2020-12-19 18:09:27',10,'Đã Đặt'),(209,13,1,1,'2020-12-19 18:11:10',10,'Đã Đặt'),(210,13,1,1,'2020-12-20 13:57:57',10,'Đã Đặt'),(211,13,1,1,'2020-12-19 18:06:51',10,'Đã Đặt'),(212,NULL,NULL,1,NULL,10,'Chưa Đặt'),(213,NULL,NULL,1,NULL,10,'Chưa Đặt'),(214,NULL,NULL,1,NULL,10,'Chưa Đặt'),(215,NULL,NULL,1,NULL,10,'Chưa Đặt'),(216,NULL,NULL,1,NULL,10,'Chưa Đặt'),(217,NULL,NULL,1,NULL,10,'Chưa Đặt'),(218,NULL,NULL,1,NULL,10,'Chưa Đặt'),(219,NULL,NULL,1,NULL,10,'Chưa Đặt'),(220,NULL,NULL,1,NULL,10,'Chưa Đặt'),(221,NULL,NULL,1,NULL,10,'Chưa Đặt'),(222,NULL,NULL,1,NULL,10,'Chưa Đặt'),(223,NULL,NULL,1,NULL,10,'Chưa Đặt'),(224,12,1,1,'2020-12-18 00:15:00',5,'Đã Đặt'),(225,NULL,NULL,1,NULL,5,'Chưa Đặt'),(226,NULL,NULL,1,NULL,5,'Chưa Đặt'),(227,NULL,NULL,1,NULL,5,'Chưa Đặt'),(228,NULL,NULL,1,NULL,5,'Chưa Đặt'),(229,NULL,NULL,1,NULL,5,'Chưa Đặt'),(230,NULL,NULL,1,NULL,5,'Chưa Đặt'),(231,NULL,NULL,1,NULL,5,'Chưa Đặt'),(232,NULL,NULL,1,NULL,5,'Chưa Đặt'),(233,NULL,NULL,1,NULL,5,'Chưa Đặt'),(234,NULL,NULL,1,NULL,5,'Chưa Đặt'),(235,NULL,NULL,1,NULL,5,'Chưa Đặt'),(236,NULL,NULL,1,NULL,5,'Chưa Đặt'),(237,NULL,NULL,1,NULL,5,'Chưa Đặt'),(238,NULL,NULL,1,NULL,5,'Chưa Đặt'),(239,NULL,NULL,1,NULL,5,'Chưa Đặt'),(240,NULL,NULL,1,NULL,5,'Chưa Đặt'),(241,NULL,NULL,1,NULL,5,'Chưa Đặt'),(242,NULL,NULL,1,NULL,5,'Chưa Đặt'),(243,NULL,NULL,1,NULL,5,'Chưa Đặt'),(244,NULL,NULL,1,NULL,5,'Chưa Đặt'),(245,NULL,NULL,1,NULL,5,'Chưa Đặt'),(246,NULL,NULL,1,NULL,5,'Chưa Đặt'),(247,NULL,NULL,1,NULL,5,'Chưa Đặt'),(248,NULL,NULL,1,NULL,5,'Chưa Đặt'),(249,NULL,NULL,1,NULL,5,'Chưa Đặt'),(250,NULL,NULL,1,NULL,5,'Chưa Đặt'),(251,NULL,NULL,1,NULL,5,'Chưa Đặt'),(252,NULL,NULL,1,NULL,5,'Chưa Đặt'),(253,NULL,NULL,1,NULL,5,'Chưa Đặt'),(254,NULL,NULL,1,NULL,5,'Chưa Đặt'),(255,NULL,NULL,1,NULL,5,'Chưa Đặt'),(256,NULL,NULL,1,NULL,5,'Chưa Đặt'),(257,NULL,NULL,1,NULL,5,'Chưa Đặt'),(258,NULL,NULL,1,NULL,5,'Chưa Đặt'),(259,NULL,NULL,1,NULL,5,'Chưa Đặt'),(260,NULL,NULL,1,NULL,5,'Chưa Đặt'),(261,NULL,NULL,1,NULL,5,'Chưa Đặt'),(262,NULL,NULL,1,NULL,5,'Chưa Đặt'),(263,NULL,NULL,1,NULL,5,'Chưa Đặt'),(264,NULL,NULL,1,NULL,10,'Chưa Đặt'),(265,NULL,NULL,1,NULL,10,'Chưa Đặt'),(266,NULL,NULL,1,NULL,10,'Chưa Đặt'),(267,NULL,NULL,1,NULL,10,'Chưa Đặt'),(268,NULL,NULL,1,NULL,10,'Chưa Đặt'),(269,NULL,NULL,1,NULL,10,'Chưa Đặt'),(270,NULL,NULL,1,NULL,10,'Chưa Đặt'),(271,NULL,NULL,1,NULL,10,'Chưa Đặt'),(272,NULL,NULL,1,NULL,10,'Chưa Đặt'),(273,NULL,NULL,1,NULL,10,'Chưa Đặt'),(274,NULL,NULL,1,NULL,10,'Chưa Đặt'),(275,NULL,NULL,1,NULL,10,'Chưa Đặt'),(276,NULL,NULL,1,NULL,10,'Chưa Đặt'),(277,NULL,NULL,1,NULL,10,'Chưa Đặt'),(278,NULL,NULL,1,NULL,10,'Chưa Đặt'),(279,NULL,NULL,1,NULL,10,'Chưa Đặt'),(280,NULL,NULL,1,NULL,10,'Chưa Đặt'),(281,NULL,NULL,1,NULL,10,'Chưa Đặt'),(282,NULL,NULL,1,NULL,10,'Chưa Đặt'),(283,NULL,NULL,1,NULL,10,'Chưa Đặt'),(284,NULL,NULL,1,NULL,5,'Chưa Đặt'),(285,NULL,NULL,1,NULL,5,'Chưa Đặt'),(286,NULL,NULL,1,NULL,5,'Chưa Đặt'),(287,NULL,NULL,1,NULL,5,'Chưa Đặt'),(288,NULL,NULL,1,NULL,5,'Chưa Đặt'),(289,NULL,NULL,1,NULL,5,'Chưa Đặt'),(290,NULL,NULL,1,NULL,5,'Chưa Đặt'),(291,NULL,NULL,1,NULL,5,'Chưa Đặt'),(292,NULL,NULL,1,NULL,5,'Chưa Đặt'),(293,NULL,NULL,1,NULL,5,'Chưa Đặt'),(294,NULL,NULL,1,NULL,5,'Chưa Đặt'),(295,NULL,NULL,1,NULL,5,'Chưa Đặt'),(296,NULL,NULL,1,NULL,5,'Chưa Đặt'),(297,NULL,NULL,1,NULL,5,'Chưa Đặt'),(298,NULL,NULL,1,NULL,5,'Chưa Đặt'),(299,NULL,NULL,1,NULL,5,'Chưa Đặt'),(300,NULL,NULL,1,NULL,5,'Chưa Đặt'),(301,NULL,NULL,1,NULL,5,'Chưa Đặt'),(302,NULL,NULL,1,NULL,5,'Chưa Đặt'),(303,NULL,NULL,1,NULL,5,'Chưa Đặt'),(304,NULL,NULL,1,NULL,5,'Chưa Đặt'),(305,NULL,NULL,1,NULL,5,'Chưa Đặt'),(306,NULL,NULL,1,NULL,5,'Chưa Đặt'),(307,NULL,NULL,1,NULL,5,'Chưa Đặt'),(308,NULL,NULL,1,NULL,5,'Chưa Đặt'),(309,NULL,NULL,1,NULL,5,'Chưa Đặt'),(310,NULL,NULL,1,NULL,5,'Chưa Đặt'),(311,NULL,NULL,1,NULL,5,'Chưa Đặt'),(312,NULL,NULL,1,NULL,5,'Chưa Đặt'),(313,NULL,NULL,1,NULL,5,'Chưa Đặt'),(314,NULL,NULL,1,NULL,5,'Chưa Đặt'),(315,NULL,NULL,1,NULL,5,'Chưa Đặt'),(316,NULL,NULL,1,NULL,5,'Chưa Đặt'),(317,NULL,NULL,1,NULL,5,'Chưa Đặt'),(318,NULL,NULL,1,NULL,5,'Chưa Đặt'),(319,NULL,NULL,1,NULL,5,'Chưa Đặt'),(320,NULL,NULL,1,NULL,5,'Chưa Đặt'),(321,NULL,NULL,1,NULL,5,'Chưa Đặt'),(322,NULL,NULL,1,NULL,5,'Chưa Đặt'),(323,NULL,NULL,1,NULL,5,'Chưa Đặt'),(324,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(325,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(326,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(327,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(328,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(329,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(330,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(331,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(332,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(333,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(334,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(335,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(336,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(337,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(338,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(339,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(340,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(341,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(342,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(343,NULL,NULL,7,NULL,1000,'Chưa Đặt'),(344,NULL,NULL,7,NULL,300,'Chưa Đặt'),(345,NULL,NULL,7,NULL,300,'Chưa Đặt'),(346,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(347,NULL,NULL,7,NULL,300,'Chưa Đặt'),(348,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(349,NULL,NULL,7,NULL,300,'Chưa Đặt'),(350,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(351,NULL,NULL,7,NULL,300,'Chưa Đặt'),(352,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(353,NULL,NULL,7,NULL,300,'Chưa Đặt'),(354,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(355,NULL,NULL,7,NULL,300,'Chưa Đặt'),(356,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(357,NULL,NULL,7,NULL,300,'Chưa Đặt'),(358,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(359,NULL,NULL,7,NULL,300,'Chưa Đặt'),(360,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(361,NULL,NULL,7,NULL,300,'Chưa Đặt'),(362,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(363,NULL,NULL,7,NULL,300,'Chưa Đặt'),(364,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(365,NULL,NULL,7,NULL,300,'Chưa Đặt'),(366,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(367,NULL,NULL,7,NULL,300,'Chưa Đặt'),(368,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(369,NULL,NULL,7,NULL,300,'Chưa Đặt'),(370,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(371,NULL,NULL,7,NULL,300,'Chưa Đặt'),(372,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(373,NULL,NULL,7,NULL,300,'Chưa Đặt'),(374,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(375,NULL,NULL,7,NULL,300,'Chưa Đặt'),(376,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(377,NULL,NULL,7,NULL,300,'Chưa Đặt'),(378,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(379,NULL,NULL,7,NULL,300,'Chưa Đặt'),(380,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(381,NULL,NULL,7,NULL,300,'Chưa Đặt'),(382,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(383,NULL,NULL,7,NULL,300,'Chưa Đặt'),(384,NULL,NULL,8,NULL,1000,'Chưa Đặt'),(385,NULL,NULL,7,NULL,300,'Chưa Đặt'),(386,NULL,NULL,8,NULL,300,'Chưa Đặt'),(387,NULL,NULL,7,NULL,300,'Chưa Đặt'),(388,NULL,NULL,8,NULL,300,'Chưa Đặt'),(389,NULL,NULL,7,NULL,300,'Chưa Đặt'),(390,NULL,NULL,8,NULL,300,'Chưa Đặt'),(391,NULL,NULL,7,NULL,300,'Chưa Đặt'),(392,NULL,NULL,8,NULL,300,'Chưa Đặt'),(393,NULL,NULL,7,NULL,300,'Chưa Đặt'),(394,NULL,NULL,8,NULL,300,'Chưa Đặt'),(395,NULL,NULL,7,NULL,300,'Chưa Đặt'),(396,NULL,NULL,8,NULL,300,'Chưa Đặt'),(397,NULL,NULL,7,NULL,300,'Chưa Đặt'),(398,NULL,NULL,8,NULL,300,'Chưa Đặt'),(399,NULL,NULL,7,NULL,300,'Chưa Đặt'),(400,NULL,NULL,8,NULL,300,'Chưa Đặt'),(401,NULL,NULL,7,NULL,300,'Chưa Đặt'),(402,NULL,NULL,8,NULL,300,'Chưa Đặt'),(403,NULL,NULL,7,NULL,300,'Chưa Đặt'),(404,NULL,NULL,8,NULL,300,'Chưa Đặt'),(405,NULL,NULL,7,NULL,300,'Chưa Đặt'),(406,NULL,NULL,8,NULL,300,'Chưa Đặt'),(407,NULL,NULL,7,NULL,300,'Chưa Đặt'),(408,NULL,NULL,8,NULL,300,'Chưa Đặt'),(409,NULL,NULL,7,NULL,300,'Chưa Đặt'),(410,NULL,NULL,8,NULL,300,'Chưa Đặt'),(411,NULL,NULL,7,NULL,300,'Chưa Đặt'),(412,NULL,NULL,8,NULL,300,'Chưa Đặt'),(413,NULL,NULL,7,NULL,300,'Chưa Đặt'),(414,NULL,NULL,8,NULL,300,'Chưa Đặt'),(415,NULL,NULL,7,NULL,300,'Chưa Đặt'),(416,NULL,NULL,8,NULL,300,'Chưa Đặt'),(417,NULL,NULL,7,NULL,300,'Chưa Đặt'),(418,NULL,NULL,8,NULL,300,'Chưa Đặt'),(419,NULL,NULL,7,NULL,300,'Chưa Đặt'),(420,NULL,NULL,8,NULL,300,'Chưa Đặt'),(421,NULL,NULL,7,NULL,300,'Chưa Đặt'),(422,NULL,NULL,8,NULL,300,'Chưa Đặt'),(423,NULL,NULL,8,NULL,300,'Chưa Đặt'),(424,NULL,NULL,8,NULL,300,'Chưa Đặt'),(425,NULL,NULL,8,NULL,300,'Chưa Đặt'),(426,NULL,NULL,8,NULL,300,'Chưa Đặt'),(427,NULL,NULL,8,NULL,300,'Chưa Đặt'),(428,NULL,NULL,8,NULL,300,'Chưa Đặt'),(429,NULL,NULL,8,NULL,300,'Chưa Đặt'),(430,NULL,NULL,8,NULL,300,'Chưa Đặt'),(431,NULL,NULL,8,NULL,300,'Chưa Đặt'),(432,NULL,NULL,8,NULL,300,'Chưa Đặt'),(433,NULL,NULL,8,NULL,300,'Chưa Đặt'),(434,NULL,NULL,8,NULL,300,'Chưa Đặt'),(435,NULL,NULL,8,NULL,300,'Chưa Đặt'),(436,NULL,NULL,8,NULL,300,'Chưa Đặt'),(437,NULL,NULL,8,NULL,300,'Chưa Đặt'),(438,NULL,NULL,8,NULL,300,'Chưa Đặt'),(439,NULL,NULL,8,NULL,300,'Chưa Đặt'),(440,NULL,NULL,8,NULL,300,'Chưa Đặt'),(441,NULL,NULL,8,NULL,300,'Chưa Đặt'),(442,NULL,NULL,8,NULL,300,'Chưa Đặt'),(443,NULL,NULL,8,NULL,300,'Chưa Đặt'),(444,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(445,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(446,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(447,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(448,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(449,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(450,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(451,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(452,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(453,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(454,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(455,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(456,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(457,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(458,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(459,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(460,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(461,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(462,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(463,NULL,NULL,9,NULL,1000,'Chưa Đặt'),(464,NULL,NULL,9,NULL,300,'Chưa Đặt'),(465,NULL,NULL,9,NULL,300,'Chưa Đặt'),(466,NULL,NULL,9,NULL,300,'Chưa Đặt'),(467,NULL,NULL,9,NULL,300,'Chưa Đặt'),(468,NULL,NULL,9,NULL,300,'Chưa Đặt'),(469,NULL,NULL,9,NULL,300,'Chưa Đặt'),(470,NULL,NULL,9,NULL,300,'Chưa Đặt'),(471,NULL,NULL,9,NULL,300,'Chưa Đặt'),(472,NULL,NULL,9,NULL,300,'Chưa Đặt'),(473,NULL,NULL,9,NULL,300,'Chưa Đặt'),(474,NULL,NULL,9,NULL,300,'Chưa Đặt'),(475,NULL,NULL,9,NULL,300,'Chưa Đặt'),(476,NULL,NULL,9,NULL,300,'Chưa Đặt'),(477,NULL,NULL,9,NULL,300,'Chưa Đặt'),(478,NULL,NULL,9,NULL,300,'Chưa Đặt'),(479,NULL,NULL,9,NULL,300,'Chưa Đặt'),(480,NULL,NULL,9,NULL,300,'Chưa Đặt'),(481,NULL,NULL,9,NULL,300,'Chưa Đặt'),(482,NULL,NULL,9,NULL,300,'Chưa Đặt'),(483,NULL,NULL,9,NULL,300,'Chưa Đặt'),(484,NULL,NULL,9,NULL,300,'Chưa Đặt'),(485,NULL,NULL,9,NULL,300,'Chưa Đặt'),(486,NULL,NULL,9,NULL,300,'Chưa Đặt'),(487,NULL,NULL,9,NULL,300,'Chưa Đặt'),(488,NULL,NULL,9,NULL,300,'Chưa Đặt'),(489,NULL,NULL,9,NULL,300,'Chưa Đặt'),(490,NULL,NULL,9,NULL,300,'Chưa Đặt'),(491,NULL,NULL,9,NULL,300,'Chưa Đặt'),(492,NULL,NULL,9,NULL,300,'Chưa Đặt'),(493,NULL,NULL,9,NULL,300,'Chưa Đặt'),(494,NULL,NULL,9,NULL,300,'Chưa Đặt'),(495,NULL,NULL,9,NULL,300,'Chưa Đặt'),(496,NULL,NULL,9,NULL,300,'Chưa Đặt'),(497,NULL,NULL,9,NULL,300,'Chưa Đặt'),(498,NULL,NULL,9,NULL,300,'Chưa Đặt'),(499,NULL,NULL,9,NULL,300,'Chưa Đặt'),(500,NULL,NULL,9,NULL,300,'Chưa Đặt'),(501,NULL,NULL,9,NULL,300,'Chưa Đặt'),(502,NULL,NULL,9,NULL,300,'Chưa Đặt'),(503,NULL,NULL,9,NULL,300,'Chưa Đặt'),(504,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(505,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(506,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(507,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(508,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(509,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(510,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(511,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(512,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(513,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(514,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(515,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(516,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(517,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(518,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(519,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(520,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(521,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(522,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(523,NULL,NULL,10,NULL,1000,'Chưa Đặt'),(524,NULL,NULL,10,NULL,300,'Chưa Đặt'),(525,NULL,NULL,10,NULL,300,'Chưa Đặt'),(526,NULL,NULL,10,NULL,300,'Chưa Đặt'),(527,NULL,NULL,10,NULL,300,'Chưa Đặt'),(528,NULL,NULL,10,NULL,300,'Chưa Đặt'),(529,NULL,NULL,10,NULL,300,'Chưa Đặt'),(530,NULL,NULL,10,NULL,300,'Chưa Đặt'),(531,NULL,NULL,10,NULL,300,'Chưa Đặt'),(532,NULL,NULL,10,NULL,300,'Chưa Đặt'),(533,NULL,NULL,10,NULL,300,'Chưa Đặt'),(534,NULL,NULL,10,NULL,300,'Chưa Đặt'),(535,NULL,NULL,10,NULL,300,'Chưa Đặt'),(536,NULL,NULL,10,NULL,300,'Chưa Đặt'),(537,NULL,NULL,10,NULL,300,'Chưa Đặt'),(538,NULL,NULL,10,NULL,300,'Chưa Đặt'),(539,NULL,NULL,10,NULL,300,'Chưa Đặt'),(540,NULL,NULL,10,NULL,300,'Chưa Đặt'),(541,NULL,NULL,10,NULL,300,'Chưa Đặt'),(542,NULL,NULL,10,NULL,300,'Chưa Đặt'),(543,NULL,NULL,10,NULL,300,'Chưa Đặt'),(544,NULL,NULL,10,NULL,300,'Chưa Đặt'),(545,NULL,NULL,10,NULL,300,'Chưa Đặt'),(546,NULL,NULL,10,NULL,300,'Chưa Đặt'),(547,NULL,NULL,10,NULL,300,'Chưa Đặt'),(548,NULL,NULL,10,NULL,300,'Chưa Đặt'),(549,NULL,NULL,10,NULL,300,'Chưa Đặt'),(550,NULL,NULL,10,NULL,300,'Chưa Đặt'),(551,NULL,NULL,10,NULL,300,'Chưa Đặt'),(552,NULL,NULL,10,NULL,300,'Chưa Đặt'),(553,NULL,NULL,10,NULL,300,'Chưa Đặt'),(554,NULL,NULL,10,NULL,300,'Chưa Đặt'),(555,NULL,NULL,10,NULL,300,'Chưa Đặt'),(556,NULL,NULL,10,NULL,300,'Chưa Đặt'),(557,NULL,NULL,10,NULL,300,'Chưa Đặt'),(558,NULL,NULL,10,NULL,300,'Chưa Đặt'),(559,NULL,NULL,10,NULL,300,'Chưa Đặt'),(560,NULL,NULL,10,NULL,300,'Chưa Đặt'),(561,NULL,NULL,10,NULL,300,'Chưa Đặt'),(562,NULL,NULL,10,NULL,300,'Chưa Đặt'),(563,NULL,NULL,10,NULL,300,'Chưa Đặt');
/*!40000 ALTER TABLE `ve` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-23 12:36:38
