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
-- Table structure for table `Funcionario`
--

DROP TABLE IF EXISTS `Funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funcionario` (
  `id_funcionario` int NOT NULL,
  `id_pessoa` int DEFAULT NULL,
  `codigo_funcionario` varchar(50) DEFAULT NULL,
  `Id_cargo` int DEFAULT NULL,
  `data_contratacao` datetime DEFAULT NULL,
  `Salario_funcionario` decimal(10,2) DEFAULT NULL,
  `Login_funcionario` varchar(50) DEFAULT NULL,
  `Senha_funcionario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `id_pessoa` (`id_pessoa`),
  KEY `Id_cargo` (`Id_cargo`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `Pessoa` (`id_pessoa`),
  CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`Id_cargo`) REFERENCES `Cargo` (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionario`
--

LOCK TABLES `Funcionario` WRITE;
/*!40000 ALTER TABLE `Funcionario` DISABLE KEYS */;
INSERT INTO `Funcionario` VALUES (1,2,'FUNC-001',1,'2018-05-10 00:00:00',8500.00,'joao.silva','senha123'),(2,3,'FUNC-002',5,'2019-02-15 00:00:00',4500.00,'maria.souza','senha456'),(3,5,'FUNC-003',2,'2020-03-20 00:00:00',3200.00,'carlos.oliveira','senha789'),(4,6,'FUNC-004',3,'2020-06-10 00:00:00',3800.00,'ana.pereira','senha101'),(5,7,'FUNC-005',4,'2021-01-05 00:00:00',4200.00,'roberto.almeida','senha112'),(6,1,'FUNC-006',6,'2021-08-15 00:00:00',5200.00,'analista.dados','senha131'),(7,1,'FUNC-007',7,'2022-02-01 00:00:00',2800.00,'assist.admin','senha415');
/*!40000 ALTER TABLE `Funcionario` ENABLE KEYS */;
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
