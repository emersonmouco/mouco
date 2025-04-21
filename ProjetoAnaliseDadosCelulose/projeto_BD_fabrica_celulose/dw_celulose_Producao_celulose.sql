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
-- Table structure for table `Producao_celulose`
--

DROP TABLE IF EXISTS `Producao_celulose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Producao_celulose` (
  `id_producao_celulose` int NOT NULL,
  `id_tempo` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `id_lote` int DEFAULT NULL,
  `quantidade_produzida` decimal(10,2) DEFAULT NULL,
  `tempo_producao_horas` decimal(10,2) DEFAULT NULL,
  `consumo_energia_kwh` decimal(10,2) DEFAULT NULL,
  `consumo_agua_litros` decimal(10,2) DEFAULT NULL,
  `custo_estimado_producao_kg` decimal(10,2) DEFAULT NULL,
  `observacao_producao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_producao_celulose`),
  KEY `id_tempo` (`id_tempo`),
  KEY `id_produto` (`id_produto`),
  KEY `id_lote` (`id_lote`),
  CONSTRAINT `producao_celulose_ibfk_1` FOREIGN KEY (`id_tempo`) REFERENCES `Tempo` (`id_tempo`),
  CONSTRAINT `producao_celulose_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `Produto` (`id_produto`),
  CONSTRAINT `producao_celulose_ibfk_3` FOREIGN KEY (`id_lote`) REFERENCES `Lote` (`id_lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producao_celulose`
--

LOCK TABLES `Producao_celulose` WRITE;
/*!40000 ALTER TABLE `Producao_celulose` DISABLE KEYS */;
INSERT INTO `Producao_celulose` VALUES (1,1,1,1,5000.00,8.00,2500.00,15000.00,2.50,'Produção normal'),(2,2,2,2,4500.00,7.50,2300.00,14000.00,2.30,'Pequena interrupção por manutenção'),(3,3,3,3,6000.00,9.00,3000.00,18000.00,2.80,'Aumento de produção'),(4,4,4,4,4000.00,6.50,2000.00,12000.00,2.20,'Produção com material reciclado'),(5,5,5,5,3500.00,6.00,1800.00,10000.00,3.50,'Produção especial'),(6,6,6,6,5500.00,8.50,2700.00,16000.00,2.60,'Produção para exportação'),(7,7,7,7,4800.00,7.80,2400.00,14500.00,3.20,'Produção fotográfica');
/*!40000 ALTER TABLE `Producao_celulose` ENABLE KEYS */;
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
