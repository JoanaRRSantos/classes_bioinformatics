-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `codigo_postal`
--

DROP TABLE IF EXISTS `codigo_postal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `codigo_postal` (
  `Codigo_Postal` varchar(8) NOT NULL,
  `Localidade` varchar(45) NOT NULL,
  PRIMARY KEY (`Codigo_Postal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigo_postal`
--

LOCK TABLES `codigo_postal` WRITE;
/*!40000 ALTER TABLE `codigo_postal` DISABLE KEYS */;
INSERT INTO `codigo_postal` VALUES ('4800-465','Alverca'),('4803-704','Lisboa'),('4820-435','Covas'),('4821-764','Vila Real'),('4832-423','Braga'),('4843-953','Penafiel'),('4850-201','Porto'),('4854-145','Ponta-delgada'),('4876-875','Caminha'),('4888-808','Faro');
/*!40000 ALTER TABLE `codigo_postal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispositivos`
--

DROP TABLE IF EXISTS `dispositivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dispositivos` (
  `id_Dispositivos` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Dispositivos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispositivos`
--

LOCK TABLES `dispositivos` WRITE;
/*!40000 ALTER TABLE `dispositivos` DISABLE KEYS */;
INSERT INTO `dispositivos` VALUES (1,'Siemens Multix Select DR'),(2,'Symbol (3-15 kW) – GMM'),(3,'Telecomandada Swing – GMM'),(4,'Siemens MAGNETOM Avanto'),(5,'Siemens Emotion 16');
/*!40000 ALTER TABLE `dispositivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispositivos_fornecedor`
--

DROP TABLE IF EXISTS `dispositivos_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dispositivos_fornecedor` (
  `id_Dispositivos` int(11) NOT NULL,
  `id_Fornecedor` int(11) NOT NULL,
  PRIMARY KEY (`id_Dispositivos`,`id_Fornecedor`),
  KEY `fk_Fornecedores_1_idx` (`id_Fornecedor`),
  CONSTRAINT `fk_Dispositivos_22` FOREIGN KEY (`id_Dispositivos`) REFERENCES `dispositivos` (`id_dispositivos`),
  CONSTRAINT `fk_Fornecedor_1` FOREIGN KEY (`id_Fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispositivos_fornecedor`
--

LOCK TABLES `dispositivos_fornecedor` WRITE;
/*!40000 ALTER TABLE `dispositivos_fornecedor` DISABLE KEYS */;
INSERT INTO `dispositivos_fornecedor` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `dispositivos_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispositivos_manutencao`
--

DROP TABLE IF EXISTS `dispositivos_manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dispositivos_manutencao` (
  `id_Dispositivos` int(11) NOT NULL,
  `id_Manutencao` int(11) NOT NULL,
  `data_manutencao` datetime NOT NULL,
  `data_conserto` datetime DEFAULT NULL,
  PRIMARY KEY (`id_Dispositivos`,`id_Manutencao`),
  KEY `fk_Manutencao_1_idx` (`id_Manutencao`),
  KEY `fk_Dispositivos_3_idx` (`id_Dispositivos`),
  CONSTRAINT `fk_Dispositivos_1` FOREIGN KEY (`id_Dispositivos`) REFERENCES `dispositivos` (`id_dispositivos`),
  CONSTRAINT `fk_Manutencao_1` FOREIGN KEY (`id_Manutencao`) REFERENCES `manutencao` (`id_manutencao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispositivos_manutencao`
--

LOCK TABLES `dispositivos_manutencao` WRITE;
/*!40000 ALTER TABLE `dispositivos_manutencao` DISABLE KEYS */;
INSERT INTO `dispositivos_manutencao` VALUES (1,1,'2019-10-10 09:00:00','2019-11-11 15:30:00'),(2,2,'2019-02-10 11:45:00','2019-02-14 14:20:00'),(3,3,'2019-03-10 17:50:00','2019-05-19 08:10:00');
/*!40000 ALTER TABLE `dispositivos_manutencao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispositivos_salas`
--

DROP TABLE IF EXISTS `dispositivos_salas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dispositivos_salas` (
  `id_Dispositivos` int(11) NOT NULL,
  `id_Salas` int(11) NOT NULL,
  PRIMARY KEY (`id_Dispositivos`,`id_Salas`),
  KEY `fk_Salas_1_idx` (`id_Salas`),
  CONSTRAINT `fk_Dispositivos_3` FOREIGN KEY (`id_Dispositivos`) REFERENCES `dispositivos` (`id_dispositivos`),
  CONSTRAINT `fk_Salas_1` FOREIGN KEY (`id_Salas`) REFERENCES `salas` (`id_salas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispositivos_salas`
--

LOCK TABLES `dispositivos_salas` WRITE;
/*!40000 ALTER TABLE `dispositivos_salas` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispositivos_salas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `especialidade` (
  `id_Especialidade` int(11) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  PRIMARY KEY (`id_Especialidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade`
--

LOCK TABLES `especialidade` WRITE;
/*!40000 ALTER TABLE `especialidade` DISABLE KEYS */;
INSERT INTO `especialidade` VALUES (1,'Cardiologia'),(2,'Radiografia'),(3,'Mamografia'),(4,'Ultrassonografia'),(5,'Tomografia Computadorizada'),(6,'Ressonância Magnética'),(7,'Radiologia'),(8,'Intervencionista'),(9,'Angiografia'),(10,'Densitometria Óssea'),(11,'Tomografia por Emissão de Positrões');
/*!40000 ALTER TABLE `especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exames`
--

DROP TABLE IF EXISTS `exames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exames` (
  `id_Exames` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Exames`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exames`
--

LOCK TABLES `exames` WRITE;
/*!40000 ALTER TABLE `exames` DISABLE KEYS */;
INSERT INTO `exames` VALUES (1,'Tomografia Computadorizada'),(2,'Ressonância Magnética'),(3,'Tomografia por Emissão de Pósitrons'),(4,'Ultrassonografia'),(5,'Raio-X'),(6,'Radiografia'),(7,'Fluoroscopia'),(8,'Mamografia'),(9,'Angiografia'),(10,'Cintolografia'),(11,'Ecografia'),(12,'Ecocardiografia'),(13,'Elastografia'),(14,'Termografia');
/*!40000 ALTER TABLE `exames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exames_dispositivos`
--

DROP TABLE IF EXISTS `exames_dispositivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exames_dispositivos` (
  `id_Exames` int(11) NOT NULL,
  `id_Dispositivos` int(11) NOT NULL,
  `data_utilizacao` datetime NOT NULL,
  PRIMARY KEY (`id_Exames`,`id_Dispositivos`),
  KEY `fk_Dispositivos_4_idx` (`id_Dispositivos`),
  CONSTRAINT `fk_Exames_4` FOREIGN KEY (`id_Exames`) REFERENCES `exames` (`id_exames`),
  CONSTRAINT `fk_dispositivos_4` FOREIGN KEY (`id_Dispositivos`) REFERENCES `dispositivos` (`id_dispositivos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exames_dispositivos`
--

LOCK TABLES `exames_dispositivos` WRITE;
/*!40000 ALTER TABLE `exames_dispositivos` DISABLE KEYS */;
INSERT INTO `exames_dispositivos` VALUES (1,4,'2019-01-10 09:30:00'),(2,2,'2019-05-24 11:45:00'),(3,1,'2019-07-07 16:00:00');
/*!40000 ALTER TABLE `exames_dispositivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exames_paciente`
--

DROP TABLE IF EXISTS `exames_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exames_paciente` (
  `id_Exames` int(11) NOT NULL,
  `id_Paciente` int(11) NOT NULL,
  PRIMARY KEY (`id_Exames`,`id_Paciente`),
  KEY `fk_Paciente_1_idx` (`id_Paciente`),
  CONSTRAINT `fk_Exames_2` FOREIGN KEY (`id_Exames`) REFERENCES `exames` (`id_exames`),
  CONSTRAINT `fk_Paciente_1` FOREIGN KEY (`id_Paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exames_paciente`
--

LOCK TABLES `exames_paciente` WRITE;
/*!40000 ALTER TABLE `exames_paciente` DISABLE KEYS */;
INSERT INTO `exames_paciente` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `exames_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exames_secretariado`
--

DROP TABLE IF EXISTS `exames_secretariado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exames_secretariado` (
  `id_Secretariado` int(11) NOT NULL,
  `id_Exames` int(11) NOT NULL,
  `Data_Hora` datetime NOT NULL,
  `id_Dispositivos` int(11) NOT NULL,
  `id_Tecnicos` int(11) NOT NULL,
  `id_Paciente` int(11) NOT NULL,
  PRIMARY KEY (`id_Secretariado`,`id_Exames`),
  KEY `fk_exames_3_idx` (`id_Exames`),
  KEY `fk_dispositivos_5_idx` (`id_Dispositivos`),
  KEY `fk_tecnicos_3_idx` (`id_Tecnicos`),
  KEY `fk_Paciente_3_idx` (`id_Paciente`),
  CONSTRAINT `fk_Paciente_3` FOREIGN KEY (`id_Paciente`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `fk_dispositivos_5` FOREIGN KEY (`id_Dispositivos`) REFERENCES `dispositivos` (`id_dispositivos`),
  CONSTRAINT `fk_exames_3` FOREIGN KEY (`id_Exames`) REFERENCES `exames` (`id_exames`),
  CONSTRAINT `fk_secretariado_1` FOREIGN KEY (`id_Secretariado`) REFERENCES `secretariado` (`id_secretariado`),
  CONSTRAINT `fk_tecnicos_3` FOREIGN KEY (`id_Tecnicos`) REFERENCES `tecnicos` (`id_tecnicos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exames_secretariado`
--

LOCK TABLES `exames_secretariado` WRITE;
/*!40000 ALTER TABLE `exames_secretariado` DISABLE KEYS */;
INSERT INTO `exames_secretariado` VALUES (11,1,'2019-01-10 09:30:00',4,4,4),(12,3,'2019-07-07 16:00:00',1,1,1),(13,2,'2019-05-24 11:45:00',2,2,2);
/*!40000 ALTER TABLE `exames_secretariado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `dispositivos_manutencao` BEFORE INSERT ON `exames_secretariado` FOR EACH ROW BEGIN
IF EXISTS
	(SELECT exames_secretariado.*
    FROM exames_secretariado, dispositivos, dispositivos_manutencao
    WHERE exames_secretariado.id_Dispositivos = dispositivos.id_Dispositivos AND dispositivos.id_Dispositivos = dispositivos_manutencao.id_Dispositivos AND (exames_secretariado.Data_Hora BETWEEN dispositivos_manutencao.data_manutencao AND dispositivos_manutencao.data_conserto))
	THEN  SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT='Erro: Dispositivo em Manutenção';
END IF;

IF EXISTS
	(SELECT exames_secretariado.*
    FROM exames_secretariado, exames_dispositivos, tecnicos_exames
    WHERE exames_secretariado.id_Tecnicos = tecnicos_exames.id_Exames AND exames_secretariado.id_Exames = tecnicos_exames.id_Exames AND exames_secretariado.id_Exames = exames_dispositivos.id_Exames AND exames_secretariado.id_Dispositivos = exames_dispositivos.id_Dispositivos AND (exames_secretariado.Data_Hora = exames_dispositivos.data_utilizacao OR exames_secretariado.Data_Hora = tecnicos_exames.Data_Hora))
	THEN  SIGNAL SQLSTATE '02001' SET MESSAGE_TEXT='Erro: Não é possível fazer a marcação';
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data` AFTER INSERT ON `exames_secretariado` FOR EACH ROW BEGIN
INSERT INTO tecnicos_exames.id_Tecnicos values (NEW.exames_secretariado.id_Tecnicos);
INSERT INTO tecnicos_exames.id_Exames values (NEW.exames_secretariado.id_Exames);
INSERT INTO tecnicos_exames.Data_Hora values (NEW.exames_secretariado.Data_Hora);
INSERT INTO exames_dispositivos.id_Exames values (NEW.exames_secretariado.id_Exames);
INSERT INTO exames_dispositivos.id_Dispositivos values (NEW.exames_secretariado.id_Dispositivos);
INSERT INTO exames_dispositivos.data_utilizacao values(NEW.exames_secretariado.Data_Hora);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `datas2` AFTER UPDATE ON `exames_secretariado` FOR EACH ROW BEGIN
UPDATE  tecnicos_exames SET tecnicos_exames.Data_Hora= NEW.exames_secretariado.Data_Hora WHERE tecnicos_exames.id_Tecnicos=NEW.exames_secretariado.id_Tecnicos AND tecnicos_exames.id_Exames=NEW.exames_secretariado.id_Exames;
UPDATE exames_dispositivos SET exames_dispositivos.data_utilizacao=NEW.exames_secretariado.Data_Hora WHERE exames_dispositivos.id_Exames=NEW.exames_secretariado.id_Exames AND exames_dispositivos.id_Dispositivos= NEW.exames_secretariado.id_Dispositivos;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fornecedor` (
  `id_Fornecedor` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'SONOSCANNER'),(2,'TEAMALEX MEDICAL'),(3,'VIMS-VIDEO INTERVENTIONNELLE'),(4,'KIZLON LTD.'),(5,'MEDIAN TECHNOLOGIES'),(6,'IMAGE & MEDICAL SYSTEMES - IMEDSYS'),(7,'BIMEDIS'),(8,'COGNIMED GMBH'),(9,'CANON LUXEMBOURG'),(10,'IDETEC MEDICAL IMAGING');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manutencao`
--

DROP TABLE IF EXISTS `manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manutencao` (
  `id_Manutencao` int(11) NOT NULL,
  `tipo_avaria` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Manutencao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manutencao`
--

LOCK TABLES `manutencao` WRITE;
/*!40000 ALTER TABLE `manutencao` DISABLE KEYS */;
INSERT INTO `manutencao` VALUES (1,'botão encravado'),(2,'não da imagem'),(3,'demasiado barulho');
/*!40000 ALTER TABLE `manutencao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paciente` (
  `id_Paciente` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `data_nascimento` date NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `Codigo_Postal` varchar(8) NOT NULL,
  `morada` varchar(45) NOT NULL,
  `CC` int(11) NOT NULL,
  `n_utente` int(11) NOT NULL,
  `NIF` int(11) NOT NULL,
  PRIMARY KEY (`id_Paciente`),
  KEY `fk_codigo_postal_1_idx` (`Codigo_Postal`),
  CONSTRAINT `fk_codigo_postal_1` FOREIGN KEY (`Codigo_Postal`) REFERENCES `codigo_postal` (`codigo_postal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'José Almeida','1945-05-29','M','4820-435','Rua da Andorinha',14252487,123456789,231365457),(2,'Catarina Ferreira','1950-11-03','F','4800-465','Rua Sésamo',12345678,873420231,745896231),(3,'Diogo Peixoto','1970-09-13','M','4803-704','Rua Vasco da Gama',35647219,753159824,75319482),(4,'Maria Gomes','1980-04-30','F','4850-201','Rua Carvalhinho',45678912,314526476,987654321),(5,'Filipe Lopes','1990-02-17','M','4832-423','Rua D.Joao IV',65478912,921354952,258764913),(6,'Liliana Castro','1988-08-08','F','4888-808','Rua das Flores',8534529,712893456,962587431),(7,'Francisco Ribeiro','1974-06-22','M','4854-145','Rua das Docas',99999999,999999999,154245782),(8,'Mariana Fonseca','1981-04-05','F','4843-953','Rua de São Mamede',11111111,111111111,451232007),(9,'Matilde Branco','1966-03-15','F','4876-875','Rua do Gaiato',22222222,222222222,741258967);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_contacto`
--

DROP TABLE IF EXISTS `paciente_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paciente_contacto` (
  `id_Paciente` int(11) NOT NULL,
  `valor` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Paciente`,`valor`,`tipo`),
  CONSTRAINT `fk_Paciente_2` FOREIGN KEY (`id_Paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_contacto`
--

LOCK TABLES `paciente_contacto` WRITE;
/*!40000 ALTER TABLE `paciente_contacto` DISABLE KEYS */;
INSERT INTO `paciente_contacto` VALUES (1,'965432197','telefone'),(1,'acds@gmail.com','email'),(2,'hphp@gmail.com','email'),(3,'967788991','telefone'),(3,'qwerty@gmail.com','email'),(4,'923456677','telefone'),(4,'asdf@gmail.com','email'),(5,'pllp @gmail.com','email'),(6,'912345345','telefone'),(7,'932123123','telefone'),(7,'zxcv@gmail.com','email'),(8,'934563234','telefone'),(9,'912345123','telefone'),(9,'ritor@gmail.com','email');
/*!40000 ALTER TABLE `paciente_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salas`
--

DROP TABLE IF EXISTS `salas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `salas` (
  `id_Salas` int(11) NOT NULL,
  `localizacao` varchar(45) NOT NULL,
  `telefone` int(9) NOT NULL,
  PRIMARY KEY (`id_Salas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salas`
--

LOCK TABLES `salas` WRITE;
/*!40000 ALTER TABLE `salas` DISABLE KEYS */;
INSERT INTO `salas` VALUES (1,'00.03',253543654),(2,'00.04',253543655),(3,'00.05',253543656),(4,'00.06',253543657);
/*!40000 ALTER TABLE `salas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secretariado`
--

DROP TABLE IF EXISTS `secretariado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `secretariado` (
  `id_Secretariado` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Secretariado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secretariado`
--

LOCK TABLES `secretariado` WRITE;
/*!40000 ALTER TABLE `secretariado` DISABLE KEYS */;
INSERT INTO `secretariado` VALUES (11,'Carlos Sampaio'),(12,'Ana Castro'),(13,'Carmo Andrade');
/*!40000 ALTER TABLE `secretariado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnicos`
--

DROP TABLE IF EXISTS `tecnicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tecnicos` (
  `id_Tecnicos` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `data_entrada` date NOT NULL,
  `data_nascimento` date NOT NULL,
  `id_Especialidade` int(11) NOT NULL,
  `Codigo_Postal` varchar(8) NOT NULL,
  `morada` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Tecnicos`),
  KEY `fk_especialidade_1_idx` (`id_Especialidade`),
  KEY `fk_codigo_postal_2_idx` (`Codigo_Postal`),
  CONSTRAINT `fk_codigo_postal_2` FOREIGN KEY (`Codigo_Postal`) REFERENCES `codigo_postal` (`codigo_postal`),
  CONSTRAINT `fk_especialidade_1` FOREIGN KEY (`id_Especialidade`) REFERENCES `especialidade` (`id_especialidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnicos`
--

LOCK TABLES `tecnicos` WRITE;
/*!40000 ALTER TABLE `tecnicos` DISABLE KEYS */;
INSERT INTO `tecnicos` VALUES (1,'José Andrade','2018-10-09','1990-09-01',1,'4843-953','Rua de São Mamede'),(2,'Antonio Fernandes','2018-10-09','1963-05-16',2,'4820-435','Rua de São João'),(3,'Maria Mendes','2017-12-19','1975-04-07',3,'4800-465','Rua de São Simão'),(4,'Tatiana Antonieta','2018-10-09','1994-09-27',4,'4803-704','Rua de Camões'),(5,'Joana Gonçalves','2017-12-19','1980-07-21',5,'4850-201','Rua das Flores');
/*!40000 ALTER TABLE `tecnicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnicos_exames`
--

DROP TABLE IF EXISTS `tecnicos_exames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tecnicos_exames` (
  `id_Tecnicos` int(11) NOT NULL,
  `id_Exames` int(11) NOT NULL,
  `Data_Hora` datetime NOT NULL,
  PRIMARY KEY (`id_Tecnicos`,`id_Exames`),
  KEY `fk_Exames_1_idx` (`id_Exames`),
  CONSTRAINT `fk_Exames_1` FOREIGN KEY (`id_Exames`) REFERENCES `exames` (`id_exames`),
  CONSTRAINT `fk_Tecnicos_1` FOREIGN KEY (`id_Tecnicos`) REFERENCES `tecnicos` (`id_tecnicos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnicos_exames`
--

LOCK TABLES `tecnicos_exames` WRITE;
/*!40000 ALTER TABLE `tecnicos_exames` DISABLE KEYS */;
INSERT INTO `tecnicos_exames` VALUES (1,3,'2019-07-07 16:00:00'),(2,2,'2019-05-24 11:45:00'),(4,1,'2019-01-10 09:30:00');
/*!40000 ALTER TABLE `tecnicos_exames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-29 17:26:34
