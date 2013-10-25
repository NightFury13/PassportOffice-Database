-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: passport
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `AddressId` int(11) NOT NULL,
  `HouseNo` int(11) NOT NULL,
  `Street` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `Pincode` int(11) DEFAULT NULL,
  `State` varchar(255) NOT NULL,
  PRIMARY KEY (`AddressId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,109,'RJ Street','Hyderabad',50234,'AP'),(2,23,'Baker St.','Boston',123123,'BABA'),(3,223,'Raghu St.','Bangalore',23442,'Karnataka'),(4,123,'XAS Road','Ahmedabad',23412,'Guj'),(5,7,'Babu Nagar','Kanpur',12332,'UP'),(6,12,'Pratap St.','Indore',34523,'MP'),(7,345,'Hari Nagar','Goa',12321,'Goa'),(8,23,'Donald','Duck',696969,'DisneyLand'),(9,123,'asdsdff','asdasd',6864343,'asdsada'),(10,1323,'asdsdasdff','avbnsdasd',6864343,'asiouidsada'),(11,123,'asdsadasd','asdasd',12321,'sdfsdf'),(12,435,'werw','wewesd',123,'assfd'),(13,546,'dgdfgsdg','dfdgdf',4345,'sdfasdfsd');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AppPassed`
--

DROP TABLE IF EXISTS `AppPassed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AppPassed` (
  `AppId` int(11) NOT NULL,
  `PassportAppId` int(11) DEFAULT NULL,
  `PassId` int(11) DEFAULT NULL,
  `PolVerId` int(11) DEFAULT NULL,
  `DeliveryInfoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`AppId`),
  KEY `papp_fkey` (`PassportAppId`),
  KEY `pas_fkey` (`PassId`),
  KEY `polve_fkey` (`PolVerId`),
  KEY `delv_fkey` (`DeliveryInfoId`),
  CONSTRAINT `papp_fkey` FOREIGN KEY (`PassportAppId`) REFERENCES `PassportApp` (`AppNo`),
  CONSTRAINT `pas_fkey` FOREIGN KEY (`PassId`) REFERENCES `Passport` (`Pnumber`),
  CONSTRAINT `polve_fkey` FOREIGN KEY (`PolVerId`) REFERENCES `PoliceVer` (`PolVerId`),
  CONSTRAINT `delv_fkey` FOREIGN KEY (`DeliveryInfoId`) REFERENCES `DeliveryInfo` (`DelInfoId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AppPassed`
--

LOCK TABLES `AppPassed` WRITE;
/*!40000 ALTER TABLE `AppPassed` DISABLE KEYS */;
INSERT INTO `AppPassed` VALUES (1,1,1,1,1),(2,2,2,2,2);
/*!40000 ALTER TABLE `AppPassed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contact`
--

DROP TABLE IF EXISTS `Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contact` (
  `ContactID` int(11) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ContactID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contact`
--

LOCK TABLES `Contact` WRITE;
/*!40000 ALTER TABLE `Contact` DISABLE KEYS */;
INSERT INTO `Contact` VALUES (1,1234567890,'asd@asdqwe.com'),(2,1233456532,'dgqwe@asdf.com'),(3,2147483647,'asdasd@asdsa.com'),(4,2147483647,'sdfsdf@asdsa.com'),(5,2147483647,'asdasd@asdsd.com'),(6,2147483647,'sdf@wer.com'),(7,2147483647,'tyur@xcxc.com');
/*!40000 ALTER TABLE `Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `CustId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Date` date NOT NULL,
  `Status` enum('Applied','Verified','Dispacthed') DEFAULT NULL,
  `ContactId` int(11) DEFAULT NULL,
  PRIMARY KEY (`CustId`),
  KEY `cons_fkey` (`ContactId`),
  CONSTRAINT `cons_fkey` FOREIGN KEY (`ContactId`) REFERENCES `Contact` (`ContactID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Ajay','2013-08-19','Applied',1),(2,'Ruchika','2013-08-18','Applied',2),(3,'Sameer','2011-05-13','Verified',3),(4,'Claire','2012-08-09','Applied',4);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeliveryInfo`
--

DROP TABLE IF EXISTS `DeliveryInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeliveryInfo` (
  `DelInfoId` int(11) NOT NULL,
  `CourierComp` varchar(255) NOT NULL,
  `TrackNum` int(11) NOT NULL,
  `DeliveryDate` date NOT NULL,
  PRIMARY KEY (`DelInfoId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeliveryInfo`
--

LOCK TABLES `DeliveryInfo` WRITE;
/*!40000 ALTER TABLE `DeliveryInfo` DISABLE KEYS */;
INSERT INTO `DeliveryInfo` VALUES (1,'Adlabs',12312,'2012-03-04'),(2,'Imagica',12345,'2009-04-05');
/*!40000 ALTER TABLE `DeliveryInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `DeptId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`DeptId`),
  KEY `loc_fkey` (`LocationId`),
  CONSTRAINT `loc_fkey` FOREIGN KEY (`LocationId`) REFERENCES `Location` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,'Verification',3),(2,'IT',1),(3,'Managing',1);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dependent`
--

DROP TABLE IF EXISTS `Dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dependent` (
  `EId` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(255) NOT NULL DEFAULT '',
  `Relation` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `Benefit` varchar(255) NOT NULL,
  PRIMARY KEY (`EId`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dependent`
--

LOCK TABLES `Dependent` WRITE;
/*!40000 ALTER TABLE `Dependent` DISABLE KEYS */;
INSERT INTO `Dependent` VALUES (1,'Nasha','Wife',43,'1970-05-15','5000/month'),(2,'Somay','Son',10,'2013-04-13','None');
/*!40000 ALTER TABLE `Dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DetailsRef`
--

DROP TABLE IF EXISTS `DetailsRef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DetailsRef` (
  `DRId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `AddressId` int(11) DEFAULT NULL,
  `Phone` int(11) NOT NULL,
  PRIMARY KEY (`DRId`),
  KEY `ad_fkey` (`AddressId`),
  CONSTRAINT `ad_fkey` FOREIGN KEY (`AddressId`) REFERENCES `Address` (`AddressId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DetailsRef`
--

LOCK TABLES `DetailsRef` WRITE;
/*!40000 ALTER TABLE `DetailsRef` DISABLE KEYS */;
INSERT INTO `DetailsRef` VALUES (1,'Narang',5,2147483647),(2,'Natrag',6,2147483647),(3,'Mohit',7,1236128312),(4,'Somya',8,2147483647);
/*!40000 ALTER TABLE `DetailsRef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Education`
--

DROP TABLE IF EXISTS `Education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Education` (
  `EduId` int(11) NOT NULL,
  `HighSchool` varchar(255) DEFAULT NULL,
  `College` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EduId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Education`
--

LOCK TABLES `Education` WRITE;
/*!40000 ALTER TABLE `Education` DISABLE KEYS */;
INSERT INTO `Education` VALUES (1,'XYZ School','ASD'),(2,'ASD','IIIT-H'),(3,'AQWE','ASDLJKAS'),(4,'KJHWQKE','QWEHQW');
/*!40000 ALTER TABLE `Education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmerContact`
--

DROP TABLE IF EXISTS `EmerContact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmerContact` (
  `ECId` int(11) NOT NULL,
  `phone1` int(11) DEFAULT NULL,
  `phone2` int(11) DEFAULT NULL,
  PRIMARY KEY (`ECId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmerContact`
--

LOCK TABLES `EmerContact` WRITE;
/*!40000 ALTER TABLE `EmerContact` DISABLE KEYS */;
INSERT INTO `EmerContact` VALUES (1,23234234,934823942),(2,12312312,123123123),(3,12312312,123123123),(4,12312313,123123123);
/*!40000 ALTER TABLE `EmerContact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `EmployeeId` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `Salary` int(11) NOT NULL,
  `Age` int(11) NOT NULL,
  `Position` varchar(255) NOT NULL,
  `AddressId` int(11) DEFAULT NULL,
  `ContactId` int(11) DEFAULT NULL,
  `Jdate` date NOT NULL,
  `Acardnumber` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeId`),
  KEY `add_fkey` (`AddressId`),
  KEY `cont_fkey` (`ContactId`),
  CONSTRAINT `add_fkey` FOREIGN KEY (`AddressId`) REFERENCES `Address` (`AddressId`),
  CONSTRAINT `cont_fkey` FOREIGN KEY (`ContactId`) REFERENCES `Contact` (`ContactID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'1970-08-12',500000,43,'Manager',1,5,'1999-01-13',123123123),(2,'1970-08-14',234234,43,'IT Head',2,6,'2004-06-12',123567453),(3,'1980-03-12',123123,33,'Verification Officer',3,7,'2003-08-12',123673452);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FamilyDetails`
--

DROP TABLE IF EXISTS `FamilyDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FamilyDetails` (
  `FId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Relation` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `Occupation` varchar(255) NOT NULL,
  PRIMARY KEY (`FId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FamilyDetails`
--

LOCK TABLES `FamilyDetails` WRITE;
/*!40000 ALTER TABLE `FamilyDetails` DISABLE KEYS */;
INSERT INTO `FamilyDetails` VALUES (1,'Simi','Wife','1963-06-12','Housewife'),(2,'Gunnu','Mother','1933-05-13','Housewife'),(3,'Shippi','Mother','1989-03-12','Govt. Servive'),(4,'Avu','Daughter','2012-01-01','Schooling');
/*!40000 ALTER TABLE `FamilyDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fore`
--

DROP TABLE IF EXISTS `Fore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fore` (
  `ForeId` int(11) NOT NULL,
  `DeptId` int(11) DEFAULT NULL,
  `ItemId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ForeId`),
  KEY `depp_fkey` (`DeptId`),
  KEY `it_fkey` (`ItemId`),
  CONSTRAINT `depp_fkey` FOREIGN KEY (`DeptId`) REFERENCES `Department` (`DeptId`),
  CONSTRAINT `it_fkey` FOREIGN KEY (`ItemId`) REFERENCES `Items` (`ItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fore`
--

LOCK TABLES `Fore` WRITE;
/*!40000 ALTER TABLE `Fore` DISABLE KEYS */;
INSERT INTO `Fore` VALUES (1,1,1),(2,1,2),(3,2,3);
/*!40000 ALTER TABLE `Fore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items`
--

DROP TABLE IF EXISTS `Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Items` (
  `ItemId` int(11) NOT NULL,
  `Itemcode` varchar(255) NOT NULL,
  `Date` date NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Price` int(11) NOT NULL,
  PRIMARY KEY (`ItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items`
--

LOCK TABLES `Items` WRITE;
/*!40000 ALTER TABLE `Items` DISABLE KEYS */;
INSERT INTO `Items` VALUES (1,'23A','2011-11-11',100,'XYZ',500),(2,'2F','2012-12-12',350,'ABC',300),(3,'23A','2013-03-12',250,'QWE',500);
/*!40000 ALTER TABLE `Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `LocationId` int(11) NOT NULL,
  `Street` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `Pincode` int(11) NOT NULL,
  PRIMARY KEY (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,'Pankha Road','New Delhi',110064),(2,'VIP Road','Vadodara',390004),(3,'PKR Road','Hyderabad',500032);
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manages`
--

DROP TABLE IF EXISTS `Manages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Manages` (
  `MId` int(11) NOT NULL,
  `DepartmentId` int(11) DEFAULT NULL,
  `EmployeeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`MId`),
  KEY `dp_fkey` (`DepartmentId`),
  KEY `emp_fkey` (`EmployeeId`),
  CONSTRAINT `dp_fkey` FOREIGN KEY (`DepartmentId`) REFERENCES `Department` (`DeptId`),
  CONSTRAINT `emp_fkey` FOREIGN KEY (`EmployeeId`) REFERENCES `Employee` (`EmployeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manages`
--

LOCK TABLES `Manages` WRITE;
/*!40000 ALTER TABLE `Manages` DISABLE KEYS */;
INSERT INTO `Manages` VALUES (1,1,3),(2,2,2),(3,3,1);
/*!40000 ALTER TABLE `Manages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Name`
--

DROP TABLE IF EXISTS `Name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Name` (
  `NameId` int(11) NOT NULL,
  `First` varchar(255) DEFAULT NULL,
  `Middle` varchar(255) DEFAULT NULL,
  `Last` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NameId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Name`
--

LOCK TABLES `Name` WRITE;
/*!40000 ALTER TABLE `Name` DISABLE KEYS */;
INSERT INTO `Name` VALUES (1,'Kanna','R.','Srinathan'),(2,'Suresh','P.','Mehta'),(3,'Donald','M.','Duck'),(4,'Shinchan','S.','Nohara');
/*!40000 ALTER TABLE `Name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Passport`
--

DROP TABLE IF EXISTS `Passport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Passport` (
  `Pnumber` int(11) NOT NULL,
  `IssueDate` date NOT NULL,
  `ExpDate` date NOT NULL,
  `Status` enum('Applied','Verified','Dispatched') NOT NULL,
  `NumPages` enum('20','40') NOT NULL,
  `ECRorECNR` enum('ECR','ECNR') DEFAULT NULL,
  `Type` enum('Red','Blue') NOT NULL,
  PRIMARY KEY (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passport`
--

LOCK TABLES `Passport` WRITE;
/*!40000 ALTER TABLE `Passport` DISABLE KEYS */;
INSERT INTO `Passport` VALUES (1,'2013-01-01','2018-01-01','Applied','20','ECNR','Blue'),(2,'2011-02-02','2021-02-02','Verified','20','ECR','Red'),(3,'2012-03-03','2022-03-03','Dispatched','40','ECR','Blue'),(4,'2009-04-04','2014-04-04','Dispatched','40','ECNR','Blue');
/*!40000 ALTER TABLE `Passport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PassportApp`
--

DROP TABLE IF EXISTS `PassportApp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PassportApp` (
  `AppNo` int(11) NOT NULL,
  `MaritalStat` enum('Married','Unmarried') NOT NULL,
  `FId` int(11) DEFAULT NULL,
  `FlagGovt` enum('Yes','No') NOT NULL,
  `OldAppNum` int(11) NOT NULL,
  `ApplicationStatus` enum('Applied','Verified','Dispatched') NOT NULL,
  `OldDetailsId` int(11) DEFAULT NULL,
  `RefId` int(11) DEFAULT NULL,
  `EcontactId` int(11) DEFAULT NULL,
  `CAddId` int(11) DEFAULT NULL,
  `PAddId` int(11) DEFAULT NULL,
  `TypeApp` enum('Fresh','Renewal') NOT NULL,
  `OldNameId` int(11) DEFAULT NULL,
  `AadharCardNo` int(11) NOT NULL,
  `Citizenship` enum('By Birth','Transfer','Special') NOT NULL,
  `TypeIProof` enum('Marksheet','Passport','Elec-Bill','Pan-Card','License','Aadhar-Card') NOT NULL,
  `VPeriod` enum('5 years','10 years') DEFAULT NULL,
  `EmploymentType` varchar(255) NOT NULL,
  `PassportType` enum('Red','Blue') NOT NULL,
  `Sex` enum('Male','Female','Other') NOT NULL,
  `NameId` int(11) DEFAULT NULL,
  `DOB` date NOT NULL,
  `Age` int(11) NOT NULL,
  `Birthplace` varchar(255) NOT NULL,
  `AgeProof` enum('Marksheet','Passport','Elec-Bill','Pan-Card','License','Aadhar-Card') NOT NULL,
  `AddProof` enum('Marksheet','Passport','Elec-Bill','Pan-Card','License','Aadhar-Card') NOT NULL,
  `Fees` int(11) NOT NULL,
  `EducationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`AppNo`),
  KEY `fi_fkey` (`FId`),
  KEY `old_fkey` (`OldDetailsId`),
  KEY `ref_fkey` (`RefId`),
  KEY `econ_fkey` (`EcontactId`),
  KEY `cadd_fkey` (`CAddId`),
  KEY `padd_fkey` (`PAddId`),
  KEY `olna_fkey` (`OldNameId`),
  KEY `nam_fkey` (`NameId`),
  KEY `ed_fkey` (`EducationId`),
  CONSTRAINT `fi_fkey` FOREIGN KEY (`FId`) REFERENCES `FamilyDetails` (`FId`),
  CONSTRAINT `old_fkey` FOREIGN KEY (`OldDetailsId`) REFERENCES `PrevPassDetails` (`PPId`),
  CONSTRAINT `ref_fkey` FOREIGN KEY (`RefId`) REFERENCES `DetailsRef` (`DRId`),
  CONSTRAINT `econ_fkey` FOREIGN KEY (`EcontactId`) REFERENCES `EmerContact` (`ECId`),
  CONSTRAINT `cadd_fkey` FOREIGN KEY (`CAddId`) REFERENCES `Address` (`AddressId`),
  CONSTRAINT `padd_fkey` FOREIGN KEY (`PAddId`) REFERENCES `Address` (`AddressId`),
  CONSTRAINT `olna_fkey` FOREIGN KEY (`OldNameId`) REFERENCES `Name` (`NameId`),
  CONSTRAINT `nam_fkey` FOREIGN KEY (`NameId`) REFERENCES `Name` (`NameId`),
  CONSTRAINT `ed_fkey` FOREIGN KEY (`EducationId`) REFERENCES `Education` (`EduId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PassportApp`
--

LOCK TABLES `PassportApp` WRITE;
/*!40000 ALTER TABLE `PassportApp` DISABLE KEYS */;
INSERT INTO `PassportApp` VALUES (1,'Married',1,'Yes',2346817,'Applied',1,1,1,9,9,'Fresh',1,3489,'By Birth','Aadhar-Card','5 years','Railways','Blue','Male',1,'1982-01-01',31,'Jaipur','Pan-Card','Pan-Card',200,1),(2,'Unmarried',2,'No',234234,'Verified',2,2,2,10,13,'Renewal',2,123123,'Transfer','Pan-Card','10 years','Govt. Service','Red','Male',2,'1981-03-01',32,'Moscow','Aadhar-Card','Aadhar-Card',500,2),(3,'Unmarried',3,'Yes',123123,'Dispatched',3,3,3,11,11,'Fresh',3,23421,'Transfer','License','10 years','Student','Blue','Male',3,'1983-02-03',30,'Dubai','Aadhar-Card','Aadhar-Card',250,3),(4,'Unmarried',4,'Yes',546546,'Dispatched',4,4,4,12,12,'Fresh',4,23421,'Special','Pan-Card','5 years','Student','Blue','Female',4,'1984-03-12',29,'New Delhi','Pan-Card','Pan-Card',350,4);
/*!40000 ALTER TABLE `PassportApp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PoliceVer`
--

DROP TABLE IF EXISTS `PoliceVer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PoliceVer` (
  `PolVerId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `PoliceStation` varchar(255) NOT NULL,
  `Official` varchar(255) NOT NULL,
  PRIMARY KEY (`PolVerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PoliceVer`
--

LOCK TABLES `PoliceVer` WRITE;
/*!40000 ALTER TABLE `PoliceVer` DISABLE KEYS */;
INSERT INTO `PoliceVer` VALUES (1,'2013-01-01','Jaipur','PK Rao'),(2,'2011-02-02','New Delhi','Raghu'),(3,'2012-03-03','New Delhi','PK Reddy'),(4,'2009-04-04','Bangalore','PJN');
/*!40000 ALTER TABLE `PoliceVer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrevPassDetails`
--

DROP TABLE IF EXISTS `PrevPassDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PrevPassDetails` (
  `PPId` int(11) NOT NULL,
  `Number` int(11) NOT NULL,
  `DateExp` date NOT NULL,
  PRIMARY KEY (`PPId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrevPassDetails`
--

LOCK TABLES `PrevPassDetails` WRITE;
/*!40000 ALTER TABLE `PrevPassDetails` DISABLE KEYS */;
INSERT INTO `PrevPassDetails` VALUES (1,1237892,'1973-10-23'),(2,123123,'1980-12-12'),(3,1675623,'1980-08-07'),(4,11235673,'1985-05-02');
/*!40000 ALTER TABLE `PrevPassDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provides`
--

DROP TABLE IF EXISTS `Provides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Provides` (
  `ProvideId` int(11) NOT NULL,
  `ServiceId` int(11) DEFAULT NULL,
  `DepartmentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProvideId`),
  KEY `ser_fkey` (`ServiceId`),
  KEY `dept_fkey` (`DepartmentId`),
  CONSTRAINT `ser_fkey` FOREIGN KEY (`ServiceId`) REFERENCES `Service` (`ServId`),
  CONSTRAINT `dept_fkey` FOREIGN KEY (`DepartmentId`) REFERENCES `Department` (`DeptId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provides`
--

LOCK TABLES `Provides` WRITE;
/*!40000 ALTER TABLE `Provides` DISABLE KEYS */;
INSERT INTO `Provides` VALUES (1,2,1),(2,1,2),(3,1,2),(4,3,2);
/*!40000 ALTER TABLE `Provides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seeks`
--

DROP TABLE IF EXISTS `Seeks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Seeks` (
  `SeekId` int(11) NOT NULL,
  `ServiceId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`SeekId`),
  KEY `seek1_fkey` (`ServiceId`),
  KEY `seek2_fkey` (`CustomerId`),
  CONSTRAINT `seek1_fkey` FOREIGN KEY (`ServiceId`) REFERENCES `Service` (`ServId`),
  CONSTRAINT `seek2_fkey` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seeks`
--

LOCK TABLES `Seeks` WRITE;
/*!40000 ALTER TABLE `Seeks` DISABLE KEYS */;
INSERT INTO `Seeks` VALUES (1,2,3),(2,1,1);
/*!40000 ALTER TABLE `Seeks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service`
--

DROP TABLE IF EXISTS `Service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Service` (
  `ServId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Fee` int(255) NOT NULL,
  PRIMARY KEY (`ServId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service`
--

LOCK TABLES `Service` WRITE;
/*!40000 ALTER TABLE `Service` DISABLE KEYS */;
INSERT INTO `Service` VALUES (1,'abc',500),(2,'asd',200),(3,'sdf',150);
/*!40000 ALTER TABLE `Service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SuppliedBy`
--

DROP TABLE IF EXISTS `SuppliedBy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SuppliedBy` (
  `SupplyId` int(11) NOT NULL,
  `ItemId` int(11) DEFAULT NULL,
  `SupplierId` int(11) DEFAULT NULL,
  PRIMARY KEY (`SupplyId`),
  KEY `ite_fkey` (`ItemId`),
  KEY `supp_fkey` (`SupplierId`),
  CONSTRAINT `ite_fkey` FOREIGN KEY (`ItemId`) REFERENCES `Items` (`ItemId`),
  CONSTRAINT `supp_fkey` FOREIGN KEY (`SupplierId`) REFERENCES `Supplier` (`SupplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SuppliedBy`
--

LOCK TABLES `SuppliedBy` WRITE;
/*!40000 ALTER TABLE `SuppliedBy` DISABLE KEYS */;
INSERT INTO `SuppliedBy` VALUES (1,1,1),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `SuppliedBy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier` (
  `SupplierId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ContactId` int(11) DEFAULT NULL,
  `AddressId` int(11) DEFAULT NULL,
  `TIN` int(11) NOT NULL,
  `DueAmount` int(11) NOT NULL,
  PRIMARY KEY (`SupplierId`),
  KEY `co_fkey` (`ContactId`),
  KEY `addr_fkey` (`AddressId`),
  CONSTRAINT `co_fkey` FOREIGN KEY (`ContactId`) REFERENCES `Contact` (`ContactID`),
  CONSTRAINT `addr_fkey` FOREIGN KEY (`AddressId`) REFERENCES `Address` (`AddressId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES (1,'Kotak Enterprises',4,4,12312,225000);
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorksIn`
--

DROP TABLE IF EXISTS `WorksIn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorksIn` (
  `WId` int(11) NOT NULL,
  `DeptId` int(11) DEFAULT NULL,
  `EmpId` int(11) DEFAULT NULL,
  PRIMARY KEY (`WId`),
  KEY `de_fkey` (`DeptId`),
  KEY `empl_fkey` (`EmpId`),
  CONSTRAINT `de_fkey` FOREIGN KEY (`DeptId`) REFERENCES `Department` (`DeptId`),
  CONSTRAINT `empl_fkey` FOREIGN KEY (`EmpId`) REFERENCES `Employee` (`EmployeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorksIn`
--

LOCK TABLES `WorksIn` WRITE;
/*!40000 ALTER TABLE `WorksIn` DISABLE KEYS */;
INSERT INTO `WorksIn` VALUES (1,3,1),(2,2,2),(3,1,3);
/*!40000 ALTER TABLE `WorksIn` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-25 19:28:16
