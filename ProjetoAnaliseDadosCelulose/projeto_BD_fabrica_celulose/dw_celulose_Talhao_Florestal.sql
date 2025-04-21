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
-- Table structure for table `Talhao_Florestal`
--

DROP TABLE IF EXISTS `Talhao_Florestal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Talhao_Florestal` (
  `id_talhao` int NOT NULL,
  `codigo_talhao` varchar(50) DEFAULT NULL,
  `nome_talhao` varchar(100) DEFAULT NULL,
  `area_hectares` decimal(10,2) DEFAULT NULL,
  `id_tipo_solo` int DEFAULT NULL,
  `id_especie_plantada` int DEFAULT NULL,
  `data_plantio` datetime DEFAULT NULL,
  `latitude_talhao` decimal(10,6) DEFAULT NULL,
  `longitude_talhao` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`id_talhao`),
  KEY `id_tipo_solo` (`id_tipo_solo`),
  KEY `id_especie_plantada` (`id_especie_plantada`),
  CONSTRAINT `talhao_florestal_ibfk_1` FOREIGN KEY (`id_tipo_solo`) REFERENCES `Tipo_Solo` (`id_tipo_solo`),
  CONSTRAINT `talhao_florestal_ibfk_2` FOREIGN KEY (`id_especie_plantada`) REFERENCES `Especie_Plantada` (`id_especie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Talhao_Florestal`
--

LOCK TABLES `Talhao_Florestal` WRITE;
/*!40000 ALTER TABLE `Talhao_Florestal` DISABLE KEYS */;
INSERT INTO `Talhao_Florestal` VALUES (1,'TAL-001','Talhão Norte',50.00,1,1,'2020-03-15 00:00:00',-19.821000,-40.277000),(2,'TAL-002','Talhão Sul',45.00,2,2,'2020-04-20 00:00:00',-19.822000,-40.278000),(3,'TAL-003','Talhão Leste',60.00,3,3,'2019-08-10 00:00:00',-19.823000,-40.279000),(4,'TAL-004','Talhão Oeste',55.00,4,4,'2021-02-05 00:00:00',-19.824000,-40.280000),(5,'TAL-005','Talhão Central',40.00,5,5,'2021-05-18 00:00:00',-19.825000,-40.281000);
/*!40000 ALTER TABLE `Talhao_Florestal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-15 13:47:45
