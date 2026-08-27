-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: AccountingDB
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Current Database: `AccountingDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `AccountingDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `AccountingDB`;

--
-- Table structure for table `ac_bucket_DataOperation`
--

DROP TABLE IF EXISTS `ac_bucket_DataOperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_bucket_DataOperation` (
  `OperationType` int NOT NULL,
  `User` int NOT NULL,
  `ExecutionSite` int NOT NULL,
  `Source` int NOT NULL,
  `Destination` int NOT NULL,
  `Protocol` int NOT NULL,
  `FinalStatus` int NOT NULL,
  `TransferSize` decimal(30,10) NOT NULL,
  `TransferTime` decimal(30,10) NOT NULL,
  `RegistrationTime` decimal(30,10) NOT NULL,
  `TransferOK` decimal(30,10) NOT NULL,
  `TransferTotal` decimal(30,10) NOT NULL,
  `RegistrationOK` decimal(30,10) NOT NULL,
  `RegistrationTotal` decimal(30,10) NOT NULL,
  `entriesInBucket` decimal(30,10) NOT NULL,
  `startTime` int unsigned NOT NULL,
  `bucketLength` mediumint unsigned NOT NULL,
  UNIQUE KEY `UniqueConstraint` (`startTime`,`OperationType`,`User`,`ExecutionSite`,`Source`,`Destination`,`Protocol`,`FinalStatus`,`bucketLength`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_bucket_Job`
--

DROP TABLE IF EXISTS `ac_bucket_Job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_bucket_Job` (
  `User` int NOT NULL,
  `UserGroup` int NOT NULL,
  `JobGroup` int NOT NULL,
  `JobType` int NOT NULL,
  `JobClass` int NOT NULL,
  `ProcessingType` int NOT NULL,
  `Site` int NOT NULL,
  `FinalMajorStatus` int NOT NULL,
  `FinalMinorStatus` int NOT NULL,
  `CPUTime` decimal(30,10) NOT NULL,
  `NormCPUTime` decimal(30,10) NOT NULL,
  `ExecTime` decimal(30,10) NOT NULL,
  `InputDataSize` decimal(30,10) NOT NULL,
  `OutputDataSize` decimal(30,10) NOT NULL,
  `InputDataFiles` decimal(30,10) NOT NULL,
  `OutputDataFiles` decimal(30,10) NOT NULL,
  `DiskSpace` decimal(30,10) NOT NULL,
  `InputSandBoxSize` decimal(30,10) NOT NULL,
  `OutputSandBoxSize` decimal(30,10) NOT NULL,
  `ProcessedEvents` decimal(30,10) NOT NULL,
  `entriesInBucket` decimal(30,10) NOT NULL,
  `startTime` int unsigned NOT NULL,
  `bucketLength` mediumint unsigned NOT NULL,
  UNIQUE KEY `UniqueConstraint` (`startTime`,`User`,`UserGroup`,`JobGroup`,`JobType`,`JobClass`,`ProcessingType`,`Site`,`FinalMajorStatus`,`FinalMinorStatus`,`bucketLength`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_bucket_Network`
--

DROP TABLE IF EXISTS `ac_bucket_Network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_bucket_Network` (
  `SourceIP` int NOT NULL,
  `DestinationIP` int NOT NULL,
  `SourceHostName` int NOT NULL,
  `DestinationHostName` int NOT NULL,
  `Source` int NOT NULL,
  `Destination` int NOT NULL,
  `Jitter` decimal(30,10) NOT NULL,
  `OneWayDelay` decimal(30,10) NOT NULL,
  `PacketLossRate` decimal(30,10) NOT NULL,
  `entriesInBucket` decimal(30,10) NOT NULL,
  `startTime` int unsigned NOT NULL,
  `bucketLength` mediumint unsigned NOT NULL,
  UNIQUE KEY `UniqueConstraint` (`startTime`,`SourceIP`,`DestinationIP`,`SourceHostName`,`DestinationHostName`,`Source`,`Destination`,`bucketLength`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_bucket_Pilot`
--

DROP TABLE IF EXISTS `ac_bucket_Pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_bucket_Pilot` (
  `User` int NOT NULL,
  `UserGroup` int NOT NULL,
  `Site` int NOT NULL,
  `GridCE` int NOT NULL,
  `GridMiddleware` int NOT NULL,
  `GridResourceBroker` int NOT NULL,
  `GridStatus` int NOT NULL,
  `Jobs` decimal(30,10) NOT NULL,
  `entriesInBucket` decimal(30,10) NOT NULL,
  `startTime` int unsigned NOT NULL,
  `bucketLength` mediumint unsigned NOT NULL,
  UNIQUE KEY `UniqueConstraint` (`startTime`,`User`,`UserGroup`,`Site`,`GridCE`,`GridMiddleware`,`GridResourceBroker`,`GridStatus`,`bucketLength`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_bucket_PilotSubmission`
--

DROP TABLE IF EXISTS `ac_bucket_PilotSubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_bucket_PilotSubmission` (
  `HostName` int NOT NULL,
  `SiteDirector` int NOT NULL,
  `Site` int NOT NULL,
  `CE` int NOT NULL,
  `Queue` int NOT NULL,
  `Status` int NOT NULL,
  `NumTotal` decimal(30,10) NOT NULL,
  `NumSucceeded` decimal(30,10) NOT NULL,
  `entriesInBucket` decimal(30,10) NOT NULL,
  `startTime` int unsigned NOT NULL,
  `bucketLength` mediumint unsigned NOT NULL,
  UNIQUE KEY `UniqueConstraint` (`startTime`,`HostName`,`SiteDirector`,`Site`,`CE`,`Queue`,`Status`,`bucketLength`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_bucket_StorageOccupancy`
--

DROP TABLE IF EXISTS `ac_bucket_StorageOccupancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_bucket_StorageOccupancy` (
  `Site` int NOT NULL,
  `Endpoint` int NOT NULL,
  `StorageElement` int NOT NULL,
  `SpaceType` int NOT NULL,
  `Space` decimal(30,10) NOT NULL,
  `entriesInBucket` decimal(30,10) NOT NULL,
  `startTime` int unsigned NOT NULL,
  `bucketLength` mediumint unsigned NOT NULL,
  UNIQUE KEY `UniqueConstraint` (`startTime`,`Site`,`Endpoint`,`StorageElement`,`SpaceType`,`bucketLength`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_bucket_WMSHistory`
--

DROP TABLE IF EXISTS `ac_bucket_WMSHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_bucket_WMSHistory` (
  `Status` int NOT NULL,
  `Site` int NOT NULL,
  `User` int NOT NULL,
  `UserGroup` int NOT NULL,
  `JobGroup` int NOT NULL,
  `MinorStatus` int NOT NULL,
  `ApplicationStatus` int NOT NULL,
  `JobSplitType` int NOT NULL,
  `Jobs` decimal(30,10) NOT NULL,
  `Reschedules` decimal(30,10) NOT NULL,
  `entriesInBucket` decimal(30,10) NOT NULL,
  `startTime` int unsigned NOT NULL,
  `bucketLength` mediumint unsigned NOT NULL,
  UNIQUE KEY `UniqueConstraint` (`startTime`,`Status`,`Site`,`User`,`UserGroup`,`JobGroup`,`MinorStatus`,`ApplicationStatus`,`JobSplitType`,`bucketLength`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_catalog_Types`
--

DROP TABLE IF EXISTS `ac_catalog_Types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_catalog_Types` (
  `name` varchar(64) NOT NULL,
  `keyFields` varchar(255) NOT NULL,
  `valueFields` varchar(255) NOT NULL,
  `bucketsLength` varchar(255) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_in_DataOperation`
--

DROP TABLE IF EXISTS `ac_in_DataOperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_in_DataOperation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `OperationType` varchar(32) NOT NULL,
  `User` varchar(64) NOT NULL,
  `ExecutionSite` varchar(256) NOT NULL,
  `Source` varchar(32) NOT NULL,
  `Destination` varchar(32) NOT NULL,
  `Protocol` varchar(32) NOT NULL,
  `FinalStatus` varchar(32) NOT NULL,
  `TransferSize` bigint unsigned NOT NULL,
  `TransferTime` float NOT NULL,
  `RegistrationTime` float NOT NULL,
  `TransferOK` int unsigned NOT NULL,
  `TransferTotal` int unsigned NOT NULL,
  `RegistrationOK` int unsigned NOT NULL,
  `RegistrationTotal` int unsigned NOT NULL,
  `startTime` int unsigned NOT NULL,
  `endTime` int unsigned NOT NULL,
  `taken` tinyint(1) NOT NULL DEFAULT '1',
  `takenSince` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_in_Job`
--

DROP TABLE IF EXISTS `ac_in_Job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_in_Job` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `User` varchar(64) NOT NULL,
  `UserGroup` varchar(32) NOT NULL,
  `JobGroup` varchar(64) NOT NULL,
  `JobType` varchar(32) NOT NULL,
  `JobClass` varchar(32) NOT NULL,
  `ProcessingType` varchar(256) NOT NULL,
  `Site` varchar(64) NOT NULL,
  `FinalMajorStatus` varchar(32) NOT NULL,
  `FinalMinorStatus` varchar(256) NOT NULL,
  `CPUTime` int unsigned NOT NULL,
  `NormCPUTime` int unsigned NOT NULL,
  `ExecTime` int unsigned NOT NULL,
  `InputDataSize` bigint unsigned NOT NULL,
  `OutputDataSize` bigint unsigned NOT NULL,
  `InputDataFiles` int unsigned NOT NULL,
  `OutputDataFiles` int unsigned NOT NULL,
  `DiskSpace` bigint unsigned NOT NULL,
  `InputSandBoxSize` bigint unsigned NOT NULL,
  `OutputSandBoxSize` bigint unsigned NOT NULL,
  `ProcessedEvents` int unsigned NOT NULL,
  `startTime` int unsigned NOT NULL,
  `endTime` int unsigned NOT NULL,
  `taken` tinyint(1) NOT NULL DEFAULT '1',
  `takenSince` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_in_Network`
--

DROP TABLE IF EXISTS `ac_in_Network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_in_Network` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `SourceIP` varchar(64) NOT NULL,
  `DestinationIP` varchar(64) NOT NULL,
  `SourceHostName` varchar(255) NOT NULL,
  `DestinationHostName` varchar(255) NOT NULL,
  `Source` varchar(255) NOT NULL,
  `Destination` varchar(255) NOT NULL,
  `Jitter` float NOT NULL,
  `OneWayDelay` float NOT NULL,
  `PacketLossRate` tinyint unsigned NOT NULL,
  `startTime` int unsigned NOT NULL,
  `endTime` int unsigned NOT NULL,
  `taken` tinyint(1) NOT NULL DEFAULT '1',
  `takenSince` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_in_Pilot`
--

DROP TABLE IF EXISTS `ac_in_Pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_in_Pilot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `User` varchar(64) NOT NULL,
  `UserGroup` varchar(32) NOT NULL,
  `Site` varchar(64) NOT NULL,
  `GridCE` varchar(128) NOT NULL,
  `GridMiddleware` varchar(32) NOT NULL,
  `GridResourceBroker` varchar(128) NOT NULL,
  `GridStatus` varchar(32) NOT NULL,
  `Jobs` int unsigned NOT NULL,
  `startTime` int unsigned NOT NULL,
  `endTime` int unsigned NOT NULL,
  `taken` tinyint(1) NOT NULL DEFAULT '1',
  `takenSince` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_in_PilotSubmission`
--

DROP TABLE IF EXISTS `ac_in_PilotSubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_in_PilotSubmission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `HostName` varchar(255) NOT NULL,
  `SiteDirector` varchar(100) NOT NULL,
  `Site` varchar(100) NOT NULL,
  `CE` varchar(100) NOT NULL,
  `Queue` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `NumTotal` int unsigned NOT NULL,
  `NumSucceeded` int unsigned NOT NULL,
  `startTime` int unsigned NOT NULL,
  `endTime` int unsigned NOT NULL,
  `taken` tinyint(1) NOT NULL DEFAULT '1',
  `takenSince` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53300 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_in_StorageOccupancy`
--

DROP TABLE IF EXISTS `ac_in_StorageOccupancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_in_StorageOccupancy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Site` varchar(64) NOT NULL,
  `Endpoint` varchar(255) NOT NULL,
  `StorageElement` varchar(64) NOT NULL,
  `SpaceType` varchar(64) NOT NULL,
  `Space` bigint unsigned NOT NULL,
  `startTime` int unsigned NOT NULL,
  `endTime` int unsigned NOT NULL,
  `taken` tinyint(1) NOT NULL DEFAULT '1',
  `takenSince` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_in_WMSHistory`
--

DROP TABLE IF EXISTS `ac_in_WMSHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_in_WMSHistory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Status` varchar(128) NOT NULL,
  `Site` varchar(128) NOT NULL,
  `User` varchar(128) NOT NULL,
  `UserGroup` varchar(128) NOT NULL,
  `JobGroup` varchar(32) NOT NULL,
  `MinorStatus` varchar(128) NOT NULL,
  `ApplicationStatus` varchar(256) NOT NULL,
  `JobSplitType` varchar(32) NOT NULL,
  `Jobs` int unsigned NOT NULL,
  `Reschedules` int unsigned NOT NULL,
  `startTime` int unsigned NOT NULL,
  `endTime` int unsigned NOT NULL,
  `taken` tinyint(1) NOT NULL DEFAULT '1',
  `takenSince` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49883 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_DataOperation_Destination`
--

DROP TABLE IF EXISTS `ac_key_DataOperation_Destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_DataOperation_Destination` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_DataOperation_ExecutionSite`
--

DROP TABLE IF EXISTS `ac_key_DataOperation_ExecutionSite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_DataOperation_ExecutionSite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_DataOperation_FinalStatus`
--

DROP TABLE IF EXISTS `ac_key_DataOperation_FinalStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_DataOperation_FinalStatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_DataOperation_OperationType`
--

DROP TABLE IF EXISTS `ac_key_DataOperation_OperationType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_DataOperation_OperationType` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_DataOperation_Protocol`
--

DROP TABLE IF EXISTS `ac_key_DataOperation_Protocol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_DataOperation_Protocol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_DataOperation_Source`
--

DROP TABLE IF EXISTS `ac_key_DataOperation_Source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_DataOperation_Source` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_DataOperation_User`
--

DROP TABLE IF EXISTS `ac_key_DataOperation_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_DataOperation_User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Job_FinalMajorStatus`
--

DROP TABLE IF EXISTS `ac_key_Job_FinalMajorStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Job_FinalMajorStatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Job_FinalMinorStatus`
--

DROP TABLE IF EXISTS `ac_key_Job_FinalMinorStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Job_FinalMinorStatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Job_JobClass`
--

DROP TABLE IF EXISTS `ac_key_Job_JobClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Job_JobClass` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Job_JobGroup`
--

DROP TABLE IF EXISTS `ac_key_Job_JobGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Job_JobGroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Job_JobType`
--

DROP TABLE IF EXISTS `ac_key_Job_JobType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Job_JobType` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Job_ProcessingType`
--

DROP TABLE IF EXISTS `ac_key_Job_ProcessingType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Job_ProcessingType` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Job_Site`
--

DROP TABLE IF EXISTS `ac_key_Job_Site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Job_Site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Job_User`
--

DROP TABLE IF EXISTS `ac_key_Job_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Job_User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Job_UserGroup`
--

DROP TABLE IF EXISTS `ac_key_Job_UserGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Job_UserGroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Network_Destination`
--

DROP TABLE IF EXISTS `ac_key_Network_Destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Network_Destination` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Network_DestinationHostName`
--

DROP TABLE IF EXISTS `ac_key_Network_DestinationHostName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Network_DestinationHostName` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Network_DestinationIP`
--

DROP TABLE IF EXISTS `ac_key_Network_DestinationIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Network_DestinationIP` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Network_Source`
--

DROP TABLE IF EXISTS `ac_key_Network_Source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Network_Source` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Network_SourceHostName`
--

DROP TABLE IF EXISTS `ac_key_Network_SourceHostName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Network_SourceHostName` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Network_SourceIP`
--

DROP TABLE IF EXISTS `ac_key_Network_SourceIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Network_SourceIP` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_PilotSubmission_CE`
--

DROP TABLE IF EXISTS `ac_key_PilotSubmission_CE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_PilotSubmission_CE` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_PilotSubmission_HostName`
--

DROP TABLE IF EXISTS `ac_key_PilotSubmission_HostName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_PilotSubmission_HostName` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_PilotSubmission_Queue`
--

DROP TABLE IF EXISTS `ac_key_PilotSubmission_Queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_PilotSubmission_Queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_PilotSubmission_Site`
--

DROP TABLE IF EXISTS `ac_key_PilotSubmission_Site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_PilotSubmission_Site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_PilotSubmission_SiteDirector`
--

DROP TABLE IF EXISTS `ac_key_PilotSubmission_SiteDirector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_PilotSubmission_SiteDirector` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_PilotSubmission_Status`
--

DROP TABLE IF EXISTS `ac_key_PilotSubmission_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_PilotSubmission_Status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Pilot_GridCE`
--

DROP TABLE IF EXISTS `ac_key_Pilot_GridCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Pilot_GridCE` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Pilot_GridMiddleware`
--

DROP TABLE IF EXISTS `ac_key_Pilot_GridMiddleware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Pilot_GridMiddleware` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Pilot_GridResourceBroker`
--

DROP TABLE IF EXISTS `ac_key_Pilot_GridResourceBroker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Pilot_GridResourceBroker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Pilot_GridStatus`
--

DROP TABLE IF EXISTS `ac_key_Pilot_GridStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Pilot_GridStatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Pilot_Site`
--

DROP TABLE IF EXISTS `ac_key_Pilot_Site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Pilot_Site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Pilot_User`
--

DROP TABLE IF EXISTS `ac_key_Pilot_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Pilot_User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_Pilot_UserGroup`
--

DROP TABLE IF EXISTS `ac_key_Pilot_UserGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_Pilot_UserGroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_StorageOccupancy_Endpoint`
--

DROP TABLE IF EXISTS `ac_key_StorageOccupancy_Endpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_StorageOccupancy_Endpoint` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_StorageOccupancy_Site`
--

DROP TABLE IF EXISTS `ac_key_StorageOccupancy_Site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_StorageOccupancy_Site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_StorageOccupancy_SpaceType`
--

DROP TABLE IF EXISTS `ac_key_StorageOccupancy_SpaceType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_StorageOccupancy_SpaceType` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_StorageOccupancy_StorageElement`
--

DROP TABLE IF EXISTS `ac_key_StorageOccupancy_StorageElement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_StorageOccupancy_StorageElement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_WMSHistory_ApplicationStatus`
--

DROP TABLE IF EXISTS `ac_key_WMSHistory_ApplicationStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_WMSHistory_ApplicationStatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_WMSHistory_JobGroup`
--

DROP TABLE IF EXISTS `ac_key_WMSHistory_JobGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_WMSHistory_JobGroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_WMSHistory_JobSplitType`
--

DROP TABLE IF EXISTS `ac_key_WMSHistory_JobSplitType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_WMSHistory_JobSplitType` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_WMSHistory_MinorStatus`
--

DROP TABLE IF EXISTS `ac_key_WMSHistory_MinorStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_WMSHistory_MinorStatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_WMSHistory_Site`
--

DROP TABLE IF EXISTS `ac_key_WMSHistory_Site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_WMSHistory_Site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_WMSHistory_Status`
--

DROP TABLE IF EXISTS `ac_key_WMSHistory_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_WMSHistory_Status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_WMSHistory_User`
--

DROP TABLE IF EXISTS `ac_key_WMSHistory_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_WMSHistory_User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_key_WMSHistory_UserGroup`
--

DROP TABLE IF EXISTS `ac_key_WMSHistory_UserGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_key_WMSHistory_UserGroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valueindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_type_DataOperation`
--

DROP TABLE IF EXISTS `ac_type_DataOperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_type_DataOperation` (
  `OperationType` int NOT NULL,
  `User` int NOT NULL,
  `ExecutionSite` int NOT NULL,
  `Source` int NOT NULL,
  `Destination` int NOT NULL,
  `Protocol` int NOT NULL,
  `FinalStatus` int NOT NULL,
  `TransferSize` bigint unsigned NOT NULL,
  `TransferTime` float NOT NULL,
  `RegistrationTime` float NOT NULL,
  `TransferOK` int unsigned NOT NULL,
  `TransferTotal` int unsigned NOT NULL,
  `RegistrationOK` int unsigned NOT NULL,
  `RegistrationTotal` int unsigned NOT NULL,
  `startTime` int unsigned NOT NULL,
  `endTime` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_type_Job`
--

DROP TABLE IF EXISTS `ac_type_Job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_type_Job` (
  `User` int NOT NULL,
  `UserGroup` int NOT NULL,
  `JobGroup` int NOT NULL,
  `JobType` int NOT NULL,
  `JobClass` int NOT NULL,
  `ProcessingType` int NOT NULL,
  `Site` int NOT NULL,
  `FinalMajorStatus` int NOT NULL,
  `FinalMinorStatus` int NOT NULL,
  `CPUTime` int unsigned NOT NULL,
  `NormCPUTime` int unsigned NOT NULL,
  `ExecTime` int unsigned NOT NULL,
  `InputDataSize` bigint unsigned NOT NULL,
  `OutputDataSize` bigint unsigned NOT NULL,
  `InputDataFiles` int unsigned NOT NULL,
  `OutputDataFiles` int unsigned NOT NULL,
  `DiskSpace` bigint unsigned NOT NULL,
  `InputSandBoxSize` bigint unsigned NOT NULL,
  `OutputSandBoxSize` bigint unsigned NOT NULL,
  `ProcessedEvents` int unsigned NOT NULL,
  `startTime` int unsigned NOT NULL,
  `endTime` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_type_Network`
--

DROP TABLE IF EXISTS `ac_type_Network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_type_Network` (
  `SourceIP` int NOT NULL,
  `DestinationIP` int NOT NULL,
  `SourceHostName` int NOT NULL,
  `DestinationHostName` int NOT NULL,
  `Source` int NOT NULL,
  `Destination` int NOT NULL,
  `Jitter` float NOT NULL,
  `OneWayDelay` float NOT NULL,
  `PacketLossRate` tinyint unsigned NOT NULL,
  `startTime` int unsigned NOT NULL,
  `endTime` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_type_Pilot`
--

DROP TABLE IF EXISTS `ac_type_Pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_type_Pilot` (
  `User` int NOT NULL,
  `UserGroup` int NOT NULL,
  `Site` int NOT NULL,
  `GridCE` int NOT NULL,
  `GridMiddleware` int NOT NULL,
  `GridResourceBroker` int NOT NULL,
  `GridStatus` int NOT NULL,
  `Jobs` int unsigned NOT NULL,
  `startTime` int unsigned NOT NULL,
  `endTime` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_type_PilotSubmission`
--

DROP TABLE IF EXISTS `ac_type_PilotSubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_type_PilotSubmission` (
  `HostName` int NOT NULL,
  `SiteDirector` int NOT NULL,
  `Site` int NOT NULL,
  `CE` int NOT NULL,
  `Queue` int NOT NULL,
  `Status` int NOT NULL,
  `NumTotal` int unsigned NOT NULL,
  `NumSucceeded` int unsigned NOT NULL,
  `startTime` int unsigned NOT NULL,
  `endTime` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_type_StorageOccupancy`
--

DROP TABLE IF EXISTS `ac_type_StorageOccupancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_type_StorageOccupancy` (
  `Site` int NOT NULL,
  `Endpoint` int NOT NULL,
  `StorageElement` int NOT NULL,
  `SpaceType` int NOT NULL,
  `Space` bigint unsigned NOT NULL,
  `startTime` int unsigned NOT NULL,
  `endTime` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ac_type_WMSHistory`
--

DROP TABLE IF EXISTS `ac_type_WMSHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_type_WMSHistory` (
  `Status` int NOT NULL,
  `Site` int NOT NULL,
  `User` int NOT NULL,
  `UserGroup` int NOT NULL,
  `JobGroup` int NOT NULL,
  `MinorStatus` int NOT NULL,
  `ApplicationStatus` int NOT NULL,
  `JobSplitType` int NOT NULL,
  `Jobs` int unsigned NOT NULL,
  `Reschedules` int unsigned NOT NULL,
  `startTime` int unsigned NOT NULL,
  `endTime` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `FileCatalogDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `FileCatalogDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `FileCatalogDB`;

--
-- Table structure for table `FC_DirMeta`
--

DROP TABLE IF EXISTS `FC_DirMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FC_DirMeta` (
  `DirID` int NOT NULL,
  `MetaKey` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'Noname',
  `MetaValue` varchar(31) NOT NULL DEFAULT 'Noname',
  PRIMARY KEY (`DirID`,`MetaKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FC_DirectoryInfo`
--

DROP TABLE IF EXISTS `FC_DirectoryInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FC_DirectoryInfo` (
  `DirID` int NOT NULL,
  `UID` smallint unsigned NOT NULL DEFAULT '0',
  `GID` smallint unsigned NOT NULL DEFAULT '0',
  `CreationDate` datetime DEFAULT NULL,
  `ModificationDate` datetime DEFAULT NULL,
  `Mode` smallint unsigned NOT NULL DEFAULT '775',
  `Status` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DirID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FC_FileInfo`
--

DROP TABLE IF EXISTS `FC_FileInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FC_FileInfo` (
  `FileID` int NOT NULL,
  `GUID` char(36) NOT NULL,
  `Checksum` varchar(32) DEFAULT NULL,
  `CheckSumType` enum('Adler32','MD5') DEFAULT NULL,
  `Type` enum('File','Link') NOT NULL DEFAULT 'File',
  `CreationDate` datetime DEFAULT NULL,
  `ModificationDate` datetime DEFAULT NULL,
  `Mode` smallint unsigned NOT NULL DEFAULT '775',
  PRIMARY KEY (`FileID`),
  KEY `FileID` (`FileID`),
  KEY `GUID` (`GUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FC_FileMeta`
--

DROP TABLE IF EXISTS `FC_FileMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FC_FileMeta` (
  `FileID` int NOT NULL,
  `MetaKey` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'Noname',
  `MetaValue` varchar(31) NOT NULL DEFAULT 'Noname',
  PRIMARY KEY (`FileID`,`MetaKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FC_Files`
--

DROP TABLE IF EXISTS `FC_Files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FC_Files` (
  `FileID` int NOT NULL AUTO_INCREMENT,
  `DirID` int NOT NULL,
  `Size` bigint unsigned NOT NULL,
  `UID` smallint unsigned NOT NULL,
  `GID` tinyint unsigned NOT NULL,
  `Status` smallint unsigned NOT NULL,
  `FileName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`FileID`),
  KEY `DirID` (`DirID`),
  KEY `UID` (`UID`,`GID`),
  KEY `Status` (`Status`),
  KEY `FileName` (`FileName`),
  KEY `DirID_2` (`DirID`,`FileName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FC_Groups`
--

DROP TABLE IF EXISTS `FC_Groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FC_Groups` (
  `GID` int NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(127) NOT NULL,
  PRIMARY KEY (`GID`),
  UNIQUE KEY `GroupName` (`GroupName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FC_ReplicaInfo`
--

DROP TABLE IF EXISTS `FC_ReplicaInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FC_ReplicaInfo` (
  `RepID` int NOT NULL AUTO_INCREMENT,
  `RepType` enum('Master','Replica') NOT NULL DEFAULT 'Master',
  `CreationDate` datetime DEFAULT NULL,
  `ModificationDate` datetime DEFAULT NULL,
  `PFN` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`RepID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FC_Replicas`
--

DROP TABLE IF EXISTS `FC_Replicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FC_Replicas` (
  `RepID` int NOT NULL AUTO_INCREMENT,
  `FileID` int NOT NULL,
  `SEID` int NOT NULL,
  `Status` smallint unsigned NOT NULL,
  PRIMARY KEY (`RepID`),
  UNIQUE KEY `FileID_2` (`FileID`,`SEID`),
  KEY `FileID` (`FileID`),
  KEY `SEID` (`SEID`),
  KEY `Status` (`Status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FC_Statuses`
--

DROP TABLE IF EXISTS `FC_Statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FC_Statuses` (
  `StatusID` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`StatusID`),
  KEY `Status` (`Status`),
  KEY `StatusID` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FC_StorageElements`
--

DROP TABLE IF EXISTS `FC_StorageElements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FC_StorageElements` (
  `SEID` int NOT NULL AUTO_INCREMENT,
  `SEName` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `AliasName` varchar(127) DEFAULT '',
  PRIMARY KEY (`SEID`),
  UNIQUE KEY `SEName` (`SEName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FC_Users`
--

DROP TABLE IF EXISTS `FC_Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FC_Users` (
  `UID` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(127) NOT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE KEY `UserName` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `InstalledComponentsDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `InstalledComponentsDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `InstalledComponentsDB`;

--
-- Table structure for table `Components`
--

DROP TABLE IF EXISTS `Components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Components` (
  `ComponentID` int NOT NULL AUTO_INCREMENT,
  `DIRACSystem` varchar(32) NOT NULL,
  `DIRACModule` varchar(32) NOT NULL,
  `Type` varchar(32) NOT NULL,
  PRIMARY KEY (`ComponentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HostLogging`
--

DROP TABLE IF EXISTS `HostLogging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HostLogging` (
  `HostName` varchar(255) NOT NULL,
  `DIRACVersion` varchar(64) DEFAULT NULL,
  `Extension` varchar(512) DEFAULT NULL,
  `Load1` varchar(32) DEFAULT NULL,
  `Load5` varchar(32) DEFAULT NULL,
  `Load15` varchar(32) DEFAULT NULL,
  `Memory` varchar(32) DEFAULT NULL,
  `DiskOccupancy` varchar(512) DEFAULT NULL,
  `Swap` varchar(32) DEFAULT NULL,
  `CPUClock` varchar(32) DEFAULT NULL,
  `CPUModel` varchar(64) DEFAULT NULL,
  `CertificateDN` varchar(128) DEFAULT NULL,
  `CertificateIssuer` varchar(128) DEFAULT NULL,
  `CertificateValidity` varchar(64) DEFAULT NULL,
  `Cores` int DEFAULT NULL,
  `PhysicalCores` int DEFAULT NULL,
  `OpenFiles` int DEFAULT NULL,
  `OpenPipes` int DEFAULT NULL,
  `OpenSockets` int DEFAULT NULL,
  `Uptime` varchar(64) DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`HostName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Hosts`
--

DROP TABLE IF EXISTS `Hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hosts` (
  `HostID` int NOT NULL AUTO_INCREMENT,
  `HostName` varchar(255) NOT NULL,
  `CPU` varchar(64) NOT NULL,
  PRIMARY KEY (`HostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InstalledComponents`
--

DROP TABLE IF EXISTS `InstalledComponents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InstalledComponents` (
  `ComponentID` int NOT NULL,
  `HostID` int NOT NULL,
  `Instance` varchar(64) NOT NULL,
  `InstallationTime` datetime NOT NULL,
  `UnInstallationTime` datetime DEFAULT NULL,
  `InstalledBy` varchar(32) DEFAULT NULL,
  `UnInstalledBy` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ComponentID`,`HostID`,`Instance`,`InstallationTime`),
  KEY `HostID` (`HostID`),
  CONSTRAINT `InstalledComponents_ibfk_1` FOREIGN KEY (`ComponentID`) REFERENCES `Components` (`ComponentID`),
  CONSTRAINT `InstalledComponents_ibfk_2` FOREIGN KEY (`HostID`) REFERENCES `Hosts` (`HostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `JobDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `JobDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `JobDB`;

--
-- Table structure for table `AtticJobParameters`
--

DROP TABLE IF EXISTS `AtticJobParameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AtticJobParameters` (
  `JobID` int unsigned NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Value` text NOT NULL,
  `RescheduleCycle` int unsigned NOT NULL,
  PRIMARY KEY (`JobID`,`Name`,`RescheduleCycle`),
  CONSTRAINT `AtticJobParameters_ibfk_1` FOREIGN KEY (`JobID`) REFERENCES `Jobs` (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HeartBeatLoggingInfo`
--

DROP TABLE IF EXISTS `HeartBeatLoggingInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HeartBeatLoggingInfo` (
  `JobID` int unsigned NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Value` text NOT NULL,
  `HeartBeatTime` datetime NOT NULL,
  PRIMARY KEY (`JobID`,`Name`,`HeartBeatTime`),
  CONSTRAINT `HeartBeatLoggingInfo_ibfk_1` FOREIGN KEY (`JobID`) REFERENCES `Jobs` (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InputData`
--

DROP TABLE IF EXISTS `InputData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InputData` (
  `JobID` int unsigned NOT NULL,
  `LFN` varchar(255) NOT NULL DEFAULT '',
  `Status` varchar(32) NOT NULL DEFAULT 'AprioriGood',
  PRIMARY KEY (`JobID`,`LFN`),
  CONSTRAINT `InputData_ibfk_1` FOREIGN KEY (`JobID`) REFERENCES `Jobs` (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JobCommands`
--

DROP TABLE IF EXISTS `JobCommands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JobCommands` (
  `JobID` int unsigned NOT NULL,
  `Command` varchar(100) NOT NULL,
  `Arguments` varchar(100) NOT NULL,
  `Status` varchar(64) NOT NULL DEFAULT 'Received',
  `ReceptionTime` datetime NOT NULL,
  `ExecutionTime` datetime DEFAULT NULL,
  PRIMARY KEY (`JobID`,`Arguments`,`ReceptionTime`),
  CONSTRAINT `JobCommands_ibfk_1` FOREIGN KEY (`JobID`) REFERENCES `Jobs` (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JobJDLs`
--

DROP TABLE IF EXISTS `JobJDLs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JobJDLs` (
  `JobID` int unsigned NOT NULL AUTO_INCREMENT,
  `JDL` mediumtext NOT NULL,
  `JobRequirements` text NOT NULL,
  `OriginalJDL` mediumtext NOT NULL,
  PRIMARY KEY (`JobID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JobParameters`
--

DROP TABLE IF EXISTS `JobParameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JobParameters` (
  `JobID` int unsigned NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Value` text NOT NULL,
  PRIMARY KEY (`JobID`,`Name`),
  CONSTRAINT `JobParameters_ibfk_1` FOREIGN KEY (`JobID`) REFERENCES `Jobs` (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Jobs`
--

DROP TABLE IF EXISTS `Jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Jobs` (
  `JobID` int unsigned NOT NULL DEFAULT '0',
  `JobType` varchar(32) NOT NULL DEFAULT 'user',
  `JobGroup` varchar(32) NOT NULL DEFAULT '00000000',
  `Site` varchar(100) NOT NULL DEFAULT 'ANY',
  `JobName` varchar(128) NOT NULL DEFAULT 'Unknown',
  `Owner` varchar(64) NOT NULL DEFAULT 'Unknown',
  `OwnerGroup` varchar(128) NOT NULL DEFAULT 'Unknown',
  `VO` varchar(32) NOT NULL DEFAULT 'Unknown',
  `SubmissionTime` datetime DEFAULT NULL,
  `RescheduleTime` datetime DEFAULT NULL,
  `LastUpdateTime` datetime DEFAULT NULL,
  `StartExecTime` datetime DEFAULT NULL,
  `HeartBeatTime` datetime DEFAULT NULL,
  `EndExecTime` datetime DEFAULT NULL,
  `Status` varchar(32) NOT NULL DEFAULT 'Received',
  `MinorStatus` varchar(128) NOT NULL DEFAULT 'Unknown',
  `ApplicationStatus` varchar(255) DEFAULT 'Unknown',
  `UserPriority` int NOT NULL DEFAULT '0',
  `RescheduleCounter` int NOT NULL DEFAULT '0',
  `VerifiedFlag` enum('True','False') NOT NULL DEFAULT 'False',
  `AccountedFlag` enum('True','False','Failed') NOT NULL DEFAULT 'False',
  PRIMARY KEY (`JobID`),
  KEY `JobType` (`JobType`),
  KEY `JobGroup` (`JobGroup`),
  KEY `Site` (`Site`),
  KEY `Owner` (`Owner`),
  KEY `OwnerGroup` (`OwnerGroup`),
  KEY `Status` (`Status`),
  KEY `MinorStatus` (`MinorStatus`),
  KEY `ApplicationStatus` (`ApplicationStatus`),
  KEY `StatusSite` (`Status`,`Site`),
  KEY `LastUpdateTime` (`LastUpdateTime`),
  CONSTRAINT `Jobs_ibfk_1` FOREIGN KEY (`JobID`) REFERENCES `JobJDLs` (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OptimizerParameters`
--

DROP TABLE IF EXISTS `OptimizerParameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OptimizerParameters` (
  `JobID` int unsigned NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Value` mediumtext NOT NULL,
  PRIMARY KEY (`JobID`,`Name`),
  CONSTRAINT `OptimizerParameters_ibfk_1` FOREIGN KEY (`JobID`) REFERENCES `Jobs` (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `JobLoggingDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `JobLoggingDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `JobLoggingDB`;

--
-- Table structure for table `LoggingInfo`
--

DROP TABLE IF EXISTS `LoggingInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LoggingInfo` (
  `JobID` int NOT NULL,
  `SeqNum` int NOT NULL DEFAULT '0',
  `Status` varchar(32) NOT NULL DEFAULT '',
  `MinorStatus` varchar(128) NOT NULL DEFAULT '',
  `ApplicationStatus` varchar(255) NOT NULL DEFAULT '',
  `StatusTime` datetime NOT NULL,
  `StatusTimeOrder` double(12,3) NOT NULL,
  `StatusSource` varchar(32) NOT NULL DEFAULT 'Unknown',
  PRIMARY KEY (`JobID`,`SeqNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `PilotAgentsDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `PilotAgentsDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `PilotAgentsDB`;

--
-- Table structure for table `JobToPilotMapping`
--

DROP TABLE IF EXISTS `JobToPilotMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JobToPilotMapping` (
  `PilotID` int unsigned NOT NULL,
  `JobID` int unsigned NOT NULL,
  `StartTime` datetime NOT NULL,
  KEY `JobID` (`JobID`),
  KEY `PilotID` (`PilotID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PilotAgents`
--

DROP TABLE IF EXISTS `PilotAgents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PilotAgents` (
  `PilotID` int unsigned NOT NULL AUTO_INCREMENT,
  `InitialJobID` int unsigned NOT NULL DEFAULT '0',
  `CurrentJobID` int unsigned NOT NULL DEFAULT '0',
  `PilotJobReference` varchar(255) NOT NULL DEFAULT 'Unknown',
  `PilotStamp` varchar(32) NOT NULL DEFAULT '',
  `DestinationSite` varchar(128) NOT NULL DEFAULT 'NotAssigned',
  `Queue` varchar(128) NOT NULL DEFAULT 'Unknown',
  `GridSite` varchar(128) NOT NULL DEFAULT 'Unknown',
  `VO` varchar(128) NOT NULL,
  `GridType` varchar(32) NOT NULL DEFAULT 'LCG',
  `BenchMark` double NOT NULL DEFAULT '0',
  `SubmissionTime` datetime DEFAULT NULL,
  `LastUpdateTime` datetime DEFAULT NULL,
  `Status` varchar(32) NOT NULL DEFAULT 'Unknown',
  `StatusReason` varchar(255) NOT NULL DEFAULT 'Unknown',
  `AccountingSent` enum('True','False') NOT NULL DEFAULT 'False',
  PRIMARY KEY (`PilotID`),
  KEY `PilotJobReference` (`PilotJobReference`),
  KEY `Status` (`Status`),
  KEY `Statuskey` (`GridSite`,`DestinationSite`,`Status`)
) ENGINE=InnoDB AUTO_INCREMENT=53432 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PilotOutput`
--

DROP TABLE IF EXISTS `PilotOutput`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PilotOutput` (
  `PilotID` int unsigned NOT NULL,
  `StdOutput` mediumtext,
  `StdError` mediumtext,
  PRIMARY KEY (`PilotID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `ProxyDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ProxyDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ProxyDB`;

--
-- Table structure for table `ProxyDB_CleanProxies`
--

DROP TABLE IF EXISTS `ProxyDB_CleanProxies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProxyDB_CleanProxies` (
  `UserName` varchar(64) NOT NULL,
  `UserDN` varchar(255) NOT NULL,
  `ProxyProvider` varchar(64) NOT NULL DEFAULT 'Certificate',
  `Pem` blob,
  `ExpirationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UserDN`,`ProxyProvider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProxyDB_Log`
--

DROP TABLE IF EXISTS `ProxyDB_Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProxyDB_Log` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `IssuerDN` varchar(255) NOT NULL,
  `IssuerGroup` varchar(255) NOT NULL,
  `TargetDN` varchar(255) NOT NULL,
  `TargetGroup` varchar(255) NOT NULL,
  `Action` varchar(128) NOT NULL,
  `Timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Timestamp` (`Timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProxyDB_Requests`
--

DROP TABLE IF EXISTS `ProxyDB_Requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProxyDB_Requests` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserDN` varchar(255) NOT NULL,
  `Pem` blob,
  `ExpirationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProxyDB_VOMSProxies`
--

DROP TABLE IF EXISTS `ProxyDB_VOMSProxies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProxyDB_VOMSProxies` (
  `UserName` varchar(64) NOT NULL,
  `UserDN` varchar(255) NOT NULL,
  `UserGroup` varchar(255) NOT NULL,
  `VOMSAttr` varchar(255) NOT NULL,
  `Pem` blob,
  `ExpirationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UserDN`,`UserGroup`,`VOMSAttr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `ResourceStatusDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ResourceStatusDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ResourceStatusDB`;

--
-- Table structure for table `NodeHistory`
--

DROP TABLE IF EXISTS `NodeHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NodeHistory` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `StatusType` varchar(128) NOT NULL DEFAULT 'all',
  `VO` varchar(64) NOT NULL DEFAULT 'all',
  `Status` varchar(8) NOT NULL DEFAULT '',
  `Reason` varchar(512) NOT NULL DEFAULT 'Unspecified',
  `DateEffective` datetime NOT NULL,
  `TokenExpiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `ElementType` varchar(32) NOT NULL DEFAULT '',
  `LastCheckTime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `TokenOwner` varchar(16) NOT NULL DEFAULT 'rs_svc',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NodeLog`
--

DROP TABLE IF EXISTS `NodeLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NodeLog` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `StatusType` varchar(128) NOT NULL DEFAULT 'all',
  `VO` varchar(64) NOT NULL DEFAULT 'all',
  `Status` varchar(8) NOT NULL DEFAULT '',
  `Reason` varchar(512) NOT NULL DEFAULT 'Unspecified',
  `DateEffective` datetime NOT NULL,
  `TokenExpiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `ElementType` varchar(32) NOT NULL DEFAULT '',
  `LastCheckTime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `TokenOwner` varchar(16) NOT NULL DEFAULT 'rs_svc',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NodeStatus`
--

DROP TABLE IF EXISTS `NodeStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NodeStatus` (
  `Name` varchar(64) NOT NULL,
  `StatusType` varchar(128) NOT NULL DEFAULT 'all',
  `VO` varchar(64) NOT NULL DEFAULT 'all',
  `Status` varchar(8) NOT NULL DEFAULT '',
  `Reason` varchar(512) NOT NULL DEFAULT 'Unspecified',
  `DateEffective` datetime NOT NULL,
  `TokenExpiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `ElementType` varchar(32) NOT NULL DEFAULT '',
  `LastCheckTime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `TokenOwner` varchar(16) NOT NULL DEFAULT 'rs_svc',
  PRIMARY KEY (`Name`,`StatusType`,`VO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ResourceHistory`
--

DROP TABLE IF EXISTS `ResourceHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ResourceHistory` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `StatusType` varchar(128) NOT NULL DEFAULT 'all',
  `VO` varchar(64) NOT NULL DEFAULT 'all',
  `Status` varchar(8) NOT NULL DEFAULT '',
  `Reason` varchar(512) NOT NULL DEFAULT 'Unspecified',
  `DateEffective` datetime NOT NULL,
  `TokenExpiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `ElementType` varchar(32) NOT NULL DEFAULT '',
  `LastCheckTime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `TokenOwner` varchar(16) NOT NULL DEFAULT 'rs_svc',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ResourceLog`
--

DROP TABLE IF EXISTS `ResourceLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ResourceLog` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `StatusType` varchar(128) NOT NULL DEFAULT 'all',
  `VO` varchar(64) NOT NULL DEFAULT 'all',
  `Status` varchar(8) NOT NULL DEFAULT '',
  `Reason` varchar(512) NOT NULL DEFAULT 'Unspecified',
  `DateEffective` datetime NOT NULL,
  `TokenExpiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `ElementType` varchar(32) NOT NULL DEFAULT '',
  `LastCheckTime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `TokenOwner` varchar(16) NOT NULL DEFAULT 'rs_svc',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ResourceStatus`
--

DROP TABLE IF EXISTS `ResourceStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ResourceStatus` (
  `Name` varchar(64) NOT NULL,
  `StatusType` varchar(128) NOT NULL DEFAULT 'all',
  `VO` varchar(64) NOT NULL DEFAULT 'all',
  `Status` varchar(8) NOT NULL DEFAULT '',
  `Reason` varchar(512) NOT NULL DEFAULT 'Unspecified',
  `DateEffective` datetime NOT NULL,
  `TokenExpiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `ElementType` varchar(32) NOT NULL DEFAULT '',
  `LastCheckTime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `TokenOwner` varchar(16) NOT NULL DEFAULT 'rs_svc',
  PRIMARY KEY (`Name`,`StatusType`,`VO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ResourceStatusCache`
--

DROP TABLE IF EXISTS `ResourceStatusCache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ResourceStatusCache` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `SiteName` varchar(64) NOT NULL,
  `ResourceName` varchar(64) NOT NULL,
  `Status` varchar(8) NOT NULL DEFAULT '',
  `PreviousStatus` varchar(8) NOT NULL DEFAULT '',
  `StatusType` varchar(128) NOT NULL DEFAULT 'all',
  `Time` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SiteHistory`
--

DROP TABLE IF EXISTS `SiteHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SiteHistory` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `StatusType` varchar(128) NOT NULL DEFAULT 'all',
  `VO` varchar(64) NOT NULL DEFAULT 'all',
  `Status` varchar(8) NOT NULL DEFAULT '',
  `Reason` varchar(512) NOT NULL DEFAULT 'Unspecified',
  `DateEffective` datetime NOT NULL,
  `TokenExpiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `ElementType` varchar(32) NOT NULL DEFAULT '',
  `LastCheckTime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `TokenOwner` varchar(16) NOT NULL DEFAULT 'rs_svc',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SiteLog`
--

DROP TABLE IF EXISTS `SiteLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SiteLog` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `StatusType` varchar(128) NOT NULL DEFAULT 'all',
  `VO` varchar(64) NOT NULL DEFAULT 'all',
  `Status` varchar(8) NOT NULL DEFAULT '',
  `Reason` varchar(512) NOT NULL DEFAULT 'Unspecified',
  `DateEffective` datetime NOT NULL,
  `TokenExpiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `ElementType` varchar(32) NOT NULL DEFAULT '',
  `LastCheckTime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `TokenOwner` varchar(16) NOT NULL DEFAULT 'rs_svc',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SiteStatus`
--

DROP TABLE IF EXISTS `SiteStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SiteStatus` (
  `Name` varchar(64) NOT NULL,
  `StatusType` varchar(128) NOT NULL DEFAULT 'all',
  `VO` varchar(64) NOT NULL DEFAULT 'all',
  `Status` varchar(8) NOT NULL DEFAULT '',
  `Reason` varchar(512) NOT NULL DEFAULT 'Unspecified',
  `DateEffective` datetime NOT NULL,
  `TokenExpiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `ElementType` varchar(32) NOT NULL DEFAULT '',
  `LastCheckTime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `TokenOwner` varchar(16) NOT NULL DEFAULT 'rs_svc',
  PRIMARY KEY (`Name`,`StatusType`,`VO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `SandboxMetadataDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `SandboxMetadataDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `SandboxMetadataDB`;

--
-- Table structure for table `sb_EntityMapping`
--

DROP TABLE IF EXISTS `sb_EntityMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sb_EntityMapping` (
  `SBId` int unsigned NOT NULL,
  `EntityId` varchar(128) NOT NULL,
  `Type` varchar(64) NOT NULL,
  PRIMARY KEY (`SBId`,`EntityId`,`Type`),
  KEY `Entity` (`EntityId`),
  KEY `SBIndex` (`SBId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sb_Owners`
--

DROP TABLE IF EXISTS `sb_Owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sb_Owners` (
  `OwnerId` int unsigned NOT NULL AUTO_INCREMENT,
  `Owner` varchar(32) NOT NULL,
  `OwnerGroup` varchar(32) NOT NULL,
  `VO` varchar(64) NOT NULL,
  PRIMARY KEY (`OwnerId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sb_SandBoxes`
--

DROP TABLE IF EXISTS `sb_SandBoxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sb_SandBoxes` (
  `SBId` int unsigned NOT NULL AUTO_INCREMENT,
  `OwnerId` int unsigned NOT NULL,
  `SEName` varchar(64) NOT NULL,
  `SEPFN` varchar(512) NOT NULL,
  `Bytes` bigint NOT NULL DEFAULT '0',
  `RegistrationTime` datetime NOT NULL,
  `LastAccessTime` datetime NOT NULL,
  `Assigned` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`SBId`),
  UNIQUE KEY `Location` (`SEName`,`SEPFN`),
  KEY `SBOwner` (`OwnerId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `StorageManagementDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `StorageManagementDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `StorageManagementDB`;

--
-- Table structure for table `CacheReplicas`
--

DROP TABLE IF EXISTS `CacheReplicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CacheReplicas` (
  `ReplicaID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(32) NOT NULL,
  `Status` varchar(32) DEFAULT 'New',
  `SE` varchar(32) NOT NULL,
  `LFN` varchar(255) NOT NULL,
  `PFN` varchar(255) DEFAULT NULL,
  `Size` bigint DEFAULT '0',
  `FileChecksum` varchar(255) NOT NULL,
  `GUID` varchar(255) NOT NULL,
  `SubmitTime` datetime NOT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  `Links` int DEFAULT '0',
  PRIMARY KEY (`ReplicaID`),
  KEY `ReplicaID` (`ReplicaID`,`Status`,`SE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StageRequests`
--

DROP TABLE IF EXISTS `StageRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StageRequests` (
  `ReplicaID` int NOT NULL,
  `StageStatus` varchar(32) DEFAULT 'StageSubmitted',
  `RequestID` varchar(64) DEFAULT '',
  `StageRequestSubmitTime` datetime NOT NULL,
  `StageRequestCompletedTime` datetime DEFAULT NULL,
  `PinLength` int DEFAULT NULL,
  `PinExpiryTime` datetime DEFAULT NULL,
  KEY `StageStatus` (`StageStatus`),
  KEY `ReplicaID` (`ReplicaID`),
  CONSTRAINT `StageRequests_ibfk_1` FOREIGN KEY (`ReplicaID`) REFERENCES `CacheReplicas` (`ReplicaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TaskReplicas`
--

DROP TABLE IF EXISTS `TaskReplicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TaskReplicas` (
  `TaskID` int NOT NULL,
  `ReplicaID` int NOT NULL,
  PRIMARY KEY (`TaskID`,`ReplicaID`),
  KEY `ReplicaID` (`ReplicaID`),
  KEY `TaskID` (`TaskID`,`ReplicaID`),
  CONSTRAINT `TaskReplicas_ibfk_1` FOREIGN KEY (`TaskID`) REFERENCES `Tasks` (`TaskID`),
  CONSTRAINT `TaskReplicas_ibfk_2` FOREIGN KEY (`ReplicaID`) REFERENCES `CacheReplicas` (`ReplicaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tasks`
--

DROP TABLE IF EXISTS `Tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tasks` (
  `TaskID` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(32) DEFAULT 'New',
  `Source` varchar(32) NOT NULL,
  `SubmitTime` datetime NOT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  `CompleteTime` datetime DEFAULT NULL,
  `CallBackMethod` varchar(255) DEFAULT NULL,
  `SourceTaskID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`TaskID`),
  KEY `TaskID` (`TaskID`,`Status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `TaskQueueDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `TaskQueueDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `TaskQueueDB`;

--
-- Table structure for table `tq_Jobs`
--

DROP TABLE IF EXISTS `tq_Jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tq_Jobs` (
  `TQId` int unsigned NOT NULL,
  `JobId` int unsigned NOT NULL,
  `Priority` int unsigned NOT NULL,
  `RealPriority` float NOT NULL,
  PRIMARY KEY (`JobId`),
  KEY `TaskIndex` (`TQId`),
  CONSTRAINT `tq_Jobs_ibfk_1` FOREIGN KEY (`TQId`) REFERENCES `tq_TaskQueues` (`TQId`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tq_RAM_requirements`
--

DROP TABLE IF EXISTS `tq_RAM_requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tq_RAM_requirements` (
  `TQId` int unsigned NOT NULL,
  `MinRAM` int unsigned NOT NULL DEFAULT '0',
  `MaxRAM` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`TQId`),
  CONSTRAINT `tq_RAM_requirements_ibfk_1` FOREIGN KEY (`TQId`) REFERENCES `tq_TaskQueues` (`TQId`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tq_TQToBannedSites`
--

DROP TABLE IF EXISTS `tq_TQToBannedSites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tq_TQToBannedSites` (
  `TQId` int unsigned NOT NULL,
  `Value` varchar(64) NOT NULL,
  PRIMARY KEY (`TQId`,`Value`),
  KEY `TaskIndex` (`TQId`),
  KEY `BannedSitesIndex` (`Value`),
  CONSTRAINT `tq_TQToBannedSites_ibfk_1` FOREIGN KEY (`TQId`) REFERENCES `tq_TaskQueues` (`TQId`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tq_TQToGridCEs`
--

DROP TABLE IF EXISTS `tq_TQToGridCEs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tq_TQToGridCEs` (
  `TQId` int unsigned NOT NULL,
  `Value` varchar(64) NOT NULL,
  PRIMARY KEY (`TQId`,`Value`),
  KEY `TaskIndex` (`TQId`),
  KEY `GridCEsIndex` (`Value`),
  CONSTRAINT `tq_TQToGridCEs_ibfk_1` FOREIGN KEY (`TQId`) REFERENCES `tq_TaskQueues` (`TQId`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tq_TQToJobTypes`
--

DROP TABLE IF EXISTS `tq_TQToJobTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tq_TQToJobTypes` (
  `TQId` int unsigned NOT NULL,
  `Value` varchar(64) NOT NULL,
  PRIMARY KEY (`TQId`,`Value`),
  KEY `TaskIndex` (`TQId`),
  KEY `JobTypesIndex` (`Value`),
  CONSTRAINT `tq_TQToJobTypes_ibfk_1` FOREIGN KEY (`TQId`) REFERENCES `tq_TaskQueues` (`TQId`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tq_TQToPlatforms`
--

DROP TABLE IF EXISTS `tq_TQToPlatforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tq_TQToPlatforms` (
  `TQId` int unsigned NOT NULL,
  `Value` varchar(64) NOT NULL,
  PRIMARY KEY (`TQId`,`Value`),
  KEY `TaskIndex` (`TQId`),
  KEY `PlatformsIndex` (`Value`),
  CONSTRAINT `tq_TQToPlatforms_ibfk_1` FOREIGN KEY (`TQId`) REFERENCES `tq_TaskQueues` (`TQId`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tq_TQToSites`
--

DROP TABLE IF EXISTS `tq_TQToSites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tq_TQToSites` (
  `TQId` int unsigned NOT NULL,
  `Value` varchar(64) NOT NULL,
  PRIMARY KEY (`TQId`,`Value`),
  KEY `TaskIndex` (`TQId`),
  KEY `SitesIndex` (`Value`),
  CONSTRAINT `tq_TQToSites_ibfk_1` FOREIGN KEY (`TQId`) REFERENCES `tq_TaskQueues` (`TQId`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tq_TQToTags`
--

DROP TABLE IF EXISTS `tq_TQToTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tq_TQToTags` (
  `TQId` int unsigned NOT NULL,
  `Value` varchar(64) NOT NULL,
  PRIMARY KEY (`TQId`,`Value`),
  KEY `TaskIndex` (`TQId`),
  KEY `TagsIndex` (`Value`),
  CONSTRAINT `tq_TQToTags_ibfk_1` FOREIGN KEY (`TQId`) REFERENCES `tq_TaskQueues` (`TQId`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tq_TaskQueues`
--

DROP TABLE IF EXISTS `tq_TaskQueues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tq_TaskQueues` (
  `TQId` int unsigned NOT NULL AUTO_INCREMENT,
  `Owner` varchar(255) NOT NULL,
  `OwnerGroup` varchar(32) NOT NULL,
  `VO` varchar(32) NOT NULL,
  `CPUTime` bigint unsigned NOT NULL,
  `Priority` float NOT NULL,
  `Enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TQId`),
  KEY `TQOwner` (`Owner`,`OwnerGroup`,`CPUTime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-22 14:57:19
