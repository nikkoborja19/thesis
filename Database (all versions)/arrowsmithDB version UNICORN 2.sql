-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: arrowsmiththunderbird
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`alias_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alias`
--

LOCK TABLES `alias` WRITE;
/*!40000 ALTER TABLE `alias` DISABLE KEYS */;
INSERT INTO `alias` VALUES (1,11323906,'Nikko','2017-07-13 03:01:27'),(2,11323906,'Borja','2017-07-13 03:01:27'),(3,11324783,'Ken','2017-07-13 03:01:27'),(4,11324783,'Hapon','2017-07-13 03:01:27'),(5,11316330,'Jed','2017-07-13 03:01:27'),(6,11316330,'Jared','2017-07-13 03:01:27'),(7,11319992,'Mervin','2017-07-13 03:01:27'),(8,11319992,'Uy','2017-07-13 03:01:27'),(9,11111111,'Rey','2017-07-13 03:01:27'),(10,22222222,'Kylo','2017-07-13 03:01:27'),(11,33333333,'Han','2017-07-13 03:01:27'),(12,14444444,'Wang','2017-07-13 03:01:27'),(13,24444444,'Syfu','2017-07-13 03:01:27'),(14,34444444,'Patrick','2017-07-13 03:01:27'),(15,15555555,'Courtney','2017-07-13 03:01:27'),(16,25555555,'Bulos','2017-07-13 03:01:27'),(17,25555555,'Remy','2017-07-13 03:01:27'),(18,25555555,'Rems','2017-07-13 03:01:27'),(19,35555555,'Ethel','2017-07-13 03:01:27'),(20,17777777,'Dany','2017-07-13 03:01:27'),(21,27777777,'Joffrey','2017-07-13 03:01:27'),(22,37777777,'Jon','2017-07-13 03:01:27');
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
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'No Area','2017-07-13 03:01:27');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batchinfo`
--

DROP TABLE IF EXISTS `batchinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchinfo` (
  `batchinfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `degreeprogram_id` int(11) NOT NULL,
  `batch` int(11) NOT NULL,
  `studentcount` int(11) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`batchinfo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batchinfo`
--

LOCK TABLES `batchinfo` WRITE;
/*!40000 ALTER TABLE `batchinfo` DISABLE KEYS */;
INSERT INTO `batchinfo` VALUES (1,1,113,60,'2017-07-29 11:22:19'),(2,1,114,70,'2017-07-29 11:22:19'),(3,2,113,30,'2017-07-29 11:22:19'),(9,2,114,20,'2017-07-29 11:22:19'),(10,3,113,20,'2017-07-29 11:22:19'),(11,3,114,30,'2017-07-29 11:22:19');
/*!40000 ALTER TABLE `batchinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building` (
  `building_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_name` varchar(150) DEFAULT NULL,
  `building_code` varchar(10) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`building_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'No Building','NB','2017-07-27 12:15:52'),(2,'St. La Salle Hall','LS','2017-07-27 12:15:52'),(3,'Velasco Hall','VL','2017-07-27 12:15:52'),(4,'Br. Gabriel Connon Hall','CH','2017-07-27 12:15:52'),(5,'Gokongwei Hall','GK','2017-07-27 12:15:52'),(6,'Br. Andrew Gonzales Hall','AG','2017-07-27 12:15:52'),(7,'Enrique Razon Sports Center','ER','2017-07-27 12:15:52'),(8,'Br. William Hall','WH','2017-07-27 12:15:52'),(9,'Br. John Hall','JH','2017-07-27 12:15:52'),(10,'Yuchengco Hall','Y','2017-07-27 12:15:52'),(11,'Bloemen Hall','BH','2017-07-27 12:15:52'),(12,'Henry Sy Sr. Hall','HSSH','2017-07-27 12:15:52'),(13,'St. Miguel Hall','SM','2017-07-27 12:15:52'),(14,'St. Joseph Hall','SJ','2017-07-27 12:15:52'),(15,'Mutien Marie Hall','MM','2017-07-27 12:15:52'),(16,'Science And Technology Research Center Hall','STRC','2017-07-27 12:15:52'),(17,'Science And Technology Complex','STC','2017-07-27 12:15:52');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
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
  `is_obsolete` int(11) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`college_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES (1,'BAGCED','Br. Andrew Gonzalez College of Education',0,'2017-07-13 03:01:27'),(2,'CCS','College of Computer Studies',0,'2017-07-13 03:01:27'),(3,'COL','College of Law',0,'2017-07-13 03:01:27'),(4,'CLA','College of Liberal Arts',0,'2017-07-13 03:01:27'),(5,'COS','College of Science',0,'2017-07-13 03:01:27'),(6,'GCOE','Gokongwei College of Engineering',0,'2017-07-13 03:01:27'),(7,'RVRCOB','Ramon V. del Rosario College of Business',0,'2017-07-13 03:01:27'),(8,'SOE','School of Economics',0,'2017-07-13 03:01:27'),(9,'NC','No College',0,'2017-07-13 03:01:27');
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
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`constraint_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constraints`
--

LOCK TABLES `constraints` WRITE;
/*!40000 ALTER TABLE `constraints` DISABLE KEYS */;
INSERT INTO `constraints` VALUES (1,1,6,4.5,4,3,6,3,9,3,12,6,'2017-07-13 03:01:27'),(2,2,6,4.5,4,3,6,3,9,3,12,6,'2017-07-13 03:01:27'),(3,3,6,4.5,4,3,6,3,9,3,12,6,'2017-07-13 03:01:27'),(4,4,6,4.5,4,3,6,3,9,3,12,6,'2017-07-13 03:01:27');
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
  `units` float DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1816 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1496,2,12,0,'COMPRO1','Introduction to Computer Programming 1',3,'','This course covers the fundamentals of logic formulation and computer programming using the C programming language. It serves as a foundation for future courses that the students will encounter throughout the Computer Science program. This course is coupled with a lab component.','2017-11-18 05:38:42'),(1499,2,12,0,'COMPRO2','Advanced C Programming',3,'','This advanced course for computer programming in C covers the representation and manipulation of C data structures. This course, like COMPRO1, serves as a foundation for future courses that the students will encounter throughout the Computer Science program. This course is coupled with a lab component.','2017-11-18 05:43:01'),(1500,2,12,0,'OBJECTP','Object-oriented Programming using Java',3,'','This course provides the students with the fundamental understanding of object-oriented technology.  It also introduces the different concepts that are commonly associated with object-oriented programming such as threading, event-driven programming, etc. using Java as the programming language.','2017-11-18 05:45:47'),(1501,2,12,0,'INTRODB','Introduction to Databases',3,'','The course covers the basic theories behind databases, data models and database analysis and design. The course will tackle different data models but will concentrate mainly on relational databases, being the most commonly used today.  The course introduces learners to concepts on conceptual design of databases using the concepts of the Entity-Relationship (ER) model and normalization, relational model, relational database design and database query languages. ','2017-11-18 05:53:41'),(1502,2,12,0,'ADVANDB','Advanced Database',3,'','This course is about major advanced concepts in the field of databases. Being an advanced course, it will involve a considerable amount of research work as embodied by the projects required to complete the course.','2017-11-18 05:57:12'),(1503,2,12,0,'SWDESPA','Software Design Patterns',3,'','This is an advanced programming course emphasizing object-oriented design. Design patterns are recurring solutions in designing systems and are considered simple yet elegant solutions which have been proven effective over time. The applications of these design patterns allow the creation of systems that are more scalable, reliable and effective. ','2017-11-18 06:00:19'),(1504,2,12,0,'WEBAPDE','Web Applications Development For ST',3,'','This course introduces students to the theories, processes and skills needed in the development of web applications. It provides an overview of the various technologies used in designing and implementing web-based systems. Advanced topics are also included to prepare students in realizing useful web applications that utilize up-to-date industry tools.','2017-11-18 06:03:06'),(1505,2,12,0,'SOFENGG','Introduction to Software Engineering',3,'','This course provides an overview of software engineering as a discipline concerned with the application of theory, knowledge, and practice for effectively and efficiently building software systems. It introduces the students to the fundamental principles and methodologies of software engineering.  It focuses on the concepts and principles of software requirements engineering, its tools, techniques, and methods for modeling software systems. Various approaches to requirements analysis and review activities are examined.','2017-11-18 06:12:34'),(1506,2,12,0,'SECURDE','Secure Web Development',3,'','This course introduces the students to the concepts and principles surrounding secure coding practices and software security assessment. Students will be taught how to properly assess threats that may present a risk to software, web applications in particular, and how to mitigate these threats by incorporating appropriate controls through the software development life cycle. The course will also cover the methodologies and tools used to test existing web applications.','2017-11-18 06:08:41'),(1507,2,12,0,'PROSDEV','Professional Software Development',3,'','The aim of this course is to prepare ST students for practicum and a career in software development by delivering actual knowledge and skills currently required by the industry. This is achieved through lectures from IT industry practitioners on the current trends and organizational practices that lead to producing software that is robust, reliable and attractive to use, often co-operating with others as part of a development team. ','2017-11-18 06:13:48'),(1508,2,12,0,'PRC-ST1','Practicum Course in ST',1,'','This course is the venue for Software Technology upperclassmen to apply and practice the Computer Science concepts and theories they have learned, by working in an actual company environment.','2017-11-18 06:16:03'),(1509,2,12,0,'MOBAPDE','Mobile Computing',3,'','In this course, we will look into the technical capabilities and challenges of developing for mobile platforms for practical usage in the IT industry. The course would also look into ways of integrating such devices into the industry supply chain and the issues it raises.','2017-11-18 06:17:56'),(1510,5,26,0,'CCSALGE','College Algebra for CCS Students ',2,'','This is a course tackling basic algebra for Computer Science Students. Topics include the number systems, algebraic expressions, fractions, rational exponents, linear and quadratic equations and inequalities, systems of equations, lines , linear and quadratic functions and inverse function,','2017-11-18 06:25:53'),(1511,5,26,0,'CCSTRIG','Trigonometry for Computer Science Majors ',2,'','This course covers polynomial functions, exponential and logarithmic functions, trigonometric functions, inverse trigonometric functions, solutions of triangles, law of sine and law of cosine','2017-11-18 06:31:01'),(1512,5,26,0,'CCSCAL1','Calculus 1 for CCS Students',3,'','This course covers basic concepts of plane analytic geometry, limits and continuity, derivatives and their applications.','2017-11-18 06:40:17'),(1513,5,26,0,'CCSCAL2','Calculus 2 for CCS Students',3,'','This second course in analysis covers differentiation and integration of exponential, logarithm and trigonometric functions; the concepts of the definite and indefinite integral and some applications of the definite integral.','2017-11-18 06:40:17'),(1514,2,12,0,'DISCTRU','Discrete Structures',3,'','This is a one-term introductory course in Discrete Mathematics. Topics include, but not limited to: prepositional and predicate logic, set theory, relations and functions, integers and algorithms, proof rules and program correctness, mathematical reasoning, recurrences. ','2017-11-18 06:38:40'),(1515,2,12,0,'DASALGO','Introduction to Data Structure and Algorithm',3,'','This is a introductory course in Data Structures and Algorithms. Topics include, but not limited to: representation and operations on linear and non-linear data structures (arrays, lists, stacks, queues, graphs, trees, heaps), applications of data structures, types of file organizations, hashing, and analysis of algorithms. ','2017-11-18 06:40:35'),(1516,2,12,0,'INTESYS','Intelligent Systems',3,'','This course introduces the students to the basic concepts and techniques in the area of artificial intelligence. Concepts and techniques include knowledge representations, searching and problem solving. Furthermore, the course is designed to expose undergraduate students to functional and symbolic programming and use of an expert system shell.','2017-11-18 06:44:56'),(1517,2,12,0,'ALGOCOM','Algorithm Complexity',3,'','This course covers the design and analysis of different algorithms under various design principles and techniques making use of different data structures.','2017-11-18 06:50:33'),(1518,2,12,0,'AUTOMAT','Automata Theory, Formal Languages and Computational Complexity',3,'','This course concentrates on the theoretical aspect of Computer Science, which has evolved from three disciplines: mathematics, engineering and linguistics.  ','2017-11-18 06:52:59'),(1519,2,12,0,'CMPILER','Compiler Theory',3,'','This course introduces the theories, formal techniques, design, and implementation considerations in the construction of interpreters, compilers, and language translators in general.','2017-11-18 07:03:11'),(1520,2,10,0,'BASICON','Basic Computer Concepts',3,'','This course provides an overview of computers, number systems, data types and representations, digital logic systems, assembly and machine language, compilers and translators, operating systems, internet working, human computer interactions, and intelligent systems.','2017-11-18 14:48:15'),(1521,2,10,0,'DIGIDES','Digital Design',3,'','This course provides an overview of the principles underlying number systems and representation, logic gates, Boolean algebra, simplification of Boolean functions, and basic operation of combinational and sequential logic circuits.','2017-11-18 14:48:15'),(1522,2,11,0,'NETWORK','Network ',3,'','This course introduces the student to the basic concepts of computer networking. The seven layered ISO-OSI reference model for computer networks, using TCP/IP and other current networking standards as an example.','2017-11-18 14:48:15'),(1523,2,10,0,'ARCHORG','Computer Architecture and Organization',3,'','This course provides an overview of Instruction Set Architecture through assembly language programming and the interaction between basic computer system components, namely the CPU, Memory, and I/O.','2017-11-18 14:48:15'),(1524,2,12,0,'OPERSYS','Introduction to Operating Systems',3,'','This is an introductory course to operating system design and implementation. This course will cover basic algorithms and procedures to CPU scheduling and memory management. This course will also introduce students to basic concepts of writing concurrent processes and basic techniques to synchronize processes.','2017-11-18 07:48:21'),(1525,5,26,0,'ST-STAT','Statistics and Probability for ST',3,'','This course covers simulation, which refers to a broad collection of methods to mimic the behavior of real systems. The main focus of this course is on building logical or mathematical models of systems and analyzing these models. Different types of simulation models such as Static, Dynamic, Continuous, Discrete, Deterministic and Stochastic models are discussed. This course also covers mathematical preliminaries to simulation such as pseudo-random number generation and an introduction to probability and statistics, which provide essential tools for conducting meaningful simulation.','2017-11-18 14:48:15'),(1526,5,26,0,'ADVSTAT','Advanced Statistics and Probability for ST',3,'','This course covers topics in advanced statistics and probability, including joint probability distribution, F-distribution, sampling distribution, chi-square distribution, and analysis of variance. Topics on numerical methods are also introduced, including continuous and discrete functions, non-linear equations, quadratic and cubic functions, interpolation, and regression techniques. ','2017-11-18 14:48:15'),(1527,2,12,0,'CSETHIC','CS Professional Ethics',3,'','None','2017-11-18 08:34:21'),(1528,5,24,0,'SCIMATB','G.E. Natural Science New Materials Track- BIO LEC',1,'','This is a course designed to help students appreciate and understand this exciting field by guiding them through the scientific underpinnings of modern biotechnology, giving them a grasp of the basic concepts and principles, and enabling them to be at pace with this rapidly evolving technology. This is brought about by the recent progress and cutting-edge breakthroughs in the field of biotechnology which have revolutionized our understanding of life processes and have led to innovations, practical applications and improvement in the ways by which we utilize living organisms to meet human needs.','2017-11-18 14:48:15'),(1529,5,24,0,'LBYMATB','G.E. Natural Science New Materials Track- CHEM LAB',1,'','This is a laboratory course designed to help students appreciate and understand this exciting field by guiding them through the scientific underpinnings of modern biotechnology, giving them a grasp of the basic concepts and principles, and enabling them to be at pace with this rapidly evolving technology. This is brought about by the recent progress and cutting-edge breakthroughs in the field of biotechnology which have revolutionized our understanding of life processes and have led to innovations, practical applications, and improvement in the ways by which we utilize living organisms to meet human needs.','2017-11-18 14:48:15'),(1530,1,8,0,'FITWELL','Physical Fitness and Wellness ',2,'','This course is an introductory course that focuses on our rich culture and cherished values. It enables this generation to enjoy the country’s games that developed the character and molded the values and beliefs of the young many decades ago. Game originations, modifications over time, special equipment, terminologies, and background information are given focus. Students are assessed on their ability to apply skills, strategies, rules and conventions of play while safely participating and enjoying and showing appropriate social behavior.','2017-11-18 14:48:15'),(1532,1,8,0,'FTDANCE','Physical Fitness and Wellness in Dance (Ballroom Dancing) ',2,'','This course is a basic course intended principally for students without previous dance experience. Students will be introduced to the basic fundamentals of partnership dancing. It includes basic dance steps and dance fundamentals needed to learn selected ballroom dances with emphasis on basic dance steps, rhythm, and technique. Young dancers are introduced through ballroom dance FINALE that will enhance their sense of rhythm, coordination, and confidence on the dance floor.','2017-11-18 14:48:15'),(1531,1,8,0,'FTSPORT','Physical Fitness and Wellness in Individual Sports (Philippine Games) ',2,'','This course is a soft pre-requisite course to all the succeeding Physical Education sports and rhythm activities. Every student will submit to the rigors and protocol of each Health-related fitness test components. Test results will help students understand their current fitness status, identify the risk, empower them to take responsibility for lifestyle decision, and inspire them to embrace the opportunity to make positive lifestyle choices. Each fitness component will be discussed every meeting to enlighten students on the facts, issues, controversies, and myths surrounding each topic. Active participation in the mastery of the aerobic mass demo routine and creation for the presentation of a creative aerobic routine from the basic rhythmic step patterns in the inter-class competition is required.','2017-11-18 14:48:15'),(1533,1,8,0,'FTTEAMS','Physical Fitness and Wellness in Team Sports (Basketball) ',2,'','This course is a basic course in basketball that equips students with the necessary skills needed to become an offensive/defensive team member in basketball. This course further develops fundamental skills learned in basketball through awareness of movement/actions and factors that influence a player to move intelligently and safely on the court. Application of discipline-specific, scientific, and theoretical concepts critical to the development of strategies, techniques, and the use of proper body mechanics will be strictly observed through safety performance while actively participating in drills/activities in order to become well informed and engaged basketball players.','2017-11-18 14:48:15'),(1534,1,7,0,'PERSEF1','Personal Effectiveness 1',2,'','The Lasallian Core Curriculum of the DLSU–Manila aims at developing a whole person who embodies the Lasallian values and demonstrates professional skills as well as personal competencies. This individual is mature in all aspects of his/her person, with a nationalistic and humanistic outlook and a carefully reasoned faith.   PERSEF1 is a foundational course in the Lasallian Core Curriculum, taken by all students in their first year. It provides the information and skills that they need as they blend into college life. The course covers basic topics in each of the 5 themes of total personal development, designed to complement their academic and spiritual growth. These themes will be further explored in the 2 other Personal Effectiveness courses which the students will take in later years.','2017-11-18 14:48:15'),(1535,1,7,0,'PERSEF2','Personal Effectiveness 2 ',2,'','The Lasallian Core Curriculum of the DLSU–Manila aims at developing a whole person who embodies the Lasallian values and demonstrates professional skills as well as personal competencies. This individual is mature in all aspects of his/her person, with a nationalistic and humanistic outlook and a carefully reasoned faith.   PERSEF2 is a formative course in the Lasallian Core Curriculum, taken by students in their 2nd or 3rd year, before they take their practicum courses. It focuses on their preparation for entry into the world of work. It is based on the theory that career is a developmental process that starts in childhood and goes on through life. One’s career development is thus affected by, and affects, one’s physical, socio–psychological, spiritual and cognitive development. The topics of the various sessions revolve around the same 5 themes of total personal development, which were covered in PERSEF1, but take on a different level with emphasis on career development.','2017-11-18 14:48:15'),(1536,1,7,0,'IPERSEF','Integrating Course for Personal Effectiveness ',0,'','This course integrates what the students have learned and internalized during the first and second personal effectiveness courses.','2017-11-18 14:48:15'),(1537,4,16,0,'FILKOMU','Komunikasyon sa Filipinohiya',3,'','The course focuses on the more advanced use of the Filipino language in discussing the five macro discourses of Philippine Studies which have been designed for an individual to know and understand oneself and appreciate one’s national identity, culture, and society. The general objective of the course is for every Lasallian student to acquire competence in communication in the five discourses of Filipinology in an academic context.','2017-11-18 14:48:15'),(1538,4,16,0,'FILDLAR','Pagbasa at Pagsulat sa Iba’t-ibang Disiplina ',3,'','The course focuses on the development of the analytical and critical skills of the students in reading and writing for academic and professional communication requirements with consideration of other language register. Students are taught the different paraphrasing techniques and reading strategies that go beyond literal translation through the use of written textual genre (as well as audio/visual) or from various language usage in the fields of humanities, social science and communication, science and technology, and the profession. To serve as models are various reading materials on how to conduct research papers and other scholarly essays.','2017-11-18 14:48:15'),(1579,2,12,0,'FORMDEV','Formation and Development',0.5,'','This course introduces the students to the life of St. La Salle and the early life of the Brothers of the Christians Schools, and assists them in relating these to their lives.','2017-11-18 14:18:54'),(1540,4,15,0,'ENGLCOM','Basic Communication and Study Skills',3,NULL,'ENGLCOM (Basic Communication and Study Skills) English one is a course that primarily focuses on the development of communicative competence in reading and writing. ENGLONE will use various strategies in academic reading, and the process approach to academic writing. Evaluation will include traditional and nontraditional (portfolio assessment) methods.','2017-11-18 14:48:15'),(1541,4,15,0,'SPEECOM','Oral Communication/Advanced Speech Class ',3,'','This course is an English for Specific Purposes (ESP) course that focuses on the production, delivery, and assessment of the following oral presentations: the impromptu, lecture and/or persuasive speech for individual presentation, and the panel discussion for group presentation. The presentations aim at providing students first-hand experiences in public speaking to develop their self-confidence and critical thinking in oral presentations addressing relevant social issues.','2017-11-18 14:48:15'),(1542,4,19,0,'ENGLRES','English for Academic Purposes ',3,'','This course aims to teach students to apply reading and writing skills necessary in conducting research. It also enhances the critical thinking skills required in academic research writing/communication of a particular field (Business, Computer Science, Liberal Arts, Education, Science, and Engineering).','2017-11-18 14:48:15'),(1543,2,12,0,'INOVATE','Technology and Innovation Management',3,'','This course is on managing technology and innovation for survival and growth in challenging times. Students will learn how to develop corporate strategies and understand current practices in innovation management. They will also devise innovation approaches that integrate design, marketing and production perspectives, and combine technology and business models.','2017-11-18 08:53:36'),(1544,4,22,0,'INTFILO','Introductory Philosophy ',3,'','Philosophy, both as a way of life and an academic discipline, examines and understands the fundamental questions about the world and human life, seeks answers to these questions, and applies the answers to daily living. It also examines the basis upon which beliefs are held, and explodes possible interconnections among various fields of knowledge. This course shall introduce students to the ideas of some of the world’s greatest philosophers, which have shaped the way in which human beings think and live. Consequently, this foundational philosophy course shall hone their skills in philosophical reasoning.','2017-11-18 14:48:15'),(1545,4,16,0,'KASPIL1','Buhay, Mga Sinulat, At Nagawa ni Dr. Jose Rizal ',3,'','This is a foundational course. The critical study and review of the life, writings, and achievements of Dr. Jose Rizal is a historical examination. The course also discusses the Spanish colonialism in the Philippines with emphasis in the 19th century during the time of Dr. Jose Rizal. The course is in compliance with the provisions set forth in the Rizal Law (R.A 1425, 1956) that aims to respond to the need of engendering and strengthening the spirit of nationalism in the life of the student.','2017-11-18 14:48:15'),(1546,4,16,0,'KASPIL2','Kasaysayan ng Pilipinas ',3,'','This course is a critical study of the history of the Philippines and its political, economic, social and cultural institutions from its birth up to the present as viewed under a Filipino perspective. This course discusses the development of the nation and the challenges that if faced at every significant chapter of its history. The course aims to inculcate in students the lessons learned from history and how these lessons can provide solution to the issues presently confronting the country.','2017-11-18 14:48:15'),(1547,4,23,0,'LASARE1','Lasallian Recollection 1 ',0,'','This one-day recollection for first year students focuses on the development of the Lasallian core values of faith, zeal for service, and communion in mission among the participants. Using passages from the Sacred Scriptures and references to the Lasallian founding story, LASARE1 invites each of the participants to (1) recognize and appreciate their inherent goodness and giftedness in the context of being created in the image and likeness of God, (2) explore ways by which they can enhance and share their gifts to their respective communities, and (3) identify a concrete community service project by which they can actualize the value or working together in a mission to serve those in need. The synthesizing point for all the activities of this one-day recollection is the call to be “Ambassadors of God” or to be the visible signs of faith, hope, and God’s love in this world.','2017-11-18 14:48:15'),(1548,4,23,0,'LASARE2','Lasallian Recollection 2',0,'','LASARE2 is a one–day recollection for second year students which intends to deepen the Lasallian Core Values of Faith, Zeal for Service and Communion in Mission among the participants by helping them become more aware of their calling. The program will provide an opportunity for the participants to understand what “calling” is and its principles; to be moved to respond to the greater reality beyond them; to identify their gifts and passions that will enable them to respond to their calling; and to express in writing how God is calling them in their present reality. At the end of the recollection, the participants are challenged to make their individual “mission statement” or a definition of their “life’s work” which manifests how they have integrated the Lasallian Core Values in their lives.','2017-11-18 14:48:15'),(1549,4,23,0,'LASARE3','Lasallian Recollection 3',0,'','The Integrating Lasallian Retreat (LASARET) is an overnight off-campus spiritual development activity for graduating students, aimed at nurturing in them a deep sense of purpose and mission. The retreat hopes that the students will be able to identify possible contributions and personal responses to the Gospel invitation of building God’s Kingdom or to the Lasallian vision of forming “Achievers for God and Country.”','2017-11-18 14:48:15'),(1550,4,19,0,'HUMAART','Introduction to Art ',3,'','This course is an introduction to the elements and principles of art (music, dance, architecture, sculpture, painting, and film) through a critical examination of the major art works, movements and styles in the Philippines and the world. It is principally a study of arts as processes of the creative imagination in dynamic interaction with its multi-faceted worlds.  To enable the students to appreciate the arts, the course will foreground the study of the arts and their elements on a story of how the basic human impetus to express oneself in enduring forms of beauty is born out of the struggle of the spirit on the day-to-day level. The arts provide the tangible and intangible examples of the magnificence of the human spirit which ennoble the mind and the heart of the beholder. And it is one’s awareness of the monuments of the human spirit’s magnificence that opens the way for a student’s life-long and deepening intimacy with the arts.','2017-11-18 14:48:15'),(1551,4,19,0,'HUMALIT','Introduction to Literature',3,'','Introduction to Literature is a foundational course that introduces students to literary forms of genres (fiction, poetry, drama) through the study of selected literary texts from various countries and historical periods. Students will be guided through the development of a personal framework for the analysis, appreciation, and assessment of literature','2017-11-18 14:48:15'),(1552,9,42,0,'NSTP101','NSTP General Orientation ',0,'','This non-academic course introduces the student to the general overview of the NSTP and CWTS, whose goals are to encourage the student/youth to contribute in nation building and in the improvement of the general welfare and the quality of life of local marginalized communities.','2017-11-18 14:48:15'),(1553,9,42,0,'NSTP-01','NSTP Community Service/ROTC 1',3,'','This non-academic course focuses in training and developing the NROTC cadets for incorporation into the Naval Reserve Force. Specifically, this course aims to indoctrinate and equip ROTC Cadet with: the basic knowledge on fundamentals and principles of military service, skills to move, shoot and communicate, and the right attitude of a military professional.','2017-11-18 14:48:15'),(1555,9,42,0,'NSTP-02','NSTP Community Service/ROTC 2',3,'','The NSTPCW2 is the second and final phase of the CWTS component of NSTP. Under CW2, students are given the opportunity to implement projects in partnership with local marginalized and deprived communities by way of actual community work through implementation and completion of short-term projects (e.g. literacy, resource mobilization, advocacy) that will benefit a partner community. The student is expected to submit term-end community project report.','2017-11-18 14:48:15'),(1572,2,12,0,'SOCTEC1','Science, Technology, and Society 1',3,'','Science, Technology, and Society 1 (SOCTEC 1) is a social science course designed for students of the Colleges of Computer Studies, Engineering, and Science. It uses social science perspectives to examine the nature, emergence, and progress of scientific and technological knowledge and practice. The course focuses on the interface between science and technology on the one hand and human society and culture on the other. Specifically, it shows how science emerges and develops as a response to the various problems and demands of society and how the practice of science is shaped by the social, cultural, political, and economic aspects of society. To be discussed in the course are current issues about science, technology, and society that are relevant to the students’ majors (natural and physical sciences, engineering, and computer science).','2017-11-18 11:14:23'),(1557,4,23,0,'TREDONE','Humanity’s Search for Life ',3,'','This course develops in students the skills for religious respect and tolerance, dialogue and unity, as they open themselves into inter-religious and ecumenical dialogue. This dialogue and sharing of spiritual gifts from the great traditions in turn show the way to promoting justice, peace, and integrity of creation.   In this course, the students discern the role that faith plays in their lives as they grapple with the questions and concerns on the meaning of life. As the course looks at the distinctiveness of Christianity and its different faith expressions, students are led to discover and critically appreciate the life-giving roots exemplified in their own beliefs, norms, and rituals. They deepen their understanding of the meaning of life by recognizing the truth, goodness, and beauty found in the different religious traditions.','2017-11-18 14:48:15'),(1558,4,23,0,'TREDTWO','The Filipino Christian in a Changing World ',3,'','This course develops students as persons in communities of moral discernment. The Filipino-Christian living in a rapidly changing world is confronted with challenges and alternative lifestyles which demand proper discernment, evaluation, and decision.','2017-11-18 14:48:15'),(1559,4,23,0,'TREDTRI','The Christian and the Word ',3,'','The course is a journey into Sacred Scriptures as a locus of encounter with JESUS, THE LIVING WORD. The students read and reflect on the bible as God’s revelation or personal communication, develop the skills in biblical analysis and personally reflect on the life of Jesus. The course empowers the students to live and promote the Gospel values of justice, peace, and care of creation in their lives and in their communities. Concretely, students immerse into communities in need of help in the catechetical ministry.','2017-11-18 14:48:15'),(1560,4,23,0,'TREDFOR','The Christian Vocation of Life',3,'','The course develops in the student the disposition and knowledge in discerning Christian life as a response of faith to the invitation to an unconditional offer of life and love (the Kingdom of God). The course focuses on marriage and family life as a response and commitment to follow Jesus. After exploring God’s call as vocation in Module 1, its implication for the marital commitment will be discussed in Modules 2 and 3. The characteristics, relational means of the marital commitment, and the meaning of being and becoming family will be treated in Module 4. Priesthood, religious life, and single life will also be discussed in Module 5 as other ways of responding to God’s call.','2017-11-18 14:48:15'),(1561,2,12,0,'STELEC1','ST Elective 1',3,'','None','2017-11-18 10:48:53'),(1562,2,12,0,'STELEC2','ST Elective 2',3,'','None','2017-11-18 10:49:07'),(1563,2,12,0,'STELEC3','ST Elective 3',3,'','None','2017-11-18 10:49:12'),(1564,2,12,0,'STELEC4','ST Elective 4',3,'','None','2017-11-18 10:49:17'),(1565,2,12,0,'SPELEC1','Special Elective 1',3,'','None','2017-11-18 10:49:49'),(1566,2,12,0,'SPELEC3','Special Elective 3',3,'','None','2017-11-18 10:49:57'),(1567,2,12,0,'SPELEC2','Special Elective 2',3,'','None','2017-11-18 10:50:12'),(1568,5,27,0,'SCIMATP','G.E. Natural Science New Materials Track – Physics ',2,'','This is a General Education (GE) course on new materials used in modern technologies designed for students in the College of Computer Studies (CCS), College of Education (CED), College of Liberal Arts (CLA), College of Business, and School of Economics (SOE). The course provides the students with an insight on the structure, properties, processing, and performance of new materials. Misconceptions on the different topics will be drawn out, sorted, and resolved through the various hands-on activities and group discussion. The course utilizes the students’ imagination, intuition, and creativity in analyzing and discovering the various laws and principles that govern the physical world.','2017-11-18 14:48:15'),(1569,5,25,0,'SCIMATC','G.E. Natural Science New Materials Track – Chemistry (Lecture) ',1,'','This course is designed to provide an understanding of general chemical principle by following the current development in material sciences; plastics and polymers; synthesis, design and delivery of drugs; household products; food and nutrition; and genetic engineering. Chemical concepts that will be covered include atomic theory; bonding and polymerization; molecular geometry and isomerism; organic chemistry and functional groups; intermolecular forces of attraction; food components; carbohydrates, fats and proteins; caloric intake; and DNA and the chemistry of heredity.','2017-11-18 14:48:15'),(1570,5,25,0,'LBYMATC','G.E. Natural Science New Materials Track – Chemistry (Laboratory) ',1,'','The laboratory component of SCIMATC will expand understanding of the lecture topics by providing the students with an experience of scientific knowledge acquisition. Activities include hands-on experiments, demonstrations and inter class debates.','2017-11-18 14:48:15'),(1571,9,42,0,'SAS1000','NSTP/CWTS General Meeting',0,'','None','2017-11-18 14:48:15'),(1573,2,12,0,'SOCTEC2','Science, Technology, and Society 2',3,'','SOCTEC2 (Science, Technology and Society 2) Science, Technology and Society 2 is about the influence and consequences of science and technology on various aspects of society, such as the environment, the economy, modernization and globalization, social and power relations, and governance.','2017-11-18 11:14:40'),(1574,2,12,0,'STMETRE','Software Technology Research Methods',2,'','A course on methods of research where students learn the steps on how to do a research project; a thesis proposal should be produced at the end of the course.','2017-11-18 11:18:40'),(1575,2,12,0,'THS-ST1','Thesis in Software Technology 1 ',2,'','The undergraduate thesis is a non-classroom learning environment in which students may apply the skills, methods, and theories learned throughout their stay in the College of Computer Studies. THSST-1 involves the following activities: (a) search and review of related literature. (b) investigation of existing solutions to the identified problem(s) in STRESME. (c) evaluation of existing solutions. (d) application of methods and theories in the design of a solution to the problem(s).','2017-11-18 11:22:10'),(1576,2,12,0,'THS-ST2','Thesis in Software Technology 2',2,'','Entry into the THSST-2 stage requires a successful completion of all THSST-1 requirements and prerequisite courses as specified in the appropriate ST flowchart. This stage involves the implementation of major system functions in the target programming language and/or environment. The components are expected to perform the following activities: (a) development and implementation of the solution identified in THSST-1. (b) documentation of development and implementation issues. (c) regular consultation with the thesis adviser. (d) submission of a 6-page technical paper to be reviewed by the panelists and if accepted, participation in a public presentation in a duly organized symposium or congress by the College &/or University, or local/national conferences.','2017-11-18 11:23:27'),(1577,2,12,0,'THS-ST3','Thesis in Software Technology 3',2,'','During this stage, the proponents perform the following activities: (a) development of minor system functions (i.e online help, system enhancements). (b) system testing and analysis of test results. (c) documentation of testing activities and test results. (d) finalizing of the thesis deliverables (i.e. main document, technical manual, user’s manual, software). (e) preparation for the thesis defense.','2017-11-19 08:42:00'),(1578,4,19,0,'GREATWK','Great Works',3,'','The course is designed to center on a theme built around three Great Works from various cultures/disciplines that have exerted influence on the way human beings think about themselves in relation to the world. The course will be taught by a team of three teacher-facilitators who will rotate every four weeks in three classes. Each teacher will facilitate the reading and discussion of one work. Towards the end of the term, the teachers will meet as a team with all the students of the three classes in sessions that will serve to integrate the discussions on the three Great Works. Through the course, students are given a venue to participate in multidisciplinary discourses on how a particular Great Work \"reads\" or \"thinks through\" the human problems with new perspectives and paradigms.','2017-11-18 14:48:15'),(1580,2,12,0,'ADVDISC','Advanced Discrete Structures',3,'','This course provides students with advanced theories on discrete structures and linear algebra. It covers topics on methods of proof, inductions, equivalence relations, solutions of equations, as well as matrices, vector spaces, and linear transformations.','2017-11-18 14:31:33'),(1581,2,12,0,'THEOCOM','Automata Theory, Formal Languages and Computational Complexity',3,'','This course concentrates on the theoretical aspect of Computer Science, which has evolved from three disciplines: mathematics, engineering and linguistics.  ','2017-11-18 23:02:11'),(1582,2,12,0,'COMPILE','Compiler Theory',3,'','This course introduces the theories, formal techniques, design, and implementation considerations in the construction of interpreters, compilers, and language translators in general.','2017-11-18 23:03:10'),(1583,2,12,0,'INTRPRG','Introduction to Programming and Logic Formulation',3,'','This course provides students with the fundamentals of logic formulation and understanding of object-oriented technology. It introduces the different concepts that are commonly associated with object programming.','2017-11-18 23:05:10'),(1584,2,12,0,'DASTRAP','Applied Data Structures and Algorithms',3,'','In this course, the students will learn different data structures and algorithm analysis with a focus on how to create efficient data structures and algorithms. The course aims to train the students the ability to select or design the data structure that will best solve a given problem.','2017-11-18 23:07:26'),(1585,2,12,0,'ADVPROG','Advanced Programming',3,'','This course introduces students to advance logic programming constructs in JAVA. Complementing existing knowledge of basic logic programming constructs and data structures, ADVPROG focuses on developing the abilities of students in developing advanced computing applications.','2017-11-18 23:08:36'),(1586,2,12,0,'COMALGO','Algorithm Complexity',3,'','This course covers the design and analysis of different algorithms under various design principles and techniques making use of different data structures.','2017-11-18 23:10:21'),(1587,2,12,0,'COMMAT1','Introduction to Computer Programming',3,'','This course covers the fundamentals of logic formulation together with their implementation in the C programming language. This course should serve as a foundation for future computer courses that the students will encounter.','2017-11-18 23:18:36'),(1588,2,12,0,'COMMAT2','Computer for Mathematics 2',3,'','This is an advanced course in computer programming using C++ programming language. The first part of the course discusses basic object-oriented constructs that all features of the C++ language. The second part of the course extends the application of the object-oriented programming to other abstract date types.','2017-11-18 23:19:06'),(1589,2,12,0,'COMMAT3','Computer for Mathematics 3',3,'','This computer programming course will explore the power of Java Language. A one hour lecture and two hour laboratory course which discuss user interfaces, object oriented programming, event handling, and graphic techniques.','2017-11-18 23:19:30'),(1590,2,12,0,'ADVANSE','Advanced Software Engineering',3,'','This course will introduce students to the practices of a full spectrum of software development approaches and methods, from the more plan-driven, documentation-intensive approaches of PSP, TSP, and CMMI, to the more agile methods of XP and Scrum.','2017-11-18 23:24:45'),(1591,2,12,0,'MOBIDEV','Development of Mobile Applications',3,'','This course aims to expose the students to various wireless technologies and how they can be utilized to support different kinds of activities. It also aims to provide the students with the breadth of knowledge required to pursue further studies on the area.','2017-11-18 23:49:27'),(1597,2,12,0,'3DMODEL','Introduction to 3D Computer Graphics and Animation',3,'','This course will discuss introductory topics on 3D computer graphics including modeling, material properties, lights, cameras, animation and rendering.','2017-11-18 23:37:38'),(1593,2,12,0,'DESPATT','Design Patterns',3,'','This is an advanced programming course emphasizing object-oriented design. Design patterns are recurring solutions in designing systems and are considered simple yet elegant solutions which have been proven effective over time. The applications of these design patterns allow the creation of systems that are more scalable, reliable and effective. ','2017-11-18 23:29:16'),(1594,2,12,0,'INTROAI','Introduction to Artificial Intelligence ',3,'','Artificial Intelligence (AI) is the study of how machines can exhibit at least one of the following aspects associated with intelligent behavior: (a) problem solving, or the performance of non-trivial, goal-directed cognitive tasks even in the face of inadequate (e.g., incomplete, incorrect, inconsistent, or vague) data; (b) reasoning, or the drawing of logical inferences and conclusions from possibly inadequate evidence; (c) learning, or the improvement of performance through experience; and (d) natural language processing. This 3.0-unit course introduces the CS-ST major to fundamental concepts, principles, and techniques in searchbased problem solving, reasoning, and machine learning, and in the representation of the knowledge needed to perform these tasks. ','2017-11-18 23:33:30'),(1596,2,12,0,'EMPATHY','EMPATHIC COMPUTING IN HUMAN­SYSTEM INTERACTION',3,'','This course introduces the pluridisciplinary perspectives on Empathic Computing, surveys the relevant related literatures and explores the design and methodology of existing stateof­the­art empathic intelligent systems, and investigates the compelling current issues and future trends.','2017-11-18 23:36:57'),(1600,2,12,0,'WEBPROG','Web Programming',3,'','This course introduces students to the theories, processes and skills needed in the development of web applications. It provides an overview of the various technologies used in designing and implementing web-based systems. Advanced topics are also included to prepare students in realizing useful web applications that utilize up-to-date industry tools.','2017-11-18 23:48:16'),(1599,2,12,0,'WEBDEVE','ST Web Applications Development',3,'','This course introduces students to the theories, processes and skills needed in the development of web applications. It provides an overview of the various technologies used in designing and implementing web-based systems. Advanced topics are also included to prepare students in realizing useful web applications that utilize up-to-date industry tools.','2017-11-18 23:39:00'),(1601,2,12,0,'DEV-WEB','Development Of Web Applications',3,'','This course introduces students to the theories, processes and skills needed in the development of web applications. It provides an overview of the various technologies used in designing and implementing web-based systems. Advanced topics are also included to prepare students in realizing useful web applications that utilize up-to-date industry tools.','2017-11-18 23:47:38'),(1602,2,12,0,'BISPROC','Organization and Business Processes',3,'','This course is designed for Information Technology and Communications Management students who need to have an overview of different generic business processes of various industries. The students are going to learn how to describe, analyze, diagnose, and redesign a business process through the study of robust Business Process Reengineering (BPR) methodologies and tools. In the business environment, redesigning a business process involves more than restructuring the workflow. It also involves changes in information flows, knowledge management capabilities, and total quality management skills. When a business reengineers its processes, it is vital for the employees to handle change. This is why the course is also going to cover the approaches in change management.','2017-11-18 23:51:00'),(1603,2,12,0,'ORGMGNT','Organization and Management Concepts',3,'','ORGMGNT (Organization and Management Concepts) This course is an introduction to basic management concepts and the role of Information Technology in business organizations.','2017-11-19 00:05:16'),(1604,2,12,0,'BISPROC','Organization and Business Processes',3,'','This course is designed for Information Technology and Communications Management students who need to have an overview of different generic business processes of various industries. The students are going to learn how to describe, analyze, diagnose, and redesign a business process through the study of robust Business Process Reengineering (BPR) methodologies and tools. In the business environment, redesigning a business process involves more than restructuring the workflow. It also involves changes in information flows, knowledge management capabilities, and total quality management skills. When a business reengineers its processes, it is vital for the employees to handle change. This is why the course is also going to cover the approaches in change management.','2017-11-19 00:05:43'),(1605,2,12,0,'AN-MODE','SYSTEMS ANALYSIS AND DESIGN PROJECT',1,'','This course introduces students to the different object-oriented diagrams used to model information systems functional, structural and behavioral components. Using a master-case driven lecture, students will get to appreciate the value and relationships of the different diagrams in communicating elements of the information system being analyzed.','2017-11-19 00:06:45'),(1606,2,12,0,'COMMAT4','Computer for Mathematics',3,'','This course will look at some of the advanced features provided in the Java libraries, called APIs such as: networking, Swing, container data structures and RMI.','2017-11-19 00:07:36'),(1607,2,12,0,'INTROOS','Introduction To Operating System',3,'','This is an introductory course to operating system design and implementation. This course will cover basic algorithms and procedures to CPU scheduling and memory management. This course will also introduce students to basic concepts of writing concurrent processes and basic techniques to synchronize processes.','2017-11-19 00:09:52'),(1609,2,12,0,'TECHPRE','Technopreneurship',3,'','None','2017-11-19 00:14:28'),(1610,2,12,0,'MODESTA','Modeling, Simulation and Statistics',3,'','This course covers simulation, which refers to a broad collection of methods to mimic the behavior of real systems. The main focus of this course is on building logical or mathematical models of systems and analyzing these models. Different types of simulation models such as Static, Dynamic, Continuous, Discrete, Deterministic and Stochastic models are discussed. This course also covers mathematical preliminaries to simulation such as pseudo-random number generation and an introduction to probability and statistics, which provide essential tools for conducting meaningful simulation.','2017-11-19 00:15:47'),(1611,2,12,0,'INTROSE','Introduction to Software Engineering',3,'','This course provides an overview of software engineering as a discipline concerned with the application of theory, knowledge, and practice for effectively and efficiently building software systems. It introduces the students to the fundamental principles and methodologies of software engineering.  It focuses on the concepts and principles of software requirements engineering, its tools, techniques, and methods for modeling software systems. Various approaches to requirements analysis and review activities are examined.','2017-11-19 00:45:07'),(1612,2,12,0,'PROFSWD','Professional Software Development',3,'','The aim of this course is to prepare ST students for practicum and a career in software development by delivering actual knowledge and skills currently required by the industry. This is achieved through lectures from IT industry practitioners on the current trends and organizational practices that lead to producing software that is robust, reliable and attractive to use, often co-operating with others as part of a development team. ','2017-11-19 00:46:37'),(1613,2,12,0,'SPSWENG','Introduction to Software Engineering',3,'','This course provides an overview of software engineering as a discipline concerned with the application of theory, knowledge, and practice for effectively and efficiently building software systems. It introduces the students to the fundamental principles and methodologies of software engineering.  It focuses on the concepts and principles of software requirements engineering, its tools, techniques, and methods for modeling software systems. Various approaches to requirements analysis and review activities are examined.','2017-11-19 01:15:07'),(1614,2,12,0,'INTRNLP','Introduction to Natural Language Processing',3,'','None','2017-11-19 01:28:20'),(1615,2,12,0,'COMPRG1','Introduction to Computer Programming 1',3,'','This course covers the fundamentals of logic formulation and computer programming using the C programming language. It serves as a foundation for future courses that the students will encounter throughout the Computer Science program. This course is coupled with a lab component.','2017-11-19 01:30:32'),(1616,2,12,0,'COMPRG2','Advanced Programming',3,'','This advanced course for computer programming in C covers the representation and manipulation of C data structures. This course, like COMPRO1, serves as a foundation for future courses that the students will encounter throughout the Computer Science program. This course is coupled with a lab component.','2017-11-19 01:31:46'),(1623,2,12,0,'STRESME','Software Technology Research Methods',3,'','A course on methods of research where students learn the steps on how to do a research project; a thesis proposal should be produced at the end of the course.','2017-11-19 01:43:37'),(1624,2,12,0,'HCIFACE','Human-Computer Interface',3,'','This course provides an overview of software engineering as a discipline concerned with the application of theory, knowledge, and practice for effectively and efficiently building software systems. It introduces the students to the fundamental principles and methodologies of software engineering.  It focuses on the concepts and principles of software requirements engineering, its tools, techniques, and methods for modeling software systems. Various approaches to requirements analysis and review activities are examined.','2017-11-19 01:48:01'),(1618,2,12,0,'INTPRG2','Introduction to Computer Programming 2',3,'','This advanced course for computer programming in C covers the representation and manipulation of C data structures. This course, like COMPRO1, serves as a foundation for future courses that the students will encounter throughout the Computer Science program. This course is coupled with a lab component.','2017-11-19 01:33:42'),(1619,2,12,0,'CSRESEM','Computer Science Research Method',3,'','A course on methods of research where students learn the steps on how to do a research project; a thesis proposal should be produced at the end of the course.','2017-11-19 01:37:19'),(1620,2,12,0,'RESMETH','Research Method',3,'','A course on methods of research where students learn the steps on how to do a research project; a thesis proposal should be produced at the end of the course.','2017-11-19 01:38:18'),(1621,2,12,0,'OPERLAB','Operating Systems Lab',3,'','None','2017-11-19 01:39:26'),(1622,2,12,0,'TECHGOV','Technology Governance',3,'','None','2017-11-19 01:40:19'),(1625,2,12,0,'COMPORG','Computer Architecture and Organization',3,'','This course provides an overview of Instruction Set Architecture through assembly language programming and the interaction between basic computer system components, namely the CPU, Memory, and I/O.','2017-11-19 02:13:05'),(1627,2,10,0,'DIGILOG','Digital Logic',3,'','This course provides a discussion of digital logic, specifically on boolean algebra, simplification of boolean functions, logic gates, and basic operation of combinational and sequential logic circuits.','2017-11-19 08:21:48'),(1628,2,10,0,'NTCOR01','Networking Basic',3,'','The course introduces students to fundamental networking concepts and technologies. It includes discussion on application of computer networks such as transmission of video, audio, and voice. The course materials assist students in developing the skills necessary to plan and implement small networks across a range of applications.','2017-11-19 08:19:34'),(1629,2,10,0,'COMPASM','Computer Programming in Assembly Language',3,'','This is a lecture course on Assembly language programming and the supplementary introduction on interfacing assembly code with C language programs.','2017-11-19 08:19:34'),(1630,2,10,0,'LBYNT01','Networking Basic Laboratory',1,'','This course covers basic networking topics that allow the student to design and implement SOHO networks. Topics include the two networking models (OSI and TCP/IP) as well as basic Cisco CLI commands to perform bsic router and switch configuration.','2017-11-19 08:19:34'),(1631,2,12,0,'WEB-PRG','Web Programming',3,'','This course introduces students to the theories, processes and skills needed in the development of web applications. It provides an overview of the various technologies used in designing and implementing web-based systems. Advanced topics are also included to prepare students in realizing useful web applications that utilize up-to-date industry tools.','2017-11-19 02:24:55'),(1642,2,10,0,'NECOR02','Routing and Switching Fundamentals (Lecture)',3,'','The primary focus of this course is on routers and routing protocols. It includes discussion on different issues involved in the transmission of information among routers in order to determine the best path data packets can take. This course includes discussion and lab activities on both static routing and dynamic routing protocols.','2017-11-19 08:19:34'),(1640,2,10,0,'HCK-LCT','Lecture on Ethical Hacking Countermeasures',3,'','The course introduces students to fundamental networking concepts and technologies. It includes discussion on application of computer networks such as transmission of video, audio, and voice. The course materials assist students in developing the skills necessary to plan and implement small networks across a range of applications.','2017-11-19 08:19:34'),(1635,2,10,0,'NECOR01','Introduction to Networks (Lecture)',3,'','The course introduces students to fundamental networking concepts and technologies. It includes discussion on application of computer networks such as transmission of video, audio, and voice. The course materials assist students in developing the skills necessary to plan and implement small networks across a range of applications.','2017-11-19 08:19:34'),(1641,2,10,0,'LBYNE02','Routing and Switching Fundamentals (Laboratory)',1,'','This course covers topics on routers and routing basics. This includes router configuration and troubleshooting, IOS management, distance vector routing, and access control lists.','2017-11-19 08:19:34'),(1637,2,10,0,'LBYNE01','Introduction to Networks (Laboratory)',1,'','This course covers basic networking topics that allow the student to design and implement SOHO networks. Topics include the two networking models (OSI and TCP/IP) as well as basic Cisco CLI commands to perform bsic router and switch configuration.','2017-11-19 08:19:34'),(1639,2,10,0,'LBY-HCK','Laboratory on Ethical Hacking Countermeasures',1,'','This is the laboratory component of HACKLEC. This covers laboratory activities that allows students to understand footprinting, scanning, enumeration, system hacking, trojan and backdoors, sniffers, denial of service, and web application vulnerabilities.','2017-11-19 08:19:34'),(1643,2,10,0,'COMORGA','Computer Organization',3,'','This course covers design considerations for implementing components of the von neumann computer, namely, the central processing unit, memory and I/O peripherals.','2017-11-19 08:21:48'),(1644,2,10,0,'NECOR03','Advanced Routing and Switching (Lecture)',3,'','This course covers the basics of LAN switching and its design and implementation for interconnecting computers or other computing devices. It includes different concepts in switching such as VLANs and spanning tree that help a switched network to be more efficient and fault-tolerant. It also covers introductory concepts on wireless technology.','2017-11-19 08:19:34'),(1645,2,10,0,'LBYNE03','Advanced Routing and Switching (Laboratory)',1,'','This course focuses on advanced IP addressing techniques (variable length subnet masking), intermediate routing protocols, CLI configuration of switches, Ethernet switching, Virtual LANs, Spanning Tree Protocols, and VLAN Trunking Protocols.','2017-11-19 08:19:34'),(1646,2,10,0,'FORENSC','Computer Forensic',3,'','This course provides students with the necessary knowledge to identify the footprints left by intruders of computer and network systems. It includes discussion on properly handling evidences to prosecute as well as cyber laws applicable in different countries.','2017-11-19 08:19:34'),(1647,2,10,0,'LBYFORE','Computer Forensic Laboratory',1,'','This course is the laboratory component of computer forensics. In this course, students perform activities that allow them to identify footprints left by intruders of computer and network systems. It also includes activities on properly handling computer-based evidences.','2017-11-19 08:19:34'),(1648,2,10,0,'NECOR04','WAN Solutions',3,'','The course focuses on advanced IP addressing techniques, WAN technology and terminology, PPP, ISDN, DDR, Frame Relay, network management, introduction to optional networking. Advantages and disadvantages of each WAN solution is discussed in this course.','2017-11-19 08:19:34'),(1649,2,10,0,'LBYNE04','WAN Solutions (Laboratory)',1,'','The course focuses on advanced IP addressing techniques, WAN technology and terminology, PPP, ISDN, DDR, Frame Relay, network management, introduction to optional networking. Advantages and disadvantages of each WAN solution is discussed in this course.','2017-11-19 08:19:34'),(1650,2,10,0,'SECPROG','Secure Programming',3,'','This course provides basic foundation in developing applications that have reduced security risks. It includes best practices in application development that allows the creation of .NET/Java-based applications while mitigating software vulnerabilities such as buffer overflow and hijacking.','2017-11-19 08:21:48'),(1651,2,10,0,'LBYSPRG','Secure Programming (Laboratory)',1,'','This course is the laboratory component of secure programming. In this course, students develop applications that have reduced security risks. It includes activities that allow students to create .NET/Java-based applications while mitigating software vulnerabilities such as buffer overflow and hijacking.','2017-11-19 08:19:34'),(1652,2,10,0,'COMPARC','Computer Architecture',3,'','This course covers design issues of computer architecture specifically on pipeline and instruction set design.','2017-11-19 08:21:48'),(1653,2,10,0,'SYST-AD','Systems Administration',3,'','This course provides a basic foundation on system administration. It includes discussion of various network operating systems and utilities that allow management and monitoring of resources such as user accounts, servers, workstations, and storage devices.','2017-11-19 08:21:48'),(1654,2,12,0,'NEELEC1','Network Engineering Elective 1',3,'','None','2017-11-19 07:57:03'),(1655,2,12,0,'NEELEC2','Network Engineering Elective 2',3,'','None','2017-11-19 07:57:10'),(1656,2,12,0,'NEELEC3','Network Engineering Elective 3',3,'','None','2017-11-19 07:57:17'),(1657,2,12,0,'NEELEC4','Network Engineering Elective 4',3,'','None','2017-11-19 07:57:26'),(1658,2,12,0,'NERESEM','NE Research Methods',2,'','This is an introductory course for the CT Thesis Program, which illustrates how much Network Engineering (NE) students have understood and learned the theories, concepts, tools, and methodologies of Computer Science, and how he/she applies these to specific problem-solving situation','2017-11-19 07:59:58'),(1659,2,10,0,'PRCT-NE','NE Practicum',1,'','On-the-job training course during the summer period of the junior year.','2017-11-19 08:22:09'),(1660,2,10,0,'THSNE-1','Thesis for Network Engineering 1',2,'','In this course, the thesis group presents the design of the system which is defined through the research objectives, scope and limitation.','2017-11-19 08:21:48'),(1661,2,12,0,'SECURAD','Security Administration',3,'','This course provides a basic foundation on security administration. It includes discussion of various security tools and appliances such as vulnerability scanners, firewalls, intrusion detection and prevention systems, and VPN gateways.','2017-11-19 08:10:04'),(1662,2,10,0,'THSNE-2','Thesis for Network Engineering 2',2,'','This course is the second stage of the thesis program for NE students. In this course, an enrolled thesis group will be submitting a conference paper containing a substantial portion of their research, for review and approval by the designated thesis committee/panel.','2017-11-19 08:21:48'),(1665,2,10,0,'THSNE-3','Thesis for Network Engineering 3',2,'','This course is the final stage of the thesis program for NE students. In this course, enrolled thesis groups will be defending the final design and implementation of their system prototypes satisfying the objectives defined in their thesis proposal stage.','2017-11-19 08:21:48'),(1664,2,12,0,'STORTEC','Storage Technology',3,'','This course provides an overview of storage technology solution such as different RAID types, direct and network attached storages, and storage area network.','2017-11-19 08:15:06'),(1666,2,12,0,'CSC721M','Neural Networks',3,'','This course covers topics on Artificial Neural Networks Concepts and Applications; Supervised, Unsupervised, and Reinforced Learning Architectures; Input/Output Coding Techniques; Adalene and Madalene, Multilayer perception model. BAM and the Hopfeld memory; Counter propagation network, Self-Organizing Map; and Hybrid Neural Network Modeling.','2017-11-19 08:58:41'),(1667,2,12,0,'CSC617M','Theories of Programming Languages',3,'','None','2017-11-19 10:36:03'),(1668,2,12,0,'CIS559M','ADVANDB',3,'','None','2017-11-19 09:02:54'),(1669,2,12,0,'CIS201M','PROGLAN and ADVANDB',3,'','None','2017-11-19 09:27:59'),(1670,2,12,0,'CSC615M','Automata and Formal Languages',3,'','None','2017-11-19 10:18:44'),(1671,2,12,0,'CSC504C','OBJECTP',3,'','None','2017-11-19 09:04:35'),(1672,2,12,0,'CSC714M','INTRNLP',3,'','None','2017-11-19 09:04:53'),(1673,2,12,0,'CSC514C','DBAPPDEV',3,'','None','2017-11-19 09:05:36'),(1674,2,12,0,'CSC755M','Design and Analysis of Algorithms',3,'','None','2017-11-19 10:03:48'),(1675,2,12,0,'CIS556M','PROGLAN w/ ADV DA STRUCT',3,'','None','2017-11-19 09:06:48'),(1676,2,12,0,'CSC713M','MACLERN',3,'','None','2017-11-19 09:07:08'),(1677,2,12,0,'CSC511C','OS and Systems Software',3,'','None','2017-11-19 10:04:28'),(1678,2,12,0,'CSC721D','None',3,'','None','2017-11-19 09:08:14'),(1679,2,12,0,'CSC742M','DATAMIN',3,'','None','2017-11-19 09:08:35'),(1680,2,12,0,'DIT702D','Info Systems Planning',3,'','None','2017-11-19 09:08:53'),(1681,2,12,0,'CSC502C','Logic Formulation in Java',3,'','None','2017-11-19 10:12:30'),(1682,2,12,0,'CIS104M','Introduction to Programming',3,'','None','2017-11-19 09:10:54'),(1683,2,12,0,'CSC701M','Methods of Research',3,'','None','2017-11-19 09:11:23'),(1684,2,12,0,'CSC765D','None',3,'','None','2017-11-19 09:11:43'),(1685,2,12,0,'STADTEC','DATAMIN',3,'','None','2017-11-19 09:16:11'),(1686,2,12,0,'LBYECON','Computer Package 1 for Economcis Major',3,'','This course aims to introduce students to basic computer concepts. It is designed to provide students with a broad understanding of the World Wide Web/Information Technology (IT), and provides an initial description of the Microsoft Windows XP environment and usage of the Microsoft Office suite.','2017-11-19 09:18:31'),(1687,2,12,0,'LBYBUS1','Business Laboratory 1',1,'','None','2017-11-19 09:32:53'),(1688,2,12,0,'LOGPROG','Logic Programming',3,'','None','2017-11-19 09:21:21'),(1689,2,12,0,'PROGLAN','Programming Languages',3,'','None','2017-11-19 09:22:19'),(1690,2,12,0,'MLAPDEV','None',3,'','None','2017-11-19 09:23:10'),(1691,2,12,0,'SECUDEV','Secure Development',3,'','None','2017-11-19 09:24:04'),(1692,2,12,0,'COM-LAB','Computer Laboratory',3,'','None','2017-11-19 09:25:05'),(1693,2,12,0,'CSC101M','Tech Innovation Strategy',3,'','None','2017-11-19 09:25:35'),(1694,2,12,0,'CSC102M','Digital Business Model',3,'','None','2017-11-19 09:25:47'),(1695,2,12,0,'3DANIMN','3D Animation',3,'','None','2017-11-19 09:25:59'),(1696,2,12,0,'GRAPHIX','Introduction to Computer Graphics',3,'','This course will discuss introductory topics on computer graphics including modeling, viewing, projection, and viewport transformations; simple illumination models, and parametric curves/surfaces.','2017-11-19 09:26:49'),(1697,2,12,0,'CSC611M','ADVANOS',3,'','None','2017-11-19 09:27:34'),(1698,2,12,0,'DIT701D','Internet and Info Infra',3,'','None','2017-11-19 09:28:37'),(1699,2,12,0,'CSC753D','Machine Learning II',3,'','None','2017-11-19 09:29:06'),(1700,2,12,0,'GAMEDES','Game Design',3,'','None','2017-11-19 09:30:29'),(1701,2,12,0,'CSC515C','Introduction to Automata Theory',3,'','None','2017-11-19 09:31:09'),(1702,2,12,0,'CSC612M','ADVCARC',3,'','None','2017-11-19 09:31:37'),(1703,2,12,0,'CSC512C','Computer Organization and Assembly',3,'','None','2017-11-19 10:16:30'),(1704,2,12,0,'2DGRAFX','Introduction to 2D Graphics',3,'','None','2017-11-19 09:32:27'),(1705,2,12,0,'LBYAPC1','None',3,'','None','2017-11-19 09:33:16'),(1706,2,12,0,'CIS214M','IS Architecture',3,'','None','2017-11-19 09:33:40'),(1707,2,12,0,'CSC505C','Data Structures',3,'','None','2017-11-19 10:34:59'),(1708,2,12,0,'CSC713D','None',3,'','None','2017-11-19 09:35:11'),(1709,2,12,0,'CSC777D','None',3,'','None','2017-11-19 09:41:21'),(1710,2,12,0,'DIT581D','None',3,'','None','2017-11-19 09:42:44'),(1711,2,12,0,'AD-STAT','Advanced Statistics and Probability for ST',3,'','This course covers topics in advanced statistics and probability, including joint probability distribution, F-distribution, sampling distribution, chi-square distribution, and analysis of variance. Topics on numerical methods are also introduced, including continuous and discrete functions, non-linear equations, quadratic and cubic functions, interpolation, and regression techniques. ','2017-11-19 09:43:39'),(1712,2,12,0,'EMAGENT','None',3,'','None','2017-11-19 09:44:22'),(1713,2,12,0,'EMAGENT','None',3,'','None','2017-11-19 09:45:07'),(1714,2,12,0,'CSC781M','Image Processing',3,'','None','2017-11-19 09:45:29'),(1715,2,12,0,'DBADMIN','Database Administration',3,'','None','2017-11-19 09:46:20'),(1716,2,12,0,'CSC571M','Technology Entrepreneur',3,'','None','2017-11-19 10:46:43'),(1717,2,12,0,'MICPRC2','None',3,'','None','2017-11-19 09:49:03'),(1718,2,12,0,'PICMCRO','None',3,'','None','2017-11-19 09:49:30'),(1719,2,12,0,'M-APDEV','Development of Mobile Applications',3,'','This course aims to expose the students to various wireless technologies and how they can be utilized to support different kinds of activities. It also aims to provide the students with the breadth of knowledge required to pursue further studies on the area.','2017-11-19 09:50:06'),(1721,2,12,0,'ADV-DEV','None',3,'','None','2017-11-19 09:52:59'),(1724,2,12,0,'MACHLRN','Machine Learning',3,'','None','2017-11-19 09:55:11'),(1725,2,12,0,'DASALAB','DASALGO Lab',3,'','None','2017-11-19 09:55:55'),(1731,2,12,0,'MOBICOM','None',3,'','None','2017-11-19 10:00:03'),(1732,2,12,0,'CSC831M','Introduction to eGovern',3,'','None','2017-11-19 10:00:42'),(1723,2,12,0,'3DGRAFX','Introduction to 3D Computer Graphics and Animation',3,'','This course will discuss introductory topics on 3D computer graphics including modeling, material properties, lights, cameras, animation and rendering.','2017-11-19 09:54:22'),(1727,2,12,0,'DSALGOR','DASALGO Lab',3,'','None','2017-11-19 09:58:18'),(1728,2,12,0,'GAMDEV2','Game Development 2',3,'','None','2017-11-19 09:58:40'),(1729,2,12,0,'LINCIRC','None',3,'','None','2017-11-19 09:59:07'),(1730,2,12,0,'ECOMLB1','None',3,'','None','2017-11-19 09:59:31'),(1733,2,12,0,'CSC724M','Empathy',3,'','None','2017-11-19 10:01:03'),(1734,2,12,0,'CSC513C','Software Engineering',3,'','None','2017-11-19 10:01:40'),(1735,2,12,0,'GAM-DEV','Game Development',3,'','None','2017-11-19 10:02:35'),(1736,2,12,0,'GAMEDEV','Game Development',3,'','None','2017-11-19 10:02:43'),(1737,2,12,0,'STTREND','None',3,'','None','2017-11-19 10:04:50'),(1738,2,12,0,'OPENSRC','None',3,'','None','2017-11-19 10:05:42'),(1739,2,12,0,'CSC506C','Discrete Structures',3,'','None','2017-11-19 10:06:47'),(1740,2,12,0,'BUS402D','None',3,'','None','2017-11-19 10:08:09'),(1741,2,12,0,'WEBAPPS','Web Applications ',3,'','This course introduces students to the theories, processes and skills needed in the development of web applications. It provides an overview of the various technologies used in designing and implementing web-based systems. Advanced topics are also included to prepare students in realizing useful web applications that utilize up-to-date industry tools.','2017-11-19 10:10:10'),(1742,2,12,0,'OO-PROG','Object-oriented Programming ',3,'','None','2017-11-19 10:12:03'),(1743,2,12,0,'INTSYS1','None',3,'','None','2017-11-19 10:13:10'),(1744,2,12,0,'WEBDEVL','Web Development',3,'','None','2017-11-19 10:13:34'),(1745,2,12,0,'DESIPAT','Design Patterns',3,'','None','2017-11-19 10:14:01'),(1746,2,12,0,'AGENTS-','Intelligent Agents',3,'','None','2017-11-19 10:15:02'),(1747,2,12,0,'HP-ELEC','None',3,'','None','2017-11-19 10:15:43'),(1748,2,12,0,'CSC501C','Information Systems',3,'','None','2017-11-19 10:16:14'),(1749,2,12,0,'CIS834M','None',3,'','None','2017-11-19 10:20:06'),(1750,2,12,0,'CSC515M','None',3,'','None','2017-11-19 10:20:26'),(1752,2,12,0,'INTPRG1','Introduction to Computer Programming 1',3,'','None','2017-11-19 10:22:34'),(1753,2,12,0,'TEXTGEN','None',3,'','None','2017-11-19 10:23:03'),(1754,2,12,0,'CSC901M','None',3,'','None','2017-11-19 10:23:16'),(1755,2,12,0,'STPROF1','None',3,'','None','2017-11-19 10:23:26'),(1756,2,12,0,'LIN640D','None',3,'','None','2017-11-19 10:23:38'),(1757,2,12,0,'DEVAPPS','None',3,'','None','2017-11-19 10:24:10'),(1758,2,12,0,'CSC509C','None',3,'','None','2017-11-19 10:24:32'),(1759,2,12,0,'CSC746D','None',3,'','None','2017-11-19 10:24:50'),(1760,2,12,0,'ELD713M','None',3,'','None','2017-11-19 10:25:06'),(1761,2,12,0,'EDM688D','None',3,'','None','2017-11-19 10:25:20'),(1762,2,12,0,'CSC701D','None',3,'','None','2017-11-19 10:25:33'),(1763,2,12,0,'HTMLPRG','None',3,'','None','2017-11-19 10:25:47'),(1764,2,12,0,'CIS106M','None',3,'','None','2017-11-19 10:26:03'),(1765,2,12,0,'INTSYS2','None',3,'','None','2017-11-19 10:26:23'),(1766,2,12,0,'INTSYSL','None',3,'','None','2017-11-19 10:26:28'),(1767,2,12,0,'COMLAB2','None',3,'','None','2017-11-19 10:27:29'),(1768,2,12,0,'STPROF2','None',3,'','None','2017-11-19 10:27:36'),(1769,2,12,0,'OPRSYST','Operating System',3,'','None','2017-11-19 10:28:17'),(1770,2,12,0,'TENOMAN','Tech Innov Management',3,'','None','2017-11-19 10:28:40'),(1771,2,12,0,'SYSDEVE','None',3,'','None','2017-11-19 10:28:49'),(1772,2,12,0,'CIS105M','Advanced Programming',3,'','None','2017-11-19 10:29:22'),(1773,2,12,0,'ANMODEL','SYSTEMS ANALYSIS AND DESIGN PROJECT',3,'','This course introduces students to the different object-oriented diagrams used to model information systems functional, structural and behavioral components. Using a master-case driven lecture, students will get to appreciate the value and relationships of the different diagrams in communicating elements of the information system being analyzed.','2017-11-19 10:29:52'),(1774,2,12,0,'CSC715M','Introduction to NLP',3,'','None','2017-11-19 10:31:39'),(1775,2,12,0,'DIT571D','IT in Society',3,'','None','2017-11-19 10:33:39'),(1776,2,12,0,'CSC902M','None',3,'','None','2017-11-19 10:33:56'),(1777,2,12,0,'WIR-TEC','Wireless Techonology',3,'','None','2017-11-19 10:38:02'),(1778,2,12,0,'CTTREND','None',3,'','None','2017-11-19 10:39:19'),(1779,2,12,0,'EMTECH1','Empowerment Technolgy',3,'','None','2017-11-19 10:41:50'),(1780,2,12,0,'INFOSCU','None',3,'','None','2017-11-19 10:42:40'),(1781,2,12,0,'SW-ENGG','Introduction to Software Engineering',3,'','This course provides an overview of software engineering as a discipline concerned with the application of theory, knowledge, and practice for effectively and efficiently building software systems. It introduces the students to the fundamental principles and methodologies of software engineering.  It focuses on the concepts and principles of software requirements engineering, its tools, techniques, and methods for modeling software systems. Various approaches to requirements analysis and review activities are examined.','2017-11-19 10:43:49'),(1782,2,12,0,'EMPTEC2','Empowerment Technology 2',3,'','None','2017-11-19 10:45:26'),(1783,2,12,0,'ETHIHAC','Ethical Hacking',3,'','None','2017-11-19 10:47:52'),(1784,2,12,0,'LBY-IOT','Internet of Things (Laboratory)',3,'','None','2017-11-19 10:48:14'),(1785,2,12,0,'EMPTECH','Empowerment Technology',3,'','None','2017-11-19 10:48:45'),(1786,2,12,0,'CSC613M','None',3,'','None','2017-11-19 10:49:06'),(1787,2,12,0,'SOFMETH','None',3,'','None','2017-11-19 10:49:20'),(1788,2,12,0,'DIT706D','Quali Appr',3,'','None','2017-11-19 10:49:54'),(1789,2,12,0,'DIT712D','None',3,'','None','2017-11-19 10:50:19'),(1790,2,12,0,'CSC724D','None',3,'','None','2017-11-19 10:51:36'),(1791,2,12,0,'INTSY2L','None',3,'','None','2017-11-19 10:52:01'),(1792,2,12,0,'SOFTMAN','Software Management',3,'','None','2017-11-19 10:52:40'),(1793,2,12,0,'JAPALA1','Japanese Language 1',3,'','None','2017-11-19 10:53:43'),(1794,2,12,0,'FRENCH1','French Language 1',3,'','None','2017-11-19 10:53:58'),(1795,2,12,0,'IMAGPRO','Image Processing',3,'','None','2017-11-19 10:54:28'),(1796,2,12,0,'EMTECH2','Empowerment Technology 2',3,'','None','2017-11-19 10:54:55'),(1797,2,12,0,'EMTECH3','Empowerment Technology 3',3,'','None','2017-11-19 10:55:08'),(1798,2,12,0,'DASTAPP','Applied Data Structures and Algorithms',3,'','None','2017-11-19 10:55:53'),(1799,2,12,0,'CSC741D','None',3,'','None','2017-11-19 10:56:16'),(1800,2,12,0,'CSC745M','None',3,'','None','2017-11-19 10:56:55'),(1801,2,12,0,'CSC745D','None',3,'','None','2017-11-19 10:57:51'),(1802,2,12,0,'CSC732M','Bus. Int.',3,'','None','2017-11-19 10:58:17'),(1803,2,12,0,'MAC-LRN','Machine Learning',3,'','None','2017-11-19 10:58:51'),(1804,2,12,0,'MACLERN','Machine Learning',3,'','None','2017-11-19 10:59:10'),(1805,2,12,0,'CSC732D','None',3,'','None','2017-11-19 10:59:35'),(1806,2,12,0,'WEBDIST','None',3,'','None','2017-11-19 10:59:57'),(1807,2,12,0,'CSC792M','Cloud Computing',3,'','None','2017-11-19 11:00:16'),(1808,2,12,0,'CLOUDCO','Cloud Computing',3,'','None','2017-11-19 11:00:24'),(1809,2,12,0,'LBYADV1','None',3,'','None','2017-11-19 11:00:39'),(1812,2,12,0,'CSC731M','None',3,'','None','2017-11-19 11:02:19'),(1811,2,12,0,'CMPHOTO','Image Processing',3,'','None','2017-11-19 11:01:36'),(1813,2,12,0,'DIT704D','None',3,'','None','2017-11-19 11:02:32'),(1814,2,12,0,'CSC105M','None',3,'','None','2017-11-19 11:02:50'),(1815,2,12,0,'PRJTMAN','Project Management',3,'','None','2017-11-19 11:03:24');
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
  `room_id` int(11) DEFAULT NULL,
  `class_day` varchar(4) DEFAULT NULL,
  `begin_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`days_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `days`
--

LOCK TABLES `days` WRITE;
/*!40000 ALTER TABLE `days` DISABLE KEYS */;
INSERT INTO `days` VALUES (1110,917,4,'H',1615,1745,'2017-11-19 03:10:54'),(1109,917,4,'T',1615,1745,'2017-11-19 03:10:54'),(1108,916,16,'W',1100,1230,'2017-11-19 03:10:54'),(1107,916,16,'M',1100,1230,'2017-11-19 03:10:54'),(1106,915,60,'S',1300,1600,'2017-11-19 03:10:54'),(1105,914,58,'F',900,1200,'2017-11-19 03:10:54'),(1104,913,11,'H',730,900,'2017-11-19 03:10:54'),(1103,912,25,'W',1430,1600,'2017-11-19 03:10:54'),(1102,912,25,'M',1430,1600,'2017-11-19 03:10:54'),(1101,911,2,'H',1245,1415,'2017-11-19 03:10:54'),(1100,911,2,'T',1245,1415,'2017-11-19 03:10:54'),(1099,910,7,'W',915,1045,'2017-11-19 03:10:54'),(1098,910,7,'M',915,1045,'2017-11-19 03:10:54');
/*!40000 ALTER TABLE `days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degreeequivalence`
--

DROP TABLE IF EXISTS `degreeequivalence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreeequivalence` (
  `degreeequivalence_id` int(11) NOT NULL AUTO_INCREMENT,
  `degreeprogram_id` int(11) NOT NULL,
  `equivalence` varchar(45) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`degreeequivalence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreeequivalence`
--

LOCK TABLES `degreeequivalence` WRITE;
/*!40000 ALTER TABLE `degreeequivalence` DISABLE KEYS */;
INSERT INTO `degreeequivalence` VALUES (1,1,'3-ST','2017-07-19 15:21:02'),(2,1,'ST-4','2017-07-19 15:21:02'),(3,1,'ST-3','2017-07-19 15:21:02'),(4,1,'ST-2','2017-07-19 15:21:02'),(5,1,'2-ST','2017-07-19 15:21:02'),(6,2,'IT-2','2017-07-19 15:21:02'),(7,2,'IT','2017-07-19 15:21:02'),(8,3,'CT','2017-07-19 15:21:28');
/*!40000 ALTER TABLE `degreeequivalence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degreeprogram`
--

DROP TABLE IF EXISTS `degreeprogram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreeprogram` (
  `degreeprogram_id` int(11) NOT NULL AUTO_INCREMENT,
  `college_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `degreeprogram_code` varchar(45) DEFAULT NULL,
  `degreeprogram_name` varchar(150) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`degreeprogram_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreeprogram`
--

LOCK TABLES `degreeprogram` WRITE;
/*!40000 ALTER TABLE `degreeprogram` DISABLE KEYS */;
INSERT INTO `degreeprogram` VALUES (1,2,12,'BS CS-ST','Bachelor of Science in Computer Science with specialization in Software Technology','2017-11-19 04:48:48'),(2,2,10,'BS CS-NE','BS Computer Science with Specialization in Network Engineering','2017-11-19 04:48:48'),(3,2,10,'BS CS-CSE','BS Computer Science Major in Computer Systems Engineering','2017-11-19 04:48:48'),(4,2,11,'BS CS-IST','BS Computer Science with Specialization in Instructional Systems Technology','2017-11-19 04:48:48'),(5,2,11,'BS-IS','BS Information Systems ','2017-11-19 04:48:48');
/*!40000 ALTER TABLE `degreeprogram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deloading`
--

DROP TABLE IF EXISTS `deloading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deloading` (
  `deloading_id` int(11) NOT NULL AUTO_INCREMENT,
  `college_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `deloading_code` varchar(100) DEFAULT NULL,
  `deloading_name` varchar(150) DEFAULT NULL,
  `deloading_type` varchar(20) DEFAULT NULL,
  `units` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`deloading_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deloading`
--

LOCK TABLES `deloading` WRITE;
/*!40000 ALTER TABLE `deloading` DISABLE KEYS */;
INSERT INTO `deloading` VALUES (1,2,12,'ST CHAIR','Department Chair','AL',6,'Being the Chair of a department','2017-11-14 21:51:52'),(2,2,10,'CT CHAIR','Department Chair','AL',6,NULL,'2017-11-14 21:51:52'),(3,2,11,'IT CHAIR','Department Chair','AL',6,NULL,'2017-11-14 21:51:52'),(4,2,12,'ST VICE CHAIR','Department Vice Chair','AL',3,NULL,'2017-11-14 21:56:12'),(5,2,11,'IT VICE CHAIR','Department Vice Chair','AL',3,NULL,'2017-11-14 21:56:12'),(6,2,10,'CT VICE CHAIR','Department Vice Chair','AL',3,NULL,'2017-11-14 21:56:12'),(7,2,12,'AVP-ES',NULL,'AL',12,NULL,'2017-11-14 21:51:52'),(8,2,12,'EA DIRECTOR',NULL,'AL',3,NULL,'2017-11-14 21:51:52'),(9,2,12,'TSG',NULL,'AL',3,NULL,'2017-11-14 21:51:52'),(10,2,12,'VCR','Vice Chancellor Of Academics','AL',12,NULL,'2017-11-14 21:51:52'),(11,2,12,'THESIS GRANT',NULL,'AL',6,NULL,'2017-11-14 21:56:11'),(12,2,12,'THESIS GRANT',NULL,'AL',3,NULL,'2017-11-14 21:56:11'),(13,2,12,'CEC DIRECTOR',NULL,'AL',6,NULL,'2017-11-14 21:56:11'),(14,2,12,'DEAN',NULL,'AL',12,NULL,'2017-11-14 21:56:12'),(15,2,12,'VICE DEAN',NULL,'AL',10,NULL,'2017-11-14 21:56:12'),(16,2,12,'STC PIONEER','STC Pioneer Faculty','AL',9,NULL,'2017-11-14 21:56:12'),(17,2,12,'PHD GRAD SCHOOL',NULL,'AL',2,NULL,'2017-11-14 21:56:12'),(18,2,12,'MS GRAD SCHOOL',NULL,'AL',1,NULL,'2017-11-14 21:56:12'),(19,2,12,'ADRIC','ADRIC Director','AL',6,NULL,'2017-11-14 21:56:12'),(20,2,12,'THESIS COORDINATOR',NULL,'AL',6,NULL,'2017-11-14 21:56:12'),(21,2,12,'JUBILEE',NULL,'RL',6,NULL,'2017-11-14 22:00:59'),(22,2,12,'RPW',NULL,'RL',3,NULL,'2017-11-14 22:00:59'),(23,2,12,'IR ECA',NULL,'RL',3,NULL,'2017-11-14 22:00:59'),(24,2,12,'KNOWLEDGE SOURCES',NULL,'RL',3,NULL,'2017-11-14 22:00:59'),(25,2,12,'PAASCU',NULL,'RL',3,NULL,'2017-11-14 22:00:59'),(26,2,12,'INFOSCU','','RL',3,NULL,'2017-11-14 22:00:59'),(27,2,12,'SOLO','Research','RL',3,NULL,'2017-11-14 22:00:59'),(28,2,12,'IE4OA',NULL,'RL',3,NULL,'2017-11-14 22:00:59'),(29,2,12,'ROSEN',NULL,'RL',6,NULL,'2017-11-14 22:00:59'),(30,2,12,'URCO',NULL,'RL',6,NULL,'2017-11-14 22:00:59'),(31,2,12,'URCO',NULL,'RL',5,NULL,'2017-11-14 22:00:59'),(32,2,12,'URCO',NULL,'RL',4,NULL,'2017-11-14 22:00:59'),(33,2,12,'URCO',NULL,'RL',3,NULL,'2017-11-14 22:00:59'),(34,2,12,'URCO',NULL,'RL',2,NULL,'2017-11-14 22:00:59'),(35,2,12,'URCO',NULL,'RL',1,NULL,'2017-11-14 22:00:59');
/*!40000 ALTER TABLE `deloading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deloadoffer`
--

DROP TABLE IF EXISTS `deloadoffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deloadoffer` (
  `deloadoffer_id` int(11) NOT NULL AUTO_INCREMENT,
  `deloading_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `term` int(11) DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`deloadoffer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deloadoffer`
--

LOCK TABLES `deloadoffer` WRITE;
/*!40000 ALTER TABLE `deloadoffer` DISABLE KEYS */;
INSERT INTO `deloadoffer` VALUES (1,1,73,2,2016,2017,'N/A','2017-07-13 03:01:27');
/*!40000 ALTER TABLE `deloadoffer` ENABLE KEYS */;
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
  `is_obsolete` int(11) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (5,1,'Counseling and Educational Psychology Department ','CEPD',50,0,'2017-07-13 03:01:27'),(6,1,'Department of English and Applied Linguistics','DEAL',50,0,'2017-07-13 03:01:27'),(7,1,'Educational Leadership and Management Department','ELMD',50,0,'2017-07-13 03:01:27'),(8,1,'Physical Education Department','PED',50,0,'2017-07-13 03:01:27'),(9,1,'Science Education Department','SED',50,0,'2017-07-13 03:01:27'),(10,2,'Computer Technology','CT',50,0,'2017-07-13 03:01:27'),(11,2,'Information Technology','IT',50,0,'2017-07-13 03:01:27'),(12,2,'Software Technology','ST',50,0,'2017-07-13 03:01:27'),(13,3,'College of Law (Department)','COL',50,0,'2017-07-13 03:01:27'),(14,4,'Behavioral Sciences Department','BSD',50,0,'2017-07-13 03:01:27'),(15,4,'Communication Department','COMM',50,0,'2017-07-13 03:01:27'),(16,4,'Departamento ng Filipino','FIL',50,0,'2017-07-13 03:01:27'),(17,4,'History Department','HIST',50,0,'2017-07-13 03:01:27'),(18,4,'International Studies Department','IS',50,0,'2017-07-13 03:01:27'),(19,4,'Department of Literature','LIT',50,0,'2017-07-13 03:01:27'),(20,4,'Philosophy Department','PHILO',50,0,'2017-07-13 03:01:27'),(21,4,'Political Science Department','POLSCI',50,0,'2017-07-13 03:01:27'),(22,4,'Psychology Department','PSYC',50,0,'2017-07-13 03:01:27'),(23,4,'Theology and Religous Education Department','TRED',50,0,'2017-07-13 03:01:27'),(24,5,'Biology Department','BIO',50,0,'2017-07-13 03:01:27'),(25,5,'Chemistry Department','CHEM',50,0,'2017-07-13 03:01:27'),(26,5,'Mathematics Deparrtment','MATH',50,0,'2017-07-13 03:01:27'),(27,5,'Physics Department','PHY',50,0,'2017-07-13 03:01:27'),(28,6,'Chemical Engineering Department','CHE',50,0,'2017-07-13 03:01:27'),(29,6,'Civil Engineering Department','CE',50,0,'2017-07-13 03:01:27'),(30,6,'Electronics and Communications Engineering Department','ECE',50,0,'2017-07-13 03:01:27'),(31,6,'Industrial Engineering','IE',50,0,'2017-07-13 03:01:27'),(32,6,'Manufacturing Engineering and Management','MEM',50,0,'2017-07-13 03:01:27'),(33,6,'Mechanical Engineering','ME',50,0,'2017-07-13 03:01:27'),(34,7,'Accountancy','ACCTY',50,0,'2017-07-13 03:01:27'),(35,7,'Center for Professional Development in Business','CPDB',50,0,'2017-07-13 03:01:27'),(36,7,'Commercial Law','COMM LAW',50,0,'2017-07-13 03:01:27'),(37,7,'Decision Sciences and Innovation Department','DSI',50,0,'2017-07-13 03:01:27'),(38,7,'Financial Management Department','FMD',50,0,'2017-07-13 03:01:27'),(39,7,'Management and Organization Department','MOD',50,0,'2017-07-13 03:01:27'),(40,7,'Marketing Management','MKTG',50,0,'2017-07-13 03:01:27'),(41,8,'Economics Department','ECON',50,0,'2017-07-13 03:01:27'),(42,9,'No Department','ND',50,0,'2017-07-30 09:45:00');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elecoffer`
--

DROP TABLE IF EXISTS `elecoffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elecoffer` (
  `offering_id` int(11) NOT NULL,
  `equivalence_id` int(11) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`offering_id`,`equivalence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elecoffer`
--

LOCK TABLES `elecoffer` WRITE;
/*!40000 ALTER TABLE `elecoffer` DISABLE KEYS */;
INSERT INTO `elecoffer` VALUES (605,1493,'2017-07-28 14:29:14'),(608,1490,'2017-07-28 14:29:14'),(646,1493,'2017-07-28 14:29:14'),(647,1494,'2017-07-28 14:29:14'),(648,1490,'2017-07-28 14:29:14'),(649,1493,'2017-07-28 14:29:14'),(650,1490,'2017-07-28 14:29:14');
/*!40000 ALTER TABLE `elecoffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equivalence`
--

DROP TABLE IF EXISTS `equivalence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equivalence` (
  `course_id` int(11) NOT NULL,
  `equivalence_id` int(11) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`course_id`,`equivalence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equivalence`
--

LOCK TABLES `equivalence` WRITE;
/*!40000 ALTER TABLE `equivalence` DISABLE KEYS */;
INSERT INTO `equivalence` VALUES (1581,1518,'2017-11-18 23:02:11'),(1582,1519,'2017-11-18 23:03:10'),(1586,1517,'2017-11-18 23:10:21'),(1590,1507,'2017-11-18 23:24:45'),(1591,1509,'2017-11-18 23:25:23'),(1593,1503,'2017-11-18 23:29:16'),(1596,1561,'2017-11-18 23:36:57'),(1596,1562,'2017-11-18 23:36:57'),(1596,1563,'2017-11-18 23:36:57'),(1596,1564,'2017-11-18 23:36:57'),(1597,1561,'2017-11-18 23:37:38'),(1597,1562,'2017-11-18 23:37:38'),(1597,1563,'2017-11-18 23:37:38'),(1597,1564,'2017-11-18 23:37:38'),(1599,1504,'2017-11-18 23:39:00'),(1600,1504,'2017-11-18 23:41:35'),(1600,1599,'2017-11-18 23:41:35'),(1601,1504,'2017-11-18 23:47:38'),(1601,1599,'2017-11-18 23:47:38'),(1601,1600,'2017-11-18 23:47:38'),(1607,1524,'2017-11-19 00:09:52'),(1609,1565,'2017-11-19 00:14:28'),(1609,1566,'2017-11-19 00:14:28'),(1609,1567,'2017-11-19 00:14:28'),(1610,1525,'2017-11-19 00:15:47'),(1612,1507,'2017-11-19 00:46:37'),(1613,1505,'2017-11-19 01:15:07'),(1615,1496,'2017-11-19 01:30:32'),(1616,1499,'2017-11-19 01:31:46'),(1618,1499,'2017-11-19 01:33:42'),(1618,1616,'2017-11-19 01:33:42'),(1619,1574,'2017-11-19 01:37:19'),(1620,1574,'2017-11-19 01:38:18'),(1620,1619,'2017-11-19 01:38:18'),(1623,1574,'2017-11-19 01:43:37'),(1624,1565,'2017-11-19 01:48:01'),(1624,1566,'2017-11-19 01:48:01'),(1624,1567,'2017-11-19 01:48:01'),(1625,1523,'2017-11-19 02:13:05'),(1629,1520,'2017-11-19 05:51:12'),(1631,1504,'2017-11-19 02:24:55'),(1631,1599,'2017-11-19 02:24:55'),(1631,1600,'2017-11-19 02:24:55'),(1631,1601,'2017-11-19 02:24:55'),(1635,1628,'2017-11-19 02:54:54'),(1639,1637,'2017-11-19 05:40:07'),(1711,1526,'2017-11-19 09:43:39'),(1723,1597,'2017-11-19 09:54:22'),(1727,1515,'2017-11-19 09:58:18'),(1736,1735,'2017-11-19 10:02:43'),(1741,1504,'2017-11-19 10:10:10'),(1741,1599,'2017-11-19 10:10:10'),(1741,1600,'2017-11-19 10:10:10'),(1741,1601,'2017-11-19 10:10:10'),(1741,1631,'2017-11-19 10:10:10'),(1744,1504,'2017-11-19 10:13:34'),(1752,1496,'2017-11-19 10:22:34'),(1769,1524,'2017-11-19 10:28:17'),(1773,1605,'2017-11-19 10:29:52'),(1781,1613,'2017-11-19 10:43:49'),(1785,1779,'2017-11-19 10:48:45'),(1798,1584,'2017-11-19 10:55:53'),(1803,1724,'2017-11-19 10:58:51'),(1804,1724,'2017-11-19 10:59:10'),(1804,1803,'2017-11-19 10:59:10'),(1811,1795,'2017-11-19 11:01:36');
/*!40000 ALTER TABLE `equivalence` ENABLE KEYS */;
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
  `year_started` int(11) DEFAULT NULL,
  `faculty_type` varchar(5) DEFAULT NULL COMMENT 'FT - Full Time, HT - Half Time, PT- Part Time',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`faculty_id`)
) ENGINE=MyISAM AUTO_INCREMENT=156 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (155,22546752,2005,'FT','2017-11-18 03:05:59'),(154,22647488,2005,'FT','2017-11-18 03:05:45'),(153,22723489,2005,'FT','2017-11-18 03:05:30'),(152,22414157,2005,'FT','2017-11-18 03:05:15'),(151,22711414,2005,'FT','2017-11-18 03:05:01'),(150,22523467,2005,'FT','2017-11-18 03:04:02'),(149,22039001,2005,'PT','2017-11-18 03:03:17'),(148,22373844,2005,'FT','2017-11-18 03:03:01'),(147,22177932,2005,'FT','2017-11-18 03:02:48'),(146,22718119,2005,'FT','2017-11-18 03:01:19'),(145,22683488,2005,'FT','2017-11-18 03:01:06'),(144,22784944,2005,'FT','2017-11-18 03:00:51'),(143,22611389,2005,'FT','2017-11-18 03:00:19'),(142,22563468,2005,'PT','2017-11-18 03:00:03'),(1,11111111,2005,'FT','2017-11-19 03:19:09'),(140,22241516,2005,'FT','2017-11-18 02:58:23'),(139,22778675,2005,'FT','2017-11-18 02:58:06'),(138,22879890,2005,'FT','2017-11-18 02:57:51'),(137,22526611,2005,'FT','2017-11-18 02:57:37'),(136,22637450,2005,'FT','2017-11-18 02:57:21'),(135,22098177,2005,'FT','2017-11-18 02:57:07'),(134,22234115,2005,'FT','2017-11-18 02:56:27'),(133,22344564,2005,'PT','2017-11-18 02:56:10'),(132,22675888,2005,'FT','2017-11-18 02:55:53'),(131,22314156,2005,'FT','2017-11-18 02:55:40'),(130,22778155,2005,'FT','2017-11-18 02:55:25'),(129,22734526,2005,'FT','2017-11-18 02:55:10'),(128,22842352,2005,'PT','2017-11-18 02:54:51'),(127,22672356,2005,'FT','2017-11-18 02:54:33'),(126,22854322,2005,'PT','2017-11-18 02:53:52'),(125,22155322,2005,'PT','2017-11-18 02:53:37'),(124,22784497,2005,'PT','2017-11-18 02:53:23'),(123,22833990,2005,'PT','2017-11-18 02:53:04'),(122,22648495,2005,'FT','2017-11-18 02:52:49'),(121,22165677,2005,'FT','2017-11-18 02:52:33'),(120,22725425,2005,'FT','2017-11-18 02:52:17'),(119,22124479,2005,'FT','2017-11-18 02:52:00'),(118,22457287,2005,'FT','2017-11-18 02:51:43'),(117,22453891,2005,'FT','2017-11-18 02:51:26'),(116,22374777,2005,'FT','2017-11-18 02:51:01'),(115,22832111,2005,'PT','2017-11-18 02:50:48'),(114,22764530,2005,'FT','2017-11-18 02:50:29'),(113,22098909,2005,'FT','2017-11-18 02:50:07'),(112,22738947,2005,'PT','2017-11-18 02:49:25'),(111,22567683,2005,'FT','2017-11-18 02:49:07'),(110,22543787,2005,'FT','2017-11-18 02:48:45'),(109,22425252,2005,'FT','2017-11-18 02:48:19'),(108,22425263,2005,'FT','2017-11-18 02:48:02'),(107,22576895,2005,'FT','2017-11-18 02:47:40'),(106,22090001,2005,'FT','2017-11-18 02:46:46'),(105,22176192,2005,'FT','2017-11-18 02:46:19'),(104,22456783,2005,'FT','2017-11-18 02:45:43'),(103,22597519,2005,'PT','2017-11-18 02:44:54'),(102,22590997,2005,'FT','2017-11-18 02:42:25'),(101,22742131,2005,'FT','2017-11-18 02:40:22'),(100,22317443,2005,'FT','2017-11-18 02:39:24');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowcharts`
--

DROP TABLE IF EXISTS `flowcharts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowcharts` (
  `flowchart_id` int(11) NOT NULL AUTO_INCREMENT,
  `degreeprogram_id` int(11) NOT NULL,
  `batch` int(11) DEFAULT NULL,
  `year_level` int(11) DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`flowchart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowcharts`
--

LOCK TABLES `flowcharts` WRITE;
/*!40000 ALTER TABLE `flowcharts` DISABLE KEYS */;
INSERT INTO `flowcharts` VALUES (1,2,113,1,2014,2015,'2017-11-19 08:50:10'),(2,2,113,2,2015,2016,'2017-11-19 08:50:10'),(3,2,113,3,2016,2017,'2017-11-19 08:50:11'),(4,2,113,4,2017,2018,'2017-11-19 08:50:11'),(5,1,113,1,2014,2015,'2017-11-19 08:50:11'),(6,1,113,2,2015,2016,'2017-11-19 08:50:11'),(7,1,113,3,2016,2017,'2017-11-19 08:50:12'),(8,1,113,4,2017,2018,'2017-11-19 08:50:12');
/*!40000 ALTER TABLE `flowcharts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowcourses`
--

DROP TABLE IF EXISTS `flowcourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowcourses` (
  `flowchart_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `term` int(11) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`flowchart_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowcourses`
--

LOCK TABLES `flowcourses` WRITE;
/*!40000 ALTER TABLE `flowcourses` DISABLE KEYS */;
INSERT INTO `flowcourses` VALUES (1,1496,1,'2017-11-19 08:50:10'),(1,1499,2,'2017-11-19 08:50:10'),(1,1500,3,'2017-11-19 08:50:10'),(1,1510,1,'2017-11-19 08:50:10'),(1,1511,2,'2017-11-19 08:50:10'),(1,1512,3,'2017-11-19 08:50:10'),(1,1514,2,'2017-11-19 08:50:10'),(1,1515,3,'2017-11-19 08:50:10'),(1,1520,1,'2017-11-19 08:50:10'),(1,1528,1,'2017-11-19 08:50:10'),(1,1529,1,'2017-11-19 08:50:10'),(1,1530,1,'2017-11-19 08:50:10'),(1,1531,2,'2017-11-19 08:50:10'),(1,1532,3,'2017-11-19 08:50:10'),(1,1534,1,'2017-11-19 08:50:10'),(1,1537,1,'2017-11-19 08:50:10'),(1,1538,2,'2017-11-19 08:50:10'),(1,1540,3,'2017-11-19 08:50:10'),(1,1547,2,'2017-11-19 08:50:10'),(1,1552,1,'2017-11-19 08:50:10'),(1,1553,2,'2017-11-19 08:50:10'),(1,1555,3,'2017-11-19 08:50:10'),(1,1557,3,'2017-11-19 08:50:10'),(1,1571,1,'2017-11-19 08:50:10'),(1,1572,2,'2017-11-19 08:50:10'),(1,1579,3,'2017-11-19 08:50:10'),(2,1501,2,'2017-11-19 08:50:11'),(2,1513,1,'2017-11-19 08:50:11'),(2,1533,2,'2017-11-19 08:50:11'),(2,1535,2,'2017-11-19 08:50:11'),(2,1541,1,'2017-11-19 08:50:11'),(2,1542,3,'2017-11-19 08:50:11'),(2,1548,1,'2017-11-19 08:50:11'),(2,1558,1,'2017-11-19 08:50:11'),(2,1568,2,'2017-11-19 08:50:11'),(2,1569,3,'2017-11-19 08:50:11'),(2,1570,3,'2017-11-19 08:50:11'),(2,1586,2,'2017-11-19 08:50:11'),(2,1627,3,'2017-11-19 08:50:11'),(2,1629,1,'2017-11-19 08:50:11'),(2,1631,3,'2017-11-19 08:50:11'),(2,1635,1,'2017-11-19 08:50:11'),(2,1637,1,'2017-11-19 08:50:11'),(2,1639,2,'2017-11-19 08:50:11'),(2,1640,2,'2017-11-19 08:50:11'),(2,1641,2,'2017-11-19 08:50:11'),(2,1642,2,'2017-11-19 08:50:11'),(2,1643,3,'2017-11-19 08:50:11'),(2,1644,3,'2017-11-19 08:50:11'),(2,1645,3,'2017-11-19 08:50:11'),(3,1559,1,'2017-11-19 08:50:11'),(3,1565,2,'2017-11-19 08:50:11'),(3,1573,1,'2017-11-19 08:50:11'),(3,1607,2,'2017-11-19 08:50:11'),(3,1610,3,'2017-11-19 08:50:11'),(3,1611,1,'2017-11-19 08:50:11'),(3,1646,1,'2017-11-19 08:50:11'),(3,1647,1,'2017-11-19 08:50:11'),(3,1648,1,'2017-11-19 08:50:11'),(3,1649,1,'2017-11-19 08:50:11'),(3,1650,2,'2017-11-19 08:50:11'),(3,1651,2,'2017-11-19 08:50:11'),(3,1652,2,'2017-11-19 08:50:11'),(3,1653,2,'2017-11-19 08:50:11'),(3,1654,3,'2017-11-19 08:50:11'),(3,1658,3,'2017-11-19 08:50:11'),(3,1659,3,'2017-11-19 08:50:11'),(4,1527,3,'2017-11-19 08:50:11'),(4,1536,1,'2017-11-19 08:50:11'),(4,1544,3,'2017-11-19 08:50:11'),(4,1545,1,'2017-11-19 08:50:11'),(4,1546,2,'2017-11-19 08:50:11'),(4,1549,1,'2017-11-19 08:50:11'),(4,1550,1,'2017-11-19 08:50:11'),(4,1551,3,'2017-11-19 08:50:11'),(4,1560,1,'2017-11-19 08:50:11'),(4,1566,3,'2017-11-19 08:50:11'),(4,1567,2,'2017-11-19 08:50:11'),(4,1578,2,'2017-11-19 08:50:11'),(4,1655,1,'2017-11-19 08:50:11'),(4,1656,2,'2017-11-19 08:50:11'),(4,1657,3,'2017-11-19 08:50:11'),(4,1660,1,'2017-11-19 08:50:11'),(4,1661,1,'2017-11-19 08:50:11'),(4,1662,2,'2017-11-19 08:50:11'),(4,1664,2,'2017-11-19 08:50:11'),(4,1665,3,'2017-11-19 08:50:11'),(5,1496,1,'2017-11-19 08:50:11'),(5,1499,2,'2017-11-19 08:50:11'),(5,1500,3,'2017-11-19 08:50:11'),(5,1510,1,'2017-11-19 08:50:11'),(5,1511,2,'2017-11-19 08:50:11'),(5,1512,3,'2017-11-19 08:50:11'),(5,1514,2,'2017-11-19 08:50:11'),(5,1515,3,'2017-11-19 08:50:11'),(5,1520,1,'2017-11-19 08:50:11'),(5,1528,1,'2017-11-19 08:50:11'),(5,1529,1,'2017-11-19 08:50:11'),(5,1530,1,'2017-11-19 08:50:11'),(5,1531,2,'2017-11-19 08:50:11'),(5,1532,3,'2017-11-19 08:50:11'),(5,1534,1,'2017-11-19 08:50:11'),(5,1537,1,'2017-11-19 08:50:11'),(5,1538,2,'2017-11-19 08:50:11'),(5,1540,3,'2017-11-19 08:50:11'),(5,1547,2,'2017-11-19 08:50:11'),(5,1552,1,'2017-11-19 08:50:11'),(5,1553,2,'2017-11-19 08:50:11'),(5,1555,3,'2017-11-19 08:50:11'),(5,1557,3,'2017-11-19 08:50:11'),(5,1571,1,'2017-11-19 08:50:11'),(5,1572,2,'2017-11-19 08:50:11'),(5,1579,3,'2017-11-19 08:50:11'),(6,1501,1,'2017-11-19 08:50:12'),(6,1503,2,'2017-11-19 08:50:12'),(6,1504,3,'2017-11-19 08:50:12'),(6,1513,1,'2017-11-19 08:50:11'),(6,1516,1,'2017-11-19 08:50:12'),(6,1518,3,'2017-11-19 08:50:12'),(6,1521,1,'2017-11-19 08:50:12'),(6,1522,2,'2017-11-19 08:50:12'),(6,1523,2,'2017-11-19 08:50:12'),(6,1524,3,'2017-11-19 08:50:12'),(6,1525,2,'2017-11-19 08:50:12'),(6,1533,2,'2017-11-19 08:50:12'),(6,1535,2,'2017-11-19 08:50:12'),(6,1541,1,'2017-11-19 08:50:11'),(6,1545,1,'2017-11-19 08:50:12'),(6,1546,3,'2017-11-19 08:50:12'),(6,1548,1,'2017-11-19 08:50:12'),(6,1558,2,'2017-11-19 08:50:12'),(6,1565,3,'2017-11-19 08:50:12'),(6,1573,3,'2017-11-19 08:50:12'),(7,1502,1,'2017-11-19 08:50:12'),(7,1505,1,'2017-11-19 08:50:12'),(7,1506,3,'2017-11-19 08:50:12'),(7,1507,3,'2017-11-19 08:50:12'),(7,1509,2,'2017-11-19 08:50:12'),(7,1517,3,'2017-11-19 08:50:12'),(7,1527,2,'2017-11-19 08:50:12'),(7,1542,1,'2017-11-19 08:50:12'),(7,1546,1,'2017-11-19 08:50:12'),(7,1561,1,'2017-11-19 08:50:12'),(7,1562,3,'2017-11-19 08:50:12'),(7,1568,3,'2017-11-19 08:50:12'),(7,1574,3,'2017-11-19 08:50:12'),(7,1580,1,'2017-11-19 08:50:12'),(8,1508,1,'2017-11-19 08:50:12'),(8,1519,2,'2017-11-19 08:50:12'),(8,1526,1,'2017-11-19 08:50:12'),(8,1536,1,'2017-11-19 08:50:12'),(8,1543,2,'2017-11-19 08:50:12'),(8,1544,3,'2017-11-19 08:50:12'),(8,1549,1,'2017-11-19 08:50:12'),(8,1550,2,'2017-11-19 08:50:12'),(8,1551,3,'2017-11-19 08:50:12'),(8,1560,1,'2017-11-19 08:50:12'),(8,1563,1,'2017-11-19 08:50:12'),(8,1564,2,'2017-11-19 08:50:12'),(8,1566,3,'2017-11-19 08:50:12'),(8,1567,1,'2017-11-19 08:50:12'),(8,1569,1,'2017-11-19 08:50:12'),(8,1570,1,'2017-11-19 08:50:12'),(8,1575,1,'2017-11-19 08:50:12'),(8,1576,2,'2017-11-19 08:50:12'),(8,1577,3,'2017-11-19 08:50:12'),(8,1578,3,'2017-11-19 08:50:12');
/*!40000 ALTER TABLE `flowcourses` ENABLE KEYS */;
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
  `has_research_load` int(11) DEFAULT NULL,
  `is_admin` int(11) DEFAULT NULL,
  `is_on_leave` int(11) DEFAULT NULL,
  `leave_type` varchar(45) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`loads_id`)
) ENGINE=MyISAM AUTO_INCREMENT=372 DEFAULT CHARSET=latin1;
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
  `is_non_acad` int(11) DEFAULT NULL,
  `is_shs` int(11) DEFAULT NULL,
  `is_service_course` int(11) DEFAULT NULL,
  `servicedept_id` int(11) DEFAULT NULL,
  `is_masters` int(11) DEFAULT NULL,
  `is_elective` int(11) DEFAULT NULL,
  `elective_type` varchar(7) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `offering_status` varchar(45) DEFAULT NULL,
  `iteo_eval` float DEFAULT NULL,
  `isPublished` int(11) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`offering_id`)
) ENGINE=MyISAM AUTO_INCREMENT=918 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offering`
--

LOCK TABLES `offering` WRITE;
/*!40000 ALTER TABLE `offering` DISABLE KEYS */;
INSERT INTO `offering` VALUES (917,1557,1,'CS-ST','S11',113,3,2014,2015,45,0,0,0,0,42,0,0,' ','','Regular',5,1,'2017-11-19 03:36:28'),(916,1500,1,'CS-ST','S18A',113,3,2014,2015,45,0,0,0,0,42,0,0,' ','','Regular',5,1,'2017-11-19 03:36:28'),(915,1555,1,'CS-ST','S15',113,3,2014,2015,45,0,0,0,0,42,0,0,' ','','Regular',5,1,'2017-11-19 03:36:28'),(914,1532,1,'CS-ST','S12',113,3,2014,2015,45,0,0,0,0,42,0,0,' ','','Regular',5,1,'2017-11-19 03:36:28'),(913,1579,1,'CS-ST','S12',113,3,2014,2015,45,0,0,0,0,42,0,0,' ','','Regular',5,1,'2017-11-19 03:36:28'),(912,1540,1,'CS-ST','S11',113,3,2014,2015,45,0,0,0,0,42,0,0,' ','','Regular',5,1,'2017-11-19 03:36:28'),(911,1515,1,'CS-ST','S11',113,3,2014,2015,45,0,0,0,0,42,0,0,' ','','Regular',5,1,'2017-11-19 03:36:28'),(910,1512,1,'CS-ST','S11',113,3,2014,2015,45,0,0,0,0,42,0,0,' ','','Regular',5,1,'2017-11-19 03:36:28');
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
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `req_type` varchar(45) DEFAULT NULL COMMENT '1 - prerequisite, 2 - soft prerequisite, 3 - co requisite',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`requisite_id`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisite`
--

LOCK TABLES `requisite` WRITE;
/*!40000 ALTER TABLE `requisite` DISABLE KEYS */;
INSERT INTO `requisite` VALUES (1,1499,1496,'Pre-req','2017-11-18 05:43:01'),(2,1500,1499,'Pre-req','2017-11-18 05:45:47'),(3,1501,1499,'Pre-req','2017-11-18 05:53:41'),(4,1502,1501,'Pre-req','2017-11-18 05:57:12'),(5,1503,1500,'Pre-req','2017-11-18 06:00:19'),(6,1504,1501,'Pre-req','2017-11-18 06:03:06'),(7,1504,1503,'Pre-req','2017-11-18 06:03:06'),(8,1505,1504,'Pre-req','2017-11-18 06:06:39'),(9,1506,1504,'Pre-req','2017-11-18 06:08:41'),(10,1507,1505,'Pre-req','2017-11-18 06:13:48'),(11,1508,1507,'Pre-req','2017-11-18 06:16:03'),(12,1509,1503,'Pre-req','2017-11-18 06:17:56'),(13,1511,1510,'Pre-req','2017-11-18 06:29:55'),(14,1512,1510,'Pre-req','2017-11-18 06:35:49'),(15,1513,1512,'Pre-req','2017-11-18 06:37:17'),(16,1514,1510,'Pre-req','2017-11-18 06:38:40'),(17,1515,1514,'Pre-req','2017-11-18 06:40:35'),(18,1515,1499,'Pre-req','2017-11-18 06:41:52'),(19,1516,1515,'Pre-req','2017-11-18 06:44:56'),(20,1517,1515,'Pre-req','2017-11-18 06:50:33'),(21,1518,1515,'Pre-req','2017-11-18 06:52:59'),(22,1519,1518,'Pre-req','2017-11-18 07:03:11'),(23,1521,1520,'Pre-req','2017-11-18 07:17:14'),(24,1522,1520,'Pre-req','2017-11-18 07:18:12'),(25,1523,1521,'Pre-req','2017-11-18 07:46:22'),(26,1524,1523,'Pre-req','2017-11-18 07:48:21'),(27,1525,1513,'Pre-req','2017-11-18 08:28:27'),(28,1526,1525,'Pre-req','2017-11-18 08:29:33'),(29,1531,1530,'Pre-req','2017-11-18 08:39:40'),(30,1532,1530,'Pre-req','2017-11-18 08:40:33'),(31,1533,1530,'Pre-req','2017-11-18 08:41:15'),(33,1535,1534,'Pre-req','2017-11-18 08:43:19'),(34,1536,1535,'Pre-req','2017-11-18 08:44:28'),(35,1538,1537,'Pre-req','2017-11-18 08:48:11'),(36,1539,1537,'Pre-req','2017-11-18 08:48:14'),(37,1541,1540,'Pre-req','2017-11-18 08:50:39'),(38,1542,1540,'Pre-req','2017-11-18 08:51:47'),(39,1546,1545,'Pre-req','2017-11-18 10:28:17'),(40,1548,1547,'Pre-req','2017-11-18 10:29:52'),(41,1549,1548,'Pre-req','2017-11-18 10:30:23'),(42,1551,1542,'Pre-req','2017-11-18 10:33:12'),(43,1550,1542,'Pre-req','2017-11-18 10:33:53'),(44,1553,1552,'Pre-req','2017-11-18 10:38:33'),(45,1554,1552,'Pre-req','2017-11-18 10:39:10'),(46,1555,1554,'Pre-req','2017-11-18 10:39:51'),(47,1556,1553,'Pre-req','2017-11-18 10:40:13'),(48,1558,1557,'Pre-req','2017-11-18 10:42:37'),(49,1559,1558,'Pre-req','2017-11-18 10:43:04'),(50,1560,1559,'Pre-req','2017-11-18 10:43:29'),(51,1573,1572,'Pre-req','2017-11-18 11:14:40'),(52,1574,1516,'Pre-req','2017-11-18 11:18:40'),(53,1574,1505,'Pre-req','2017-11-18 11:18:40'),(54,1574,1524,'Pre-req','2017-11-18 11:18:40'),(55,1575,1574,'Pre-req','2017-11-18 11:23:16'),(56,1576,1575,'Pre-req','2017-11-18 11:23:27'),(57,1577,1577,'Pre-req','2017-11-18 11:23:47'),(58,1580,1514,'Pre-req','2017-11-18 14:31:33'),(59,1584,1583,'Pre-req','2017-11-18 23:07:26'),(60,1585,1584,'Pre-req','2017-11-18 23:08:36'),(61,1588,1587,'Pre-req','2017-11-18 23:19:06'),(62,1589,1588,'Pre-req','2017-11-18 23:19:30'),(63,1594,1514,'Pre-req','2017-11-18 23:33:30'),(73,1611,1504,'Pre-req','2017-11-19 00:45:07'),(72,1606,1589,'Pre-req','2017-11-19 00:07:36'),(71,1605,1604,'Pre-req','2017-11-19 00:06:45'),(70,1604,1603,'Pre-req','2017-11-19 00:05:43'),(69,1596,1594,'Pre-req','2017-11-18 23:36:57'),(74,1616,1615,'Pre-req','2017-11-19 01:31:46'),(75,1618,1583,'Pre-req','2017-11-19 01:42:26'),(76,1627,1520,'Pre-req','2017-11-19 02:18:37'),(77,1628,1627,'Pre-req','2017-11-19 02:19:24'),(78,1629,1520,'Pre-req','2017-11-19 02:20:19'),(79,1633,1629,'Pre-req','2017-11-19 02:26:20'),(80,1634,1520,'Pre-req','2017-11-19 02:52:08'),(81,1635,1520,'Pre-req','2017-11-19 02:53:05'),(91,1641,1635,'Pre-req','2017-11-19 05:45:38'),(83,1639,1635,'Pre-req','2017-11-19 05:34:09'),(84,1639,1639,'Pre-req','2017-11-19 05:34:09'),(85,1639,1629,'Pre-req','2017-11-19 05:34:09'),(86,1640,1635,'Pre-req','2017-11-19 05:35:54'),(87,1640,1637,'Pre-req','2017-11-19 05:35:54'),(88,1640,1629,'Pre-req','2017-11-19 05:35:54'),(89,1631,1500,'Pre-req','2017-11-19 05:38:09'),(90,1631,1501,'Pre-req','2017-11-19 05:38:09'),(92,1641,1637,'Pre-req','2017-11-19 05:45:38'),(93,1642,1635,'Pre-req','2017-11-19 05:46:39'),(94,1642,1637,'Pre-req','2017-11-19 05:46:39'),(95,1643,1629,'Pre-req','2017-11-19 05:50:29'),(96,1644,1642,'Pre-req','2017-11-19 06:06:02'),(97,1644,1641,'Pre-req','2017-11-19 06:06:02'),(98,1645,1642,'Pre-req','2017-11-19 06:06:37'),(99,1645,1641,'Pre-req','2017-11-19 06:06:37'),(100,1646,1640,'Pre-req','2017-11-19 07:40:23'),(101,1646,1639,'Pre-req','2017-11-19 07:40:23'),(102,1647,1640,'Pre-req','2017-11-19 07:43:00'),(103,1647,1639,'Pre-req','2017-11-19 07:43:00'),(104,1648,1644,'Pre-req','2017-11-19 07:45:12'),(105,1648,1645,'Pre-req','2017-11-19 07:45:12'),(106,1649,1644,'Pre-req','2017-11-19 07:48:08'),(107,1649,1645,'Pre-req','2017-11-19 07:48:08'),(108,1650,1631,'Pre-req','2017-11-19 07:49:34'),(109,1650,1640,'Pre-req','2017-11-19 07:49:34'),(110,1650,1639,'Pre-req','2017-11-19 07:49:34'),(111,1651,1631,'Pre-req','2017-11-19 07:51:28'),(112,1651,1640,'Pre-req','2017-11-19 07:51:28'),(113,1651,1639,'Pre-req','2017-11-19 07:51:28'),(114,1652,1643,'Pre-req','2017-11-19 07:53:06'),(115,1653,1642,'Pre-req','2017-11-19 07:56:16'),(116,1653,1641,'Pre-req','2017-11-19 07:56:16'),(117,1658,1640,'Pre-req','2017-11-19 07:59:58'),(118,1658,1639,'Pre-req','2017-11-19 07:59:58'),(119,1658,1642,'Pre-req','2017-11-19 07:59:58'),(120,1658,1641,'Pre-req','2017-11-19 07:59:58'),(121,1659,1642,'Pre-req','2017-11-19 08:06:06'),(122,1659,1641,'Pre-req','2017-11-19 08:06:06'),(123,1659,1653,'Pre-req','2017-11-19 08:06:06'),(124,1660,1658,'Pre-req','2017-11-19 08:08:46'),(125,1661,1642,'Pre-req','2017-11-19 08:10:04'),(126,1661,1641,'Pre-req','2017-11-19 08:10:04'),(127,1662,1660,'Pre-req','2017-11-19 08:11:33'),(130,1665,1662,'Pre-req','2017-11-19 08:17:21'),(129,1664,1653,'Pre-req','2017-11-19 08:15:06'),(131,1782,1779,'Pre-req','2017-11-19 10:45:26'),(132,1791,1766,'Pre-req','2017-11-19 10:52:01'),(133,1796,1779,'Pre-req','2017-11-19 10:54:55'),(134,1797,1796,'Pre-req','2017-11-19 10:55:08');
/*!40000 ALTER TABLE `requisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_code` varchar(45) DEFAULT NULL,
  `room_location` varchar(45) DEFAULT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `room_capacity` int(11) DEFAULT NULL,
  `building_id` int(11) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'G201','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(2,'G202','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(3,'G203','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(4,'G204','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(5,'G205','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(6,'G206','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(7,'G207','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(8,'G208','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(9,'G209','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(10,'G210','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(11,'G211','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(12,'G212','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(13,'G213','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(14,'G301','Taft','Computer Laboratory',45,5,'2017-07-27 07:55:45'),(15,'G302','Taft','Computer Laboratory',45,5,'2017-07-27 07:55:45'),(16,'G302A','Taft','Computer Laboratory',20,5,'2017-07-27 07:55:45'),(17,'G302B','Taft','Computer Laboratory',20,5,'2017-07-27 07:55:45'),(18,'G304A','Taft','Computer Laboratory',20,5,'2017-07-27 07:55:45'),(19,'G304B','Taft','Computer Laboratory',20,5,'2017-07-27 07:55:45'),(20,'G306A','Taft','Computer Laboratory',20,5,'2017-07-27 07:55:45'),(21,'G306B','Taft','Computer Laboratory',20,5,'2017-07-27 07:55:45'),(22,'G401','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(23,'G403','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(24,'G405','Taft','Lecture',45,5,'2017-07-27 07:55:45'),(25,'AG1205','Taft','Lecture',45,6,'2017-07-27 07:55:45'),(26,'AG1706','Taft','Lecture',45,6,'2017-07-27 07:55:45'),(27,'LS228','Taft','Lecture',45,2,'2017-07-27 07:55:45'),(28,'LS229','Taft','Lecture',45,2,'2017-07-27 07:55:45'),(29,'LS302','Taft','Lecture',45,2,'2017-07-27 07:55:45'),(30,'LS303','Taft','Lecture',45,2,'2017-07-27 07:55:45'),(31,'LS304','Taft','Lecture',45,2,'2017-07-27 07:55:45'),(32,'LS308','Taft','Lecture',45,2,'2017-07-27 07:55:45'),(33,'LS310','Taft','Lecture',45,2,'2017-07-27 07:55:45'),(34,'LS316','Taft','Lecture',45,2,'2017-07-27 07:55:45'),(35,'LS320','Taft','Lecture',45,2,'2017-07-27 07:55:45'),(36,'LS332','Taft','Lecture',45,2,'2017-07-27 07:55:45'),(37,'LS333','Taft','Lecture',45,2,'2017-07-27 07:55:45'),(38,'LS335','Taft','Lecture',45,2,'2017-07-27 07:55:45'),(39,'SM308','Taft','Lecture',45,13,'2017-07-27 07:55:45'),(40,'SM310','Taft','Lecture',45,13,'2017-07-27 07:55:45'),(41,'SM311','Taft','Lecture',45,13,'2017-07-27 07:55:45'),(42,'SM312','Taft','Lecture',45,13,'2017-07-27 07:55:45'),(43,'SM313','Taft','Lecture',45,13,'2017-07-27 07:55:45'),(44,'SM314','Taft','Lecture',45,13,'2017-07-27 07:55:45'),(45,'SJ212','Taft','Lecture',45,14,'2017-07-27 07:55:45'),(46,'SJ314','Taft','Lecture',45,14,'2017-07-27 07:55:45'),(47,'V301','Taft','Lecture',45,3,'2017-07-27 07:55:45'),(48,'MRE014','STC','Lecture',45,17,'2017-07-27 07:55:45'),(49,'MRE313','STC','Lecture',45,17,'2017-07-27 07:55:45'),(50,'MRE412','STC','Lecture',45,17,'2017-07-27 07:55:45'),(51,'MRELAB','STC','Computer Laboratory',45,17,'2017-07-27 07:55:45'),(52,'MRW204','STC','Lecture',45,17,'2017-07-27 07:55:45'),(53,'MRW403','STC','Lecture',45,17,'2017-07-27 07:55:45'),(54,'MRW404','STC','Lecture',45,17,'2017-07-27 07:55:45'),(55,'MRW411','STC','Lecture',45,17,'2017-07-27 07:55:45'),(56,'MRW414','STC','Lecture',45,17,'2017-07-27 07:55:45'),(58,'ER701','Taft','Lecture',45,7,'2017-07-27 08:32:08'),(59,'Y503','Taft','Lecture',45,10,'2017-07-27 08:32:08'),(60,'No Room','None','None',0,1,'2017-10-08 18:12:31');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
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
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (22567683,2,12,'Emerico','','Aguilar','Faculty','4562135f8626938bacc89b91964e284ebafea5bade25d9db7b4512064c8b4169f5e11f32c431b630e07ce4a94e3cad5c04f9fb07e9b6a6823f2dab50c58a42d1|huLUlcmO3d5BJ9cAcZlH6','2017-11-18 02:49:07'),(22543787,2,12,'Courtney','','Ngo','Faculty','e9e2d63b211c2f83f3f4c9b5bf6ff401e524d5e4a81fd797d6be912925efbe96438d1a9d8c6233938c0a1bdc0836e60d8b2625bc3c78e081a312a1281bf882dd|D6lGhPS5sTzA6EoUGj8R7','2017-11-18 02:48:45'),(22425252,2,12,'Conrado','','Ruiz','Faculty','cbbc8f74e525d438338db70bb02427721d59ca624876332672541edeedd50e702a4c6f50ee13079e0799f16284c57160c525a525648963b5339509d8d2cc7ef0|h7ppaFcy9fZZ93zylnyB9','2017-11-18 02:48:19'),(22425263,2,11,'Christine Diane','','Lim','Faculty','72449350848c7e109a41a82cc159a11928f211611e3d443a652a738dfdc85384725d1ad010f78000494f59220a1e278e236bd713aae3bce9812de9db15bf5084|Sdevvt5zwDjRSD6qmDSSd','2017-11-18 03:23:05'),(22576895,2,12,'Christine','','Gendrano','Faculty','3926fc6ef603888c9df9000894cdaaff7582aefccd8ee938c264a33366a5769f4a6c186429a0e9b6353c3f6ccaa642611a1317aad234bf8804c3fba3bf51bdc5|dpZ3dI8ZwxbNdPx5y3j53','2017-11-18 02:47:40'),(22090001,2,12,'Chelsea','','Celestino','Faculty','59d7f1ee0b8ebb013481b10867233c0656cc4226487d7974d0ac5c43a0029478f4d75011cfcee9050a310b90a6c2e33a246059373e1ee0daf08ab52b0d261204|zO58mUnt2hpntefG86tWv','2017-11-18 02:46:46'),(22176192,2,12,'Charibeth','','Cheng','Faculty','c5a8e56f37ef66f6a5bae5d2c137d2354ca3c730509154fd12e65f493a869ea18809c8a6db926ab837a82cc3b34d9bf5dcec23ea79197656007e2857807b3bf7|LDvEUiY1BMhOEL7lrROB5','2017-11-18 02:46:19'),(22456783,2,12,'Briane','','Samson','Faculty','ee0864feff7dc74b7feb427748f2eb332add2fed1c2a79e44a83a4acbd0ed3076f201c195433f267289effa9556077779f51bd753f54086715785fb08f4fb280|IMqoWVmpEZdEm8TtImyXW','2017-11-18 02:45:43'),(22597519,2,12,'Arturo','','Caronongan','Faculty','b3ef3ba86ad89a0b94a884a00972d23018da99d82c6b30bc3303d2c4480cdd3182091822f42409de2dbd7980f18f479e8789f2cb5b85bf10d0034ab22ba29228|uVq6zmRG61TWp7x7gVZua','2017-11-18 02:44:05'),(22590997,2,12,'Arnulfo','','Azcarraga','Faculty','12b2d5adb3ffcec1464d4fe3e50478df7c0041fe1088e4c5e7d55d86d090e0e350178f49e8e63c316c06371389839a5a308feb3f78cb98ab042d278ddbdbe343|qPOEP2VGzE8xfSqQlVmgu','2017-11-18 02:42:25'),(22317443,2,12,'Allan','','Borra','Faculty','f0301c72c8b291ba1bfe31ff6b026d1fa35d7afa0524107b9730bc61d8a16a2b652584645638f820504cbabd5e41a3e00d70a27b860838857cdd174be0d385d9|douLmBl56z79Ragp3OrUc','2017-11-18 02:39:24'),(22742131,2,12,'Rafael',NULL,'Cabredo','Chair','cc213a90fbd347c920751e70ad6c65035bd9ab78154afe6fa3ebec91f6b6be3891bce1058e9ca195241b1d49b6f39065096ffab078b70dcc091466ed1987ede4|dWJ4fFlA6hlylpGWfF8qI','2017-11-18 01:41:53'),(22738947,2,12,'Emilio','','Moghareh','Faculty','512198a307f1e793ca6155c45c6fe554e64450d1f3cda966af7efc935f40ae29e346af0e4c3a86432eebfde57d3288329278d39beac090a6cab28c52dfa90a59|c6XADYS4pszJSoaMxk6KQ','2017-11-18 02:49:25'),(22098909,2,12,'Eric','','Navarro','Faculty','7ea323b21faaf54a418b0bccd3130f29f8824bf4e410be694efd8d0126a4499a33df764b28be0e99c71bc5162912e88e0ab6a0902b094bc98847897c55f920d8|JRXNXVZwKaD5G453OXLCD','2017-11-18 02:49:43'),(22764530,2,12,'Ethel','','Ong','Faculty','cb97498950ea2d383a09148a58eeeb4641e3d283aedc7d06744d8d5820957b91fb533882f1e65cd63c8a2dcb026757853a68bcf19f622cd89e4d31e24c52f115|y0EVt8W49jWJPdvBwzHJ0','2017-11-18 02:50:29'),(22832111,2,12,'Federico','','Gonzales','Faculty','355c553c02d4b0db3b871f8626c43c30e355e89747ba299cb61e3807891b24e30495c0f2e1101562b7adfa24bc194594c35b3f4170af382e220b06eec22be5bf|x0gxmzpNcLgYHyQDcgpnI','2017-11-18 02:50:48'),(22374777,2,12,'Florante','','Salvador','Faculty','635481914815083fdd3bfe07229f49d98e67eb8127d38f10aedb28f935d87db5b8f5ecfa1af4ae2e8b49ba9597a748e1e276afaa3a9128e45ffa2cc30f828ba7|9e4erca2PjEG2DJIJaZMs','2017-11-18 02:51:01'),(22453891,2,10,'Francesca','','Laguna','Faculty','5f31044fc001bb9ba2a0177e40d8475b6d9989549002d9f243c92da94edff6ae9817b7b04c6adb1393a02e9d00c909454ad72f60a2348d3351c1686e161b65bc|HSfSy08f5YWOl9Ojpl8nz','2017-11-18 03:23:05'),(22457287,2,10,'Fritz Kevin','','Flores','Faculty','8032101071a2e37f3f909c4b1faa4c34e4a6fe104f1d87d60882fbefd5b88bd8ed8c0cac2d3d2263f16026aec4491c26b9587dd54ce3273917103f9bca0afaaa|i2s4u59tUmynxe6KKMET4','2017-11-18 03:23:05'),(22124479,2,10,'Geanne','','Franco','Chair','99db9b7e89db783daee3fb1ea27750b09249fd104593f093263d713e1d9fb1f19f322514ee86abef0ea8281283340dd00de80e3e7175b9bcf00799064908f108|rgfKZxNgBHXPTpF5wnvfk','2017-11-19 06:53:17'),(22725425,2,11,'Geneva','','Timonera','Faculty','c05da16bae25334220837f6b31f045ee28203030dc079e172dc56b73759b58a045384565e7c2d4bce0ebe66fccf14d41bd91bad4d0b44f4d7cb673b7ed18574d|gG18u4A6JDaHqwR1JAr0b','2017-11-18 03:23:05'),(22165677,2,12,'Gian','','Fontanilla','Faculty','f69daa53ae3b99cb7ad7a059631a945f889a338577abab4e772c52be86b7decfd9904828389c2f5b9192292c7fa35d68ca20bcd6e1f978a9d4bc3d1c2f799a1a|chsnG3PiRJaaajAnneD3P','2017-11-18 02:52:33'),(22648495,2,12,'Gregory','','Cu','Faculty','b39254b86395bb641ac159e2caf08b43d3f611f495e29909c78b5a8d49e8ddeb0e906bdb53c82ad7e4bdb10cdadaa7265cfb830f09cf6f6276a62ff248f61ce0|I80dsEJRW839zzmhLgzQW','2017-11-18 02:52:49'),(22833990,2,12,'Jason','','Wong','Faculty','17d4bb986618324732c8f77249de99e6897be474f881c9d29c478c274cbbcf11d82bfab0ede0b003a4776cdecdc1116daf50cf895874393a1d11d3f727a20eef|djFzRhQ05ueiTwf9QCk75','2017-11-18 02:53:04'),(22784497,2,12,'Jemie','','Que','Faculty','0d591abbc7309de636ab12f324c83284ee7f36f3021c04414cd4f6acae87eecc5438fe56e3496970db28eece17a614954526f21c8827d9fb085fc3375bd6e566|Vt2ay2WLo8mEJMG7EPP7b','2017-11-18 02:53:23'),(22155322,2,12,'Joanne','','Vilda','Faculty','4a09ad7df2445de5d57094cc8e615fb2412527f81e03c181b61c5d0c2008d67c802392fbccc7164edd9d32a1a81ff6b747e95e6f105fe9d4e6bbf4b25a4a463c|9RGcmM2e7us6ak7TS4UZM','2017-11-18 02:53:37'),(22854322,2,12,'John','','Santillana','Faculty','0f78156c8c15468b89a81acae4173573af24dee59b09ca77211e3170088255624ec179e2b53d671a88c0f32502bd62f46073c75c8667b4f78af4d763b0e73cb9|AVZ0h7tsrsw9tr8NrXF35','2017-11-18 02:53:52'),(22672356,7,40,'Joie','','Sales','Faculty','8dfd1ee4d1c27302bb81796def10fe0a65d525948d7997aa3328778d8c017a3869779af906952d554eda5f1862ea295dac78338b82660e6adf6e3435c6ffb805|TfFkzmy5xcNtOsppOgKPL','2017-11-18 03:23:05'),(22842352,2,12,'Jolo','','Balbin','Faculty','dcf26dfca2a46699e6f12be0b265c0c4c220bc12166095ccaee5b958fe22cafd6ae814c4f48613e7986cb479d5161b36da2f6c67235712047bcb1953262aa295|xaxMoFIvgN2dri2KBoX5R','2017-11-18 02:54:51'),(22734526,2,12,'Jordan','','Deja','Faculty','e433fa6ec0de3f05887bbc46c5b5d29a976aecf49ef8eae89228914d10f6cb067ad21ea0b836f45092dcd32ce6b828c91e200a3349a6184f7cdef025aa4a06e9|OIoIct3S1uhVfXDOq0NFz','2017-11-18 02:55:10'),(22778155,2,12,'Juan Lorenzo','','Hagad','Faculty','68c4dccdd969c066b10b8894fcec8d26d85f186abbd91dd70308eed858ca75e01aafb5dd081a88905eaf7973114dc7b325f3f46ecdc029dbd522dacd440d62ef|8AeeqbZo447omJe7NFYuI','2017-11-18 02:55:25'),(22314156,2,10,'Judith','','Azcarraga','Faculty','51533f5b539e87bb4b68e2783c505f7d854369de64ad84392d88bd738052e1ace8a59f94ce2be869ae7ea34d6631355eb58a39221833160a2c8143ff05eb3af5|HtT0vlx05xpgnJSFQN1lu','2017-11-18 03:23:05'),(22675888,2,12,'Kai Shan','','Fernandez','Faculty','b4efea29f05c5bc920f07a0df2942253d247d404f25c0fa177c8b45c99dec88af2bc57294e5e6ca608278271c7db97ad9b9218c1ea323e8be152b099eda02539|9r733VoNomd5qBpVASHdg','2017-11-18 02:55:53'),(22344564,2,12,'Keone','','Medina','Faculty','ec016778df4f1d51d9201c8d58be8b27fb399cb203c5074a7fe14f57f28333f233fdda9ef1e4c06b038e173e39d90ca84969f1e3430295d30f13fd0c29d0ec51|lcDQ45Sy5r0L1hr0F1fop','2017-11-18 02:56:10'),(22234115,2,12,'Leif','','Syliongka','Faculty','82d659d0a2acda32273780bc61c44cbdb6015afdcd8d6379a639371123273ea54e77fa3bf2e5de807908fef747c29373ba6346b58e2212004d7ce49d9d1a56e8|7zzsh0lSHh1iv7awpfxBu','2017-11-18 02:56:27'),(22098177,2,12,'Marjorie','','Chuacokiong','Faculty','d7c297f2687b70eb0a5f82fe1f58b635f05553d90374d036f43394494aaa46b165a2203300612488c5b1d65a12770c08fe502dfa9208d7ec5e1daf623b05cb89|YrdWe0Eh5z09raQcYakUr','2017-11-18 02:57:07'),(22637450,2,12,'Merlin','','Suarez','Faculty','2ed7692aa2f50d017e54369c892e03adaa682a89885964028634f3760adfbabd7fc4807d8e8a7add67b94380a310ebff1de0e2aaa02159cfdba1b4d93ccad0e0|7QF14VZPsN5frzjYscGad','2017-11-18 02:57:21'),(22526611,2,12,'Miguel','','Cabral','Faculty','81c999bd1a0da6ce5e2c428c6a203bfe1297824311d71d580328d572a3fb78b54a3c926441c5a0122bc32f54db49e4800af63c67b9e7527a2d4104573fdb4a40|m0F8ODY4AxmhrLUG5VYdW','2017-11-18 02:57:37'),(22879890,2,12,'Nathalie','','Lim-Cheng','Faculty','a26c9184eba61fa0da13f378fbe06d0201b10d9322ea1d528575fcf8b2aa958bafabd9316e3d14c5074d327d6a464e8b861626f5418e0dbcbcc758afd50eab14|rDyhXOap65QO3tRJEgFtx','2017-11-18 02:57:51'),(22778675,2,12,'Neil','','Bretana','Faculty','c60ee8ec973092291f30f29ca09ca3fa5b2deaa234b78c972c09cc2d18533d1f236f6265070ff1ae0c3b992a0951eec40d344bdb4e1f69807bdd9823c6c20eef|1YKmuPh4qYf2btROvs6m7','2017-11-18 02:58:06'),(22241516,2,12,'Nelson','','Marcos','Faculty','1d45a045d53032cc530514046d85543d1e6ca54c8bd1359e61ddb666940556de7396b19edf3fbe255f7c51a1c90b3a934ce636b0f184c6aaae0b55ba84ce0fc2|t0AUOWGSeWJzRORAq3Wv2','2017-11-18 02:58:23'),(11111111,9,42,'No','','Prof','Faculty','ab3e484866249135f90cd3578931fd9e255addb835110b22e9ab1e5ff13ef1b6403cffaf4a65ebeda82beaf3714e9e9ba1e78689dcd212529e658eac65423173|o9QWwotXUhOp2Ue2hE2s9','2017-11-18 03:23:05'),(22563468,2,12,'Patrice','','Lu','Faculty','ba3840888d8344eaa15eac9800f9e7f0ffc7d7b74c989d9eb849aae508164e513039a25e0bd3cbed7fdd48d8c1fca5427ed8702485b97402f963a5040efb9b44|iIlngcWDTEaLqZtVPVv95','2017-11-18 03:00:03'),(22611389,2,12,'Rachel','','Roxas','Faculty','4a14dcdb4bea2057010a826229f991761e904dee4ba955b5b704a40866f71843cddcc940114ba26e163d9bd46ba2cb044a92078800b1fec8b1117bd228f223b6|dMCKDFXRYW0dhstAWrdVD','2017-11-18 03:00:19'),(22784944,2,12,'Ralph','','Regalado','Faculty','3ba4077ce59d991f1f1c0ee3fa55059654abf0e29db79096c532a4229a4602701164a4b80c674e27a25b1fff8e4e7b08528cbc09013b81d2e435824a34ad9eec|0OkQd0Zg3atLRZERe6q6x','2017-11-18 03:00:51'),(22683488,2,12,'Raymund','','Sison','Faculty','ef2c4e61dbc41124f0daffb753e9a1bce7b6dd247410c7a21576dc6b9dc822e0d012e218c9472a4410e7ec51701e54603488f17e6f90b1d2fd373cd8d2a04134|8wSveeXEx0fdsLAS30Re5','2017-11-18 03:01:06'),(22718119,2,12,'Remedios','','Bulos','Faculty','67066491a19db2f29426178cb223ea79ff3ec53b90940c113f58fc55bbc6f91d812de50eaa1ca0c478e9c0594fc6bc2d44fee966afd4c8cecc0f420681f6997c|0Dbk0kS7TlmWQoeMw3zqY','2017-11-18 03:01:19'),(22177932,2,12,'Rhia','','Trogo','Faculty','115fc27bc76b0d2365ddbb4fbe1c76c89dc85b6c4aa0f5fa27aba2a3b873252d612ee28d617411f2b6905035947539b28790ba6cb86b42ac975dc7773d1ee745|KBvF3HfBHh226kKSngf3p','2017-11-18 03:02:48'),(22373844,2,10,'Roger','','Uy','Faculty','89b383988d0f35ccfc5864ce5fd54960fa948d045e4f6a796c10df229d0aac2c2bc5df2819d9b183b8dfc3f7d0e574942752c98d572216597b3ad96604e4b17a|EK1JAfHxtZ81UWMhvXsb5','2017-11-18 03:23:05'),(22039001,2,12,'Rose Ann','','Sale','Faculty','15f9db0403a1f12023648169abeaa339054700f442b4e21a3df08459cd6b6d11821bebbf708380b8823cb2743d596ac379b9d5f717d204f0791d819d1f887fb7|30yXz2nlrHbmuAyPYQ4oz','2017-11-18 03:03:17'),(22523467,2,12,'Ryan','','Dimaunahan','Faculty','f6a265d2d8e117a7d0194fda10f5a55c9d5a6502fbbe988fc7b2c2435d0865455e629525972228e2550a3601a367757a43dcdd5c7badb09b07c61466e5a4fb1e|DEmPOzZSzIXAdAS9wUU8x','2017-11-18 03:04:02'),(22711414,2,12,'Solomon','','See','Faculty','163d83ebe0a8352beaeb7857469f319c3f01555fc23fe86318425441537fcd1141b5e81db778b59d588f0f9cf4a049fdcd5add4c6c7f0d2db2a456d60562c3e2|Gfa3OOY4jZSBIMmxIyN3j','2017-11-18 03:05:01'),(22414157,2,12,'Shirley','','Chu','Faculty','51bba8efa00cdb388637e69a2c11966e6c407a072e6ab974172fe18a7551b6b84e42ab48c525194ab0d00508c3bb4be5ebb3e798e7e5c3794f31ce435cbd3ae6|h8KdrI5DKkIXscYlZtLAW','2017-11-18 03:05:15'),(22723489,2,12,'Stanley','','Tan','Faculty','ebcfa924c8342bb7f244efaf5f9dd52d4094fb83871ab9c8e1c046a292b28d62e0b89e2ff4a1a0cae9af195515a23f6a713bebba4554de67dc506bd87613f4cb|o7rdaUEhZaq4QOlX2SUIA','2017-11-18 03:05:30'),(22647488,2,12,'Teresita','','Limoanco','Faculty','06e1328cc8d2b148443fdb9f94d070bf295f48a12ac02b5ec589420d44541863e31806eae548b26eebe8c9b90fb4ff14d2a14a75f00f04a542a0dbf96be3d866|gh1jgqhqMIupkJYmBFoRv','2017-11-18 03:05:45'),(22546752,2,12,'Thomas','','Tiam-Lee','Faculty','306085a0a6a27e209038f27e7b8d8f7a13f8ca84013fbd2a9a9cd29dae6b6044b2691ee1f08670d07fc8d5b71ed445cbed5ff3c47bd1eee4f8113c03ff9e7903|Tsd2jdWvmyr8cJRPkPbja','2017-11-18 03:05:59'),(22131451,2,42,'Hazel',NULL,'Ventura','Academic Programming Officer','0cde394b8f727903d1334963f2fbe23f920ac3a450c01f9bf9fb332f4b901e10a5ad9e72ec110daef0449507f03430df9f53fbfe916f6bac56e080b5786593ad|cQxjbMB1xHpGZ25omQ4mk','2017-11-18 03:26:19');
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

-- Dump completed on 2017-11-19 19:05:07
