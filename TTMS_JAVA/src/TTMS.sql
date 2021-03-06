-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: TTMS
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `data_dict`
--

DROP TABLE IF EXISTS `data_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_dict` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_parent_id` int(11) DEFAULT NULL,
  `dict_index` int(11) DEFAULT NULL,
  `dict_name` varchar(200) DEFAULT NULL,
  `dict_value` varchar(100) NOT NULL,
  PRIMARY KEY (`dict_id`),
  KEY `FK_super_child_dict` (`dict_parent_id`),
  CONSTRAINT `FK_super_child_dict` FOREIGN KEY (`dict_parent_id`) REFERENCES `data_dict` (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_dict`
--

LOCK TABLES `data_dict` WRITE;
/*!40000 ALTER TABLE `data_dict` DISABLE KEYS */;
INSERT INTO `data_dict` VALUES (1,NULL,1,'数据字典','根'),(2,1,2,'PLAYTYPE','影片类型'),(3,1,3,'PLAYLANG','影片语言'),(4,1,4,'FailTime','加锁时间'),(5,1,5,'USER_RANK','用户等级'),(6,2,1,'costume drama','古装剧'),(7,2,2,'Time_Travel','悬疑剧'),(8,2,3,'life Drama','喜剧'),(9,2,4,'life Drama','生活剧'),(10,2,5,'life Drama','惊悚剧'),(11,2,6,'life Drama','动作剧'),(12,3,1,'chinese','汉语'),(13,3,2,'English','英语'),(14,3,3,'CN_EN','中英双语'),(15,3,4,'Japan','日语'),(16,4,1,'短','5'),(17,4,2,'中','10'),(18,4,3,'长','15'),(19,5,1,'LV1','VIP1'),(20,5,2,'LV2','VIP2'),(21,5,3,'LV3','VIP3'),(22,5,4,'LV4','VIP4'),(23,5,5,'LV5','VIP5'),(24,5,6,'LV6','VIP6'),(25,5,7,'LV7','VIP7');
/*!40000 ALTER TABLE `data_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` char(20) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_passwd` varchar(30) NOT NULL,
  `emp_sex` varchar(10) NOT NULL,
  `emp_position` varchar(30) NOT NULL,
  `emp_salary` int(11) DEFAULT NULL,
  `emp_tel_num` char(20) DEFAULT NULL,
  `emp_addr` varchar(200) DEFAULT NULL,
  `emp_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'admin01','admin','123456','male','admin',9000,'13345679636','长安区                                    ','123@qq.com                                    '),(2,'clerk02','clerk','123456','male','clerk',7000,'13445679636','长安区                                                                 ','124@qq.com                                                                 '),(3,'manager3','manager','123456','male','manager',6000,'13545679636','长安区                                   ','125@qq.com                                   ');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylog`
--

DROP TABLE IF EXISTS `mylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mylog` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_time` varchar(100) DEFAULT NULL,
  `log_content` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylog`
--

LOCK TABLES `mylog` WRITE;
/*!40000 ALTER TABLE `mylog` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `play`
--

DROP TABLE IF EXISTS `play`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `play` (
  `play_id` int(11) NOT NULL AUTO_INCREMENT,
  `play_type_id` int(11) DEFAULT NULL,
  `play_lang_id` int(11) DEFAULT NULL,
  `play_name` varchar(200) DEFAULT NULL,
  `play_introduction` varchar(2000) DEFAULT NULL,
  `play_image` longblob,
  `play_length` int(11) DEFAULT NULL,
  `play_ticket_price` decimal(10,2) DEFAULT NULL,
  `play_status` smallint(6) DEFAULT NULL COMMENT '取值含义：\n            			0：待安排演出\n            			1：已安排演出\n            			-1：下线',
  PRIMARY KEY (`play_id`),
  KEY `FK_dict_lan_play` (`play_lang_id`),
  KEY `FK_dict_type_play` (`play_type_id`),
  CONSTRAINT `FK_dict_lan_play` FOREIGN KEY (`play_lang_id`) REFERENCES `data_dict` (`dict_id`),
  CONSTRAINT `FK_dict_type_play` FOREIGN KEY (`play_type_id`) REFERENCES `data_dict` (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play`
--

LOCK TABLES `play` WRITE;
/*!40000 ALTER TABLE `play` DISABLE KEYS */;
INSERT INTO `play` VALUES (1,NULL,NULL,'龙猫 ','由宫崎骏执导 ',NULL,139,60.00,1),(2,NULL,NULL,'怒 ','炎炎夏日，东京八王子郊外社区，一对夫妇惨遭杀害 ',NULL,139,60.00,1),(3,NULL,NULL,'烈日灼心','曹保平编剧执导，邓超、段奕宏',NULL,139,60.00,1),(4,NULL,NULL,'加勒比海盗5','由迪士尼电影公司推出',NULL,129,60.00,1),(5,NULL,NULL,'神奇女侠','美国华纳兄弟影片公司出品',NULL,120,70.00,1),(6,NULL,NULL,'荡寇风云','陈嘉上执导，赵文卓、万茜、洪金宝',NULL,142,70.00,1),(7,NULL,NULL,'迷失Z城','由美国B计划公司出品',NULL,120,70.00,1),(8,NULL,NULL,'美好的意外','华谊兄弟传媒股份有限公司出品 ',NULL,120,80.00,1),(9,NULL,NULL,'小茜当家','主演:郝怡霖朱佳煜',NULL,120,70.00,0),(10,NULL,NULL,'惊门','天河盛宴国际文化传媒',NULL,90,60.00,0),(11,1,1,'29+1','导演：彭秀慧',NULL,130,80.00,0),(13,4,3,'摔跤','身上得到方法',NULL,120,0.00,0);
/*!40000 ALTER TABLE `play` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale` (
  `sale_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `sale_time` datetime DEFAULT NULL,
  `sale_payment` decimal(10,2) DEFAULT NULL,
  `sale_change` decimal(10,2) DEFAULT NULL,
  `sale_type` smallint(6) DEFAULT NULL COMMENT '类别取值含义：\n						1：销售单\n						-1：退款单',
  `sale_status` smallint(6) DEFAULT NULL COMMENT '销售单状态如下：\n						0：待付款\n						1：已付款',
  PRIMARY KEY (`sale_ID`),
  KEY `FK_employee_sale` (`emp_id`),
  KEY `FK_user_sale` (`user_id`),
  CONSTRAINT `FK_employee_sale` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `FK_user_sale` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,1,2,'2017-06-09 09:27:37',100.00,40.00,1,1),(2,1,2,'2017-06-09 09:27:57',150.00,30.00,-1,1),(3,1,2,'2017-06-09 09:27:59',150.00,30.00,-1,1),(4,1,2,'2017-06-09 09:37:03',100.00,40.00,-1,1),(5,1,2,'2017-06-09 09:37:37',130.00,10.00,1,1),(6,1,2,'2017-06-09 09:37:39',130.00,10.00,-1,1),(7,2,2,'2017-06-09 09:43:48',100.00,40.00,1,1),(8,2,2,'2017-06-09 10:37:22',100.00,40.00,1,1),(9,2,2,'2017-06-09 10:45:37',66.00,6.00,-1,1),(10,2,2,'2017-06-09 11:08:50',100.00,40.00,-1,1),(11,2,2,'2017-06-09 12:36:52',100.00,40.00,1,1),(12,2,2,'2017-06-11 23:09:14',200.00,92.00,-1,1),(13,2,2,'2017-06-11 23:09:17',200.00,92.00,1,1),(14,2,2,'2017-06-11 23:46:07',100.00,46.00,-1,1),(15,2,2,'2017-06-20 22:15:23',100.00,46.00,1,1),(16,2,2,'2017-06-21 21:29:55',100.00,46.00,-1,1);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_item`
--

DROP TABLE IF EXISTS `sale_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_item` (
  `sale_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) DEFAULT NULL,
  `sale_ID` bigint(20) DEFAULT NULL,
  `sale_item_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sale_item_id`),
  KEY `FK_sale_sale_item` (`sale_ID`),
  KEY `FK_ticket_sale_item` (`ticket_id`),
  CONSTRAINT `FK_sale_sale_item` FOREIGN KEY (`sale_ID`) REFERENCES `sale` (`sale_ID`),
  CONSTRAINT `FK_ticket_sale_item` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_item`
--

LOCK TABLES `sale_item` WRITE;
/*!40000 ALTER TABLE `sale_item` DISABLE KEYS */;
INSERT INTO `sale_item` VALUES (1,2,1,60.00),(7,17,5,60.00),(8,23,5,60.00),(11,1,7,60.00),(12,6,8,60.00),(13,16,9,60.00),(15,4,11,60.00),(16,40,12,60.00),(17,45,12,60.00),(18,40,13,60.00),(19,45,13,60.00),(20,49,14,60.00),(21,52,15,60.00),(22,19,16,60.00);
/*!40000 ALTER TABLE `sale_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `sched_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) DEFAULT NULL,
  `play_id` int(11) DEFAULT NULL,
  `sched_time` datetime NOT NULL,
  `sched_ticket_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sched_id`),
  KEY `FK_play_sched` (`play_id`),
  KEY `FK_studio_sched` (`studio_id`),
  CONSTRAINT `FK_play_sched` FOREIGN KEY (`play_id`) REFERENCES `play` (`play_id`),
  CONSTRAINT `FK_studio_sched` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`studio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,1,1,'2017-06-09 07:00:00',60.00),(2,1,11,'2017-06-09 10:00:00',80.00),(3,1,2,'2017-06-09 13:00:00',60.00),(4,1,3,'2017-06-09 16:00:00',60.00),(5,1,4,'2017-06-09 19:00:00',60.00),(6,1,5,'2017-06-09 22:00:00',70.00),(7,2,2,'2017-06-09 07:00:00',60.00),(8,2,6,'2017-06-10 01:00:00',70.00),(9,2,7,'2017-06-09 04:00:00',70.00),(10,2,8,'2017-06-09 07:00:00',80.00),(11,2,9,'2017-06-09 10:00:00',70.00),(12,2,10,'2017-06-09 07:00:00',60.00),(13,3,3,'2017-06-09 07:00:00',60.00),(14,3,1,'2017-06-09 16:00:00',60.00),(15,3,11,'2017-06-09 10:00:00',80.00),(16,3,2,'2017-06-09 13:00:00',60.00),(17,3,3,'2017-06-09 16:00:00',60.00);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seat` (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) DEFAULT NULL,
  `seat_row` int(11) DEFAULT NULL,
  `seat_column` int(11) DEFAULT NULL,
  `seat_status` smallint(6) DEFAULT NULL COMMENT '取值含义：\n                       0：待售座位\n                       1: 已售座位\n                       2: 锁定座位\n                       -1：座位损坏\n                       -2: 没有座椅',
  `seat_locked_time` datetime DEFAULT NULL,
  PRIMARY KEY (`seat_id`),
  KEY `FK_studio_seat` (`studio_id`),
  CONSTRAINT `FK_studio_seat` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`studio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (53,1,1,1,1,NULL),(54,1,1,2,1,NULL),(55,1,1,3,1,NULL),(56,1,1,4,1,NULL),(57,1,2,1,1,NULL),(58,1,2,2,1,NULL),(59,1,2,3,0,NULL),(60,1,2,4,0,NULL),(61,1,3,1,0,NULL),(62,1,3,2,0,NULL),(63,1,3,3,1,NULL),(64,1,3,4,0,NULL),(65,1,4,1,0,NULL),(66,1,4,2,0,NULL),(67,1,4,3,0,NULL),(68,1,4,4,1,NULL),(69,2,1,1,-1,NULL),(70,2,1,2,-1,NULL),(71,2,1,3,-1,NULL),(72,2,1,4,-1,NULL),(73,2,1,5,-1,NULL),(74,2,2,1,-1,NULL),(75,2,2,2,-1,NULL),(76,2,2,3,-1,NULL),(77,2,2,4,-1,NULL),(78,2,2,5,-1,NULL),(79,2,3,1,-1,NULL),(80,2,3,2,-1,NULL),(81,2,3,3,-1,NULL),(82,2,3,4,-1,NULL),(83,2,3,5,-1,NULL),(84,2,4,1,-1,NULL),(85,2,4,2,-1,NULL),(86,2,4,3,-1,NULL),(87,2,4,4,-1,NULL),(88,2,4,5,-1,NULL),(89,3,1,1,1,NULL),(90,3,1,2,1,NULL),(91,3,1,3,1,NULL),(92,3,1,4,1,NULL),(93,3,1,5,0,NULL),(94,3,2,1,2,'2017-06-09 10:33:54'),(95,3,2,2,1,NULL),(96,3,2,3,0,NULL),(97,3,2,4,1,NULL),(98,3,2,5,0,NULL),(99,3,3,1,2,'2017-06-09 10:33:54'),(100,3,3,2,1,NULL),(101,3,3,3,1,NULL),(102,3,3,4,0,NULL),(103,3,3,5,0,NULL),(104,3,4,1,0,NULL),(105,3,4,2,0,NULL),(106,3,4,3,0,NULL),(107,3,4,4,0,NULL),(108,3,4,5,0,NULL),(109,3,1,1,0,NULL),(110,3,1,2,0,NULL),(111,3,1,3,0,NULL),(112,3,1,4,0,NULL),(113,3,2,1,0,NULL),(114,3,2,2,0,NULL),(115,3,2,3,0,NULL),(116,3,2,4,0,NULL),(117,3,3,1,0,NULL),(118,3,3,2,0,NULL),(119,3,3,3,0,NULL),(120,3,3,4,0,NULL),(121,3,4,1,0,NULL),(122,3,4,2,0,NULL),(123,3,4,3,0,NULL),(124,3,4,4,0,NULL),(125,3,5,1,0,NULL),(126,3,5,2,0,NULL),(127,3,5,3,0,NULL),(128,3,5,4,0,NULL),(129,10,1,1,0,NULL),(130,10,1,2,0,NULL),(131,10,1,3,0,NULL),(132,10,1,4,0,NULL),(133,10,1,5,0,NULL),(134,10,1,6,0,NULL),(135,10,1,7,0,NULL),(136,10,2,1,0,NULL),(137,10,2,2,0,NULL),(138,10,2,3,0,NULL),(139,10,2,4,0,NULL),(140,10,2,5,0,NULL),(141,10,2,6,0,NULL),(142,10,2,7,0,NULL),(143,10,3,1,0,NULL),(144,10,3,2,0,NULL),(145,10,3,3,0,NULL),(146,10,3,4,0,NULL),(147,10,3,5,0,NULL),(148,10,3,6,0,NULL),(149,10,3,7,0,NULL),(150,10,4,1,0,NULL),(151,10,4,2,0,NULL),(152,10,4,3,0,NULL),(153,10,4,4,0,NULL),(154,10,4,5,0,NULL),(155,10,4,6,0,NULL),(156,10,4,7,0,NULL),(157,10,5,1,0,NULL),(158,10,5,2,0,NULL),(159,10,5,3,0,NULL),(160,10,5,4,0,NULL),(161,10,5,5,0,NULL),(162,10,5,6,0,NULL),(163,10,5,7,0,NULL),(164,10,6,1,0,NULL),(165,10,6,2,0,NULL),(166,10,6,3,0,NULL),(167,10,6,4,0,NULL),(168,10,6,5,0,NULL),(169,10,6,6,0,NULL),(170,10,6,7,0,NULL),(171,17,1,1,0,NULL),(172,17,1,2,0,NULL),(173,17,1,3,0,NULL),(174,17,1,4,0,NULL),(175,17,1,5,0,NULL),(176,17,2,1,0,NULL),(177,17,2,2,0,NULL),(178,17,2,3,0,NULL),(179,17,2,4,0,NULL),(180,17,2,5,0,NULL),(181,17,3,1,0,NULL),(182,17,3,2,0,NULL),(183,17,3,3,0,NULL),(184,17,3,4,0,NULL),(185,17,3,5,0,NULL),(186,17,4,1,0,NULL),(187,17,4,2,0,NULL),(188,17,4,3,0,NULL),(189,17,4,4,0,NULL),(190,17,4,5,0,NULL),(191,17,5,1,0,NULL),(192,17,5,2,0,NULL),(193,17,5,3,0,NULL),(194,17,5,4,0,NULL),(195,17,5,5,0,NULL),(196,1,1,1,0,NULL),(197,1,1,2,0,NULL),(198,1,1,3,0,NULL),(199,1,1,4,0,NULL),(200,1,2,1,0,NULL),(201,1,2,2,0,NULL),(202,1,2,3,0,NULL),(203,1,2,4,0,NULL),(204,1,3,1,0,NULL),(205,1,3,2,0,NULL),(206,1,3,3,0,NULL),(207,1,3,4,0,NULL),(208,1,4,1,0,NULL),(209,1,4,2,0,NULL),(210,1,4,3,0,NULL),(211,1,4,4,0,NULL),(212,18,1,1,0,NULL),(213,18,1,2,0,NULL),(214,18,1,3,0,NULL),(215,18,1,4,0,NULL),(216,18,1,5,0,NULL),(217,18,1,6,0,NULL),(218,18,2,1,0,NULL),(219,18,2,2,0,NULL),(220,18,2,3,0,NULL),(221,18,2,4,0,NULL),(222,18,2,5,0,NULL),(223,18,2,6,0,NULL),(224,18,3,1,0,NULL),(225,18,3,2,0,NULL),(226,18,3,3,0,NULL),(227,18,3,4,0,NULL),(228,18,3,5,0,NULL),(229,18,3,6,0,NULL),(230,18,4,1,0,NULL),(231,18,4,2,0,NULL),(232,18,4,3,0,NULL),(233,18,4,4,0,NULL),(234,18,4,5,0,NULL),(235,18,4,6,0,NULL),(236,18,5,1,0,NULL),(237,18,5,2,0,NULL),(238,18,5,3,0,NULL),(239,18,5,4,0,NULL),(240,18,5,5,0,NULL),(241,18,5,6,0,NULL),(242,18,1,1,0,NULL),(243,18,1,2,0,NULL),(244,18,1,3,0,NULL),(245,18,1,4,0,NULL),(246,18,1,5,0,NULL),(247,18,1,6,0,NULL),(248,18,2,1,0,NULL),(249,18,2,2,0,NULL),(250,18,2,3,0,NULL),(251,18,2,4,0,NULL),(252,18,2,5,0,NULL),(253,18,2,6,0,NULL),(254,18,3,1,0,NULL),(255,18,3,2,0,NULL),(256,18,3,3,0,NULL),(257,18,3,4,0,NULL),(258,18,3,5,0,NULL),(259,18,3,6,0,NULL),(260,18,4,1,0,NULL),(261,18,4,2,0,NULL),(262,18,4,3,0,NULL),(263,18,4,4,0,NULL),(264,18,4,5,0,NULL),(265,18,4,6,0,NULL),(266,18,5,1,0,NULL),(267,18,5,2,0,NULL),(268,18,5,3,0,NULL),(269,18,5,4,0,NULL),(270,18,5,5,0,NULL),(271,18,5,6,0,NULL),(272,18,6,1,0,NULL),(273,18,6,2,0,NULL),(274,18,6,3,0,NULL),(275,18,6,4,0,NULL),(276,18,6,5,0,NULL),(277,18,6,6,0,NULL),(278,18,7,1,0,NULL),(279,18,7,2,0,NULL),(280,18,7,3,0,NULL),(281,18,7,4,0,NULL),(282,18,7,5,0,NULL),(283,18,7,6,0,NULL),(284,1,1,1,0,NULL),(285,1,1,2,0,NULL),(286,1,1,3,0,NULL),(287,1,1,4,0,NULL),(288,1,2,1,0,NULL),(289,1,2,2,0,NULL),(290,1,2,3,0,NULL),(291,1,2,4,0,NULL),(292,1,3,1,0,NULL),(293,1,3,2,0,NULL),(294,1,3,3,0,NULL),(295,1,3,4,0,NULL),(296,1,4,1,0,NULL),(297,1,4,2,0,NULL),(298,1,4,3,0,NULL),(299,1,4,4,0,NULL),(300,15,1,1,0,NULL),(301,15,1,2,0,NULL),(302,15,1,3,0,NULL),(303,15,1,4,0,NULL),(304,15,1,5,0,NULL),(305,15,1,6,0,NULL),(306,15,2,1,0,NULL),(307,15,2,2,0,NULL),(308,15,2,3,0,NULL),(309,15,2,4,0,NULL),(310,15,2,5,0,NULL),(311,15,2,6,0,NULL),(312,15,3,1,0,NULL),(313,15,3,2,0,NULL),(314,15,3,3,0,NULL),(315,15,3,4,0,NULL),(316,15,3,5,0,NULL),(317,15,3,6,0,NULL),(318,15,4,1,0,NULL),(319,15,4,2,0,NULL),(320,15,4,3,0,NULL),(321,15,4,4,0,NULL),(322,15,4,5,0,NULL),(323,15,4,6,0,NULL),(324,19,1,1,0,NULL),(325,19,1,2,0,NULL),(326,19,1,3,0,NULL),(327,19,2,1,0,NULL),(328,19,2,2,0,NULL),(329,19,2,3,0,NULL),(330,19,3,1,0,NULL),(331,19,3,2,0,NULL),(332,19,3,3,0,NULL),(333,7,1,1,0,NULL),(334,7,1,2,0,NULL),(335,7,1,3,0,NULL),(336,7,1,4,0,NULL),(337,7,2,1,0,NULL),(338,7,2,2,0,NULL),(339,7,2,3,0,NULL),(340,7,2,4,0,NULL),(341,7,3,1,0,NULL),(342,7,3,2,0,NULL),(343,7,3,3,0,NULL),(344,7,3,4,0,NULL),(345,7,4,1,0,NULL),(346,7,4,2,0,NULL),(347,7,4,3,0,NULL),(348,7,4,4,0,NULL),(349,14,1,1,0,NULL),(350,14,1,2,0,NULL),(351,14,1,3,0,NULL),(352,14,1,4,0,NULL),(353,14,1,5,0,NULL),(354,14,1,6,0,NULL),(355,14,2,1,0,NULL),(356,14,2,2,0,NULL),(357,14,2,3,0,NULL),(358,14,2,4,0,NULL),(359,14,2,5,0,NULL),(360,14,2,6,0,NULL),(361,14,3,1,0,NULL),(362,14,3,2,0,NULL),(363,14,3,3,0,NULL),(364,14,3,4,0,NULL),(365,14,3,5,0,NULL),(366,14,3,6,0,NULL),(367,14,4,1,0,NULL),(368,14,4,2,0,NULL),(369,14,4,3,0,NULL),(370,14,4,4,0,NULL),(371,14,4,5,0,NULL),(372,14,4,6,0,NULL),(429,5,1,1,0,NULL);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio`
--

DROP TABLE IF EXISTS `studio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studio` (
  `studio_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_name` varchar(100) NOT NULL,
  `studio_row_count` int(11) DEFAULT NULL,
  `studio_col_count` int(11) DEFAULT NULL,
  `studio_sale_count` int(11) DEFAULT NULL,
  `studio_position` varchar(50) DEFAULT NULL,
  `studio_introduction` varchar(2000) DEFAULT NULL,
  `studio_flag` smallint(6) DEFAULT NULL COMMENT '取值含义：\n                        0：尚未生成座位，可以根据行列信息生成座位\n                        1：已经根据影厅的座位信息安排了座位，不能再安排座位；\n                        -1：影厅损坏或者废弃，不能使用',
  PRIMARY KEY (`studio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio`
--

LOCK TABLES `studio` WRITE;
/*!40000 ALTER TABLE `studio` DISABLE KEYS */;
INSERT INTO `studio` VALUES (1,'新视觉',4,4,0,'西安','VIP新视觉，响亮在城市上空',1),(2,'恋尚',4,5,0,'西安','VIP恋上一段历史，演绎时代风尚',1),(3,'601',5,4,0,'西安','',1),(4,'古韵',4,6,0,'无锡','VIP古韵千年，回望一眼',1),(5,'古今谣',4,5,0,'东莞','VIP谣谣千古，耀耀今朝',0),(6,'他年艺',4,4,0,'杭州','VIP他年演艺，一种传奇',1),(7,'水云谣',4,4,0,'石家庄','VIP水润云舒处，美在一城中',1),(8,'韵千娇',6,6,0,'武汉','Ordi韵城如此多娇，引无数',0),(9,'世尚凤',6,5,0,'成都','Ordi世代欣赏，时尚彩凤',0),(10,'一挥间',6,7,0,'重庆','Ordi弹指一挥间，时光易千年',1),(11,'千秋铭',6,7,0,'漳州','Ordi流芳百世，只为千秋',0),(12,'艺光年',6,8,0,'沈阳','Ordi穿越光年的感观享受',0),(13,'风满楼',6,7,0,'伊犁','Ordi一楼风雨，一片痴情',0),(14,'红剧人',4,6,0,'雁塔','Ordi红动中国，剧传天下',1),(15,'君桥',4,6,0,'兰州','Ordi君之桥，为你的成功搭桥',1),(17,'mq',5,5,NULL,NULL,'',0),(18,'sdaf',7,6,NULL,NULL,'fdsgagds',0),(19,'test',3,3,NULL,'test','test',0);
/*!40000 ALTER TABLE `studio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `ticket_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seat_id` int(11) DEFAULT NULL,
  `sched_id` int(11) DEFAULT NULL,
  `ticket_price` decimal(10,2) DEFAULT NULL,
  `ticket_status` smallint(6) DEFAULT NULL COMMENT '含义如下：\n						0：待销售\n						1：锁定\n						9：卖出',
  `ticket_locked_time` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `FK_sched_ticket` (`sched_id`),
  KEY `FK_seat_ticket` (`seat_id`),
  CONSTRAINT `FK_sched_ticket` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`),
  CONSTRAINT `FK_seat_ticket` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,53,1,60.00,9,NULL),(2,54,1,60.00,9,NULL),(3,55,1,60.00,9,NULL),(4,56,1,60.00,9,NULL),(5,57,1,60.00,9,NULL),(6,58,1,60.00,9,NULL),(7,59,1,60.00,0,NULL),(8,60,1,60.00,0,NULL),(9,61,1,60.00,0,NULL),(10,62,1,60.00,0,NULL),(11,63,1,60.00,9,NULL),(12,64,1,60.00,0,NULL),(13,65,1,60.00,0,NULL),(14,66,1,60.00,0,NULL),(15,67,1,60.00,0,NULL),(16,68,1,60.00,9,NULL),(17,69,7,60.00,9,NULL),(18,70,7,60.00,0,NULL),(19,71,7,60.00,9,NULL),(20,72,7,60.00,0,NULL),(21,73,7,60.00,0,NULL),(22,74,7,60.00,0,NULL),(23,75,7,60.00,9,NULL),(24,76,7,60.00,0,NULL),(25,77,7,60.00,0,NULL),(26,78,7,60.00,0,NULL),(27,79,7,60.00,0,NULL),(28,80,7,60.00,0,NULL),(29,81,7,60.00,0,NULL),(30,82,7,60.00,0,NULL),(31,83,7,60.00,0,NULL),(32,84,7,60.00,0,NULL),(33,85,7,60.00,0,NULL),(34,86,7,60.00,0,NULL),(35,87,7,60.00,0,NULL),(36,88,7,60.00,0,NULL),(37,89,13,60.00,9,NULL),(38,90,13,60.00,9,NULL),(39,91,13,60.00,9,NULL),(40,92,13,60.00,9,NULL),(41,93,13,60.00,0,NULL),(42,94,13,60.00,0,NULL),(43,95,13,60.00,0,NULL),(44,96,13,60.00,0,NULL),(45,97,13,60.00,9,NULL),(46,98,13,60.00,0,NULL),(47,99,13,60.00,0,NULL),(48,100,13,60.00,0,NULL),(49,101,13,60.00,9,NULL),(50,102,13,60.00,0,NULL),(51,103,13,60.00,0,NULL),(52,104,13,60.00,9,NULL),(53,105,13,60.00,0,NULL),(54,106,13,60.00,0,NULL),(55,107,13,60.00,0,NULL),(56,108,13,60.00,0,NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `user_sex` varchar(10) NOT NULL,
  `user_birthday` date NOT NULL,
  `user_tel_num` varchar(12) NOT NULL,
  `user_rank` varchar(10) DEFAULT 'VIP1',
  `user_cumulative` decimal(10,2) DEFAULT NULL,
  `user_email` varchar(20) DEFAULT NULL,
  `user_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'临时用户','男','1997-02-03','13032946422',NULL,NULL,NULL,NULL),(2,'hp','male','1997-01-20','18709261963','VIP3',NULL,'hepan@xupt.edu.cn',NULL),(3,'hp','female','1997-01-20','18709261963','VIP1',NULL,'asdfafdsadf',NULL),(4,'test','female','1996-06-06','1548552457','VIP1',NULL,'test@qq.com',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-20  8:46:50
