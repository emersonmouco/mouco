-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: dw_celulose
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `Lote`
--

DROP TABLE IF EXISTS `Lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lote` (
  `id_lote` int NOT NULL,
  `codigo_lote` varchar(50) DEFAULT NULL,
  `data_criacao_lote` datetime DEFAULT NULL,
  `responsavel_lote` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lote`
--

LOCK TABLES `Lote` WRITE;
/*!40000 ALTER TABLE `Lote` DISABLE KEYS */;
INSERT INTO `Lote` VALUES (1,'LOT-2023-001','2023-01-16 08:00:00','Carlos Oliveira'),(2,'LOT-2023-002','2023-02-21 09:00:00','Carlos Oliveira'),(3,'LOT-2023-003','2023-03-19 10:00:00','Ana Pereira'),(4,'LOT-2023-004','2023-04-06 08:00:00','Ana Pereira'),(5,'LOT-2023-005','2023-05-23 11:00:00','Roberto Almeida'),(6,'LOT-2023-006','2023-06-11 14:00:00','Roberto Almeida'),(7,'LOT-2023-007','2023-07-13 09:00:00','Carlos Oliveira');
/*!40000 ALTER TABLE `Lote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-15 13:47:44
