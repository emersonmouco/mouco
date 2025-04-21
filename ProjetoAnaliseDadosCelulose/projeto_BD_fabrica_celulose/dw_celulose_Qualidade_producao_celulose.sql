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
-- Table structure for table `Qualidade_producao_celulose`
--

DROP TABLE IF EXISTS `Qualidade_producao_celulose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Qualidade_producao_celulose` (
  `id_qualidade_celulose` int NOT NULL,
  `id_tempo` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `id_qualidade` int DEFAULT NULL,
  `valor_medido` decimal(10,2) DEFAULT NULL,
  `aprovado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_qualidade_celulose`),
  KEY `id_tempo` (`id_tempo`),
  KEY `id_produto` (`id_produto`),
  KEY `id_qualidade` (`id_qualidade`),
  CONSTRAINT `qualidade_producao_celulose_ibfk_1` FOREIGN KEY (`id_tempo`) REFERENCES `Tempo` (`id_tempo`),
  CONSTRAINT `qualidade_producao_celulose_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `Produto` (`id_produto`),
  CONSTRAINT `qualidade_producao_celulose_ibfk_3` FOREIGN KEY (`id_qualidade`) REFERENCES `Qualidade` (`id_qualidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Qualidade_producao_celulose`
--

LOCK TABLES `Qualidade_producao_celulose` WRITE;
/*!40000 ALTER TABLE `Qualidade_producao_celulose` DISABLE KEYS */;
INSERT INTO `Qualidade_producao_celulose` VALUES (1,1,1,1,88.50,1),(2,1,1,2,75.20,1),(3,1,1,3,4.20,1),(4,2,2,1,86.00,1),(5,2,2,4,88.00,1),(6,2,2,5,5.20,0),(7,3,3,2,248.00,1),(8,3,3,3,5.00,1),(9,3,3,7,105.00,1),(10,4,4,1,85.50,1),(11,4,4,6,92.00,1),(12,4,4,5,5.50,0),(13,5,5,1,90.00,1),(14,5,5,3,4.80,1),(15,5,5,4,92.00,1),(16,6,6,2,89.00,1),(17,6,6,3,4.50,1),(18,6,6,5,4.80,1),(19,7,7,1,94.00,1),(20,7,7,6,98.00,1),(21,7,7,7,148.00,1);
/*!40000 ALTER TABLE `Qualidade_producao_celulose` ENABLE KEYS */;
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
