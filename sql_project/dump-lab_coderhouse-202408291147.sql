-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: lab_coderhouse
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `bioquimico`
--

DROP TABLE IF EXISTS `bioquimico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bioquimico` (
  `legajo` int NOT NULL,
  `dni` int NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `sucursal` enum('Flores','San Justo','Caballito') DEFAULT NULL,
  `matricula` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`legajo`),
  UNIQUE KEY `matricula` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bioquimico`
--

LOCK TABLES `bioquimico` WRITE;
/*!40000 ALTER TABLE `bioquimico` DISABLE KEYS */;
INSERT INTO `bioquimico` VALUES (1,23456789,'Mariana','GÃ³mez','1985-04-12','123456789','Flores',1001,NULL),(2,34567890,'Carlos','LÃ³pez','1978-09-23','987654321','San Justo',1002,NULL),(3,45678901,'Ana','PÃ©rez','1990-11-05','456123789','Caballito',1003,NULL),(4,56789012,'Jorge','MartÃ­nez','1982-06-17','321654987','Flores',1004,NULL);
/*!40000 ALTER TABLE `bioquimico` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_bioquimico` BEFORE INSERT ON `bioquimico` FOR EACH ROW BEGIN
    DECLARE temp_legajo INT;

    INSERT INTO personal (nombre, apellido, fecha_de_nacimiento, telefono, email, dni, sucursal, puesto, matricula)
    VALUES (NEW.nombre, NEW.apellido, NEW.fecha_de_nacimiento, NEW.telefono, CONCAT(NEW.nombre, '@correo.com'), NEW.dni, NEW.sucursal, 'Bioquímico', NEW.matricula);
    
    SET temp_legajo = LAST_INSERT_ID();
    
    SET NEW.legajo = temp_legajo;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `detalles_pacientes_estudios`
--

DROP TABLE IF EXISTS `detalles_pacientes_estudios`;
/*!50001 DROP VIEW IF EXISTS `detalles_pacientes_estudios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detalles_pacientes_estudios` AS SELECT 
 1 AS `dni_paciente`,
 1 AS `nombre_paciente`,
 1 AS `apellido_paciente`,
 1 AS `telefono_paciente`,
 1 AS `fecha_turno`,
 1 AS `nombre_estudio`,
 1 AS `id_resultado`,
 1 AS `estado_resultado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `detalles_pacientes_estudios_completos`
--

DROP TABLE IF EXISTS `detalles_pacientes_estudios_completos`;
/*!50001 DROP VIEW IF EXISTS `detalles_pacientes_estudios_completos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detalles_pacientes_estudios_completos` AS SELECT 
 1 AS `dni_paciente`,
 1 AS `nombre_paciente`,
 1 AS `apellido_paciente`,
 1 AS `telefono_paciente`,
 1 AS `fecha_turno`,
 1 AS `nombre_estudio`,
 1 AS `id_resultado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `duenio`
--

DROP TABLE IF EXISTS `duenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `duenio` (
  `dni` int NOT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `apellido` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duenio`
--

LOCK TABLES `duenio` WRITE;
/*!40000 ALTER TABLE `duenio` DISABLE KEYS */;
INSERT INTO `duenio` VALUES (15421745,'juan','coderhouse');
/*!40000 ALTER TABLE `duenio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudio`
--

DROP TABLE IF EXISTS `estudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudio` (
  `nombre` varchar(80) NOT NULL,
  `precio` int NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudio`
--

LOCK TABLES `estudio` WRITE;
/*!40000 ALTER TABLE `estudio` DISABLE KEYS */;
INSERT INTO `estudio` VALUES ('Ácido Úrico',6700),('Albumina',6400),('Amilasa',7500),('Anticuerpos Anti-TG',8200),('Anticuerpos Anti-TPO',8100),('Anticuerpos Antinucleares',6800),('Bilirrubina Directa',7100),('Bilirrubina Indirecta',7200),('Bilirrubina Total',7000),('Calcio',6900),('Células Tumorales',7000),('Citoquímica',7400),('Colesterol Total',5500),('Creatinina',6500),('Electrolitos',6800),('Factor Reumatoide',6900),('Ferremia',8500),('Ferritina',8700),('Fosfatasa Alcalina',7200),('Fósforo',6200),('Gases en Sangre',7200),('GGT',7300),('Globulinas',6500),('Glucosa',6200),('Hematocrito',5800),('Hemoglobina',5900),('Hemoglobina Glicosilada',8000),('Hemograma',5800),('Hepatitis A',7300),('Hepatitis B',6400),('Hepatitis C',6500),('HIV',6300),('LDH',7400),('Leucocitos',6000),('Lipasa',7600),('Microalbuminuria',7500),('PCR',6600),('Plaquetas',6100),('Potasio',6700),('Procalcitonina',6700),('Proteínas Totales',6300),('Prueba de Embarazo',7100),('Sodio',6500),('T3 Libre',7800),('T4 Libre',7700),('Transaminasas (ALT)',7000),('Transaminasas (AST)',7100),('Transferrina',8600),('Triglicéridos',6000),('TSH',7900),('Urea',6300),('Urocultivo',7600),('VDRL',6200),('Vitamina B12',8400),('Vitamina D',8300);
/*!40000 ALTER TABLE `estudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratorio`
--

DROP TABLE IF EXISTS `laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratorio` (
  `id_laboratorio` int NOT NULL AUTO_INCREMENT,
  `sucursal` varchar(30) DEFAULT NULL,
  `id_duenio` int NOT NULL DEFAULT '15421745',
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_laboratorio`),
  UNIQUE KEY `sucursal` (`sucursal`),
  KEY `fk_duenio` (`id_duenio`),
  CONSTRAINT `fk_duenio` FOREIGN KEY (`id_duenio`) REFERENCES `duenio` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorio`
--

LOCK TABLES `laboratorio` WRITE;
/*!40000 ALTER TABLE `laboratorio` DISABLE KEYS */;
INSERT INTO `laboratorio` VALUES (1,'Flores',15421745,'4477-5514'),(2,'San Justo',15421745,'4488-2211'),(3,'Caballito',15421745,'4487-5902');
/*!40000 ALTER TABLE `laboratorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `dni` int NOT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `apellido` varchar(80) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `domicilio` varchar(150) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (10123456,'Juan','Perez','1980-01-15','15-7733-2498','Avenida Corrientes 1234','juan.perez@hotmail.com'),(10234567,'Maria','Gomez','1992-03-22','4345-5345','Calle Florida 567','maria.gomez@live.com'),(10345678,'Carlos','Lopez','1985-05-30','15-6789-0134','Avenida Santa Fe 890','carlos.lopez@outlook.com'),(10456789,'Lucia','Fernandez','1978-07-19','4932-1023','Calle San Martín 456','lucia.fernandez@hotmail.com'),(10567890,'Roberto','Gonzalez','1990-11-25','15-8765-4321','Avenida Rivadavia 789','roberto.gonzalez@live.com'),(10678901,'Laura','Ramirez','1983-02-02','4782-6543','Calle Lavalle 1010','laura.ramirez@outlook.com'),(10789012,'Jose','Sanchez','1995-06-16','15-3214-9987','Avenida Belgrano 1122','jose.sanchez@hotmail.com'),(10890123,'Sofia','Diaz','1988-09-28','4115-8899','Calle Córdoba 1313','sofia.diaz@live.com'),(10901234,'Diego','Martinez','1975-12-04','15-5566-7788','Avenida de Mayo 1414','diego.martinez@outlook.com'),(11012345,'Valentina','Hernandez','1993-04-14','4801-2233','Calle Tucumán 1515','valentina.hernandez@hotmail.com'),(11123456,'Fernando','Alvarez','1982-08-23','15-1234-5678','Avenida Callao 1616','fernando.alvarez@live.com'),(11234567,'Martina','Garcia','1991-10-10','4833-4455','Calle Entre Ríos 1717','martina.garcia@outlook.com'),(11345678,'Matias','Morales','1987-03-08','15-9876-5432','Avenida Independencia 1818','matias.morales@hotmail.com'),(11456789,'Florencia','Ortiz','1984-07-17','4956-7788','Calle Maipú 1919','florencia.ortiz@live.com'),(11567890,'Ignacio','Dominguez','1996-11-21','15-6655-9988','Avenida Pueyrredón 2020','ignacio.dominguez@outlook.com'),(11678901,'Camila','Flores','1989-01-05','4211-3344','Calle Alberdi 2121','camila.flores@hotmail.com'),(11789012,'Nicolas','Cruz','1981-05-25','15-4321-1234','Avenida Juan B. Justo 2222','nicolas.cruz@live.com'),(11890123,'Daniela','Silva','1994-09-12','4388-7766','Calle Suipacha 2323','daniela.silva@outlook.com'),(11901234,'Julian','Mendez','1986-12-15','15-1111-2222','Avenida Corrientes 2424','julian.mendez@hotmail.com'),(12012345,'Alejandra','Castro','1979-03-30','4399-8877','Calle Defensa 2525','alejandra.castro@live.com'),(12123456,'Martin','Reyes','1992-06-22','15-3344-5566','Avenida Callao 2626','martin.reyes@outlook.com'),(12234567,'Paula','Peralta','1985-10-05','4902-8899','Calle Ayacucho 2727','paula.peralta@hotmail.com'),(12345678,'Esteban','Acosta','1981-08-09','15-7777-8888','Avenida 9 de Julio 2828','esteban.acosta@live.com'),(12456789,'Victoria','Rios','1993-11-19','4789-1122','Calle Tucumán 2929','victoria.rios@outlook.com'),(12567890,'Adrian','Vega','1988-04-02','15-2345-6789','Avenida Córdoba 3030','adrian.vega@hotmail.com'),(12678901,'Romina','Blanco','1977-12-24','4677-3344','Calle Florida 3131','romina.blanco@live.com'),(12789012,'Enrique','Farias','1984-05-17','15-9999-0000','Avenida Las Heras 3232','enrique.farias@outlook.com'),(12890123,'Carolina','Nunez','1995-07-21','4778-9900','Calle San Juan 3333','carolina.nunez@hotmail.com'),(12901234,'Facundo','Sosa','1980-11-13','15-8765-5432','Avenida Libertador 3434','facundo.sosa@live.com'),(13012345,'Natalia','Vallejos','1990-02-06','4987-5544','Calle Balcarce 3535','natalia.vallejos@outlook.com'),(13123456,'Pedro','Pineda','1987-09-09','15-2345-4321','Avenida Corrientes 3636','pedro.pineda@hotmail.com'),(13234567,'Eliana','Quinteros','1978-07-28','4521-6677','Calle Chacabuco 3737','eliana.quinteros@live.com'),(13345678,'Maximiliano','Franco','1991-06-15','15-9988-7766','Avenida Rivadavia 3838','maximiliano.franco@outlook.com'),(13456789,'Micaela','Ferrari','1983-03-27','4953-2233','Calle Viamonte 3939','micaela.ferrari@hotmail.com'),(13567890,'Andres','Cabrera','1994-10-12','15-9876-5432','Avenida Callao 4040','andres.cabrera@live.com'),(13678901,'Sabrina','Figueroa','1976-01-18','4310-4455','Calle Moreno 4141','sabrina.figueroa@outlook.com'),(13789012,'Rodrigo','Montes','1985-08-25','15-8765-4321','Avenida Belgrano 4242','rodrigo.montes@hotmail.com'),(13890123,'Milagros','Gutierrez','1993-12-01','4890-6677','Calle Paraguay 4343','milagros.gutierrez@live.com'),(13901234,'Luis','Molina','1979-02-22','15-1234-5678','Avenida San Juan 4444','luis.molina@outlook.com'),(14012345,'Antonella','Navarro','1987-04-29','4523-5566','Calle Maipú 4545','antonella.navarro@hotmail.com'),(14123456,'Bautista','Castillo','1996-11-11','15-9988-8877','Avenida Independencia 4646','bautista.castillo@live.com'),(14234567,'Celeste','Ibanez','1981-05-06','4700-3344','Calle Piedras 4747','celeste.ibanez@outlook.com'),(14345678,'Ezequiel','Suarez','1990-07-30','15-2233-4455','Avenida Alem 4848','ezequiel.suarez@hotmail.com'),(14456789,'Julieta','Aguilar','1989-09-16','4655-6677','Calle Salta 4949','julieta.aguilar@live.com'),(14567890,'Lorenzo','Bustos','1982-10-03','15-4455-6677','Avenida Entre Ríos 5050','lorenzo.bustos@outlook.com');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `precio` int NOT NULL,
  `tipo` enum('tarjeta debito','billetera virtual','efectivo') DEFAULT NULL,
  `fecha_de_pago` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pagos_por_tipo_y_fecha`
--

DROP TABLE IF EXISTS `pagos_por_tipo_y_fecha`;
/*!50001 DROP VIEW IF EXISTS `pagos_por_tipo_y_fecha`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pagos_por_tipo_y_fecha` AS SELECT 
 1 AS `fecha_de_pago`,
 1 AS `tipo_pago`,
 1 AS `cantidad_pagos`,
 1 AS `total_pagado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `legajo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `apellido` varchar(80) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dni` int NOT NULL,
  `sucursal` varchar(30) DEFAULT NULL,
  `puesto` varchar(40) DEFAULT NULL,
  `matricula` int DEFAULT NULL,
  PRIMARY KEY (`legajo`),
  UNIQUE KEY `dni` (`dni`),
  KEY `fk_sucursal` (`sucursal`),
  CONSTRAINT `fk_sucursal` FOREIGN KEY (`sucursal`) REFERENCES `laboratorio` (`sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Mariana','GÃ³mez','1985-04-12','123456789','Mariana@correo.com',23456789,'Flores','BioquÃ­mico',1001),(2,'Carlos','LÃ³pez','1978-09-23','987654321','Carlos@correo.com',34567890,'San Justo','BioquÃ­mico',1002),(3,'Ana','PÃ©rez','1990-11-05','456123789','Ana@correo.com',45678901,'Caballito','BioquÃ­mico',1003),(4,'Jorge','MartÃ­nez','1982-06-17','321654987','Jorge@correo.com',56789012,'Flores','BioquÃ­mico',1004),(5,'Carlos','GonzÃ¡lez','1984-06-15','1145678901','Carlos@correo.com',12965438,'Flores','TÃ©cnico',189034),(6,'MarÃ­a','LÃ³pez','1991-09-20','1156789012','MarÃ­a@correo.com',23568123,'San Justo','TÃ©cnico',290134),(7,'Juan','MartÃ­nez','1987-03-12','1167890123','Juan@correo.com',34561298,'Caballito','TÃ©cnico',453028),(8,'Laura','DÃ­az','1982-07-07','1178901234','Laura@correo.com',45237125,'Flores','TÃ©cnico',892715),(9,'Esteban','FernÃ¡ndez','1990-01-28','1189012345','Esteban@correo.com',56349120,'San Justo','TÃ©cnico',162839),(10,'Gabriela','PÃ©rez','1994-05-09','1190123456','Gabriela@correo.com',67891234,'Caballito','TÃ©cnico',459381),(11,'AndrÃ©s','Torres','1993-10-10','1101234567','AndrÃ©s@correo.com',78901345,'Flores','TÃ©cnico',238917),(12,'SofÃ­a','RamÃ­rez','1985-12-22','1123456789','SofÃ­a@correo.com',89012456,'San Justo','TÃ©cnico',487029),(13,'Luis','Moreno','1979-08-17','1134567890','Luis@correo.com',90123567,'Caballito','TÃ©cnico',543710),(14,'Ana','Vargas','1992-04-13','1145678901','Ana@correo.com',10234567,'Flores','TÃ©cnico',659103),(15,'Roberto','GutiÃ©rrez','1986-11-25','1156789012','Roberto@correo.com',21345678,'San Justo','TÃ©cnico',701235),(16,'Elena','Sosa','1983-03-03','1167890123','Elena@correo.com',32456789,'Caballito','TÃ©cnico',829013),(17,'Jorge','Reyes','1988-07-18','1178901234','Jorge@correo.com',43567890,'Flores','TÃ©cnico',932104),(18,'Marta','Castro','1975-02-15','1189012345','Marta@correo.com',54678901,'San Justo','TÃ©cnico',104920),(19,'Pedro','Ortiz','1981-09-14','1190123456','Pedro@correo.com',65789012,'Caballito','TÃ©cnico',117832),(20,'Valeria','MÃ©ndez','1989-11-14','1145678901','Valeria@correo.com',30567891,'Flores','Recepcionista',NULL),(21,'Camila','DomÃ­nguez','1993-02-05','1156789012','Camila@correo.com',41890712,'San Justo','Recepcionista',NULL),(22,'NicolÃ¡s','Herrera','1985-07-19','1167890123','NicolÃ¡s@correo.com',52345678,'Caballito','Recepcionista',NULL),(23,'LucÃ­a','GÃ³mez','1990-04-30','1178901234','LucÃ­a@correo.com',63781234,'Flores','Recepcionista',NULL),(24,'MartÃ­n','SÃ¡nchez','1988-09-25','1189012345','MartÃ­n@correo.com',74890213,'San Justo','Recepcionista',NULL),(25,'Romina','Vega','1992-06-12','1190123456','Romina@correo.com',85214367,'Caballito','Recepcionista',NULL),(26,'Diego','Navarro','1987-01-08','1101234567','Diego@correo.com',96783456,'Flores','Recepcionista',NULL);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcionista`
--

DROP TABLE IF EXISTS `recepcionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepcionista` (
  `legajo` int NOT NULL,
  `dni` int NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `sucursal` enum('Flores','San Justo','Caballito') DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`legajo`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcionista`
--

LOCK TABLES `recepcionista` WRITE;
/*!40000 ALTER TABLE `recepcionista` DISABLE KEYS */;
INSERT INTO `recepcionista` VALUES (20,30567891,'Valeria','MÃ©ndez','1989-11-14','Flores','1145678901',NULL),(21,41890712,'Camila','DomÃ­nguez','1993-02-05','San Justo','1156789012',NULL),(22,52345678,'NicolÃ¡s','Herrera','1985-07-19','Caballito','1167890123',NULL),(23,63781234,'LucÃ­a','GÃ³mez','1990-04-30','Flores','1178901234',NULL),(24,74890213,'MartÃ­n','SÃ¡nchez','1988-09-25','San Justo','1189012345',NULL),(25,85214367,'Romina','Vega','1992-06-12','Caballito','1190123456',NULL),(26,96783456,'Diego','Navarro','1987-01-08','Flores','1101234567',NULL);
/*!40000 ALTER TABLE `recepcionista` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_recepcionista` BEFORE INSERT ON `recepcionista` FOR EACH ROW BEGIN
    DECLARE temp_legajo INT;

    INSERT INTO personal (nombre, apellido, fecha_de_nacimiento, telefono, email, dni, sucursal, puesto)
    VALUES (NEW.nombre, NEW.apellido, NEW.fecha_de_nacimiento, NEW.telefono, CONCAT(NEW.nombre, '@correo.com'), NEW.dni, NEW.sucursal, 'Recepcionista');
    
    SET temp_legajo = LAST_INSERT_ID();

    SET NEW.legajo = temp_legajo;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `resultado`
--

DROP TABLE IF EXISTS `resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultado` (
  `id_resultado` varchar(105) NOT NULL,
  `sucursal` enum('Flores','San Justo','Caballito') DEFAULT NULL,
  `completo` tinyint(1) DEFAULT '0',
  `id_bioquimico` int DEFAULT NULL,
  `id_tecnico` int DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_resultado`),
  KEY `fk_bioquimico` (`id_bioquimico`),
  CONSTRAINT `fk_bioquimico` FOREIGN KEY (`id_bioquimico`) REFERENCES `bioquimico` (`legajo`),
  CONSTRAINT `fk_resultado_turno` FOREIGN KEY (`id_resultado`) REFERENCES `turno_estudio` (`turno_estudio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado`
--

LOCK TABLES `resultado` WRITE;
/*!40000 ALTER TABLE `resultado` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talon`
--

DROP TABLE IF EXISTS `talon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talon` (
  `numero_talon` int NOT NULL AUTO_INCREMENT,
  `id_turno` int NOT NULL,
  `id_laboratorio` int NOT NULL,
  `id_recepcionista` int NOT NULL,
  `id_pago` int NOT NULL,
  PRIMARY KEY (`numero_talon`),
  KEY `fk_laboratorio` (`id_laboratorio`),
  KEY `fk_turno` (`id_turno`),
  KEY `fk_recepcionista` (`id_recepcionista`),
  KEY `fk_pago` (`id_pago`),
  CONSTRAINT `fk_laboratorio` FOREIGN KEY (`id_laboratorio`) REFERENCES `laboratorio` (`id_laboratorio`),
  CONSTRAINT `fk_pago` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`),
  CONSTRAINT `fk_recepcionista` FOREIGN KEY (`id_recepcionista`) REFERENCES `recepcionista` (`legajo`),
  CONSTRAINT `fk_turno` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talon`
--

LOCK TABLES `talon` WRITE;
/*!40000 ALTER TABLE `talon` DISABLE KEYS */;
/*!40000 ALTER TABLE `talon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnico` (
  `legajo` int NOT NULL,
  `dni` int NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `sucursal` enum('Flores','San Justo','Caballito') DEFAULT NULL,
  `matricula` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`legajo`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `matricula` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico`
--

LOCK TABLES `tecnico` WRITE;
/*!40000 ALTER TABLE `tecnico` DISABLE KEYS */;
INSERT INTO `tecnico` VALUES (5,12965438,'Carlos','GonzÃ¡lez','1984-06-15','1145678901','Flores',189034,NULL),(6,23568123,'MarÃ­a','LÃ³pez','1991-09-20','1156789012','San Justo',290134,NULL),(7,34561298,'Juan','MartÃ­nez','1987-03-12','1167890123','Caballito',453028,NULL),(8,45237125,'Laura','DÃ­az','1982-07-07','1178901234','Flores',892715,NULL),(9,56349120,'Esteban','FernÃ¡ndez','1990-01-28','1189012345','San Justo',162839,NULL),(10,67891234,'Gabriela','PÃ©rez','1994-05-09','1190123456','Caballito',459381,NULL),(11,78901345,'AndrÃ©s','Torres','1993-10-10','1101234567','Flores',238917,NULL),(12,89012456,'SofÃ­a','RamÃ­rez','1985-12-22','1123456789','San Justo',487029,NULL),(13,90123567,'Luis','Moreno','1979-08-17','1134567890','Caballito',543710,NULL),(14,10234567,'Ana','Vargas','1992-04-13','1145678901','Flores',659103,NULL),(15,21345678,'Roberto','GutiÃ©rrez','1986-11-25','1156789012','San Justo',701235,NULL),(16,32456789,'Elena','Sosa','1983-03-03','1167890123','Caballito',829013,NULL),(17,43567890,'Jorge','Reyes','1988-07-18','1178901234','Flores',932104,NULL),(18,54678901,'Marta','Castro','1975-02-15','1189012345','San Justo',104920,NULL),(19,65789012,'Pedro','Ortiz','1981-09-14','1190123456','Caballito',117832,NULL);
/*!40000 ALTER TABLE `tecnico` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_tecnico` BEFORE INSERT ON `tecnico` FOR EACH ROW BEGIN
    DECLARE temp_legajo INT;

    INSERT INTO personal (nombre, apellido, fecha_de_nacimiento, telefono, email, dni, sucursal, puesto, matricula)
    VALUES (NEW.nombre, NEW.apellido, NEW.fecha_de_nacimiento, NEW.telefono, CONCAT(NEW.nombre, '@correo.com'), NEW.dni, NEW.sucursal, 'Técnico', NEW.matricula);
    
    SET temp_legajo = LAST_INSERT_ID();
    
    SET NEW.legajo = temp_legajo;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turno` (
  `id_turno` int NOT NULL AUTO_INCREMENT,
  `fecha_y_hora` datetime NOT NULL,
  `dni_paciente` int NOT NULL,
  `id_tecnico` int NOT NULL,
  PRIMARY KEY (`id_turno`),
  KEY `fk_paciente` (`dni_paciente`),
  KEY `fk_tecnico` (`id_tecnico`),
  CONSTRAINT `fk_paciente` FOREIGN KEY (`dni_paciente`) REFERENCES `paciente` (`dni`),
  CONSTRAINT `fk_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`legajo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno`
--

LOCK TABLES `turno` WRITE;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno_estudio`
--

DROP TABLE IF EXISTS `turno_estudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turno_estudio` (
  `estudio` varchar(80) NOT NULL,
  `id_turno` int NOT NULL,
  `turno_estudio` varchar(105) NOT NULL,
  PRIMARY KEY (`turno_estudio`),
  KEY `id_turno` (`id_turno`),
  KEY `estudio` (`estudio`),
  CONSTRAINT `turno_estudio_ibfk_1` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`),
  CONSTRAINT `turno_estudio_ibfk_2` FOREIGN KEY (`estudio`) REFERENCES `estudio` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno_estudio`
--

LOCK TABLES `turno_estudio` WRITE;
/*!40000 ALTER TABLE `turno_estudio` DISABLE KEYS */;
/*!40000 ALTER TABLE `turno_estudio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_turno_estudio` BEFORE INSERT ON `turno_estudio` FOR EACH ROW BEGIN
    SET NEW.turno_estudio = CONCAT(NEW.id_turno, '_', NEW.estudio);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `turnos_pendientes`
--

DROP TABLE IF EXISTS `turnos_pendientes`;
/*!50001 DROP VIEW IF EXISTS `turnos_pendientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `turnos_pendientes` AS SELECT 
 1 AS `id_turno`,
 1 AS `fecha_y_hora`,
 1 AS `nombre_paciente`,
 1 AS `apellido_paciente`,
 1 AS `nombre_estudio`,
 1 AS `nombre_tecnico`,
 1 AS `apellido_tecnico`,
 1 AS `resultado_completo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `turnos_sin_resultado`
--

DROP TABLE IF EXISTS `turnos_sin_resultado`;
/*!50001 DROP VIEW IF EXISTS `turnos_sin_resultado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `turnos_sin_resultado` AS SELECT 
 1 AS `id_turno`,
 1 AS `fecha_y_hora`,
 1 AS `dni_paciente`,
 1 AS `nombre_paciente`,
 1 AS `apellido_paciente`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'lab_coderhouse'
--
/*!50003 DROP FUNCTION IF EXISTS `laboratorio_que_mas_facturo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `laboratorio_que_mas_facturo`() RETURNS varchar(80) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_laboratorio_nombre VARCHAR(80);
    
    SELECT l.sucursal INTO v_laboratorio_nombre
    FROM laboratorio l
    JOIN talon t ON l.id_laboratorio = t.id_laboratorio
    JOIN pago p ON t.id_pago = p.id_pago
    GROUP BY l.id_laboratorio
    ORDER BY SUM(p.precio) DESC
    LIMIT 1;

    RETURN v_laboratorio_nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtener_ultimo_resultado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_ultimo_resultado`(dni_paciente INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_resultado_id VARCHAR(50);
    
    SELECT r.id_resultado INTO v_resultado_id
    FROM resultado r
    JOIN turno_estudio te ON r.id_resultado = te.turno_estudio
    JOIN turno t ON t.id_turno = te.id_turno
    WHERE t.dni_paciente = dni_paciente
    ORDER BY t.fecha_y_hora DESC
    LIMIT 1;
    
    RETURN v_resultado_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_estudios_bioquimico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_estudios_bioquimico`(bioquimico_legajo INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total_estudios INT;

    SELECT COUNT(*) INTO total_estudios
    FROM resultado r
    WHERE r.id_bioquimico = bioquimico_legajo;

    RETURN total_estudios;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crear_talon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_talon`(
    IN p_id_laboratorio INT,
    IN p_id_recepcionista INT,
    IN p_dni_paciente INT,
    IN p_estudios TEXT,
    IN p_id_tecnico INT,
    IN p_fecha_turno DATETIME,
    IN p_tipo_pago ENUM('tarjeta debito', 'billetera virtual', 'efectivo')
)
BEGIN
    DECLARE v_id_pago INT;
    DECLARE v_id_turno INT;
    DECLARE v_precio INT;
    DECLARE v_valid_lab INT;
    DECLARE v_valid_rec INT;
    DECLARE v_valid_pac INT;
    DECLARE v_valid_tec INT;
    DECLARE v_estudio VARCHAR(80);
    DECLARE v_precio_estudio INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR 
        SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(p_estudios, ',', numbers.n), ',', -1)) AS estudio
        FROM (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) numbers
        WHERE CHAR_LENGTH(p_estudios) - CHAR_LENGTH(REPLACE(p_estudios, ',', '')) >= numbers.n - 1;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

-- SABER SI EXISTE EL LAB, TECNICO, ETC
    SELECT COUNT(*) INTO v_valid_lab FROM laboratorio WHERE id_laboratorio = p_id_laboratorio;
    IF v_valid_lab = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Laboratorio no encontrado.';
    END IF;

    SELECT COUNT(*) INTO v_valid_rec FROM recepcionista WHERE legajo = p_id_recepcionista;
    IF v_valid_rec = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Recepcionista no encontrada.';
    END IF;

    SELECT COUNT(*) INTO v_valid_pac FROM paciente WHERE dni = p_dni_paciente;
    IF v_valid_pac = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Paciente no encontrado.';
    END IF;

    SELECT COUNT(*) INTO v_valid_tec FROM tecnico WHERE legajo = p_id_tecnico AND sucursal = (SELECT sucursal FROM laboratorio WHERE id_laboratorio = p_id_laboratorio);
    IF v_valid_tec = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Técnico no encontrado o no pertenece al laboratorio especificado.';
    END IF;

-- CREAR PAGO
    SET v_precio = 0;
    INSERT INTO pago (precio, tipo) VALUES (v_precio, p_tipo_pago);
    SET v_id_pago = LAST_INSERT_ID();

    INSERT INTO turno (fecha_y_hora, dni_paciente,  id_tecnico) 
    VALUES (p_fecha_turno, p_dni_paciente, p_id_tecnico);
    SET v_id_turno = LAST_INSERT_ID();

    INSERT INTO talon (id_turno, id_laboratorio, id_recepcionista, id_pago) 
    VALUES (v_id_turno, p_id_laboratorio, p_id_recepcionista, v_id_pago);

-- LOOP CON AYUDA DE chatGpt
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_estudio;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Verificar si el estudio existe y obtener el precio
        SELECT precio INTO v_precio_estudio FROM estudio WHERE nombre = v_estudio;
        IF v_precio_estudio IS NULL THEN
            SET @msg = CONCAT('Estudio "', v_estudio, '" no encontrado.');
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
        END IF;

        -- Actualizar el precio total
        SET v_precio = v_precio + v_precio_estudio;

        -- Insertar en la tabla turno_estudio
        INSERT INTO turno_estudio (estudio, id_turno) VALUES (v_estudio, v_id_turno);

    END LOOP;
    CLOSE cur;

    -- Actualizar el precio total en la tabla pago
    UPDATE pago SET precio = v_precio WHERE id_pago = v_id_pago;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generar_resultado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generar_resultado`(
    IN p_turno_estudio VARCHAR(105),
    IN p_legajo_tecnico INT,
    in p_sucursal ENUM ('Flores', 'San Justo', 'Caballito')
    )
BEGIN
    IF EXISTS (SELECT 1 FROM turno_estudio WHERE turno_estudio = p_turno_estudio) THEN
        INSERT INTO resultado (id_resultado, id_tecnico, fecha_creacion, sucursal)
        VALUES (p_turno_estudio, p_legajo_tecnico, CURRENT_TIMESTAMP, p_sucursal);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El turno_estudio no existe.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `detalles_pacientes_estudios`
--

/*!50001 DROP VIEW IF EXISTS `detalles_pacientes_estudios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detalles_pacientes_estudios` AS select `p`.`dni` AS `dni_paciente`,`p`.`nombre` AS `nombre_paciente`,`p`.`apellido` AS `apellido_paciente`,`p`.`telefono` AS `telefono_paciente`,`t`.`fecha_y_hora` AS `fecha_turno`,`e`.`nombre` AS `nombre_estudio`,`r`.`id_resultado` AS `id_resultado`,if((`r`.`completo` = true),'Completo','Incompleto') AS `estado_resultado` from ((((`paciente` `p` join `turno` `t` on((`p`.`dni` = `t`.`dni_paciente`))) join `turno_estudio` `te` on((`t`.`id_turno` = `te`.`id_turno`))) join `estudio` `e` on((`te`.`estudio` = `e`.`nombre`))) left join `resultado` `r` on((`r`.`id_resultado` = `te`.`turno_estudio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `detalles_pacientes_estudios_completos`
--

/*!50001 DROP VIEW IF EXISTS `detalles_pacientes_estudios_completos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detalles_pacientes_estudios_completos` AS select `p`.`dni` AS `dni_paciente`,`p`.`nombre` AS `nombre_paciente`,`p`.`apellido` AS `apellido_paciente`,`p`.`telefono` AS `telefono_paciente`,`t`.`fecha_y_hora` AS `fecha_turno`,`e`.`nombre` AS `nombre_estudio`,`r`.`id_resultado` AS `id_resultado` from ((((`paciente` `p` join `turno` `t` on((`p`.`dni` = `t`.`dni_paciente`))) join `turno_estudio` `te` on((`t`.`id_turno` = `te`.`id_turno`))) join `estudio` `e` on((`te`.`estudio` = `e`.`nombre`))) left join `resultado` `r` on((`r`.`id_resultado` = `t`.`id_turno`))) where (`r`.`completo` = true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pagos_por_tipo_y_fecha`
--

/*!50001 DROP VIEW IF EXISTS `pagos_por_tipo_y_fecha`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pagos_por_tipo_y_fecha` AS select `p`.`fecha_de_pago` AS `fecha_de_pago`,`p`.`tipo` AS `tipo_pago`,count(`p`.`id_pago`) AS `cantidad_pagos`,sum(`p`.`precio`) AS `total_pagado` from `pago` `p` group by `p`.`fecha_de_pago`,`p`.`tipo` order by `p`.`fecha_de_pago` desc,`p`.`tipo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `turnos_pendientes`
--

/*!50001 DROP VIEW IF EXISTS `turnos_pendientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `turnos_pendientes` AS select `t`.`id_turno` AS `id_turno`,`t`.`fecha_y_hora` AS `fecha_y_hora`,`p`.`nombre` AS `nombre_paciente`,`p`.`apellido` AS `apellido_paciente`,`e`.`nombre` AS `nombre_estudio`,`tec`.`nombre` AS `nombre_tecnico`,`tec`.`apellido` AS `apellido_tecnico`,`r`.`completo` AS `resultado_completo` from (((((`turno` `t` join `turno_estudio` `te` on((`t`.`id_turno` = `te`.`id_turno`))) join `paciente` `p` on((`t`.`dni_paciente` = `p`.`dni`))) join `estudio` `e` on((`te`.`estudio` = `e`.`nombre`))) left join `resultado` `r` on((`te`.`turno_estudio` = `r`.`id_resultado`))) join `tecnico` `tec` on((`t`.`id_tecnico` = `tec`.`legajo`))) where ((`r`.`completo` = false) or (`r`.`completo` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `turnos_sin_resultado`
--

/*!50001 DROP VIEW IF EXISTS `turnos_sin_resultado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `turnos_sin_resultado` AS select `t`.`id_turno` AS `id_turno`,`t`.`fecha_y_hora` AS `fecha_y_hora`,`p`.`dni` AS `dni_paciente`,`p`.`nombre` AS `nombre_paciente`,`p`.`apellido` AS `apellido_paciente` from ((`turno` `t` join `paciente` `p` on((`t`.`dni_paciente` = `p`.`dni`))) left join `resultado` `r` on((`t`.`id_turno` = `r`.`id_resultado`))) where (`r`.`id_resultado` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 11:48:51
