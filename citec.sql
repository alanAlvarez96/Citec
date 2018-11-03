-- MySQL dump 10.16  Distrib 10.1.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: citec
-- ------------------------------------------------------
-- Server version	10.1.29-MariaDB-6+b1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Camion`
--

DROP TABLE IF EXISTS `Camion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Camion` (
  `camion` int(11) NOT NULL,
  `asiento` int(11) NOT NULL,
  `estatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`camion`,`asiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Camion`
--

LOCK TABLES `Camion` WRITE;
/*!40000 ALTER TABLE `Camion` DISABLE KEYS */;
INSERT INTO `Camion` VALUES (1,1,'O'),(1,2,'l'),(1,3,'l'),(1,4,'l'),(1,5,'l'),(1,6,'l'),(1,7,'l');
/*!40000 ALTER TABLE `Camion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mensajes`
--

DROP TABLE IF EXISTS `Mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mensajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Mensaje` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mensajes`
--

LOCK TABLES `Mensajes` WRITE;
/*!40000 ALTER TABLE `Mensajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_expo_articulo`
--

DROP TABLE IF EXISTS `area_expo_articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_expo_articulo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idArticulo` bigint(11) NOT NULL,
  `Espacio` varchar(60) NOT NULL,
  `Horario` time NOT NULL,
  `Fecha` date NOT NULL,
  `Duracion` int(11) NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idArticulo` (`idArticulo`),
  CONSTRAINT `arti-exposicion` FOREIGN KEY (`idArticulo`) REFERENCES `articulo` (`id_articulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_expo_articulo`
--

LOCK TABLES `area_expo_articulo` WRITE;
/*!40000 ALTER TABLE `area_expo_articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_expo_articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulo` (
  `id_articulo` bigint(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `archivo_final` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `poster` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `estatus_pago` int(11) NOT NULL DEFAULT '0',
  `desc_Reconocimiento` tinyint(4) NOT NULL DEFAULT '0',
  `aval_academico` int(11) NOT NULL DEFAULT '0',
  `factura` int(11) DEFAULT '0',
  `desc_factura` int(11) NOT NULL,
  `expone` int(11) NOT NULL,
  PRIMARY KEY (`id_articulo`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asiste_confer`
--

DROP TABLE IF EXISTS `asiste_confer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asiste_confer` (
  `id_conferencia` int(11) NOT NULL,
  `id_Congresista` int(11) NOT NULL,
  `asistencia` char(1) NOT NULL,
  UNIQUE KEY `asis_conf` (`id_conferencia`,`id_Congresista`),
  KEY `Existe Congresista` (`id_Congresista`),
  CONSTRAINT `Existe Conferencia` FOREIGN KEY (`id_conferencia`) REFERENCES `conferencia` (`id_conferencia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Existe Congresista` FOREIGN KEY (`id_Congresista`) REFERENCES `usuario` (`id_reg`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiste_confer`
--

LOCK TABLES `asiste_confer` WRITE;
/*!40000 ALTER TABLE `asiste_confer` DISABLE KEYS */;
/*!40000 ALTER TABLE `asiste_confer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asiste_evento`
--

DROP TABLE IF EXISTS `asiste_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asiste_evento` (
  `id_user` int(11) NOT NULL,
  `id_evento` int(11) NOT NULL,
  `asistencia` char(1) NOT NULL,
  `asiento` int(11) NOT NULL,
  `camion` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_evento`),
  KEY `id_evento` (`id_evento`),
  KEY `Asientos` (`asiento`,`camion`),
  CONSTRAINT `asiste_evento_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `evento_social` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asiste_evento_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_reg`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiste_evento`
--

LOCK TABLES `asiste_evento` WRITE;
/*!40000 ALTER TABLE `asiste_evento` DISABLE KEYS */;
INSERT INTO `asiste_evento` VALUES (1,1,'a',2,1),(2,1,'a',3,1),(3,1,'a',5,1),(5,1,'a',1,2),(6,1,'a',6,2),(7,1,'a',10,2),(8,1,'a',3,2),(10,1,'',20,1);
/*!40000 ALTER TABLE `asiste_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asiste_panel`
--

DROP TABLE IF EXISTS `asiste_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asiste_panel` (
  `id_user` int(11) NOT NULL,
  `id_panel` int(11) NOT NULL,
  `asistencia` char(1) NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `id_panel` (`id_panel`),
  CONSTRAINT `asiste_panel_ibfk_2` FOREIGN KEY (`id_panel`) REFERENCES `paneles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asiste_panel_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_reg`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiste_panel`
--

LOCK TABLES `asiste_panel` WRITE;
/*!40000 ALTER TABLE `asiste_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `asiste_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asiste_taller`
--

DROP TABLE IF EXISTS `asiste_taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asiste_taller` (
  `id_user` int(11) NOT NULL,
  `id_taller` int(11) NOT NULL,
  `asistencia` char(1) NOT NULL,
  PRIMARY KEY (`id_user`,`id_taller`),
  KEY `id_taller` (`id_taller`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `asiste_taller_ibfk_2` FOREIGN KEY (`id_taller`) REFERENCES `taller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asiste_taller_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_reg`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiste_taller`
--

LOCK TABLES `asiste_taller` WRITE;
/*!40000 ALTER TABLE `asiste_taller` DISABLE KEYS */;
INSERT INTO `asiste_taller` VALUES (3,2,'a'),(4,2,''),(10,2,'');
/*!40000 ALTER TABLE `asiste_taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asiste_visita`
--

DROP TABLE IF EXISTS `asiste_visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asiste_visita` (
  `id_user` int(11) NOT NULL,
  `id_visita` int(11) NOT NULL,
  `asistencia` char(1) NOT NULL,
  PRIMARY KEY (`id_user`,`id_visita`),
  UNIQUE KEY `id_user` (`id_user`),
  KEY `id_visita` (`id_visita`),
  CONSTRAINT `asiste_visita_ibfk_3` FOREIGN KEY (`id_visita`) REFERENCES `visita_indus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asiste_visita_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_reg`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiste_visita`
--

LOCK TABLES `asiste_visita` WRITE;
/*!40000 ALTER TABLE `asiste_visita` DISABLE KEYS */;
INSERT INTO `asiste_visita` VALUES (1,2,'n'),(2,2,'n');
/*!40000 ALTER TABLE `asiste_visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conferencia`
--

DROP TABLE IF EXISTS `conferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conferencia` (
  `id_conferencia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `lugar_conf` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_conferencista` int(11) NOT NULL,
  `costo` double NOT NULL,
  `cupo` int(11) NOT NULL,
  PRIMARY KEY (`id_conferencia`),
  UNIQUE KEY `id_conferencia` (`id_conferencia`),
  KEY `id_conferencista` (`id_conferencista`),
  CONSTRAINT `conferencia_ibfk_1` FOREIGN KEY (`id_conferencista`) REFERENCES `conferencista` (`id_conferencista`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conferencia`
--

LOCK TABLES `conferencia` WRITE;
/*!40000 ALTER TABLE `conferencia` DISABLE KEYS */;
INSERT INTO `conferencia` VALUES (20,'conferencia de prueba 2','esto es una prueba 2','centro de las artes','2018-11-13','13:00:00',15,20,15),(21,'conferencia de prueba 3','esto es una prueba 3','centro de las artes','2018-11-13','14:00:00',15,20,15),(22,'conferencia de prueba 2','esto es una prueba 1','centro de las artes','2018-11-14','12:00:00',15,20,15),(23,'conferencia de prueba 2','esto es una prueba 1','centro de las artes','2018-11-15','13:00:00',15,20,15),(24,'conferencia de prueba 2','esto es una prueba 1','centro de las artes','2018-11-13','13:00:00',15,20,15),(25,'conferencia de prueba 2','esto es una prueba 1','centro de las artes','2018-11-16','13:00:00',15,20,15),(26,'conferencia de prueba 2','esto es una prueba 1','centro de las artes','2018-11-16','11:00:00',15,20,15);
/*!40000 ALTER TABLE `conferencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conferencista`
--

DROP TABLE IF EXISTS `conferencista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conferencista` (
  `id_conferencista` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `genero` char(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `institucion_empresa` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `biografia` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_conferencista`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conferencista`
--

LOCK TABLES `conferencista` WRITE;
/*!40000 ALTER TABLE `conferencista` DISABLE KEYS */;
INSERT INTO `conferencista` VALUES (15,'LUIS','FAMANIA','H','famanialuis@gmail.com','(33) 3673·5096 ','Luis Famania Life Coaching','Consultor empresarial, Life Coach y Conferencista Internacional.\r\nIngeniero Industrial con Especialidad en DirecciÃ³n de Operaciones egresado de la Universidad Panamericana sede Guadalajara, CertificaciÃ³n en Coaching con\r\nProgramaciÃ³n NeurolinguÃ­stica y  CertificaciÃ³n Internacional en tÃ©cnicas avanzadas de PNL por el CMPNL, Especialista en Equipos de trabajo de alto\r\ndesempeÃ±o por el ITESO y maestrÃ­a en curso de PNL.\r\nSocio fundador de Grupo Ingenia de MÃ©xico, empresa de consultorÃ­a empresarial, capacitaciÃ³n y coaching.\r\nComo experto en ProgramaciÃ³n NeurolingÃ¼Ã­stica, manejo de las emociones, Coaching de Vida, Liderazgo, Negocios y ComunicaciÃ³n, Luis ha impartido seminarios y conferencias en las principales universidades del paÃ­s. En el Ã¡mbito Empresarial, ha participado activamente en procesos de consultorÃ­a  y coaching con directivos y gerentes de empresas de diferentes rubros a nivel nacional e internacional.');
/*!40000 ALTER TABLE `conferencista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracion` (
  `campo` varchar(20) NOT NULL,
  `valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`campo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion`
--

LOCK TABLES `configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
INSERT INTO `configuracion` VALUES ('numeTalleres',1);
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_Reconocimientos`
--

DROP TABLE IF EXISTS `datos_Reconocimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_Reconocimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posiX` int(11) NOT NULL,
  `posiY` int(11) NOT NULL,
  `tipo` set('T','I','C') NOT NULL COMMENT 'Texto,imagen,Campo',
  `Contenido` text NOT NULL,
  `I` int(11) NOT NULL,
  `N` int(11) NOT NULL,
  `S` int(11) NOT NULL,
  `ancho` int(11) NOT NULL,
  `alto` int(11) NOT NULL COMMENT 'si es texto son mm de cada renglon',
  `TLetra` int(11) NOT NULL,
  `orden` int(11) NOT NULL DEFAULT '1',
  `cat` set('C','P','R','F','1','2','S') NOT NULL COMMENT 'Carta de aceptación o diploma ponente',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_Reconocimientos`
--

LOCK TABLES `datos_Reconocimientos` WRITE;
/*!40000 ALTER TABLE `datos_Reconocimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos_Reconocimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_social`
--

DROP TABLE IF EXISTS `evento_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento_social` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(300) NOT NULL,
  `lugar` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` text NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `costo` double NOT NULL,
  `cupo` int(11) NOT NULL,
  `transporte` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_social`
--

LOCK TABLES `evento_social` WRITE;
/*!40000 ALTER TABLE `evento_social` DISABLE KEYS */;
INSERT INTO `evento_social` VALUES (1,'evento prueba','utic','esto es una observacion','2018-03-12','19:30:10',12,15,1);
/*!40000 ALTER TABLE `evento_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_deposito`
--

DROP TABLE IF EXISTS `ficha_deposito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ficha_deposito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ficha` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `monto` float NOT NULL,
  `idUser` int(11) NOT NULL,
  `idAutorizo` int(11) NOT NULL,
  `ref_bancaria` varchar(30) NOT NULL,
  `fecha` date NOT NULL,
  `Factura` char(1) NOT NULL,
  `tipo_pago` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1Art 2Con 3 CoA',
  `cuenta` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`idUser`),
  KEY `id_autorizo` (`idAutorizo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_deposito`
--

LOCK TABLES `ficha_deposito` WRITE;
/*!40000 ALTER TABLE `ficha_deposito` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_deposito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `id_hotel` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `pagina` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_hotel` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_hotel`),
  UNIQUE KEY `id_hotel` (`id_hotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logos`
--

DROP TABLE IF EXISTS `logos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `posicion` char(10) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `ancho` char(10) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `max_ancho` char(10) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `enlace` varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logos`
--

LOCK TABLES `logos` WRITE;
/*!40000 ALTER TABLE `logos` DISABLE KEYS */;
/*!40000 ALTER TABLE `logos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos_efectivo`
--

DROP TABLE IF EXISTS `pagos_efectivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos_efectivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monto` float NOT NULL,
  `id_user` int(11) NOT NULL COMMENT 'id_user/id_articulo',
  `tipo_pago` tinyint(4) NOT NULL COMMENT 'congreso/articulo',
  `id_autorizo` int(11) NOT NULL,
  `Factura` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `autorizo` (`id_autorizo`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos_efectivo`
--

LOCK TABLES `pagos_efectivo` WRITE;
/*!40000 ALTER TABLE `pagos_efectivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos_efectivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paneles`
--

DROP TABLE IF EXISTS `paneles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paneles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Descripcion` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Lugar` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `cupo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paneles`
--

LOCK TABLES `paneles` WRITE;
/*!40000 ALTER TABLE `paneles` DISABLE KEYS */;
/*!40000 ALTER TABLE `paneles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba`
--

DROP TABLE IF EXISTS `prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prueba` (
  `numero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba`
--

LOCK TABLES `prueba` WRITE;
/*!40000 ALTER TABLE `prueba` DISABLE KEYS */;
INSERT INTO `prueba` VALUES (5);
/*!40000 ALTER TABLE `prueba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reconocimiento`
--

DROP TABLE IF EXISTS `reconocimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reconocimiento` (
  `id_reconocimiento` int(11) NOT NULL AUTO_INCREMENT,
  `pdf` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_reconocimiento`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `reconocimiento_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_reg`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reconocimiento`
--

LOCK TABLES `reconocimiento` WRITE;
/*!40000 ALTER TABLE `reconocimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `reconocimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taller`
--

DROP TABLE IF EXISTS `taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci,
  `Temario` text NOT NULL,
  `Requisitos` text NOT NULL,
  `lugar` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `id_tallerista` int(11) NOT NULL,
  `costo` double NOT NULL,
  `cupo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tallerista` (`id_tallerista`),
  CONSTRAINT `taller_ibfk_1` FOREIGN KEY (`id_tallerista`) REFERENCES `tallerista` (`id_tallerista`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taller`
--

LOCK TABLES `taller` WRITE;
/*!40000 ALTER TABLE `taller` DISABLE KEYS */;
INSERT INTO `taller` VALUES (2,'taller1','descripcion','iot','|1requisito','utic','1969-12-24','01:30:00',1,18,13);
/*!40000 ALTER TABLE `taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tallerista`
--

DROP TABLE IF EXISTS `tallerista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tallerista` (
  `id_tallerista` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellidoP` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellidoM` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `curriculum` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `institucion_empresa` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tallerista`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tallerista`
--

LOCK TABLES `tallerista` WRITE;
/*!40000 ALTER TABLE `tallerista` DISABLE KEYS */;
INSERT INTO `tallerista` VALUES (1,'jonas','jonas','jonas','1340@mail','esto es su cirriculuim','itc');
/*!40000 ALTER TABLE `tallerista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_user`
--

DROP TABLE IF EXISTS `tipo_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_user`
--

LOCK TABLES `tipo_user` WRITE;
/*!40000 ALTER TABLE `tipo_user` DISABLE KEYS */;
INSERT INTO `tipo_user` VALUES (1,'staff');
/*!40000 ALTER TABLE `tipo_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_reg` int(11) NOT NULL AUTO_INCREMENT,
  `correo` char(70) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `id_tipo` int(11) DEFAULT '1',
  `estatus` int(1) DEFAULT '0',
  `diploCongreso` tinyint(4) NOT NULL DEFAULT '0',
  `Registro` tinyint(4) NOT NULL DEFAULT '0',
  `descDiploma` tinyint(4) NOT NULL DEFAULT '0',
  `encuesta` bigint(20) NOT NULL,
  `tarjeta` bigint(20) NOT NULL,
  PRIMARY KEY (`correo`),
  UNIQUE KEY `id_reg` (`id_reg`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `DependeDeConacad` FOREIGN KEY (`correo`) REFERENCES `conacad`.`usuarios` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'15030093@itcelaya.edu.mx',1,0,0,0,0,10,10),(2,'15030094@itcelaya.edu.mx',1,0,0,0,0,10,10),(3,'15030095@itcelaya.edu.mx',1,1,2,3,3,3,3),(4,'15030096@itcelaya.edu.mx',1,1,2,3,3,3,3),(5,'15030097@itcelaya.edu.mx',1,1,2,3,3,3,3),(6,'15030098@itcelaya.edu.mx',1,1,2,3,3,3,3),(7,'15030099@itcelaya.edu.mx',1,1,2,3,3,3,3),(8,'15030100@itcelaya.edu.mx',1,1,2,3,3,3,3),(10,'15030101@itcelaya.edu.mx',1,1,2,3,3,3,3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visita_indus`
--

DROP TABLE IF EXISTS `visita_indus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visita_indus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `costo` double NOT NULL,
  `cupo` int(11) NOT NULL,
  `Descripcion` text NOT NULL,
  `Observaciones` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visita_indus`
--

LOCK TABLES `visita_indus` WRITE;
/*!40000 ALTER TABLE `visita_indus` DISABLE KEYS */;
INSERT INTO `visita_indus` VALUES (2,'bimbi','2018-10-11','13:00:00',35,15,'descripcion','esto es una observacion'),(3,'tecno','2018-10-27','13:00:00',35,15,'descripcion','esta es una observacion');
/*!40000 ALTER TABLE `visita_indus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-02 18:37:33
