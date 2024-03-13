-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: clinicaads2024
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `ambulatorio`
--

DROP TABLE IF EXISTS `ambulatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ambulatorio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `numleitos` int DEFAULT NULL,
  `andar` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambulatorio`
--

LOCK TABLES `ambulatorio` WRITE;
/*!40000 ALTER TABLE `ambulatorio` DISABLE KEYS */;
INSERT INTO `ambulatorio` VALUES (1,'pediatrico',10,1),(2,'geriatrico',5,0),(3,'ortopédico',15,0),(4,'generalidades',15,1);
/*!40000 ALTER TABLE `ambulatorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atende`
--

DROP TABLE IF EXISTS `atende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atende` (
  `medico` int NOT NULL,
  `convenio` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `medico_convenio` (`medico`,`convenio`),
  KEY `fkmedico_convenio2` (`convenio`),
  CONSTRAINT `fkmedico_convenio` FOREIGN KEY (`medico`) REFERENCES `medico` (`crm`),
  CONSTRAINT `fkmedico_convenio2` FOREIGN KEY (`convenio`) REFERENCES `convenio` (`codconv`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atende`
--

LOCK TABLES `atende` WRITE;
/*!40000 ALTER TABLE `atende` DISABLE KEYS */;
INSERT INTO `atende` VALUES (7646,189,1),(7646,232,2),(7873,435,3),(7873,908,4),(9898,232,5),(9898,435,6),(18739,189,7),(18739,908,8),(32029,435,9),(32029,908,10),(39872,189,11),(39872,232,14),(39872,908,16),(87568,454,12),(89876,454,13);
/*!40000 ALTER TABLE `atende` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Ambulatório',7,'add_ambulatorio'),(26,'Can change Ambulatório',7,'change_ambulatorio'),(27,'Can delete Ambulatório',7,'delete_ambulatorio'),(28,'Can view Ambulatório',7,'view_ambulatorio'),(29,'Can add Consulta',8,'add_consulta'),(30,'Can change Consulta',8,'change_consulta'),(31,'Can delete Consulta',8,'delete_consulta'),(32,'Can view Consulta',8,'view_consulta'),(33,'Can add Convênio',9,'add_convenio'),(34,'Can change Convênio',9,'change_convenio'),(35,'Can delete Convênio',9,'delete_convenio'),(36,'Can view Convênio',9,'view_convenio'),(37,'Can add Médico Convênio',10,'add_atende'),(38,'Can change Médico Convênio',10,'change_atende'),(39,'Can delete Médico Convênio',10,'delete_atende'),(40,'Can view Médico Convênio',10,'view_atende'),(41,'Can add Médico',11,'add_medico'),(42,'Can change Médico',11,'change_medico'),(43,'Can delete Médico',11,'delete_medico'),(44,'Can view Médico',11,'view_medico'),(45,'Can add Paciente',12,'add_paciente'),(46,'Can change Paciente',12,'change_paciente'),(47,'Can delete Paciente',12,'delete_paciente'),(48,'Can view Paciente',12,'view_paciente'),(49,'Can add Paciente x Convênio',13,'add_possui'),(50,'Can change Paciente x Convênio',13,'change_possui'),(51,'Can delete Paciente x Convênio',13,'delete_possui'),(52,'Can view Paciente x Convênio',13,'view_possui');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$vEX9bBba5WhGl10rBC2oEq$Zf3CRlFEe/qQr1domK3dI54gK4IVU6U8OfDGnbsH00c=','2024-02-29 01:12:20.706145',1,'admin','','','admin@admin.com.br',1,1,'2024-02-29 01:11:08.365700');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `horario` time DEFAULT NULL,
  `medico` int DEFAULT NULL,
  `paciente` int DEFAULT NULL,
  `convenio` int DEFAULT NULL,
  `porcent` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medico` (`medico`),
  KEY `paciente` (`paciente`),
  KEY `convenio` (`convenio`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`medico`) REFERENCES `medico` (`crm`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`paciente`) REFERENCES `paciente` (`id`),
  CONSTRAINT `consulta_ibfk_3` FOREIGN KEY (`convenio`) REFERENCES `convenio` (`codconv`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (1,'2013-05-10','10:00:00',18739,1,189,5.00),(2,'2013-05-12','10:00:00',7646,2,232,10.00),(3,'2013-05-12','11:00:00',18739,3,908,15.00),(4,'2013-05-13','10:00:00',7646,4,435,13.00),(5,'2013-05-14','13:00:00',7646,2,232,10.00),(6,'2013-05-14','14:00:00',39872,1,435,5.00),(7,'2017-06-14','10:00:00',87568,13,189,5.00),(8,'2017-06-15','14:00:00',7873,12,232,5.00),(9,'2017-06-15','14:00:00',89876,11,189,15.00),(10,'2017-06-16','08:00:00',7873,10,232,25.00),(11,'2017-06-17','08:00:00',87568,9,908,5.00),(12,'2017-06-17','14:00:00',18739,8,189,15.00),(13,'2017-06-17','10:00:00',89876,7,454,10.00),(14,'2017-06-18','16:00:00',89876,6,189,7.00),(15,'2017-07-01','13:00:00',32029,5,908,3.00),(16,'2017-07-02','15:00:00',87568,4,189,50.00),(17,'2017-07-03','10:00:00',7873,11,454,5.00),(18,'2017-07-04','15:00:00',39872,12,189,35.00),(19,'2017-07-04','11:00:00',32029,13,454,5.00),(20,'2017-07-04','17:00:00',87568,11,435,15.00);
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convenio`
--

DROP TABLE IF EXISTS `convenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convenio` (
  `codconv` int NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codconv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convenio`
--

LOCK TABLES `convenio` WRITE;
/*!40000 ALTER TABLE `convenio` DISABLE KEYS */;
INSERT INTO `convenio` VALUES (189,'Cassi'),(232,'Unimed'),(435,'São Lucas'),(454,'Santa Casa'),(908,'Copasa');
/*!40000 ALTER TABLE `convenio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-02-29 01:13:47.624862','89876','João Carneiro',2,'[{\"changed\": {\"fields\": [\"Endereco\"]}}]',11,1),(2,'2024-02-29 01:17:36.552817','9898','Marcos Alves Faino',1,'[{\"added\": {}}, {\"added\": {\"name\": \"M\\u00e9dico Conv\\u00eanio\", \"object\": \"Dr. Marcos Alves Faino atende conv\\u00eanio Unimed\"}}]',11,1),(3,'2024-02-29 01:18:33.336240','9898','Marcos Alves Faino',2,'[]',11,1),(4,'2024-02-29 01:42:12.619083','87568','Adib',2,'[{\"changed\": {\"name\": \"M\\u00e9dico Conv\\u00eanio\", \"object\": \"Dr. Adib atende conv\\u00eanio Cassi\", \"fields\": [\"Convenio\"]}}]',11,1),(5,'2024-02-29 01:42:23.473765','87568','Adib',2,'[{\"changed\": {\"name\": \"M\\u00e9dico Conv\\u00eanio\", \"object\": \"Dr. Adib atende conv\\u00eanio Santa Casa\", \"fields\": [\"Convenio\"]}}]',11,1),(6,'2024-03-07 02:02:06.105655','16','Dr. Pedro atende convênio Copasa',1,'[{\"added\": {}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'core','ambulatorio'),(10,'core','atende'),(8,'core','consulta'),(9,'core','convenio'),(11,'core','medico'),(12,'core','paciente'),(13,'core','possui'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-02-29 00:33:15.760304'),(2,'auth','0001_initial','2024-02-29 00:33:16.142548'),(3,'admin','0001_initial','2024-02-29 00:33:16.238570'),(4,'admin','0002_logentry_remove_auto_add','2024-02-29 00:33:16.245650'),(5,'admin','0003_logentry_add_action_flag_choices','2024-02-29 00:33:16.252781'),(6,'contenttypes','0002_remove_content_type_name','2024-02-29 00:33:16.315929'),(7,'auth','0002_alter_permission_name_max_length','2024-02-29 00:33:16.354237'),(8,'auth','0003_alter_user_email_max_length','2024-02-29 00:33:16.373320'),(9,'auth','0004_alter_user_username_opts','2024-02-29 00:33:16.392396'),(10,'auth','0005_alter_user_last_login_null','2024-02-29 00:33:16.430817'),(11,'auth','0006_require_contenttypes_0002','2024-02-29 00:33:16.432812'),(12,'auth','0007_alter_validators_add_error_messages','2024-02-29 00:33:16.439854'),(13,'auth','0008_alter_user_username_max_length','2024-02-29 00:33:16.514785'),(14,'auth','0009_alter_user_last_name_max_length','2024-02-29 00:33:16.568338'),(15,'auth','0010_alter_group_name_max_length','2024-02-29 00:33:16.583297'),(16,'auth','0011_update_proxy_permissions','2024-02-29 00:33:16.589281'),(17,'auth','0012_alter_user_first_name_max_length','2024-02-29 00:33:16.636438'),(18,'core','0001_initial','2024-02-29 01:11:24.057237'),(19,'sessions','0001_initial','2024-02-29 01:11:24.143363'),(20,'core','0002_alter_atende_options','2024-03-06 23:36:57.952578');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6ubmuf9det0xuigixrxd2m65yyq0m41d','.eJxVjDsOwjAQBe_iGlmx8W8p6XMGa23v4gBypDipEHeHSCmgfTPzXiLitta4dVriVMRFKHH63RLmB7UdlDu22yzz3NZlSnJX5EG7HOdCz-vh_h1U7PVb25LIegBTHNMQLOOZKQeTfNKBvSanMhtAA6AdOkajBtZeBVIAoLR4fwD4VTfJ:1rfUyC:qa4SdKNIOogfSm7pr-EkS4lfHumvjSPEeIJ0JBF8SC8','2024-03-14 01:12:20.713124');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `crm` int NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  `endereco` varchar(250) DEFAULT NULL,
  `telefone` char(15) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `salario` decimal(12,2) DEFAULT NULL,
  `idamb` int DEFAULT NULL,
  PRIMARY KEY (`crm`),
  KEY `idamb` (`idamb`),
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`idamb`) REFERENCES `ambulatorio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (7646,'Ana','Obstetricia','Av Z','7829-1233',65,6452.32,4),(7873,'Eustaquio','Pediatria',NULL,NULL,43,4535.43,1),(9898,'Marcos Alves Faino','Cirurgião','Rua dos Buracos, 233','(69)99989-6969',48,35000.00,4),(18739,'Elias','Pediatria','Rua X','8738-1221',34,7562.38,1),(32029,'Karla','Dermatologia',NULL,NULL,62,3284.43,2),(39872,'Pedro','Oftalmologia','Tv H','9888-2333',42,4739.42,2),(87568,'Adib','Traumatologia',NULL,NULL,37,12543.12,3),(89876,'João Carneiro','Traumatologia','Rua X nº 213',NULL,53,12354.43,3);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `endereco` varchar(250) DEFAULT NULL,
  `telefone` char(15) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `idamb` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idamb` (`idamb`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`idamb`) REFERENCES `ambulatorio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Joao','Rua 1','9809-9756','Ariquemes',22,4),(2,'Jose','Rua B','3621-8978','Porto Velho',53,3),(3,'Maria','Rua 10','4567-9872','Jaru',68,2),(4,'Joana','Rua J','3343-9889','Ariquemes',34,3),(5,'Alfredo','Rua X','8989-0383','Ji-Paraná',32,4),(6,'Joaquim','Rua A','9898-0134','Jaru',87,2),(7,'Ana','Rua W','9384-8920','Ji-Paraná',21,3),(8,'Analice','Rua 2','9834-1123','Jaru',12,1),(9,'Caio','Av Central','9849-2313','Ariquemes',31,3),(10,'Eduardo','Av Goytacazes',NULL,'Ariquemes',11,1),(11,'Lourenço',NULL,'8787-3454','Ariquemes',52,4),(12,'Miqueias','Av 1',NULL,'Porto Velho',42,4),(13,'Fabricio','Av 2','7679-0927','Monte Negro',51,3);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possui`
--

DROP TABLE IF EXISTS `possui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `possui` (
  `paciente` int NOT NULL,
  `convenio` int NOT NULL,
  `tipo` char(1) DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  PRIMARY KEY (`paciente`,`convenio`),
  KEY `convenio` (`convenio`),
  CONSTRAINT `possui_ibfk_1` FOREIGN KEY (`paciente`) REFERENCES `paciente` (`id`),
  CONSTRAINT `possui_ibfk_2` FOREIGN KEY (`convenio`) REFERENCES `convenio` (`codconv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possui`
--

LOCK TABLES `possui` WRITE;
/*!40000 ALTER TABLE `possui` DISABLE KEYS */;
INSERT INTO `possui` VALUES (1,189,'E','2016-12-31'),(1,232,'S','2015-12-31'),(2,232,'S','2014-12-31'),(3,908,'S','2017-12-31'),(4,435,'E','2016-12-31'),(5,435,'S','2017-12-31'),(6,232,'E','2015-12-31'),(7,189,'S','2015-12-31'),(8,454,'E','2017-12-31'),(10,908,'E','2017-12-31'),(11,435,'S','2017-12-31'),(12,908,'E','2015-12-31'),(13,189,'S','2017-12-31');
/*!40000 ALTER TABLE `possui` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-06 22:06:43
