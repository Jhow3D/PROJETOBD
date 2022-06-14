CREATE DATABASE  IF NOT EXISTS `projeto_bdv2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projeto_bdv2`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projeto_bdv2
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `armazena`
--

DROP TABLE IF EXISTS `armazena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `armazena` (
  `fk_Estoque__codEstoque` int DEFAULT NULL,
  `fk_Produto_codProduto` int DEFAULT NULL,
  `codProduto` int NOT NULL,
  `codEstoque` int NOT NULL,
  PRIMARY KEY (`codProduto`,`codEstoque`),
  KEY `FK_Armazena_2` (`fk_Estoque__codEstoque`),
  KEY `FK_Armazena_3` (`fk_Produto_codProduto`),
  CONSTRAINT `FK_Armazena_2` FOREIGN KEY (`fk_Estoque__codEstoque`) REFERENCES `estoque_` (`codEstoque`) ON DELETE SET NULL,
  CONSTRAINT `FK_Armazena_3` FOREIGN KEY (`fk_Produto_codProduto`) REFERENCES `produto` (`codProduto`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armazena`
--

LOCK TABLES `armazena` WRITE;
/*!40000 ALTER TABLE `armazena` DISABLE KEYS */;
/*!40000 ALTER TABLE `armazena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `codCliente` int NOT NULL,
  `telefone` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `endereco` varchar(40) DEFAULT NULL,
  `bairro` varchar(40) DEFAULT NULL,
  `cidade` varchar(40) DEFAULT NULL,
  `UF` varchar(40) DEFAULT NULL,
  `pais` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`codCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'3333-1111','  ','Rua Padre Cabral','Boa Viagem','Recife','PE','Brasil'),(2,'3333-2222','  ','Rua Padre Bernadino','Boa Viagem','Recife','PE','Brasil'),(3,'3333-3333','  ','Rua Boenos Aires','Espinheiro','Recife','PE','Brasil'),(4,'3333-4444','  ','Praça Coronel','Centro','Natal','RN','Brasil'),(5,'3333-5555','  ','Rua do Cruzeiro','Centro','Moçoro','RN','Brasil'),(6,'3333-6666','  ','Rua do arco','Gramame','João Pessoa','PB','Brasil'),(7,'3333-7777','  ','Residencial Novo','Jardins','Campina Grande','PB','Brasil'),(8,'3333-8888','  ','Rua do Farol','Farol','Maceio','AL','Brasil');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientepf`
--

DROP TABLE IF EXISTS `clientepf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientepf` (
  `codPessoaFisica` int NOT NULL,
  `CPF` varchar(40) DEFAULT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `sexo` varchar(40) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `fk_Cliente_codCliente` int NOT NULL,
  PRIMARY KEY (`codPessoaFisica`,`fk_Cliente_codCliente`),
  KEY `FK_ClientePF_2` (`fk_Cliente_codCliente`),
  CONSTRAINT `FK_ClientePF_2` FOREIGN KEY (`fk_Cliente_codCliente`) REFERENCES `cliente` (`codCliente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientepf`
--

LOCK TABLES `clientepf` WRITE;
/*!40000 ALTER TABLE `clientepf` DISABLE KEYS */;
INSERT INTO `clientepf` VALUES (1,'111111100','Carlos Jose','M','0000-00-00',1),(2,'222222211','Jose Joao','M','0000-00-00',2),(3,'333333322','Jonatha Silva','M','0000-00-00',3),(4,'444444433','Maria Carla','F','0000-00-00',4),(5,'555555544','Claudia Santana','M','0000-00-00',5),(6,'666666655','Claudinor Ferreira','M','0000-00-00',6),(7,'777777766','Diego Alves','M','0000-00-00',7);
/*!40000 ALTER TABLE `clientepf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientepj`
--

DROP TABLE IF EXISTS `clientepj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientepj` (
  `codPessoaJuridica` int NOT NULL,
  `CNPJ` varchar(40) DEFAULT NULL,
  `razaoSocial` varchar(100) DEFAULT NULL,
  `fk_Cliente_codCliente` int NOT NULL,
  PRIMARY KEY (`codPessoaJuridica`,`fk_Cliente_codCliente`),
  KEY `FK_ClientePJ_2` (`fk_Cliente_codCliente`),
  CONSTRAINT `FK_ClientePJ_2` FOREIGN KEY (`fk_Cliente_codCliente`) REFERENCES `cliente` (`codCliente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientepj`
--

LOCK TABLES `clientepj` WRITE;
/*!40000 ALTER TABLE `clientepj` DISABLE KEYS */;
INSERT INTO `clientepj` VALUES (1,'11.111.111/0001-11','Fornecedores SA',1),(1,'66.666.666/0001-11','Magazine lojas SA',6),(2,'22.222.222/0001-11','Roupas da Moda SA',2),(3,'33.333.333/0001-11','Modas Femininas SA',3),(4,'44.444.444/0001-11','SEA MODAS SA',4),(5,'55.555.555/0001-11','REACHUELO SA',5);
/*!40000 ALTER TABLE `clientepj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `codCompra` int NOT NULL,
  `dataCompra` date DEFAULT NULL,
  `precoTotal` decimal(10,0) DEFAULT NULL,
  `nomeFornecedor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codCompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contem_ic`
--

DROP TABLE IF EXISTS `contem_ic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contem_ic` (
  `fk_Produto_codProduto` int DEFAULT NULL,
  `fk_itensComprados_codItemComprado` int DEFAULT NULL,
  `codItemComprado` int NOT NULL,
  `codProduto` int NOT NULL,
  PRIMARY KEY (`codItemComprado`,`codProduto`),
  KEY `FK_Contem_ic_2` (`fk_Produto_codProduto`),
  KEY `FK_Contem_ic_3` (`fk_itensComprados_codItemComprado`),
  CONSTRAINT `FK_Contem_ic_2` FOREIGN KEY (`fk_Produto_codProduto`) REFERENCES `produto` (`codProduto`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Contem_ic_3` FOREIGN KEY (`fk_itensComprados_codItemComprado`) REFERENCES `itenscomprados` (`codItemComprado`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contem_ic`
--

LOCK TABLES `contem_ic` WRITE;
/*!40000 ALTER TABLE `contem_ic` DISABLE KEYS */;
/*!40000 ALTER TABLE `contem_ic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contem_iv`
--

DROP TABLE IF EXISTS `contem_iv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contem_iv` (
  `fk_Produto_codProduto` int DEFAULT NULL,
  `fk_itensVendidos_codItensVendidos` int DEFAULT NULL,
  `codProduto` int NOT NULL,
  `codItensVendidos` int NOT NULL,
  PRIMARY KEY (`codProduto`,`codItensVendidos`),
  KEY `FK_Contem_IV_2` (`fk_Produto_codProduto`),
  KEY `FK_Contem_IV_3` (`fk_itensVendidos_codItensVendidos`),
  CONSTRAINT `FK_Contem_IV_2` FOREIGN KEY (`fk_Produto_codProduto`) REFERENCES `produto` (`codProduto`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Contem_IV_3` FOREIGN KEY (`fk_itensVendidos_codItensVendidos`) REFERENCES `itensvendidos` (`codItensVendidos`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contem_iv`
--

LOCK TABLES `contem_iv` WRITE;
/*!40000 ALTER TABLE `contem_iv` DISABLE KEYS */;
/*!40000 ALTER TABLE `contem_iv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contemf`
--

DROP TABLE IF EXISTS `contemf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contemf` (
  `fk_Fornecedor__CNPJ` varchar(100) DEFAULT NULL,
  `fk_Compra_codCompra` int DEFAULT NULL,
  `codCompra` int NOT NULL,
  `CNPJ` varchar(100) NOT NULL,
  PRIMARY KEY (`codCompra`,`CNPJ`),
  KEY `FK_Contemf_2` (`fk_Fornecedor__CNPJ`),
  KEY `FK_Contemf_3` (`fk_Compra_codCompra`),
  CONSTRAINT `FK_Contemf_2` FOREIGN KEY (`fk_Fornecedor__CNPJ`) REFERENCES `fornecedor_` (`CNPJ`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Contemf_3` FOREIGN KEY (`fk_Compra_codCompra`) REFERENCES `compra` (`codCompra`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contemf`
--

LOCK TABLES `contemf` WRITE;
/*!40000 ALTER TABLE `contemf` DISABLE KEYS */;
/*!40000 ALTER TABLE `contemf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contemv`
--

DROP TABLE IF EXISTS `contemv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contemv` (
  `fk_Cliente_codCliente` int DEFAULT NULL,
  `fk_Venda_codVenda` int DEFAULT NULL,
  `codCliente` int NOT NULL,
  `codVenda` int NOT NULL,
  PRIMARY KEY (`codCliente`,`codVenda`),
  KEY `FK_Contemv_2` (`fk_Cliente_codCliente`),
  KEY `FK_Contemv_3` (`fk_Venda_codVenda`),
  CONSTRAINT `FK_Contemv_2` FOREIGN KEY (`fk_Cliente_codCliente`) REFERENCES `cliente` (`codCliente`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Contemv_3` FOREIGN KEY (`fk_Venda_codVenda`) REFERENCES `venda` (`codVenda`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contemv`
--

LOCK TABLES `contemv` WRITE;
/*!40000 ALTER TABLE `contemv` DISABLE KEYS */;
/*!40000 ALTER TABLE `contemv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decrementa`
--

DROP TABLE IF EXISTS `decrementa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decrementa` (
  `fk_Estoque__codEstoque` int DEFAULT NULL,
  `fk_itensVendidos_codItensVendidos` int DEFAULT NULL,
  `codItensVendidos` int NOT NULL,
  `codEstoque` int NOT NULL,
  PRIMARY KEY (`codItensVendidos`,`codEstoque`),
  KEY `FK_Decrementa_2` (`fk_Estoque__codEstoque`),
  KEY `FK_Decrementa_3` (`fk_itensVendidos_codItensVendidos`),
  CONSTRAINT `FK_Decrementa_2` FOREIGN KEY (`fk_Estoque__codEstoque`) REFERENCES `estoque_` (`codEstoque`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Decrementa_3` FOREIGN KEY (`fk_itensVendidos_codItensVendidos`) REFERENCES `itensvendidos` (`codItensVendidos`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decrementa`
--

LOCK TABLES `decrementa` WRITE;
/*!40000 ALTER TABLE `decrementa` DISABLE KEYS */;
/*!40000 ALTER TABLE `decrementa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque_`
--

DROP TABLE IF EXISTS `estoque_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque_` (
  `codEstoque` int NOT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`codEstoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque_`
--

LOCK TABLES `estoque_` WRITE;
/*!40000 ALTER TABLE `estoque_` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor_`
--

DROP TABLE IF EXISTS `fornecedor_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor_` (
  `CNPJ` varchar(40) NOT NULL,
  `endereco` varchar(40) DEFAULT NULL,
  `telefone` varchar(40) DEFAULT NULL,
  `razaoSocial` varchar(100) DEFAULT NULL,
  `nomeFornecedor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor_`
--

LOCK TABLES `fornecedor_` WRITE;
/*!40000 ALTER TABLE `fornecedor_` DISABLE KEYS */;
INSERT INTO `fornecedor_` VALUES ('11.111.111/0001-11','Rua Amelia','3333-2222','Loja das roupas LTDA',NULL),('11.222.222/0001-11','Rua Joaquina','3333-1111','Loja dos tecidos LTDA',NULL),('11.333.333/0001-33','Av Joao','3333-3333','Tecidolandia LTDA',NULL),('11.444.444/0001-44','Av Encanador','3333-444','Revendedora tecidos LTDA',NULL),('11.555.555/0001-55','Av Joao Gomes','3333-5555','Melhores tecidos SA',NULL),('11.666.666/0001-66','Rua Desembargador','3333-6666','Tecidos da hora LTDA',NULL);
/*!40000 ALTER TABLE `fornecedor_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `codFuncionario` int NOT NULL,
  `CPF` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `telefone` varchar(40) DEFAULT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `endereco` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`codFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerente`
--

DROP TABLE IF EXISTS `gerente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gerente` (
  `codGerente` int NOT NULL,
  `fk_Funcionarios__codFuncionario` int NOT NULL,
  PRIMARY KEY (`codGerente`,`fk_Funcionarios__codFuncionario`),
  KEY `FK_Gerente_2` (`fk_Funcionarios__codFuncionario`),
  CONSTRAINT `FK_Gerente_2` FOREIGN KEY (`fk_Funcionarios__codFuncionario`) REFERENCES `funcionarios` (`codFuncionario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerente`
--

LOCK TABLES `gerente` WRITE;
/*!40000 ALTER TABLE `gerente` DISABLE KEYS */;
/*!40000 ALTER TABLE `gerente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incrementa`
--

DROP TABLE IF EXISTS `incrementa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incrementa` (
  `fk_Estoque__codEstoque` int DEFAULT NULL,
  `fk_itensComprados_codItemComprado` int DEFAULT NULL,
  `codEstoque` int NOT NULL,
  `codItemComprado` int NOT NULL,
  PRIMARY KEY (`codEstoque`,`codItemComprado`),
  KEY `FK_Incrementa_2` (`fk_Estoque__codEstoque`),
  KEY `FK_Incrementa_3` (`fk_itensComprados_codItemComprado`),
  CONSTRAINT `FK_Incrementa_2` FOREIGN KEY (`fk_Estoque__codEstoque`) REFERENCES `estoque_` (`codEstoque`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Incrementa_3` FOREIGN KEY (`fk_itensComprados_codItemComprado`) REFERENCES `itenscomprados` (`codItemComprado`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incrementa`
--

LOCK TABLES `incrementa` WRITE;
/*!40000 ALTER TABLE `incrementa` DISABLE KEYS */;
/*!40000 ALTER TABLE `incrementa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itenscomprados`
--

DROP TABLE IF EXISTS `itenscomprados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itenscomprados` (
  `codItemComprado` int NOT NULL,
  `precoCompra` float DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`codItemComprado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itenscomprados`
--

LOCK TABLES `itenscomprados` WRITE;
/*!40000 ALTER TABLE `itenscomprados` DISABLE KEYS */;
/*!40000 ALTER TABLE `itenscomprados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itensvendidos`
--

DROP TABLE IF EXISTS `itensvendidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itensvendidos` (
  `codItensVendidos` int NOT NULL,
  `precodaVenda` float DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`codItensVendidos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itensvendidos`
--

LOCK TABLES `itensvendidos` WRITE;
/*!40000 ALTER TABLE `itensvendidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `itensvendidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possuic`
--

DROP TABLE IF EXISTS `possuic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `possuic` (
  `fk_Compra_codCompra` int DEFAULT NULL,
  `fk_itensComprados_codItemComprado` int DEFAULT NULL,
  `codCompra` int NOT NULL,
  `codItemComprado` int NOT NULL,
  PRIMARY KEY (`codCompra`,`codItemComprado`),
  KEY `FK_Possuic_2` (`fk_Compra_codCompra`),
  KEY `FK_Possuic_3` (`fk_itensComprados_codItemComprado`),
  CONSTRAINT `FK_Possuic_2` FOREIGN KEY (`fk_Compra_codCompra`) REFERENCES `compra` (`codCompra`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Possuic_3` FOREIGN KEY (`fk_itensComprados_codItemComprado`) REFERENCES `itenscomprados` (`codItemComprado`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possuic`
--

LOCK TABLES `possuic` WRITE;
/*!40000 ALTER TABLE `possuic` DISABLE KEYS */;
/*!40000 ALTER TABLE `possuic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possuiv`
--

DROP TABLE IF EXISTS `possuiv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `possuiv` (
  `fk_Venda_codVenda` int DEFAULT NULL,
  `fk_itensVendidos_codItensVendidos` int DEFAULT NULL,
  `codVenda` int NOT NULL,
  `codItensVendidos` int NOT NULL,
  PRIMARY KEY (`codVenda`,`codItensVendidos`),
  KEY `FK_Possuiv_2` (`fk_Venda_codVenda`),
  KEY `FK_Possuiv_3` (`fk_itensVendidos_codItensVendidos`),
  CONSTRAINT `FK_Possuiv_2` FOREIGN KEY (`fk_Venda_codVenda`) REFERENCES `venda` (`codVenda`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Possuiv_3` FOREIGN KEY (`fk_itensVendidos_codItensVendidos`) REFERENCES `itensvendidos` (`codItensVendidos`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possuiv`
--

LOCK TABLES `possuiv` WRITE;
/*!40000 ALTER TABLE `possuiv` DISABLE KEYS */;
/*!40000 ALTER TABLE `possuiv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `codProduto` int NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `descricao` varchar(40) DEFAULT NULL,
  `tamanho` char(3) DEFAULT NULL,
  PRIMARY KEY (`codProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'camisa - masculina',99.9,NULL,'P'),(2,'camisa - masculina',99.9,NULL,'M'),(3,'camisa - masculina',99.9,NULL,'G'),(4,'camisa - masculina',109.99,NULL,'GG'),(5,'camisa - feminina',109.99,NULL,'P'),(6,'camisa - feminina ',109.99,NULL,'M'),(7,'camisa - feminina',109.99,NULL,'G'),(8,'camisa - feminina',150.99,NULL,'GG');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realizac`
--

DROP TABLE IF EXISTS `realizac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realizac` (
  `fk_Funcionarios__codFuncionario` int DEFAULT NULL,
  `fk_Compra_codCompra` int DEFAULT NULL,
  `codFuncionario` int NOT NULL,
  `codCompra` int NOT NULL,
  PRIMARY KEY (`codFuncionario`,`codCompra`),
  KEY `FK_Realizac_2` (`fk_Funcionarios__codFuncionario`),
  KEY `FK_Realizac_3` (`fk_Compra_codCompra`),
  CONSTRAINT `FK_Realizac_2` FOREIGN KEY (`fk_Funcionarios__codFuncionario`) REFERENCES `funcionarios` (`codFuncionario`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Realizac_3` FOREIGN KEY (`fk_Compra_codCompra`) REFERENCES `compra` (`codCompra`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realizac`
--

LOCK TABLES `realizac` WRITE;
/*!40000 ALTER TABLE `realizac` DISABLE KEYS */;
/*!40000 ALTER TABLE `realizac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realizav`
--

DROP TABLE IF EXISTS `realizav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realizav` (
  `fk_Funcionarios__codFuncionario` int DEFAULT NULL,
  `fk_Venda_codVenda` int DEFAULT NULL,
  `codVenda` int NOT NULL,
  `codFuncionario` int NOT NULL,
  PRIMARY KEY (`codVenda`,`codFuncionario`),
  KEY `FK_Realizav_2` (`fk_Funcionarios__codFuncionario`),
  KEY `FK_Realizav_3` (`fk_Venda_codVenda`),
  CONSTRAINT `FK_Realizav_2` FOREIGN KEY (`fk_Funcionarios__codFuncionario`) REFERENCES `funcionarios` (`codFuncionario`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Realizav_3` FOREIGN KEY (`fk_Venda_codVenda`) REFERENCES `venda` (`codVenda`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realizav`
--

LOCK TABLES `realizav` WRITE;
/*!40000 ALTER TABLE `realizav` DISABLE KEYS */;
/*!40000 ALTER TABLE `realizav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisiona`
--

DROP TABLE IF EXISTS `supervisiona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisiona` (
  `fk_Funcionarios__codFuncionario` int DEFAULT NULL,
  `fk_Funcionarios__codFuncionario_` int DEFAULT NULL,
  KEY `FK_Supervisiona_1` (`fk_Funcionarios__codFuncionario`),
  KEY `FK_Supervisiona_2` (`fk_Funcionarios__codFuncionario_`),
  CONSTRAINT `FK_Supervisiona_1` FOREIGN KEY (`fk_Funcionarios__codFuncionario`) REFERENCES `funcionarios` (`codFuncionario`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Supervisiona_2` FOREIGN KEY (`fk_Funcionarios__codFuncionario_`) REFERENCES `funcionarios` (`codFuncionario`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisiona`
--

LOCK TABLES `supervisiona` WRITE;
/*!40000 ALTER TABLE `supervisiona` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervisiona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `codVenda` int NOT NULL,
  `dataVenda` date DEFAULT NULL,
  `precoTotal` float DEFAULT NULL,
  PRIMARY KEY (`codVenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `codVendedor` int NOT NULL,
  `fk_Funcionarios__codFuncionario` int NOT NULL,
  PRIMARY KEY (`codVendedor`,`fk_Funcionarios__codFuncionario`),
  KEY `FK_Vendedor_2` (`fk_Funcionarios__codFuncionario`),
  CONSTRAINT `FK_Vendedor_2` FOREIGN KEY (`fk_Funcionarios__codFuncionario`) REFERENCES `funcionarios` (`codFuncionario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-12 14:16:53
