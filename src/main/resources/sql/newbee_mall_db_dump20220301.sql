CREATE DATABASE  IF NOT EXISTS `newbee_mall_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `newbee_mall_db`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: newbee_mall_db
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `tb_newbee_mall_admin_user`
--

DROP TABLE IF EXISTS `tb_newbee_mall_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_newbee_mall_admin_user` (
  `admin_user_id` int NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `login_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登录名称',
  `login_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登录密码',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员显示昵称',
  `locked` tinyint DEFAULT '0' COMMENT '是否锁定 0未锁定 1已锁定无法登录',
  PRIMARY KEY (`admin_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_newbee_mall_admin_user`
--

LOCK TABLES `tb_newbee_mall_admin_user` WRITE;
/*!40000 ALTER TABLE `tb_newbee_mall_admin_user` DISABLE KEYS */;
INSERT INTO `tb_newbee_mall_admin_user` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','十三',0),(2,'newbee-admin1','e10adc3949ba59abbe56e057f20f883e','新蜂01',0),(3,'newbee-admin2','e10adc3949ba59abbe56e057f20f883e','新蜂02',0);
/*!40000 ALTER TABLE `tb_newbee_mall_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '登录名',
  `password` varchar(100) NOT NULL DEFAULT '' COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e'),(2,'test2','098f6bcd4621d373cade4e832627b4f6'),(3,'test3','098f6bcd4621d373cade4e832627b4f6'),(4,'test4','098f6bcd4621d373cade4e832627b4f6'),(5,'test5','098f6bcd4621d373cade4e832627b4f6'),(6,'test6','098f6bcd4621d373cade4e832627b4f6'),(7,'test7','098f6bcd4621d373cade4e832627b4f6'),(8,'test8','098f6bcd4621d373cade4e832627b4f6'),(9,'test9','098f6bcd4621d373cade4e832627b4f6'),(10,'test10','098f6bcd4621d373cade4e832627b4f6'),(11,'test11','098f6bcd4621d373cade4e832627b4f6'),(12,'test12','098f6bcd4621d373cade4e832627b4f6'),(13,'test13','098f6bcd4621d373cade4e832627b4f6'),(14,'test14','098f6bcd4621d373cade4e832627b4f6'),(15,'test15','098f6bcd4621d373cade4e832627b4f6'),(16,'test16','098f6bcd4621d373cade4e832627b4f6'),(17,'test17','098f6bcd4621d373cade4e832627b4f6'),(18,'test18','098f6bcd4621d373cade4e832627b4f6'),(19,'test19','098f6bcd4621d373cade4e832627b4f6'),(20,'admin2','098f6bcd4621d373cade4e832627b4f6'),(21,'admin3','098f6bcd4621d373cade4e832627b4f6'),(22,'admin4','098f6bcd4621d373cade4e832627b4f6'),(23,'admin5','098f6bcd4621d373cade4e832627b4f6'),(24,'admin6','098f6bcd4621d373cade4e832627b4f6'),(25,'admin7','098f6bcd4621d373cade4e832627b4f6'),(26,'admin8','098f6bcd4621d373cade4e832627b4f6'),(27,'admin9','098f6bcd4621d373cade4e832627b4f6'),(28,'admin10','098f6bcd4621d373cade4e832627b4f6'),(29,'admin11','098f6bcd4621d373cade4e832627b4f6'),(30,'admin12','098f6bcd4621d373cade4e832627b4f6'),(31,'admin13','098f6bcd4621d373cade4e832627b4f6'),(32,'admin14','098f6bcd4621d373cade4e832627b4f6'),(33,'admin15','098f6bcd4621d373cade4e832627b4f6'),(34,'admin16','098f6bcd4621d373cade4e832627b4f6'),(35,'admin17','098f6bcd4621d373cade4e832627b4f6'),(36,'admin18','098f6bcd4621d373cade4e832627b4f6'),(37,'admin19','098f6bcd4621d373cade4e832627b4f6'),(38,'admin011','098f6bcd4621d373cade4e832627b4f6'),(39,'admin02','098f6bcd4621d373cade4e832627b4f6'),(40,'admin03','098f6bcd4621d373cade4e832627b4f6'),(41,'admin04','098f6bcd4621d373cade4e832627b4f6'),(42,'admin05','098f6bcd4621d373cade4e832627b4f6'),(43,'admin06','098f6bcd4621d373cade4e832627b4f6'),(44,'admin07','098f6bcd4621d373cade4e832627b4f6'),(45,'admin08','098f6bcd4621d373cade4e832627b4f6'),(46,'admin09','098f6bcd4621d373cade4e832627b4f6'),(47,'admin010','098f6bcd4621d373cade4e832627b4f6'),(48,'admin011','098f6bcd4621d373cade4e832627b4f6'),(49,'admin012','098f6bcd4621d373cade4e832627b4f6'),(50,'admin013','098f6bcd4621d373cade4e832627b4f6'),(51,'admin014','098f6bcd4621d373cade4e832627b4f6'),(52,'admin015','098f6bcd4621d373cade4e832627b4f6'),(53,'admin016','098f6bcd4621d373cade4e832627b4f6'),(54,'admin017','098f6bcd4621d373cade4e832627b4f6'),(55,'admin018','098f6bcd4621d373cade4e832627b4f6'),(56,'admin019','098f6bcd4621d373cade4e832627b4f6'),(57,'ZHENFENG13','77c9749b451ab8c713c48037ddfbb2c4'),(58,'213312','eqwfasdfa'),(59,'14415143','51435135'),(60,'shisan','e10adc3949ba59abbe56e057f20f883e'),(61,'zhangsan','fcea920f7412b5da7be0cf42b8c93759'),(62,'test-user1','3d0faa930d336ba748607ab7076ebce2'),(63,'3123213213','6fdce2f14f4baf2d666fa13dfd8d1945');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'newbee_mall_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-01  8:44:12
