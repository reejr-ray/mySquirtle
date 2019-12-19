CREATE DATABASE  IF NOT EXISTS `pokedex` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pokedex`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: pokedex
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `evolution_chains`
--

DROP TABLE IF EXISTS `evolution_chains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evolution_chains` (
  `evolution_chain_id` int(11) NOT NULL AUTO_INCREMENT,
  `chain_1_pokemon_id` int(11) NOT NULL,
  `chain_2_pokemon_id` int(11) DEFAULT NULL,
  `chain_3_pokemon_id` int(11) DEFAULT NULL,
  `condition_1` varchar(45) DEFAULT NULL,
  `condition_2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`evolution_chain_id`),
  KEY `chain_1_idx` (`chain_1_pokemon_id`),
  KEY `chain_2_idx` (`chain_2_pokemon_id`),
  KEY `chain_3_idx` (`chain_3_pokemon_id`),
  CONSTRAINT `chain_1` FOREIGN KEY (`chain_1_pokemon_id`) REFERENCES `pokemon` (`pokemon_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `chain_2` FOREIGN KEY (`chain_2_pokemon_id`) REFERENCES `pokemon` (`pokemon_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `chain_3` FOREIGN KEY (`chain_3_pokemon_id`) REFERENCES `pokemon` (`pokemon_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evolution_chains`
--

LOCK TABLES `evolution_chains` WRITE;
/*!40000 ALTER TABLE `evolution_chains` DISABLE KEYS */;
INSERT INTO `evolution_chains` VALUES (1,1,2,3,NULL,NULL),(2,4,5,6,NULL,NULL),(3,7,8,9,NULL,NULL);
/*!40000 ALTER TABLE `evolution_chains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_badges`
--

DROP TABLE IF EXISTS `gym_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_badges` (
  `gym_badge_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`gym_badge_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_badges`
--

LOCK TABLES `gym_badges` WRITE;
/*!40000 ALTER TABLE `gym_badges` DISABLE KEYS */;
INSERT INTO `gym_badges` VALUES (1,'Pewter City Gym','Rock'),(2,'Cerulean City Gym','Water'),(3,'Vermillion City Gym','Electric');
/*!40000 ALTER TABLE `gym_badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `progress_index` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Route 1',0),(2,'Route 2',0),(3,'Viridian Forest',0);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poke_locations`
--

DROP TABLE IF EXISTS `poke_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poke_locations` (
  `poke_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `pokemon_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`poke_location_id`),
  KEY `pokemon_idx` (`pokemon_id`),
  KEY `location_idx` (`location_id`),
  CONSTRAINT `location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `pokemon` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`pokemon_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poke_locations`
--

LOCK TABLES `poke_locations` WRITE;
/*!40000 ALTER TABLE `poke_locations` DISABLE KEYS */;
INSERT INTO `poke_locations` VALUES (1,16,1),(2,16,1),(3,25,1);
/*!40000 ALTER TABLE `poke_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon` (
  `pokemon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `height` decimal(8,2) DEFAULT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `progress_index` int(11) NOT NULL DEFAULT '0',
  `type_1_id` int(11) DEFAULT NULL,
  `type_2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pokemon_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `primary_type_idx` (`type_1_id`),
  KEY `secondary_type_idx` (`type_2_id`),
  CONSTRAINT `primary_type` FOREIGN KEY (`type_1_id`) REFERENCES `types` (`type_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `secondary_type` FOREIGN KEY (`type_2_id`) REFERENCES `types` (`type_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (1,'Bulbasaur','It can go for days without eating a single morsel. In the bulb\n             on its back, it stores energy.',0.70,6.90,0,5,8),(2,'Ivysaur','The bulb on its back grows by drawing energy. It gives off an aroma when it is ready to bloom.',1.00,13.00,0,5,8),(3,'Venasaur','The flower on its back catches the sun\'s rays. The sunlight is then absorbed and used for energy.',2.00,100.00,0,5,8),(4,'Charmander','The flame at the tip of its tail makes a sound as it burns. You\n             can only hear it in quiet places.',0.60,8.50,0,2,NULL),(5,'Charmeleon','Tough fights could excite this Pokémon. When excited, it may\n             blow out bluish-white flames.',1.10,19.00,0,2,NULL),(6,'Charizard','When expelling a blast of super hot fire, the red flame on the\n             tip of its tail burns more intensely.',1.70,90.50,0,2,NULL),(7,'Squirtle','Shoots water at prey while in the water. Withdraws into its\n             shell when in danger.',0.50,9.00,0,3,NULL),(8,'Wartortle','When tapped, this Pokémon will pull in its head, but its tail\n             will still stick out a little bit.',1.00,22.50,0,3,NULL),(9,'Blastoise','Once it takes aim at its enemy, it blasts out water with even\n             more force than a firehose.',1.60,85.50,0,3,NULL),(11,'Metapod','Hardens its shell to protect itself. However, a large impact\n              may cause it to pop out of its shell',0.70,9.90,0,12,NULL),(12,'Butterfree','Its wings, covered with poisonous powders, repel water. This\n              allows it to fly in the rain.',1.10,32.00,0,12,10),(16,'Pidgey','Very docile. If attacked, it will often kick up sand to protect\n              itself rather than fight back.',0.30,1.80,0,1,10),(17,'Pidgeotto','This Pokémon is full of vitality. It constantly flies around\n              its large territory in search of prey.',1.10,30.00,0,1,10),(18,'Pidgeot','This Pokémon flies at Mach 2 speed, seeking prey. Its large\n              talons are feared as wicked weapons.',1.50,39.50,0,1,10),(25,'Pikachu','It keeps its tail raised to monitor its surroundings. If you\n              yank its tail, it will try to bite you.',0.40,6.00,0,4,NULL),(26,'Raichu','When electricity builds up inside its body, it becomes feisty.\n              It also glows in the dark.',0.80,30.00,0,4,NULL),(27,'Sandshrew','Its body is dry. When it gets cold at night, its hide is said\n              to become coated with a fine dew.',0.60,12.00,0,4,NULL),(28,'Sandslash','It is skilled at slashing enemies with his claws. If broken,\n              they start to grow back in a day.',1.00,29.50,0,4,NULL),(74,'Geodude','Often mistaken for rocks. If you step on it, it will get angry.',0.40,20.00,0,13,9),(75,'Graveler','Often seen rolling down mountain trails. Obstacles are just\n              things to roll straight over, not avoid.',1.00,105.00,0,13,9),(76,'Golem','Once it sheds its skin, its body turns tender and whitish. Its\n              hide hardens when it\'s exposed to air.',1.40,300.00,0,13,9),(87,'Dewgong','Its entire body is a snowy-white. Unharmed by even intense\n              cold, it swims powerfully in icy waters.',1.70,120.00,0,3,6),(92,'Gastly','Said to appear in decrepit, deserted buildings. It has no real\n              shape as it appears to be made of gas.',1.30,0.10,0,14,8),(93,'Haunter','By licking, it saps the victim\'s life. It causes shaking that\n              won\'t stop until the victim\'s demise.',1.60,0.10,0,14,8),(94,'Gengar','A Gengar is close by if you feel a sudden chill. It may be\n              trying to lay a curse on you.',1.50,40.50,0,14,8),(106,'Hitmonlee','When kicking, the sole of its foot turns as hard as a diamond\n               on impact and destroys its enemy.',1.50,49.80,0,7,NULL),(107,'Hitmonchan','Punches in cork-screw fashion. It can punch its way through a\n               concrete wall the same way as a drill.',1.40,50.20,0,7,NULL),(122,'Mr. Mime','Always practices its pantomime act. It makes enemies believe\n               something exists that really doesn\'t.',1.30,54.50,0,11,NULL),(147,'Dratini','The existence of this mythical Pokémon was only recently\n               confirmed by a fisherman who caught one.',1.80,3.30,0,15,NULL),(148,'Dragonair','According to a witness, its body was surrounded by a strange\n               aura that gave it a mystical look.',4.00,16.50,0,15,NULL),(149,'Dragonite','It is said that this Pokémon lives somewhere in the sea and\n               that it flies. However, it is only a rumor.',2.20,210.00,0,15,7);
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `trainer_id` int(11) NOT NULL,
  `slot_1_pokemon_id` int(11) DEFAULT NULL,
  `slot_1_level` int(11) DEFAULT NULL,
  `slot_2_pokemon_id` int(11) DEFAULT NULL,
  `slot_2_level` int(11) DEFAULT NULL,
  `slot_3_pokemon_id` int(11) DEFAULT NULL,
  `slot_3_level` int(11) DEFAULT NULL,
  `slot_4_pokemon_id` int(11) DEFAULT NULL,
  `slot_4_level` int(11) DEFAULT NULL,
  `slot_5_pokemon_id` int(11) DEFAULT NULL,
  `slot_5_level` int(11) DEFAULT NULL,
  `slot_6_pokemon_id` int(11) DEFAULT NULL,
  `slot_6_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  KEY `owner_idx` (`trainer_id`),
  KEY `slot_1_idx` (`slot_1_pokemon_id`),
  KEY `slot_2_idx` (`slot_2_pokemon_id`),
  KEY `slot_3_idx` (`slot_3_pokemon_id`),
  KEY `slot_4_idx` (`slot_4_pokemon_id`),
  KEY `slot_5_idx` (`slot_5_pokemon_id`),
  KEY `slot_6_idx` (`slot_6_pokemon_id`),
  CONSTRAINT `owner` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `slot_1` FOREIGN KEY (`slot_1_pokemon_id`) REFERENCES `pokemon` (`pokemon_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `slot_2` FOREIGN KEY (`slot_2_pokemon_id`) REFERENCES `pokemon` (`pokemon_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `slot_3` FOREIGN KEY (`slot_3_pokemon_id`) REFERENCES `pokemon` (`pokemon_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `slot_4` FOREIGN KEY (`slot_4_pokemon_id`) REFERENCES `pokemon` (`pokemon_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `slot_5` FOREIGN KEY (`slot_5_pokemon_id`) REFERENCES `pokemon` (`pokemon_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `slot_6` FOREIGN KEY (`slot_6_pokemon_id`) REFERENCES `pokemon` (`pokemon_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,1,3,7,11,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,2,6,7,12,7,16,7,NULL,NULL,NULL,NULL,NULL,NULL),(3,3,9,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_locations`
--

DROP TABLE IF EXISTS `trainer_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer_locations` (
  `trainer_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `trainer_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`trainer_location_id`),
  KEY `trainer_idx` (`trainer_id`),
  KEY `location_idx` (`location_id`),
  CONSTRAINT `trainer` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `trainer's_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_locations`
--

LOCK TABLES `trainer_locations` WRITE;
/*!40000 ALTER TABLE `trainer_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainer_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `trainer_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `progress_index` int(11) NOT NULL DEFAULT '1',
  `rival_index` int(11) NOT NULL DEFAULT '0',
  `gym_badge_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`trainer_id`),
  KEY `type_idx` (`type_id`),
  KEY `gym_badge_idx` (`gym_badge_id`),
  CONSTRAINT `gym_badge` FOREIGN KEY (`gym_badge_id`) REFERENCES `gym_badges` (`gym_badge_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `type` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (1,NULL,'Bug Catcher',0,0,1),(2,NULL,'Bug Catcher',0,0,1),(3,NULL,'Bug Catcher',0,0,1);
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_effectiveness`
--

DROP TABLE IF EXISTS `type_effectiveness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_effectiveness` (
  `type_effectiveness_id` int(11) NOT NULL AUTO_INCREMENT,
  `attacking_type` int(11) NOT NULL,
  `defending_type` int(11) NOT NULL,
  `effectiveness` decimal(2,1) NOT NULL,
  PRIMARY KEY (`type_effectiveness_id`),
  KEY `attacker_idx` (`attacking_type`),
  KEY `defender_idx` (`defending_type`),
  CONSTRAINT `attacker` FOREIGN KEY (`attacking_type`) REFERENCES `types` (`type_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `defender` FOREIGN KEY (`defending_type`) REFERENCES `types` (`type_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_effectiveness`
--

LOCK TABLES `type_effectiveness` WRITE;
/*!40000 ALTER TABLE `type_effectiveness` DISABLE KEYS */;
INSERT INTO `type_effectiveness` VALUES (1,1,1,1.0),(2,1,2,1.0),(3,1,3,1.0),(4,1,4,1.0),(5,1,5,1.0),(6,1,6,1.0),(7,1,7,1.0),(8,1,8,1.0),(9,1,9,1.0),(10,1,10,1.0),(11,1,11,1.0),(12,1,12,1.0),(13,1,13,0.5),(14,1,14,0.0),(15,1,15,1.0),(16,2,2,1.0),(17,2,2,0.5),(18,2,3,0.5),(19,2,4,1.0),(20,2,5,2.0),(21,2,6,2.0),(22,2,7,1.0),(23,2,8,1.0),(24,2,9,1.0),(25,2,10,1.0),(26,2,11,1.0),(27,2,12,2.0),(28,2,13,0.5),(29,2,14,1.0),(30,2,15,0.5),(31,3,1,1.0),(32,3,2,2.0),(33,3,3,0.5),(34,3,4,1.0),(35,3,5,0.5),(36,3,6,1.0),(37,3,7,1.0),(38,3,8,1.0),(39,3,9,1.0),(40,3,10,1.0),(41,3,11,1.0),(42,3,12,1.0),(43,3,13,2.0),(44,3,14,1.0),(45,3,15,0.5),(46,4,1,1.0),(47,4,2,1.0),(48,4,3,2.0),(49,4,4,0.5),(50,4,5,0.5),(51,4,6,1.0),(52,4,7,1.0),(53,4,8,1.0),(54,4,9,0.0),(55,4,10,2.0),(56,4,11,1.0),(57,4,12,1.0),(58,4,13,1.0),(59,4,14,1.0),(60,4,15,0.5),(61,5,1,1.0),(62,5,2,0.5),(63,5,3,2.0),(64,5,4,1.0),(65,5,5,0.5),(66,5,6,1.0),(67,5,7,1.0),(68,5,8,0.5),(69,5,9,2.0),(70,5,10,0.5),(71,5,11,1.0),(72,5,12,0.5),(73,5,13,2.0),(74,5,14,1.0),(75,5,15,0.5),(76,6,1,1.0),(77,6,2,1.0),(78,6,3,0.5),(79,6,4,1.0),(80,6,5,2.0),(81,6,6,0.5),(82,6,7,1.0),(83,6,8,1.0),(84,6,9,2.0),(85,6,10,2.0),(86,6,11,1.0),(87,6,12,1.0),(88,6,13,1.0),(89,6,14,1.0),(90,6,15,2.0),(91,7,1,2.0),(92,7,2,1.0),(93,7,3,1.0),(94,7,4,1.0),(95,7,5,1.0),(96,7,6,2.0),(97,7,7,1.0),(98,7,8,0.5),(99,7,9,1.0),(100,7,10,0.5),(101,7,11,0.5),(102,7,12,0.5),(103,7,13,2.0),(104,7,14,0.0),(105,7,15,1.0),(106,8,1,1.0),(107,8,2,1.0),(108,8,3,1.0),(109,8,4,1.0),(110,8,5,2.0),(111,8,6,1.0),(112,8,7,1.0),(113,8,8,0.5),(114,8,9,0.5),(115,8,10,1.0),(116,8,11,1.0),(117,8,12,2.0),(118,8,13,0.5),(119,8,14,0.5),(120,8,15,1.0),(121,9,1,1.0),(122,9,2,2.0),(123,9,3,1.0),(124,9,4,2.0),(125,9,5,0.5),(126,9,6,1.0),(127,9,7,1.0),(128,9,8,2.0),(129,9,9,1.0),(130,9,10,0.0),(131,9,11,1.0),(132,9,12,0.5),(133,9,13,2.0),(134,9,14,1.0),(135,9,15,1.0),(136,10,1,1.0),(137,10,2,1.0),(138,10,3,1.0),(139,10,4,0.5),(140,10,5,2.0),(141,10,6,1.0),(142,10,7,2.0),(143,10,8,1.0),(144,10,9,1.0),(145,10,10,1.0),(146,10,11,1.0),(147,10,12,2.0),(148,10,13,0.5),(149,10,14,1.0),(150,10,15,1.0),(151,11,1,1.0),(152,11,2,1.0),(153,11,3,1.0),(154,11,4,1.0),(155,11,5,1.0),(156,11,6,1.0),(157,11,7,2.0),(158,11,8,2.0),(159,11,9,1.0),(160,11,10,1.0),(161,11,11,0.5),(162,11,12,1.0),(163,11,13,1.0),(164,11,14,1.0),(165,11,15,1.0),(166,12,1,1.0),(167,12,2,0.5),(168,12,3,1.0),(169,12,4,1.0),(170,12,5,2.0),(171,12,6,1.0),(172,12,7,0.5),(173,12,8,2.0),(174,12,9,1.0),(175,12,10,0.5),(176,12,11,2.0),(177,12,12,1.0),(178,12,13,1.0),(179,12,14,0.5),(180,12,15,1.0),(181,13,1,1.0),(182,13,2,2.0),(183,13,3,1.0),(184,13,4,1.0),(185,13,5,1.0),(186,13,6,2.0),(187,13,7,0.5),(188,13,8,1.0),(189,13,9,0.5),(190,13,10,2.0),(191,13,11,1.0),(192,13,12,2.0),(193,13,13,1.0),(194,13,14,1.0),(195,13,15,1.0),(196,14,1,0.0),(197,14,2,1.0),(198,14,3,1.0),(199,14,4,1.0),(200,14,5,1.0),(201,14,6,1.0),(202,14,7,1.0),(203,14,8,1.0),(204,14,9,1.0),(205,14,10,1.0),(206,14,11,0.0),(207,14,12,1.0),(208,14,13,1.0),(209,14,14,2.0),(210,14,15,1.0),(211,15,1,1.0),(212,15,2,1.0),(213,15,3,1.0),(214,15,4,1.0),(215,15,5,1.0),(216,15,6,1.0),(217,15,7,1.0),(218,15,8,1.0),(219,15,9,1.0),(220,15,10,1.0),(221,15,11,1.0),(222,15,12,1.0),(223,15,13,1.0),(224,15,14,1.0),(225,15,15,2.0);
/*!40000 ALTER TABLE `type_effectiveness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Normal'),(2,'Fire'),(3,'Water'),(4,'Electric'),(5,'Grass'),(6,'Ice'),(7,'Fighting'),(8,'Poison'),(9,'Ground'),(10,'Flying'),(11,'Psychic'),(12,'Bug'),(13,'Rock'),(14,'Ghost'),(15,'Dragon');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-18  9:25:48
