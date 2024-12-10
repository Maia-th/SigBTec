-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: SigBTec
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `CPF` char(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Senha` varchar(255) NOT NULL,
  `Perfil` enum('ROOT','Analista') NOT NULL,
  `Telefone` varchar(20) NOT NULL,
  `Data_Nascimento` date NOT NULL,
  `Cidade_Nascimento` varchar(100) DEFAULT NULL,
  `Foto_Perfil` blob,
  `Formacao_Profissional` text,
  PRIMARY KEY (`CPF`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feedback`
--

DROP TABLE IF EXISTS `Feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Feedback` (
  `ID_Feedback` int NOT NULL AUTO_INCREMENT,
  `ID_BaseItem` int DEFAULT NULL,
  `Observacoes` text,
  `Data_Feedback` datetime NOT NULL,
  PRIMARY KEY (`ID_Feedback`),
  KEY `ID_BaseItem` (`ID_BaseItem`),
  CONSTRAINT `Feedback_ibfk_1` FOREIGN KEY (`ID_BaseItem`) REFERENCES `JornadaBaseItem` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feedback`
--

LOCK TABLES `Feedback` WRITE;
/*!40000 ALTER TABLE `Feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `Feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JornadaBaseItem`
--

DROP TABLE IF EXISTS `JornadaBaseItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JornadaBaseItem` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Item` int DEFAULT NULL,
  `ID_Startup` int NOT NULL,
  `ID_Etapa` int NOT NULL,
  `ID_Eixo` int NOT NULL,
  `Input` text,
  `Status` enum('vazio','em analise','aprovado','recusado') DEFAULT 'vazio',
  PRIMARY KEY (`ID`),
  KEY `ID_Item` (`ID_Item`),
  KEY `ID_Startup` (`ID_Startup`),
  KEY `ID_Etapa` (`ID_Etapa`),
  KEY `ID_Eixo` (`ID_Eixo`),
  CONSTRAINT `JornadaBaseItem_ibfk_2` FOREIGN KEY (`ID_Item`) REFERENCES `JornadaItem` (`ID_Item`),
  CONSTRAINT `JornadaBaseItem_ibfk_3` FOREIGN KEY (`ID_Startup`) REFERENCES `Startup` (`ID_Startup`),
  CONSTRAINT `JornadaBaseItem_ibfk_4` FOREIGN KEY (`ID_Etapa`) REFERENCES `JornadaEtapa` (`ID_Etapa`),
  CONSTRAINT `JornadaBaseItem_ibfk_5` FOREIGN KEY (`ID_Eixo`) REFERENCES `JornadaEixo` (`ID_Eixo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JornadaBaseItem`
--

LOCK TABLES `JornadaBaseItem` WRITE;
/*!40000 ALTER TABLE `JornadaBaseItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `JornadaBaseItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JornadaEixo`
--

DROP TABLE IF EXISTS `JornadaEixo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JornadaEixo` (
  `ID_Eixo` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Eixo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JornadaEixo`
--

LOCK TABLES `JornadaEixo` WRITE;
/*!40000 ALTER TABLE `JornadaEixo` DISABLE KEYS */;
/*!40000 ALTER TABLE `JornadaEixo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JornadaEtapa`
--

DROP TABLE IF EXISTS `JornadaEtapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JornadaEtapa` (
  `ID_Etapa` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Etapa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JornadaEtapa`
--

LOCK TABLES `JornadaEtapa` WRITE;
/*!40000 ALTER TABLE `JornadaEtapa` DISABLE KEYS */;
/*!40000 ALTER TABLE `JornadaEtapa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JornadaItem`
--

DROP TABLE IF EXISTS `JornadaItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JornadaItem` (
  `ID_Item` int NOT NULL AUTO_INCREMENT,
  `ID_Etapa` int DEFAULT NULL,
  `ID_Eixo` int DEFAULT NULL,
  `Item` text NOT NULL,
  `Descricao` text NOT NULL,
  `Exemplos_Genericos` text,
  `Ferramentas` text,
  `Material_Apoio` text NOT NULL,
  `Video` text,
  `Entregas_Concretas` text NOT NULL,
  PRIMARY KEY (`ID_Item`),
  KEY `ID_Etapa` (`ID_Etapa`),
  KEY `ID_Eixo` (`ID_Eixo`),
  CONSTRAINT `JornadaItem_ibfk_1` FOREIGN KEY (`ID_Etapa`) REFERENCES `JornadaEtapa` (`ID_Etapa`),
  CONSTRAINT `JornadaItem_ibfk_2` FOREIGN KEY (`ID_Eixo`) REFERENCES `JornadaEixo` (`ID_Eixo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JornadaItem`
--

LOCK TABLES `JornadaItem` WRITE;
/*!40000 ALTER TABLE `JornadaItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `JornadaItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JornadaStartup`
--

DROP TABLE IF EXISTS `JornadaStartup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JornadaStartup` (
  `ID_Startup` int NOT NULL,
  `Data_Inicio` date NOT NULL,
  `Data_Fim` date DEFAULT NULL,
  `Progresso` decimal(5,2) DEFAULT '0.00',
  `Ultimo_Acesso` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Startup`),
  CONSTRAINT `JornadaStartup_ibfk_1` FOREIGN KEY (`ID_Startup`) REFERENCES `Startup` (`ID_Startup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JornadaStartup`
--

LOCK TABLES `JornadaStartup` WRITE;
/*!40000 ALTER TABLE `JornadaStartup` DISABLE KEYS */;
/*!40000 ALTER TABLE `JornadaStartup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Monitoramento`
--

DROP TABLE IF EXISTS `Monitoramento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Monitoramento` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Startup` int DEFAULT NULL,
  `ID_Empreendedor` char(11) DEFAULT NULL,
  `ID_Analista` char(11) DEFAULT NULL,
  `Data` date NOT NULL,
  `Faturamento` decimal(10,2) DEFAULT NULL,
  `Num_Funcionario` int DEFAULT NULL,
  `Plano_Desenvolvimento` text,
  PRIMARY KEY (`ID`),
  KEY `ID_Startup` (`ID_Startup`),
  KEY `ID_Empreendedor` (`ID_Empreendedor`),
  KEY `ID_Analista` (`ID_Analista`),
  CONSTRAINT `Monitoramento_ibfk_1` FOREIGN KEY (`ID_Startup`) REFERENCES `Startup` (`ID_Startup`),
  CONSTRAINT `Monitoramento_ibfk_2` FOREIGN KEY (`ID_Empreendedor`) REFERENCES `Usuario` (`CPF`),
  CONSTRAINT `Monitoramento_ibfk_3` FOREIGN KEY (`ID_Analista`) REFERENCES `Admin` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Monitoramento`
--

LOCK TABLES `Monitoramento` WRITE;
/*!40000 ALTER TABLE `Monitoramento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Monitoramento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MonitoramentoItens`
--

DROP TABLE IF EXISTS `MonitoramentoItens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MonitoramentoItens` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Monitoramento` int DEFAULT NULL,
  `ID_BaseItem` int DEFAULT NULL,
  `Nota` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Monitoramento` (`ID_Monitoramento`),
  KEY `ID_BaseItem` (`ID_BaseItem`),
  CONSTRAINT `MonitoramentoItens_ibfk_1` FOREIGN KEY (`ID_Monitoramento`) REFERENCES `Monitoramento` (`ID`),
  CONSTRAINT `MonitoramentoItens_ibfk_2` FOREIGN KEY (`ID_BaseItem`) REFERENCES `JornadaBaseItem` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MonitoramentoItens`
--

LOCK TABLES `MonitoramentoItens` WRITE;
/*!40000 ALTER TABLE `MonitoramentoItens` DISABLE KEYS */;
/*!40000 ALTER TABLE `MonitoramentoItens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MonitoramentoSocios`
--

DROP TABLE IF EXISTS `MonitoramentoSocios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MonitoramentoSocios` (
  `ID_Monitoramento` int NOT NULL,
  `ID_Socio` char(11) NOT NULL,
  PRIMARY KEY (`ID_Monitoramento`,`ID_Socio`),
  KEY `ID_Socio` (`ID_Socio`),
  CONSTRAINT `MonitoramentoSocios_ibfk_1` FOREIGN KEY (`ID_Monitoramento`) REFERENCES `Monitoramento` (`ID`),
  CONSTRAINT `MonitoramentoSocios_ibfk_2` FOREIGN KEY (`ID_Socio`) REFERENCES `Socios` (`ID_Empreendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MonitoramentoSocios`
--

LOCK TABLES `MonitoramentoSocios` WRITE;
/*!40000 ALTER TABLE `MonitoramentoSocios` DISABLE KEYS */;
/*!40000 ALTER TABLE `MonitoramentoSocios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notificacoes`
--

DROP TABLE IF EXISTS `Notificacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notificacoes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Remetente` char(11) DEFAULT NULL,
  `Destinatario` char(11) DEFAULT NULL,
  `Mensagem` text NOT NULL,
  `Data_Envio` datetime NOT NULL,
  `Lida` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `Remetente` (`Remetente`),
  KEY `Destinatario` (`Destinatario`),
  CONSTRAINT `Notificacoes_ibfk_1` FOREIGN KEY (`Remetente`) REFERENCES `Admin` (`CPF`),
  CONSTRAINT `Notificacoes_ibfk_2` FOREIGN KEY (`Destinatario`) REFERENCES `Usuario` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notificacoes`
--

LOCK TABLES `Notificacoes` WRITE;
/*!40000 ALTER TABLE `Notificacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Notificacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Socios`
--

DROP TABLE IF EXISTS `Socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Socios` (
  `ID_Startup` int NOT NULL,
  `ID_Empreendedor` char(11) NOT NULL,
  PRIMARY KEY (`ID_Startup`,`ID_Empreendedor`),
  KEY `ID_Empreendedor` (`ID_Empreendedor`),
  CONSTRAINT `Socios_ibfk_1` FOREIGN KEY (`ID_Startup`) REFERENCES `Startup` (`ID_Startup`),
  CONSTRAINT `Socios_ibfk_2` FOREIGN KEY (`ID_Empreendedor`) REFERENCES `Usuario` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Socios`
--

LOCK TABLES `Socios` WRITE;
/*!40000 ALTER TABLE `Socios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Socios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Startup`
--

DROP TABLE IF EXISTS `Startup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Startup` (
  `ID_Startup` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Logo` blob NOT NULL,
  `ID_Empreendedor` char(11) DEFAULT NULL,
  `ID_Analista` char(11) NOT NULL,
  `CNPJ` char(14) DEFAULT NULL,
  `Data_Abertura` date DEFAULT NULL,
  `Data_Ingresso` date DEFAULT NULL,
  `Descricao` text,
  `Email` varchar(100) DEFAULT NULL,
  `Logradouro` varchar(255) DEFAULT NULL,
  `Numero` varchar(10) DEFAULT NULL,
  `Complemento` varchar(255) DEFAULT NULL,
  `Bairro` varchar(100) DEFAULT NULL,
  `CEP` varchar(20) DEFAULT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `Investimento_Inicial` decimal(10,2) DEFAULT NULL,
  `Objetivo_PIBTec` text,
  `Ramo_Atuacao` varchar(100) DEFAULT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Startup`),
  UNIQUE KEY `CNPJ` (`CNPJ`),
  KEY `ID_Empreendedor` (`ID_Empreendedor`),
  KEY `ID_Analista` (`ID_Analista`),
  CONSTRAINT `Startup_ibfk_1` FOREIGN KEY (`ID_Empreendedor`) REFERENCES `Usuario` (`CPF`),
  CONSTRAINT `Startup_ibfk_2` FOREIGN KEY (`ID_Analista`) REFERENCES `Admin` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Startup`
--

LOCK TABLES `Startup` WRITE;
/*!40000 ALTER TABLE `Startup` DISABLE KEYS */;
/*!40000 ALTER TABLE `Startup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Startup_Rede_Social`
--

DROP TABLE IF EXISTS `Startup_Rede_Social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Startup_Rede_Social` (
  `ID_Startup` int NOT NULL,
  `Nome_Rede` varchar(50) NOT NULL,
  `Link` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Startup`,`Nome_Rede`),
  CONSTRAINT `Startup_Rede_Social_ibfk_1` FOREIGN KEY (`ID_Startup`) REFERENCES `Startup` (`ID_Startup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Startup_Rede_Social`
--

LOCK TABLES `Startup_Rede_Social` WRITE;
/*!40000 ALTER TABLE `Startup_Rede_Social` DISABLE KEYS */;
/*!40000 ALTER TABLE `Startup_Rede_Social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `CPF` char(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Senha` varchar(255) NOT NULL,
  `Telefone` varchar(20) NOT NULL,
  `Data_Nascimento` date NOT NULL,
  `Cidade_Nascimento` varchar(100) DEFAULT NULL,
  `Curriculo` blob,
  `Logradouro` varchar(255) DEFAULT NULL,
  `Numero` varchar(10) DEFAULT NULL,
  `Complemento` varchar(255) DEFAULT NULL,
  `Bairro` varchar(100) DEFAULT NULL,
  `CEP` varchar(20) DEFAULT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `Foto_Perfil` blob,
  `Formacao_Profissional` text,
  `Motivacao_Empreendedor` text,
  `Ocupacao_Atual` varchar(100) DEFAULT NULL,
  `Tempo_Experiencia` text,
  PRIMARY KEY (`CPF`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario_Rede_Social`
--

DROP TABLE IF EXISTS `Usuario_Rede_Social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario_Rede_Social` (
  `CPF` char(11) NOT NULL,
  `Nome_Rede` varchar(50) NOT NULL,
  `Link` varchar(255) NOT NULL,
  PRIMARY KEY (`CPF`,`Nome_Rede`),
  CONSTRAINT `Usuario_Rede_Social_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `Usuario` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_Rede_Social`
--

LOCK TABLES `Usuario_Rede_Social` WRITE;
/*!40000 ALTER TABLE `Usuario_Rede_Social` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario_Rede_Social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'SigBTec'
--
/*!50003 DROP PROCEDURE IF EXISTS `CriarJornadaStartup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`maiaTh`@`localhost` PROCEDURE `CriarJornadaStartup`(
    IN p_ID_Startup INT,
    IN p_Data_Inicio DATE
)
BEGIN
    -- Inserir a nova jornada na tabela JornadaStartup
    INSERT INTO JornadaStartup (ID_Startup, Data_Inicio, Data_Fim, Progresso, Ultimo_Acesso)
    VALUES (p_ID_Startup, p_Data_Inicio, NULL, 0, NULL);

    -- Copiar os itens da jornada para JornadaBaseItem
    INSERT INTO JornadaBaseItem (ID_Item, ID_Startup, ID_Etapa, ID_Eixo, Input, Status)
    SELECT ID_Item, p_ID_Startup, ID_Etapa, ID_Eixo, NULL, 'vazio'
    FROM JornadaItem;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-10 18:47:14
