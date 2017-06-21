-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: archeronedb
-- ------------------------------------------------------
-- Server version	5.7.14

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
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college` (
  `college_id` int(11) NOT NULL AUTO_INCREMENT,
  `college_code` varchar(45) DEFAULT NULL,
  `college_name` varchar(100) DEFAULT NULL,
  `isObsolete` int(11) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`college_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES (1,'BAGCED','Br. Andrew Gonzalez College of Education',0,NULL),(2,'CCS','College of Computer Studies',0,NULL),(3,'COL','College of Law',0,NULL),(4,'CLA','College of Liberal Arts',0,NULL),(5,'COS','College of Science',0,NULL),(6,'GCOE','Gokongwei College of Engineering',0,NULL),(7,'RVRCOB','Ramon V. del Rosario College of Business',0,NULL),(8,'SOE','School of Economics',0,NULL),(9,'NC','No College',0,NULL);
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
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
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `college_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `course_code` varchar(7) DEFAULT NULL,
  `course_name` varchar(70) DEFAULT NULL,
  `course_type` varchar(45) DEFAULT NULL,
  `units` float DEFAULT NULL,
  `isNonAcad` int(11) DEFAULT NULL,
  `isNonCourse` int(11) DEFAULT NULL,
  `isMasters` int(11) DEFAULT NULL,
  `isSHS` int(11) DEFAULT NULL,
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
-- Table structure for table `days`
--

DROP TABLE IF EXISTS `days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `days` (
  `days_id` int(11) NOT NULL AUTO_INCREMENT,
  `offering_id` int(11) DEFAULT NULL,
  `day` varchar(4) DEFAULT NULL,
  `start_time` varchar(4) DEFAULT NULL,
  `end_time` varchar(4) DEFAULT NULL,
  `room` varchar(45) DEFAULT NULL,
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
  `college_id` int(11) DEFAULT NULL,
  `dept_name` varchar(150) DEFAULT NULL,
  `dept_code` varchar(20) DEFAULT NULL,
  `dept_size` int(11) DEFAULT NULL,
  `isObsolete` int(11) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (5,1,'Counseling and Educational Psychology Department ','CEPD',50,0,NULL),(6,1,'Department of English and Applied Linguistics','DEAL',50,0,NULL),(7,1,'Educational Leadership and Management Department','ELMD',50,0,NULL),(8,1,'Physical Education Department','PED',50,0,NULL),(9,1,'Science Education Department','SED',50,0,NULL),(10,2,'Computer Technology','CT',50,0,NULL),(11,2,'Information Technology','IT',50,0,NULL),(12,2,'Software Technology','ST',50,0,NULL),(13,3,'College of Law (Department)','COL',50,0,NULL),(14,4,'Behavioral Sciences Department','BSD',50,0,NULL),(15,4,'Communication Department','COMM',50,0,NULL),(16,4,'Departamento ng Filipino','FIL',50,0,NULL),(17,4,'History Department','HIST',50,0,NULL),(18,4,'International Studies Department','IS',50,0,NULL),(19,4,'Department of Literature','LIT',50,0,NULL),(20,4,'Philosophy Department','PHILO',50,0,NULL),(21,4,'Political Science Department','POLSCI',50,0,NULL),(22,4,'Psychology Department','PSYC',50,0,NULL),(23,4,'Theology and Religous Education Department','TRED',50,0,NULL),(24,5,'Biology Department','BIO',50,0,NULL),(25,5,'Chemistry Department','CHEM',50,0,NULL),(26,5,'Mathematics Deparrtment','MATH',50,0,NULL),(27,5,'Physics Department','PHY',50,0,NULL),(28,6,'Chemical Engineering Department','CHE',50,0,NULL),(29,6,'Civil Engineering Department','CE',50,0,NULL),(30,6,'Electronics and Communications Engineering Department','ECE',50,0,NULL),(31,6,'Industrial Engineering','IE',50,0,NULL),(32,6,'Manufacturing Engineering and Management','MEM',50,0,NULL),(33,6,'Mechanical Engineering','ME',50,0,NULL),(34,7,'Accountancy','ACCTY',50,0,NULL),(35,7,'Center for Professional Development in Business','CPDB',50,0,NULL),(36,7,'Commercial Law','COMM LAW',50,0,NULL),(37,7,'Decision Sciences and Innovation Department','DSI',50,0,NULL),(38,7,'Financial Management Department','FMD',50,0,NULL),(39,7,'Management and Organization Department','MOD',50,0,NULL),(40,7,'Marketing Management','MKTG MGT',50,0,NULL),(41,8,'Economics Department','ECON',50,0,NULL),(42,9,'No Department','ND',50,0,NULL);
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
  `years_of_service` int(11) DEFAULT NULL,
  `faculty_status` varchar(2) DEFAULT NULL COMMENT 'FT - Full Time, HT - Half Time, PT- Part Time',
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`faculty_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loads`
--

DROP TABLE IF EXISTS `loads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loads` (
  `loads_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_id` int(11) DEFAULT NULL,
  `admin_load` float DEFAULT NULL,
  `research_load` float DEFAULT NULL,
  `teaching_load` float DEFAULT NULL,
  `non_acad_load` float DEFAULT NULL,
  `deloading` float DEFAULT NULL,
  `total_load` float DEFAULT NULL,
  `preparations` int(11) DEFAULT NULL,
  `hasResearchLoad` int(11) DEFAULT NULL,
  `isAdmin` int(11) DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
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
-- Table structure for table `offering`
--

DROP TABLE IF EXISTS `offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offering` (
  `offering_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `degree_program` varchar(45) DEFAULT NULL,
  `section` varchar(4) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `max_students_enrolled` int(11) DEFAULT NULL,
  `curr_students_enrolled` int(11) DEFAULT NULL,
  `isNonAcad` int(11) DEFAULT NULL,
  `isSHS` int(11) DEFAULT NULL,
  `isServiceCourse` int(11) DEFAULT NULL,
  `isMasters` int(11) DEFAULT NULL,
  `isElective` int(11) DEFAULT NULL,
  `elective_type` varchar(7) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `iteo_eval` float DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`offering_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offering`
--

LOCK TABLES `offering` WRITE;
/*!40000 ALTER TABLE `offering` DISABLE KEYS */;
/*!40000 ALTER TABLE `offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preference`
--

DROP TABLE IF EXISTS `preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preference` (
  `pref_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `requisite_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `spec_id` int(11) NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `college_id` int(11) DEFAULT NULL,
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
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-21 22:27:42
