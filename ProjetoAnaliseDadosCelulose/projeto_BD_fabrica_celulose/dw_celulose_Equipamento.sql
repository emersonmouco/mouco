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
-- Table structure for table `Equipamento`
--

DROP TABLE IF EXISTS `Equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipamento` (
  `id_equipamento` int NOT NULL,
  `codigo_equipamento` varchar(50) DEFAULT NULL,
  `nome_equipamento` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `id_tipo_equipamento` int DEFAULT NULL,
  `id_pessoa_fornecedor` int DEFAULT NULL,
  `data_instalacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_equipamento`),
  KEY `id_tipo_equipamento` (`id_tipo_equipamento`),
  KEY `id_pessoa_fornecedor` (`id_pessoa_fornecedor`),
  CONSTRAINT `equipamento_ibfk_1` FOREIGN KEY (`id_tipo_equipamento`) REFERENCES `Tipo_Equipamento` (`id_tipo_equipamento`),
  CONSTRAINT `equipamento_ibfk_2` FOREIGN KEY (`id_pessoa_fornecedor`) REFERENCES `Pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipamento`
--

LOCK TABLES `Equipamento` WRITE;
/*!40000 ALTER TABLE `Equipamento` DISABLE KEYS */;
INSERT INTO `Equipamento` VALUES (1,'DESF-001','Desfibrador Principal','DF-3000',1,4,'2020-01-15 00:00:00'),(2,'PREN-001','Prensa Industrial','PI-5000',2,4,'2020-02-20 00:00:00'),(3,'SEC-001','Secador Automático','SA-2000',3,4,'2020-03-10 00:00:00'),(4,'CORT-001','Cortadeira de Bobinas','CB-1500',4,4,'2021-05-05 00:00:00'),(5,'ENR-001','Enroladeira Automática','EA-1800',5,4,'2021-06-18 00:00:00'),(6,'DESF-002','Desfibrador Secundário','DF-2500',1,4,'2022-01-10 00:00:00'),(7,'PREN-002','Prensa Auxiliar','PI-3000',2,4,'2022-02-15 00:00:00');
/*!40000 ALTER TABLE `Equipamento` ENABLE KEYS */;
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
