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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'No Area',NULL);
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
  `course_code` varchar(100) DEFAULT NULL,
  `course_name` varchar(150) DEFAULT NULL,
  `course_type` varchar(45) DEFAULT NULL,
  `units` float DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=229 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (228,2,12,0,'COMPRG2','Computer Programming 2','TL',3,'',NULL),(227,2,12,0,'COMLAB1','Computer Laboratory 1','TL',3,'',NULL),(226,2,12,0,'SOFTMAN','Software Management','TL',3,'',NULL),(225,2,12,0,'MODESTA','Modeling and Simulation and Statistics','TL',3,'',NULL),(224,2,12,0,'TECHPRE','Techpreneurship','TL',3,'',NULL),(223,2,12,0,'DASTRAP','Applied Data Structures and Algorithms','TL',3,'',NULL),(222,2,12,0,'CSC511C','Operating Systems','TL',3,'',NULL),(221,2,12,0,'PERSEF2','Personal Effectiveness 2','TL',2,'',NULL),(220,2,12,0,'CSC713M - Machine Learning','Machine Learning','TL',3,'',NULL),(219,2,12,0,'COMMAT4','Computer for Mathematics 4','TL',3,'',NULL),(218,2,12,0,'AN-MODE','SYSTEMS ANALYSIS AND DESIGN PROJECT','TL',1,'',NULL),(217,2,12,0,'DEV-WEB','Development Of Web Applications','TL',3,'',NULL),(216,2,12,0,'WEBPROG','Web Programming','TL',3,'',NULL),(215,2,12,0,'WEBDEVE','Web Development Development','TL',3,'',NULL),(214,2,12,0,'solo','research','RL',3,'',NULL),(213,2,12,0,'EMPATHY','Empathic Computing','TL',3,'',NULL),(212,2,12,0,'PAASCU','PAASCU','RL',3,'',NULL),(211,2,12,0,'COMPRO1','Introduction To Computer Programming 1','TL',3,'',NULL),(210,2,12,0,'DESPATT','Design Patterns','TL',3,'',NULL),(209,2,12,0,'URCO - w/COE','URCO w/ COE','RL',6,'',NULL),(208,2,12,0,'CIS556M - ProgLan w/ Adv DaStruct','Programming Languages with Advanced Data Structures','TL',3,'',NULL),(207,2,12,0,'CSC755M - Algocom','Algorithms and Complexity','TL',3,'',NULL),(206,2,12,0,'3DMODEL','3D Modelling','TL',3,'',NULL),(205,2,12,0,'DEAN','DEAN','AL',12,'',NULL),(204,2,12,0,'MOBIDEV','Development Of Mobile Applications','TL',3,'',NULL),(203,2,12,0,'ADVANSE','Advanced Software Engineering','TL',3,'',NULL),(202,2,12,0,'CSC514C - DB App Dev','Database Application Development','TL',3,'',NULL),(201,2,12,0,'Knowledge Sources','Knowledge Sources','RL',3,'',NULL),(200,2,12,0,'IR: ECA','IR: ECA','RL',3,'',NULL),(199,2,12,0,'ST Vice Chair','Software Technology Vice Chair','AL',3,'',NULL),(198,2,12,0,'CSC505C - Dastruc','Data Structures and Algorithms','TL',3,'',NULL),(197,2,12,0,'RPW','RPW ','RL',3,'',NULL),(196,2,12,0,'IE4QA','IEQ4QA','RL',3,'',NULL),(195,2,12,0,'ST Chair','Software Technology Chair','AL',6,'',NULL),(194,2,12,0,'COMMAT3','Computer for Mathematics 3','TL',3,'',NULL),(193,2,12,0,'Thesis Grant','Thesis Grant','AL',6,'',NULL),(192,2,12,0,'INTRPRG','Introduction to Programming and Logic Formulation','TL',3,'',NULL),(191,2,12,0,'OBJECTP','Object Oriented Programming with Java','TL',3,'',NULL),(190,2,12,0,'INOVATE','Technology And Innovation Management','TL',3,'',NULL),(189,2,12,0,'INTRNLP','Introduction To Natural Language Processing','TL',3,'',NULL),(188,2,12,0,'COMALGO','Theory Of Computation And Algorithm Analysis','TL',3,'',NULL),(187,2,12,0,'INTROOS','Introduction To Operating System','TL',3,'',NULL),(186,2,12,0,'Vice Dean','Vice Dean','AL',10,'',NULL),(185,2,12,0,'CSC714M - Intro NLP','Introduction To Natural Language Processing','TL',3,'',NULL),(184,2,12,0,'ADVPROG','Advanced Programming','TL',3,'',NULL),(183,2,12,0,'INTRODB','Introduction To Database Systems','TL',3,'',NULL),(182,2,12,0,'Thesis Grant','Thesis Grant','AL',3,'',NULL),(181,2,12,0,'CSC504C - ObjectP/Java','Object Oriented Programming with Java','TL',3,'',NULL),(180,2,12,0,'COMPRO2','Advanced C Programming','TL',3,'',NULL),(179,2,12,0,'ADVANDB','Advanced Database Systems','TL',3,'',NULL),(178,2,12,0,'CSC615M - XAUTOMA','Automata Theory and Formal Languages and Computational Complexity','TL',3,'',NULL),(177,2,12,0,'CIS201M','CIS201M','TL',3,'',NULL),(176,2,12,0,'CIS559M - ADVANDB','Advanced Database Systems','TL',3,'',NULL),(175,2,12,0,'THEOCOM','Automata Theory and Formal Languages and Computational Complexity','TL',3,'',NULL),(174,2,12,0,'CSC506C - Disctru','Discrete Structures','TL',3,'',NULL),(173,2,12,0,'DISCTRU','Discrete Structures','TL',3,'',NULL),(172,2,12,0,'COMPILE','Compiler Theory','TL',3,'',NULL),(171,2,12,0,'CSC617M - ProgLan','Programming Languages','TL',3,'',NULL),(170,2,12,0,'ALGOCOM','Algorithms and Complexity','TL',3,'',NULL),(169,2,12,0,'CEC Director ','CEC Director','AL',6,'',NULL),(168,2,12,0,'VCR','Vice Chancellor Of Academic','AL',12,'',NULL),(167,2,12,0,'CSC721M - Neural Nets','Neural Nets','TL',3,'',NULL);
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
  `faculty_type` varchar(5) DEFAULT NULL COMMENT 'FT - Full Time, HT - Half Time, PT- Part Time',
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`faculty_id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (71,22098909,1,'FT',NULL),(70,22567683,1,'FT',NULL),(69,22833990,1,'PT',NULL),(68,22155322,1,'PT',NULL),(67,22039001,1,'PT',NULL),(66,22344564,1,'PT',NULL),(65,22832111,1,'PT',NULL),(64,22098177,1,'FT',NULL),(63,22177932,1,'FT',NULL),(62,22234115,1,'FT',NULL),(61,22637450,1,'FT',NULL),(60,22683488,1,'FT',NULL),(59,22711414,1,'FT',NULL),(58,22374777,1,'FT',NULL),(57,22611389,1,'FT',NULL),(56,22784944,1,'FT',NULL),(55,22764530,1,'FT',NULL),(54,22647488,1,'FT',NULL),(53,22879890,1,'FT',NULL),(52,22778155,1,'FT',NULL),(51,22165677,1,'FT',NULL),(50,22675888,1,'FT',NULL),(49,22176192,1,'FT',NULL),(48,22090001,1,'FT',NULL),(47,22526611,1,'FT',NULL),(46,22718119,1,'FT',NULL),(45,22778675,1,'FT',NULL),(44,22317443,1,'FT',NULL),(43,22590997,1,'FT',NULL);
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
  `college_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `admin_load` float DEFAULT NULL,
  `research_load` float DEFAULT NULL,
  `teaching_load` float DEFAULT NULL,
  `non_acad_load` float DEFAULT NULL,
  `deloading` float DEFAULT NULL,
  `total_load` float DEFAULT NULL,
  `preparations` int(11) DEFAULT NULL,
  `hasResearchLoad` int(11) DEFAULT NULL,
  `isAdmin` int(11) DEFAULT NULL,
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
  `description` varchar(100) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `iteo_eval` float DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`offering_id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offering`
--

LOCK TABLES `offering` WRITE;
/*!40000 ALTER TABLE `offering` DISABLE KEYS */;
INSERT INTO `offering` VALUES (1,167,43,'MSCS','G01',113,2,2012,2013,4,4,0,0,0,0,0,'','','Regular','Main',5,NULL),(2,168,43,'-ADM','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(3,169,44,'-ADM ','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(4,170,44,'3-ST','S18',113,2,2012,2013,33,33,0,0,0,0,0,'','','Regular','Main',5,NULL),(5,171,44,'MSCS','G01',113,2,2012,2013,14,14,0,0,0,0,0,'','','Regular','Main',5,NULL),(6,172,44,'SC','SS1',113,2,2012,2013,2,2,0,0,0,0,0,'','','Regular','Main',5,NULL),(7,173,45,'1-CS','S14',113,2,2012,2013,43,43,0,0,0,0,0,'','','Regular','Main',5,NULL),(8,173,45,'1-CS','S17',113,2,2012,2013,43,43,0,0,0,0,0,'','','Regular','Main',5,NULL),(9,173,45,'1-CSE','S12',113,2,2012,2013,38,38,0,0,0,0,0,'','','Regular','Main',5,NULL),(10,174,45,'DipCS','G01',113,2,2012,2013,12,12,0,0,0,0,0,'','','Regular','Main',5,NULL),(11,175,46,'2-ST','S19',113,2,2012,2013,43,43,0,0,0,0,0,'','','Regular','Main',5,NULL),(12,175,46,'2-ST','S17',113,2,2012,2013,28,28,0,0,0,0,0,'','','Regular','Main',5,NULL),(13,175,46,'2-ST','S18',113,2,2012,2013,34,34,0,0,0,0,0,'','','Regular','Main',5,NULL),(14,176,46,'SC','G01',113,2,2012,2013,7,7,0,0,0,0,0,'','','Regular','Main',5,NULL),(15,177,46,'SC','GS1',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(16,178,46,'SC','GS1',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(17,179,46,'SC','SS1',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(18,180,47,'1-CS','S14A',113,2,2012,2013,20,20,0,0,0,0,0,'','','Regular','Main',5,NULL),(19,180,47,'1-CS','S12B',113,2,2012,2013,20,20,0,0,0,0,0,'','','Regular','Main',5,NULL),(20,181,47,'DipCS','G01',113,2,2012,2013,19,19,0,0,0,0,0,'','','Regular','Main',5,NULL),(21,182,47,'-VCA','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(22,183,48,'2-NE','S22',113,2,2012,2013,43,43,0,0,0,0,0,'','','Regular','Main',5,NULL),(23,183,48,'2-IST','S20',113,2,2012,2013,24,24,0,0,0,0,0,'','','Regular','Main',5,NULL),(24,184,48,'IRR','S13A',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(25,183,48,'2-NE','S23',113,2,2012,2013,31,31,0,0,0,0,0,'','','Regular','Main',5,NULL),(26,180,49,'1-CSE','S11B',113,2,2012,2013,20,20,0,0,0,0,0,'','','Regular','Main',5,NULL),(27,180,49,'1-CS','S17B',113,2,2012,2013,20,20,0,0,0,0,0,'','','Regular','Main',5,NULL),(28,185,49,'MSCS','M',113,2,2012,2013,13,13,0,0,0,0,0,'','','Regular','Main',5,NULL),(29,180,49,'1-CS','S16A',113,2,2012,2013,21,21,0,0,0,0,0,'','','Regular','Main',5,NULL),(30,186,50,'-ADM','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(31,187,50,'3-CSE','S11 ',113,2,2012,2013,25,25,0,0,0,0,0,'','','Regular','Main',5,NULL),(32,188,51,'2-CSE','S12',113,2,2012,2013,43,43,0,0,0,0,0,'','','Regular','Main',5,NULL),(33,189,51,'3-ST','S19',113,2,2012,2013,28,28,0,0,0,0,0,'','','Regular','Main',5,NULL),(34,190,51,'3-ST','S19',113,2,2012,2013,45,45,0,0,0,0,0,'','','Regular','Main',5,NULL),(35,188,51,'2-NE','S23',113,2,2012,2013,15,15,0,0,0,0,0,'','','Regular','Main',5,NULL),(36,191,52,'IRR','S11',113,2,2012,2013,15,15,0,0,0,0,0,'','','Regular','Main',5,NULL),(37,192,52,'IRR','S13 ',113,2,2012,2013,22,22,0,0,0,0,0,'','','Regular','Main',5,NULL),(38,182,52,'VCA','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(39,194,52,'SC','NS1',113,2,2012,2013,5,5,0,0,0,0,0,'','','Regular','Main',5,NULL),(40,195,53,'-ADM','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(41,196,53,'-URCO','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(42,197,53,'-URCO','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(43,188,54,'2-CSE','S11',113,2,2012,2013,15,15,0,0,0,0,0,'','','Regular','Main',5,NULL),(44,170,54,'3-ST','S19',113,2,2012,2013,30,30,0,0,0,0,0,'','','Regular','Main',5,NULL),(45,170,54,'3-ST','S17',113,2,2012,2013,42,42,0,0,0,0,0,'','','Regular','Main',5,NULL),(46,198,54,'DipCS','G01',113,2,2012,2013,9,9,0,0,0,0,0,'','','Regular','Main',5,NULL),(47,183,55,'2-CSE','S11',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(48,199,55,'-ADM','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(49,200,55,'-URCO','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(50,201,55,'-URCO','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(51,202,55,'SC','GS1',113,2,2012,2013,1,1,0,0,0,0,0,'','','Regular','Main',5,NULL),(52,203,55,'SC','SS1',113,2,2012,2013,2,2,0,0,0,0,0,'','','Regular','Main',5,NULL),(53,204,56,'NEW','S13',113,2,2012,2013,26,26,0,0,0,0,0,'','','Regular','Main',5,NULL),(54,204,56,'NEW','S14',113,2,2012,2013,25,25,0,0,0,0,0,'','','Regular','Main',5,NULL),(55,182,56,'-VCA','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(56,205,57,'-ADM','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(57,180,58,'1-CS','S17A',113,2,2012,2013,20,20,0,0,0,0,0,'','','Regular','Main',5,NULL),(58,180,58,'1-CS','S15A',113,2,2012,2013,20,20,0,0,0,0,0,'','','Regular','Main',5,NULL),(59,180,58,'1-CS','S12A',113,2,2012,2013,20,20,0,0,0,0,0,'','','Regular','Main',5,NULL),(60,206,58,'3-ST','S17',113,2,2012,2013,43,43,0,0,0,0,0,'','','Regular','Main',5,NULL),(61,207,59,'MSCS','G01',113,2,2012,2013,9,9,0,0,0,0,0,'','','Regular','Main',5,NULL),(62,208,59,'MSIT','G01',113,2,2012,2013,16,16,0,0,0,0,0,'','','Regular','Main',5,NULL),(63,209,59,'-URCO','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(64,210,59,'SC','NS1',113,2,2012,2013,2,2,0,0,0,0,0,'','','Regular','Main',5,NULL),(65,211,60,'IRR','S11',113,2,2012,2013,17,17,0,0,0,0,0,'','','Regular','Main',5,NULL),(66,211,60,'IRR','S17',113,2,2012,2013,17,17,0,0,0,0,0,'','','Regular','Main',5,NULL),(67,211,60,'IRR','S16 ',113,2,2012,2013,17,17,0,0,0,0,0,'','','Regular','Main',5,NULL),(68,212,60,'-ADM','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(69,213,61,'3-ST','S18',113,2,2012,2013,35,35,0,0,0,0,0,'','','Regular','Main',5,NULL),(70,214,61,'-URCO','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(71,200,61,'-URCO','',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(72,215,62,'4-CSE','S11',113,2,2012,2013,28,28,0,0,0,0,0,'','','Regular','Main',5,NULL),(73,216,62,'NEW','S11',113,2,2012,2013,25,25,0,0,0,0,0,'','','Regular','Main',5,NULL),(74,217,62,'2-IS ','S15 ',113,2,2012,2013,28,28,0,0,0,0,0,'','','Regular','Main',5,NULL),(75,217,62,'2-IS','S16',113,2,2012,2013,28,28,0,0,0,0,0,'','','Regular','Main',5,NULL),(76,218,62,'2-IS','S13',113,2,2012,2013,28,28,0,0,0,0,0,'','','Regular','Main',5,NULL),(77,219,62,'SC','NS1',113,2,2012,2013,1,1,0,0,0,0,0,'','','Regular','Main',5,NULL),(78,187,63,'3-NE','S12',113,2,2012,2013,23,23,0,0,0,0,0,'','','Regular','Main',5,NULL),(79,187,63,'3-NE','S23',113,2,2012,2013,37,37,0,0,0,0,0,'','','Regular','Main',5,NULL),(80,220,63,'MSCS','G01',113,2,2012,2013,20,20,0,0,0,0,0,'','','Regular','Main',5,NULL),(81,221,63,'','NO4',113,2,2012,2013,-999,-999,1,0,0,0,0,'','','Regular','Main',5,NULL),(82,222,63,'','SS1',113,2,2012,2013,1,1,0,0,0,0,0,'','','Regular','Main',5,NULL),(83,223,64,'1-IS','S13',113,2,2012,2013,38,38,0,0,0,0,0,'','','Regular','Main',5,NULL),(84,223,64,'1-IS','S18',113,2,2012,2013,34,34,0,0,0,0,0,'','','Regular','Main',5,NULL),(85,223,64,'1-IS','S19',113,2,2012,2013,41,41,0,0,0,0,0,'','','Regular','Main',5,NULL),(86,223,64,'NEW','S14',113,2,2012,2013,22,22,0,0,0,0,0,'','','Regular','Main',5,NULL),(87,190,65,'3-ST','S18',113,2,2012,2013,44,44,0,0,0,0,0,'','','Regular','Main',5,NULL),(88,224,65,'3-CSE','S11',113,2,2012,2013,35,35,0,0,0,0,0,'','','Regular','Main',5,NULL),(89,190,65,'3-ST','S17',113,2,2012,2013,19,19,0,0,0,0,0,'','','Regular','Main',5,NULL),(90,225,66,'3-ST','S18',113,2,2012,2013,43,43,0,0,0,0,0,'','','Regular','Main',5,NULL),(91,225,67,'3-ST','S19',113,2,2012,2013,35,35,0,0,0,0,0,'','','Regular','Main',5,NULL),(92,225,67,'3-ST','S17',113,2,2012,2013,42,42,0,0,0,0,0,'','','Regular','Main',5,NULL),(93,173,68,'1-CSE','S11',113,2,2012,2013,40,40,0,0,0,0,0,'','','Regular','Main',5,NULL),(94,173,68,'1-CS','S15',113,2,2012,2013,43,43,0,0,0,0,0,'','','Regular','Main',5,NULL),(95,173,68,'1-CS','S16',113,2,2012,2013,43,43,0,0,0,0,0,'','','Regular','Main',5,NULL),(96,180,69,'IRR','S12',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','Main',5,NULL),(97,173,70,'1-CS','STC',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','STC',5,NULL),(98,223,70,'1-IS','STC',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','STC',5,NULL),(99,175,70,'2-ST','STC',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','STC',5,NULL),(100,226,70,'','STC',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','STC',5,NULL),(101,227,71,'IRR','STC',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','STC',5,NULL),(102,228,71,'1-CS','STC',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','STC',5,NULL),(103,211,71,'IRR','STC',113,2,2012,2013,-999,-999,0,0,0,0,0,'','','Regular','STC',5,NULL);
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
  `first_name` varchar(70) DEFAULT NULL,
  `middle_name` varchar(70) DEFAULT NULL,
  `last_name` varchar(70) DEFAULT NULL,
  `user_type` varchar(70) DEFAULT NULL,
  `user_password` varchar(200) DEFAULT NULL,
  `time_stamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (22590997,2,12,'Arnulfo','','Azcarraga','Faculty','iLoveCCS',NULL),(22317443,2,12,'Allan','','Borra','Faculty','iLoveCCS',NULL),(22778675,2,12,'Neil','','Bretana','Faculty','iLoveCCS',NULL),(22718119,2,12,'Remedios','','Bulos','Faculty','iLoveCCS',NULL),(22526611,2,12,'Miguel','','Cabral','Faculty','iLoveCCS',NULL),(22090001,2,12,'Chelsea','','Celestino','Faculty','iLoveCCS',NULL),(22176192,2,12,'Charibeth','','Cheng','Faculty','iLoveCCS',NULL),(22675888,2,12,'Kai Shan','','Fernandez','Faculty','iLoveCCS',NULL),(22165677,2,12,'Gian','','Fontanilla','Faculty','iLoveCCS',NULL),(22778155,2,12,'Juan Lorenzo','','Hagad','Faculty','iLoveCCS',NULL),(22879890,2,12,'Nathalie','','Lim-Cheng','Faculty','iLoveCCS',NULL),(22647488,2,12,'Teresita','','Limoanco','Faculty','iLoveCCS',NULL),(22764530,2,12,'Ethel','','Ong','Faculty','iLoveCCS',NULL),(22784944,2,12,'Ralph','','Regalado','Faculty','iLoveCCS',NULL),(22611389,2,12,'Rachel','','Roxas','Faculty','iLoveCCS',NULL),(22374777,2,12,'Florante','','Salvador','Faculty','iLoveCCS',NULL),(22711414,2,12,'See','','Solomon','Faculty','iLoveCCS',NULL),(22683488,2,12,'Raymund','','Sison','Faculty','iLoveCCS',NULL),(22637450,2,12,'Merlin','','Suarez','Faculty','iLoveCCS',NULL),(22234115,2,12,'Leif','','Syliongka','Faculty','iLoveCCS',NULL),(22177932,2,12,'Rhia','','Trogo','Faculty','iLoveCCS',NULL),(22098177,2,12,'Marjorie','','Chuacokiong','Faculty','iLoveCCS',NULL),(22832111,2,12,'Federico','','Gonzales','Faculty','iLoveCCS',NULL),(22344564,2,12,'Keone','','Medina','Faculty','iLoveCCS',NULL),(22039001,2,12,'Rose Ann','','Sale','Faculty','iLoveCCS',NULL),(22155322,2,12,'Joanne','','Vilda','Faculty','iLoveCCS',NULL),(22833990,2,12,'Jason','','Wong','Faculty','iLoveCCS',NULL),(22567683,2,12,'Emerico','','Aguilar','Faculty','iLoveCCS',NULL),(22098909,2,12,'Eric','','Navarro','Faculty','iLoveCCS',NULL);
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

-- Dump completed on 2017-06-24 23:46:57
