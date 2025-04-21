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
-- Table structure for table `Pessoa`
--

DROP TABLE IF EXISTS `Pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pessoa` (
  `id_pessoa` int NOT NULL,
  `nome_razaosocial_pessoa` varchar(100) DEFAULT NULL,
  `apelido_nomefantasia_pessoa` varchar(100) DEFAULT NULL,
  `Cpf_cnpj_pessoa` varchar(20) DEFAULT NULL,
  `Rg_ie_pessoa` varchar(20) DEFAULT NULL,
  `id_endereco` int DEFAULT NULL,
  `Telefone_pessoa` varchar(20) DEFAULT NULL,
  `Celular_pessoa` varchar(20) DEFAULT NULL,
  `email_pessoa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`),
  KEY `id_endereco` (`id_endereco`),
  CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`id_endereco`) REFERENCES `Endereco` (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pessoa`
--

LOCK TABLES `Pessoa` WRITE;
/*!40000 ALTER TABLE `Pessoa` DISABLE KEYS */;
INSERT INTO `Pessoa` VALUES (1,'Celulose SA','Celulose Indústria','12.345.678/0001-00','123.456.789',1,'(11) 4000-1000','(11) 94000-1000','contato@celulose.com.br'),(2,'João Silva','João','123.456.789-00','12.345.678-9',6,'(31) 3333-4444','(31) 93333-4444','joao.silva@email.com'),(3,'Maria Souza','Maria','987.654.321-00','98.765.432-1',4,'(21) 2222-3333','(21) 92222-3333','maria.souza@email.com'),(4,'Indústria de Máquinas Ltda','Máquinas Pesadas','23.456.789/0001-00','234.567.890',7,'(19) 5555-6666','(19) 95555-6666','vendas@maquinaspesadas.com.br'),(5,'Carlos Oliveira','Carlos','456.789.123-00','45.678.912-3',2,'(41) 7777-8888','(41) 97777-8888','carlos.oliveira@email.com'),(6,'Ana Pereira','Ana','789.123.456-00','78.912.345-6',3,'(51) 9999-0000','(51) 99999-0000','ana.pereira@email.com'),(7,'Roberto Almeida','Roberto','321.654.987-00','32.165.498-7',5,'(27) 4444-5555','(27) 94444-5555','roberto.almeida@email.com');
/*!40000 ALTER TABLE `Pessoa` ENABLE KEYS */;
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
