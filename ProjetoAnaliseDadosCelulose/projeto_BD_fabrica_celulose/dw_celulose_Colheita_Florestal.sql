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
-- Table structure for table `Colheita_Florestal`
--

DROP TABLE IF EXISTS `Colheita_Florestal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Colheita_Florestal` (
  `id_colheita_florestal` int NOT NULL,
  `id_tempo` int DEFAULT NULL,
  `id_talhao` int DEFAULT NULL,
  `id_equipe_colheita` int DEFAULT NULL,
  `volume_colhido` decimal(10,2) DEFAULT NULL,
  `area_colhida` decimal(10,2) DEFAULT NULL,
  `custo_colheita` decimal(10,2) DEFAULT NULL,
  `tempo_colheita_horas` decimal(10,2) DEFAULT NULL,
  `rendimento_m3_por_hectare` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_colheita_florestal`),
  KEY `id_tempo` (`id_tempo`),
  KEY `id_talhao` (`id_talhao`),
  KEY `id_equipe_colheita` (`id_equipe_colheita`),
  CONSTRAINT `colheita_florestal_ibfk_1` FOREIGN KEY (`id_tempo`) REFERENCES `Tempo` (`id_tempo`),
  CONSTRAINT `colheita_florestal_ibfk_2` FOREIGN KEY (`id_talhao`) REFERENCES `Talhao_Florestal` (`id_talhao`),
  CONSTRAINT `colheita_florestal_ibfk_3` FOREIGN KEY (`id_equipe_colheita`) REFERENCES `Equipe_Colheita` (`id_equipe_colheita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colheita_Florestal`
--

LOCK TABLES `Colheita_Florestal` WRITE;
/*!40000 ALTER TABLE `Colheita_Florestal` DISABLE KEYS */;
INSERT INTO `Colheita_Florestal` VALUES (1,1,1,1,1200.00,10.00,4800.00,40.00,120.00),(2,2,2,2,1350.00,12.00,5400.00,45.00,112.50),(3,3,3,3,1800.00,15.00,7200.00,60.00,120.00),(4,4,4,4,1650.00,14.00,6600.00,55.00,117.86),(5,5,5,5,1080.00,9.00,4320.00,36.00,120.00),(6,6,1,1,960.00,8.00,3840.00,32.00,120.00),(7,7,2,2,1125.00,10.00,4500.00,37.50,112.50);
/*!40000 ALTER TABLE `Colheita_Florestal` ENABLE KEYS */;
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
