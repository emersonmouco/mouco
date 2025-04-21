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
-- Table structure for table `Produto`
--

DROP TABLE IF EXISTS `Produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Produto` (
  `id_produto` int NOT NULL,
  `codigo_produto` varchar(50) DEFAULT NULL,
  `nome_produto` varchar(100) DEFAULT NULL,
  `descricao_produto` varchar(255) DEFAULT NULL,
  `gramatura` decimal(10,2) DEFAULT NULL,
  `aplicacao` varchar(100) DEFAULT NULL,
  `id_tipo_fibra` int DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `id_tipo_fibra` (`id_tipo_fibra`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_tipo_fibra`) REFERENCES `Tipo_Fibra` (`id_tipo_fibra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produto`
--

LOCK TABLES `Produto` WRITE;
/*!40000 ALTER TABLE `Produto` DISABLE KEYS */;
INSERT INTO `Produto` VALUES (1,'PAP-001','Papel Branco A4','Papel sulfite branco 75g',75.00,'Escritório',1),(2,'PAP-002','Papel Jornal','Papel para impressão de jornais',45.00,'Impressão',2),(3,'PAP-003','Papel Cartão','Papel cartão para embalagens',250.00,'Embalagem',3),(4,'PAP-004','Papel Reciclado','Papel 100% reciclado',80.00,'Escritório',4),(5,'PAP-005','Papel Especial','Papel para aplicações especiais',120.00,'Indústria',5),(6,'PAP-006','Papel Kraft','Papel resistente para embalagens',90.00,'Embalagem',1),(7,'PAP-007','Papel Fotográfico','Papel para impressão fotográfica',150.00,'Fotografia',2);
/*!40000 ALTER TABLE `Produto` ENABLE KEYS */;
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
