-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: archerone
-- ------------------------------------------------------
-- Server version	5.1.53-community-log

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
-- Table structure for table `alias`
--

DROP TABLE IF EXISTS `alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alias` (
  `alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `alias_name` varchar(45) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`alias_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alias`
--

LOCK TABLES `alias` WRITE;
/*!40000 ALTER TABLE `alias` DISABLE KEYS */;
INSERT INTO `alias` VALUES (1,11323906,'Nikko',NULL),(2,11323906,'Borja',NULL),(3,11324783,'Ken',NULL),(4,11324783,'Hapon',NULL),(5,11316330,'Jed',NULL),(6,11316330,'Jared',NULL),(7,11319992,'Mervin',NULL),(8,11319992,'Uy',NULL),(9,11111111,'Rey',NULL),(10,22222222,'Kylo',NULL),(11,33333333,'Han',NULL),(12,14444444,'Wang',NULL),(13,24444444,'Syfu',NULL),(14,34444444,'Patrick',NULL),(15,15555555,'Courtney',NULL),(16,25555555,'Bulos',NULL),(17,25555555,'Remy',NULL),(18,25555555,'Rems',NULL),(19,35555555,'Ethel',NULL),(20,17777777,'Dany',NULL),(21,27777777,'Joffrey',NULL),(22,37777777,'Jon',NULL);
/*!40000 ALTER TABLE `alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `area_id` int(11) NOT NULL,
  `area_name` varchar(70) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constraints`
--

DROP TABLE IF EXISTS `constraints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constraints` (
  `constraint_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) DEFAULT NULL,
  `MAX_HOURS_PER_DAY` float DEFAULT NULL,
  `MAX_CONSECUTIVE_HOURS` float DEFAULT NULL,
  `MAX_PREPARATIONS` int(11) DEFAULT NULL,
  `MIN_PREPARATIONS` int(11) DEFAULT NULL,
  `MAX_LOAD_PARTTIME` float DEFAULT NULL,
  `MIN_LOAD_PARTTIME` float DEFAULT NULL,
  `MAX_LOAD_HALFTIME` float DEFAULT NULL,
  `MIN_LOAD_HALFTIME` float DEFAULT NULL,
  `MAX_LOAD_FULLTIME` float DEFAULT NULL,
  `MIN_LOAD_FULLTIME` float DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`constraint_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constraints`
--

LOCK TABLES `constraints` WRITE;
/*!40000 ALTER TABLE `constraints` DISABLE KEYS */;
INSERT INTO `constraints` VALUES (1,1,6,4.5,4,3,6,3,9,3,12,6,NULL),(2,2,6,4.5,4,3,6,3,9,3,12,6,NULL),(3,3,6,4.5,4,3,6,3,9,3,12,6,NULL),(4,4,6,4.5,4,3,6,3,9,3,12,6,NULL);
/*!40000 ALTER TABLE `constraints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `course_code` varchar(7) DEFAULT NULL,
  `course_name` varchar(70) DEFAULT NULL,
  `units` float DEFAULT NULL,
  `isNonAcad` int(11) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseoffering`
--

DROP TABLE IF EXISTS `courseoffering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseoffering` (
  `offering_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `section` varchar(4) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `isElective` int(11) DEFAULT NULL,
  `elective_type` varchar(7) DEFAULT NULL,
  `max_students_enrolled` int(11) DEFAULT NULL,
  `curr_students_enrolled` int(11) DEFAULT NULL,
  `isNonAcad` int(11) DEFAULT NULL,
  `isSeniorHigh` int(11) DEFAULT NULL,
  `isServiceCourse` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`offering_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseoffering`
--

LOCK TABLES `courseoffering` WRITE;
/*!40000 ALTER TABLE `courseoffering` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseoffering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `days`
--

DROP TABLE IF EXISTS `days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `days` (
  `days_id` int(11) NOT NULL,
  `offering_id` int(11) DEFAULT NULL,
  `day` varchar(4) DEFAULT NULL,
  `start_time` varchar(4) DEFAULT NULL,
  `end_time` varchar(4) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`days_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `days`
--

LOCK TABLES `days` WRITE;
/*!40000 ALTER TABLE `days` DISABLE KEYS */;
/*!40000 ALTER TABLE `days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(45) DEFAULT NULL,
  `dept_acronym` varchar(5) DEFAULT NULL,
  `dept_size` int(11) DEFAULT NULL,
  `isObsolete` int(11) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Software Technology','ST',30,0,NULL),(2,'Computer Technology','CT',20,0,NULL),(3,'Information Technology','IT',15,0,NULL),(4,'No Department','ND',10,0,NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `preparations` int(11) DEFAULT NULL,
  `college` varchar(5) DEFAULT NULL,
  `years_of_service` int(11) DEFAULT NULL,
  `faculty_status` varchar(2) DEFAULT NULL COMMENT 'FT - Full Time, HT - Half Time, PT- Part Time',
  `hasResearchLoad` int(11) DEFAULT NULL,
  `isAdmin` int(11) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`faculty_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,11323906,0,'CCS',5,'FT',0,0,NULL),(2,11324783,0,'CCS',8,'FT',0,0,NULL),(3,11316330,0,'CCS',7,'FT',1,0,NULL),(4,11319992,0,'CCS',9,'FT',0,0,NULL),(5,11111111,0,'CCS',8,'FT',1,0,NULL),(6,22222222,0,'CCS',7,'HT',0,0,NULL),(7,33333333,0,'CCS',4,'FT',1,0,NULL),(8,15555555,0,'CCS',5,'PT',1,1,NULL),(9,25555555,0,'CCS',5,'HT',1,0,NULL),(10,35555555,0,'CCS',2,'FT',0,1,NULL),(11,17777777,0,'CCS',1,'PT',1,0,NULL),(12,27777777,0,'CCS',3,'FT',1,0,NULL),(13,37777777,0,'CCS',10,'PT',1,0,NULL);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `history_id` int(11) NOT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `times_taught` int(11) DEFAULT NULL,
  `iteo_eval` float DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loads`
--

DROP TABLE IF EXISTS `loads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loads` (
  `loads_id` int(11) NOT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `admin_load` float DEFAULT NULL,
  `research_load` float DEFAULT NULL,
  `teaching_load` float DEFAULT NULL,
  `non_acad_load` float DEFAULT NULL,
  `deloading` float DEFAULT NULL,
  `total_load` float DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`loads_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loads`
--

LOCK TABLES `loads` WRITE;
/*!40000 ALTER TABLE `loads` DISABLE KEYS */;
/*!40000 ALTER TABLE `loads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preference`
--

DROP TABLE IF EXISTS `preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preference` (
  `pref_id` int(11) NOT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `hours_to_teach` varchar(100) DEFAULT NULL,
  `days_to_teach` varchar(5) DEFAULT NULL,
  `courses_to_teach` varchar(100) DEFAULT NULL,
  `other_remark` varchar(100) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pref_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preference`
--

LOCK TABLES `preference` WRITE;
/*!40000 ALTER TABLE `preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisite`
--

DROP TABLE IF EXISTS `requisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisite` (
  `requisite_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `req_course_id` int(11) DEFAULT NULL,
  `req_type` int(11) DEFAULT NULL COMMENT '1 - prerequisite, 2 - soft prerequisite, 3 - co requisite',
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`requisite_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisite`
--

LOCK TABLES `requisite` WRITE;
/*!40000 ALTER TABLE `requisite` DISABLE KEYS */;
/*!40000 ALTER TABLE `requisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialization`
--

DROP TABLE IF EXISTS `specialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialization` (
  `spec_id` int(11) NOT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`spec_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialization`
--

LOCK TABLES `specialization` WRITE;
/*!40000 ALTER TABLE `specialization` DISABLE KEYS */;
/*!40000 ALTER TABLE `specialization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (99999999,4,'Anakin','Vader','Skywalker','System Administrator',NULL,NULL),(11323906,1,'Nikko','Tayao','Borja','Chair',NULL,NULL),(11324783,2,'Ken','Vermug','Hosoya','Chair',NULL,NULL),(11316330,3,'Jared Luke','Campit','Pangilinan','Chair',NULL,NULL),(11319992,4,'Mervin Stewart','Chan','Uy','Academic Programming Officer',NULL,NULL),(11111111,1,'Rey','Kenobi','Skywalker','Vice Chair',NULL,NULL),(22222222,2,'Kylo','Solo','Ren','Vice Chair',NULL,NULL),(33333333,3,'Han','Ford','Solo','Vice Chair',NULL,NULL),(14444444,1,'Kenneth','Duterte','Wang','Secretary',NULL,NULL),(24444444,2,'Jonah','Andres','Syfu','Secretary',NULL,NULL),(34444444,3,'Patrick','Batak','Esquillo','Secretary',NULL,NULL),(15555555,1,'Courtney Anne','Maiquilla','Ngo','Faculty',NULL,NULL),(25555555,2,'Remedios','De Dios','Bulos','Faculty',NULL,NULL),(35555555,3,'Ethel Joy','Chua','Ong','Faculty',NULL,NULL),(17777777,1,'Daenerys','Clarke','Targaryen','Faculty',NULL,NULL),(27777777,2,'Joffrey','Gleeson','Baratheon','Faculty',NULL,NULL),(37777777,3,'Jon','Harrington','Snow','Faculty',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yearhandled`
--

DROP TABLE IF EXISTS `yearhandled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yearhandled` (
  `handled_id` int(11) NOT NULL,
  `history_id` int(11) DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `iteo_eval` float DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`handled_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yearhandled`
--

LOCK TABLES `yearhandled` WRITE;
/*!40000 ALTER TABLE `yearhandled` DISABLE KEYS */;
/*!40000 ALTER TABLE `yearhandled` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-30  4:57:27
