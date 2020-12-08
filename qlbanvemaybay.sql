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
  PRIMARY KEY (`id`),
  KEY `tuyenBayId` (`tuyenBayId`),
  CONSTRAINT `chuyenbay_ibfk_1` FOREIGN KEY (`tuyenBayId`) REFERENCES `tuyenbay` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuyenbay`
--

LOCK TABLES `chuyenbay` WRITE;
/*!40000 ALTER TABLE `chuyenbay` DISABLE KEYS */;
INSERT INTO `chuyenbay` VALUES (1,'2020-12-09 17:30:00','02:00:00',1);
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
  `maGhe` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `loaiGhe` enum('Vip','Thường') COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `trangThai` enum('Đã Đặt','Chưa Đặt') COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mayBayId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mayBayId` (`mayBayId`),
  CONSTRAINT `ghe_ibfk_1` FOREIGN KEY (`mayBayId`) REFERENCES `maybay` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghe`
--

LOCK TABLES `ghe` WRITE;
/*!40000 ALTER TABLE `ghe` DISABLE KEYS */;
INSERT INTO `ghe` VALUES (1,'A1','Vip','Chưa Đặt',1);
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
  `tenKhachHang` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `ngaySinh` date NOT NULL,
  `diaChi` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `CMND` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `soDienThoai` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (1,'Phạm Tuân','2000-07-09','29/3 Tân Hương Tân Phú','0263901003','0932866623');
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
  `maMayBay` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maybay`
--

LOCK TABLES `maybay` WRITE;
/*!40000 ALTER TABLE `maybay` DISABLE KEYS */;
INSERT INTO `maybay` VALUES (1,'MH370');
/*!40000 ALTER TABLE `maybay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanbay`
--

DROP TABLE IF EXISTS `sanbay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanbay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenSanBay` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `tinhThanh` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tinhThanh` (`tinhThanh`),
  CONSTRAINT `sanbay_ibfk_1` FOREIGN KEY (`tinhThanh`) REFERENCES `tinhthanh` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanbay`
--

LOCK TABLES `sanbay` WRITE;
/*!40000 ALTER TABLE `sanbay` DISABLE KEYS */;
INSERT INTO `sanbay` VALUES (1,'Sân Bay Nội Bài',1),(2,'Sân Bay Tân Sơ Nhất',2);
/*!40000 ALTER TABLE `sanbay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinhthanh`
--

DROP TABLE IF EXISTS `tinhthanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinhthanh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenTinhThanh` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinhthanh`
--

LOCK TABLES `tinhthanh` WRITE;
/*!40000 ALTER TABLE `tinhthanh` DISABLE KEYS */;
INSERT INTO `tinhthanh` VALUES (1,'Hà Nội'),(2,'Hồ Chí Minh');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuyenbay`
--

LOCK TABLES `tuyenbay` WRITE;
/*!40000 ALTER TABLE `tuyenbay` DISABLE KEYS */;
INSERT INTO `tuyenbay` VALUES (1,2,1),(2,1,2);
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
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `sdt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `user_role` enum('USER','ADMIN') CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Tuân',1,'admin','5aee410122e9d1d76f194496cb2f90de','1851050167tuan@ou.edu.vn','0363902003','ADMIN');
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
  `ve_khachHang` int NOT NULL,
  `ve_nhanvien` int NOT NULL,
  `ve_chuyenbay` int NOT NULL,
  `ngayXuatVe` datetime DEFAULT NULL,
  `noiXuatVe` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ve_khachHang` (`ve_khachHang`),
  KEY `ve_nhanvien` (`ve_nhanvien`),
  KEY `ve_chuyenbay` (`ve_chuyenbay`),
  CONSTRAINT `ve_ibfk_1` FOREIGN KEY (`id`) REFERENCES `ghe` (`id`),
  CONSTRAINT `ve_ibfk_2` FOREIGN KEY (`ve_khachHang`) REFERENCES `khachhang` (`id`),
  CONSTRAINT `ve_ibfk_3` FOREIGN KEY (`ve_nhanvien`) REFERENCES `user` (`id`),
  CONSTRAINT `ve_ibfk_4` FOREIGN KEY (`ve_chuyenbay`) REFERENCES `chuyenbay` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ve`
--

LOCK TABLES `ve` WRITE;
/*!40000 ALTER TABLE `ve` DISABLE KEYS */;
/*!40000 ALTER TABLE `ve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'qlbanvemaybay'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-08 14:43:01
