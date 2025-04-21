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
-- Table structure for table `Vendas`
--

DROP TABLE IF EXISTS `Vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vendas` (
  `id_vendas` int NOT NULL,
  `id_tempo` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `id_pessoa_cliente` int DEFAULT NULL,
  `id_pessoa_vendedor` int DEFAULT NULL,
  `quantidade_vendida` decimal(10,2) DEFAULT NULL,
  `valor_venda` decimal(10,2) DEFAULT NULL,
  `custo_venda` decimal(10,2) DEFAULT NULL,
  `margem_lucro` decimal(10,2) DEFAULT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL,
  `desconto_percentual` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_vendas`),
  KEY `id_tempo` (`id_tempo`),
  KEY `id_produto` (`id_produto`),
  KEY `id_pessoa_cliente` (`id_pessoa_cliente`),
  KEY `id_pessoa_vendedor` (`id_pessoa_vendedor`),
  CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`id_tempo`) REFERENCES `Tempo` (`id_tempo`),
  CONSTRAINT `vendas_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `Produto` (`id_produto`),
  CONSTRAINT `vendas_ibfk_3` FOREIGN KEY (`id_pessoa_cliente`) REFERENCES `Pessoa` (`id_pessoa`),
  CONSTRAINT `vendas_ibfk_4` FOREIGN KEY (`id_pessoa_vendedor`) REFERENCES `Pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendas`
--

LOCK TABLES `Vendas` WRITE;
/*!40000 ALTER TABLE `Vendas` DISABLE KEYS */;
INSERT INTO `Vendas` VALUES (1,1,1,2,3,1000.00,5500.00,2500.00,3000.00,5.50,0.00),(2,2,2,3,5,1500.00,6000.00,3450.00,2550.00,4.00,5.00),(3,3,3,5,6,800.00,4800.00,2240.00,2560.00,6.00,0.00),(4,4,4,6,3,1200.00,4200.00,2640.00,1560.00,3.50,10.00),(5,5,5,2,5,500.00,4000.00,1750.00,2250.00,8.00,0.00),(6,6,6,3,6,900.00,4500.00,2340.00,2160.00,5.00,5.00),(7,7,7,5,3,600.00,5400.00,1920.00,3480.00,9.00,0.00),(8,8,1,6,5,1100.00,6050.00,2750.00,3300.00,5.50,0.00),(9,9,2,2,6,1300.00,4940.00,2990.00,1950.00,3.80,5.00),(10,10,3,3,3,700.00,4550.00,1960.00,2590.00,6.50,0.00);
/*!40000 ALTER TABLE `Vendas` ENABLE KEYS */;
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
