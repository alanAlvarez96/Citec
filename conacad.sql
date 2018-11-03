-- MySQL dump 10.16  Distrib 10.1.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: conacad
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
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `nmbr` char(30) NOT NULL,
  `apllds` char(35) NOT NULL,
  `email` char(70) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `genero` char(1) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `pwd` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT '',
  `user` varchar(13) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT '',
  `tpo` char(1) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT '',
  `accesos` int(11) NOT NULL DEFAULT '0',
  `fecha_ult_acceso` date NOT NULL DEFAULT '0000-00-00',
  `hora_ult_acceso` time NOT NULL DEFAULT '00:00:00',
  `conectado` char(1) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT '',
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT '',
  `avatar` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT '',
  `foto` varchar(18) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT '',
  `navegador` char(13) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT '',
  `fech_Ingreso` date NOT NULL,
  `sistOperativo` char(17) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `HT_grado` char(10) NOT NULL,
  `HT_isRevisor` char(1) NOT NULL,
  `HT_isEditor` char(1) NOT NULL,
  `HT_Institucion` varchar(80) NOT NULL,
  `geneEncuesta` int(1) NOT NULL DEFAULT '0',
  `usua_citec` char(1) NOT NULL,
  `acce_bloqueado` tinyint(4) NOT NULL DEFAULT '0',
  `idInstitucion` int(11) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('alan','alvarez','15030093@itcelaya.edu.mx','m','mafg1212','alan','',0,'0000-00-00','00:00:00','','','','','','2018-10-17','windows','1','0','0','0',0,'y',0,1),('alan','alvarez','15030094@itcelaya.edu.mx','m','mafg1212','ale','',0,'0000-00-00','00:00:00','','','','','','2018-10-17','windows','1','0','0','0',0,'y',0,1),('user5','alvarez','15030095@itcelaya.edu.mx','m','mafg1212','u5','',0,'2018-10-16','00:00:00','','','','','','2018-10-16','windows','1','0','0','0',0,'y',0,1),('user6','alvarez','15030096@itcelaya.edu.mx','m','mafg1212','u6','',0,'2018-10-16','00:00:00','','','','','','2018-10-16','windows','1','0','0','0',0,'y',0,1),('user7','alvarez','15030097@itcelaya.edu.mx','m','mafg1212','u7','',0,'2018-10-16','00:00:00','','','','','','2018-10-16','windows','1','0','0','0',0,'y',0,1),('user8','alvarez','15030098@itcelaya.edu.mx','m','mafg1212','u8','',0,'2018-10-16','00:00:00','','','','','','2018-10-16','windows','1','0','0','0',0,'y',0,1),('user9','alvarez','15030099@itcelaya.edu.mx','m','mafg1212','u9','',0,'2018-10-16','00:00:00','','','','','','2018-10-16','windows','1','0','0','0',0,'y',0,1),('user10','alvarez','15030100@itcelaya.edu.mx','m','mafg1212','u10','',0,'2018-10-16','00:00:00','','','','','','2018-10-16','windows','1','0','0','0',0,'y',0,1),('user11','alvarez','15030101@itcelaya.edu.mx','m','mafg1212','u11','',0,'2018-10-16','00:00:00','','','','','','2018-10-16','windows','1','0','0','0',0,'y',0,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`alanC`@`localhost`*/ /*!50003 TRIGGER `insertUsuario` AFTER INSERT ON `usuarios`
 FOR EACH ROW BEGIN
IF NEW.email not REGEXP '(.*)@(.*).(.*)'  
then
   delete from usuarios where email=New.email;
END IF;
END */;;
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

-- Dump completed on 2018-11-02 18:34:28
