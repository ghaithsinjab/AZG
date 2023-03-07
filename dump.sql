-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: agz_strapi
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
-- Table structure for table `about_uses`
--

DROP TABLE IF EXISTS `about_uses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about_uses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb3_unicode_ci,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `values_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `about_uses_created_by_id_fk` (`created_by_id`),
  KEY `about_uses_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `about_uses_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `about_uses_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_uses`
--

LOCK TABLES `about_uses` WRITE;
/*!40000 ALTER TABLE `about_uses` DISABLE KEYS */;
INSERT INTO `about_uses` VALUES (1,'Our Company','<p>Established in 1990, AL ZAROUNI GROUP is one of the largest diversified enterprises in the country.</p><p>We see ourselves as a legacy of innovative businesses built on excellence, trust and responsibility. Our reach may have a global impact, but our roots are steeped in time-honoured family values that date back half a century.</p><p>In many ways, the AL ZAROUNI story and the history of the United Arab Emirates have been one narrative. Today, we stand proud in the knowledge of our achievements, and are embracing a future full of endless possibilities.</p>','2023-02-25 20:51:31.164000','2023-02-26 13:36:10.770000',1,1,'Our Values');
/*!40000 ALTER TABLE `about_uses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `about_uses_components`
--

DROP TABLE IF EXISTS `about_uses_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about_uses_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `about_uses_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `about_uses_field_index` (`field`),
  KEY `about_uses_component_type_index` (`component_type`),
  KEY `about_uses_entity_fk` (`entity_id`),
  CONSTRAINT `about_uses_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `about_uses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_uses_components`
--

LOCK TABLES `about_uses_components` WRITE;
/*!40000 ALTER TABLE `about_uses_components` DISABLE KEYS */;
INSERT INTO `about_uses_components` VALUES (1,1,1,'controls.content-box','highlights',1),(2,1,2,'controls.content-box','highlights',2),(5,1,3,'controls.content-box','values',1),(6,1,4,'controls.content-box','values',2);
/*!40000 ALTER TABLE `about_uses_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `conditions` json DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_permissions_created_by_id_fk` (`created_by_id`),
  KEY `admin_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'plugin::content-manager.explorer.create','plugin::navigation.audience','{\"fields\": [\"name\", \"key\"]}','[]','2023-02-21 20:41:56.554000','2023-02-21 20:41:56.554000',NULL,NULL),(2,'plugin::content-manager.explorer.read','plugin::navigation.audience','{\"fields\": [\"name\", \"key\"]}','[]','2023-02-21 20:41:56.567000','2023-02-21 20:41:56.567000',NULL,NULL),(3,'plugin::content-manager.explorer.update','plugin::navigation.audience','{\"fields\": [\"name\", \"key\"]}','[]','2023-02-21 20:41:56.582000','2023-02-21 20:41:56.582000',NULL,NULL),(4,'plugin::content-manager.explorer.delete','plugin::navigation.audience','{}','[]','2023-02-21 20:41:56.607000','2023-02-21 20:41:56.607000',NULL,NULL),(5,'plugin::upload.read',NULL,'{}','[]','2023-02-21 20:41:56.635000','2023-02-21 20:41:56.635000',NULL,NULL),(6,'plugin::upload.configure-view',NULL,'{}','[]','2023-02-21 20:41:56.667000','2023-02-21 20:41:56.667000',NULL,NULL),(7,'plugin::upload.assets.create',NULL,'{}','[]','2023-02-21 20:41:56.707000','2023-02-21 20:41:56.707000',NULL,NULL),(8,'plugin::upload.assets.update',NULL,'{}','[]','2023-02-21 20:41:56.738000','2023-02-21 20:41:56.738000',NULL,NULL),(9,'plugin::upload.assets.download',NULL,'{}','[]','2023-02-21 20:41:56.769000','2023-02-21 20:41:56.769000',NULL,NULL),(10,'plugin::upload.assets.copy-link',NULL,'{}','[]','2023-02-21 20:41:56.793000','2023-02-21 20:41:56.793000',NULL,NULL),(11,'plugin::content-manager.explorer.create','plugin::navigation.audience','{\"fields\": [\"name\", \"key\"]}','[\"admin::is-creator\"]','2023-02-21 20:41:56.810000','2023-02-21 20:41:56.810000',NULL,NULL),(12,'plugin::content-manager.explorer.read','plugin::navigation.audience','{\"fields\": [\"name\", \"key\"]}','[\"admin::is-creator\"]','2023-02-21 20:41:56.827000','2023-02-21 20:41:56.827000',NULL,NULL),(13,'plugin::content-manager.explorer.update','plugin::navigation.audience','{\"fields\": [\"name\", \"key\"]}','[\"admin::is-creator\"]','2023-02-21 20:41:56.846000','2023-02-21 20:41:56.846000',NULL,NULL),(14,'plugin::content-manager.explorer.delete','plugin::navigation.audience','{}','[\"admin::is-creator\"]','2023-02-21 20:41:56.875000','2023-02-21 20:41:56.875000',NULL,NULL),(15,'plugin::upload.read',NULL,'{}','[\"admin::is-creator\"]','2023-02-21 20:41:56.903000','2023-02-21 20:41:56.903000',NULL,NULL),(16,'plugin::upload.configure-view',NULL,'{}','[]','2023-02-21 20:41:56.944000','2023-02-21 20:41:56.944000',NULL,NULL),(17,'plugin::upload.assets.create',NULL,'{}','[]','2023-02-21 20:41:56.970000','2023-02-21 20:41:56.970000',NULL,NULL),(18,'plugin::upload.assets.update',NULL,'{}','[\"admin::is-creator\"]','2023-02-21 20:41:56.999000','2023-02-21 20:41:56.999000',NULL,NULL),(19,'plugin::upload.assets.download',NULL,'{}','[]','2023-02-21 20:41:57.028000','2023-02-21 20:41:57.028000',NULL,NULL),(20,'plugin::upload.assets.copy-link',NULL,'{}','[]','2023-02-21 20:41:57.053000','2023-02-21 20:41:57.053000',NULL,NULL),(21,'plugin::content-manager.explorer.create','plugin::users-permissions.user','{\"fields\": [\"username\", \"email\", \"provider\", \"password\", \"resetPasswordToken\", \"confirmationToken\", \"confirmed\", \"blocked\", \"role\"]}','[]','2023-02-21 20:41:57.120000','2023-02-21 20:41:57.120000',NULL,NULL),(22,'plugin::content-manager.explorer.create','plugin::navigation.audience','{\"fields\": [\"name\", \"key\"]}','[]','2023-02-21 20:41:57.133000','2023-02-21 20:41:57.133000',NULL,NULL),(23,'plugin::content-manager.explorer.read','plugin::users-permissions.user','{\"fields\": [\"username\", \"email\", \"provider\", \"password\", \"resetPasswordToken\", \"confirmationToken\", \"confirmed\", \"blocked\", \"role\"]}','[]','2023-02-21 20:41:57.156000','2023-02-21 20:41:57.156000',NULL,NULL),(24,'plugin::content-manager.explorer.read','plugin::navigation.audience','{\"fields\": [\"name\", \"key\"]}','[]','2023-02-21 20:41:57.170000','2023-02-21 20:41:57.170000',NULL,NULL),(25,'plugin::content-manager.explorer.update','plugin::users-permissions.user','{\"fields\": [\"username\", \"email\", \"provider\", \"password\", \"resetPasswordToken\", \"confirmationToken\", \"confirmed\", \"blocked\", \"role\"]}','[]','2023-02-21 20:41:57.185000','2023-02-21 20:41:57.185000',NULL,NULL),(26,'plugin::content-manager.explorer.update','plugin::navigation.audience','{\"fields\": [\"name\", \"key\"]}','[]','2023-02-21 20:41:57.200000','2023-02-21 20:41:57.200000',NULL,NULL),(27,'plugin::content-manager.explorer.delete','plugin::users-permissions.user','{}','[]','2023-02-21 20:41:57.215000','2023-02-21 20:41:57.215000',NULL,NULL),(28,'plugin::content-manager.explorer.delete','plugin::navigation.audience','{}','[]','2023-02-21 20:41:57.226000','2023-02-21 20:41:57.226000',NULL,NULL),(29,'plugin::content-manager.single-types.configure-view',NULL,'{}','[]','2023-02-21 20:41:57.241000','2023-02-21 20:41:57.241000',NULL,NULL),(30,'plugin::content-manager.collection-types.configure-view',NULL,'{}','[]','2023-02-21 20:41:57.258000','2023-02-21 20:41:57.258000',NULL,NULL),(31,'plugin::content-manager.components.configure-layout',NULL,'{}','[]','2023-02-21 20:41:57.275000','2023-02-21 20:41:57.275000',NULL,NULL),(32,'plugin::content-type-builder.read',NULL,'{}','[]','2023-02-21 20:41:57.293000','2023-02-21 20:41:57.293000',NULL,NULL),(33,'plugin::email.settings.read',NULL,'{}','[]','2023-02-21 20:41:57.309000','2023-02-21 20:41:57.309000',NULL,NULL),(34,'plugin::upload.read',NULL,'{}','[]','2023-02-21 20:41:57.325000','2023-02-21 20:41:57.325000',NULL,NULL),(35,'plugin::upload.assets.create',NULL,'{}','[]','2023-02-21 20:41:57.340000','2023-02-21 20:41:57.340000',NULL,NULL),(36,'plugin::upload.assets.update',NULL,'{}','[]','2023-02-21 20:41:57.357000','2023-02-21 20:41:57.357000',NULL,NULL),(37,'plugin::upload.assets.download',NULL,'{}','[]','2023-02-21 20:41:57.372000','2023-02-21 20:41:57.372000',NULL,NULL),(38,'plugin::upload.assets.copy-link',NULL,'{}','[]','2023-02-21 20:41:57.386000','2023-02-21 20:41:57.386000',NULL,NULL),(39,'plugin::upload.configure-view',NULL,'{}','[]','2023-02-21 20:41:57.399000','2023-02-21 20:41:57.399000',NULL,NULL),(40,'plugin::upload.settings.read',NULL,'{}','[]','2023-02-21 20:41:57.412000','2023-02-21 20:41:57.412000',NULL,NULL),(41,'plugin::i18n.locale.create',NULL,'{}','[]','2023-02-21 20:41:57.430000','2023-02-21 20:41:57.430000',NULL,NULL),(42,'plugin::i18n.locale.read',NULL,'{}','[]','2023-02-21 20:41:57.444000','2023-02-21 20:41:57.444000',NULL,NULL),(43,'plugin::i18n.locale.update',NULL,'{}','[]','2023-02-21 20:41:57.460000','2023-02-21 20:41:57.460000',NULL,NULL),(44,'plugin::i18n.locale.delete',NULL,'{}','[]','2023-02-21 20:41:57.480000','2023-02-21 20:41:57.480000',NULL,NULL),(45,'plugin::users-permissions.roles.create',NULL,'{}','[]','2023-02-21 20:41:57.493000','2023-02-21 20:41:57.493000',NULL,NULL),(46,'plugin::users-permissions.roles.read',NULL,'{}','[]','2023-02-21 20:41:57.508000','2023-02-21 20:41:57.508000',NULL,NULL),(47,'plugin::users-permissions.roles.update',NULL,'{}','[]','2023-02-21 20:41:57.520000','2023-02-21 20:41:57.520000',NULL,NULL),(48,'plugin::users-permissions.roles.delete',NULL,'{}','[]','2023-02-21 20:41:57.536000','2023-02-21 20:41:57.536000',NULL,NULL),(49,'plugin::users-permissions.providers.read',NULL,'{}','[]','2023-02-21 20:41:57.553000','2023-02-21 20:41:57.553000',NULL,NULL),(50,'plugin::users-permissions.providers.update',NULL,'{}','[]','2023-02-21 20:41:57.567000','2023-02-21 20:41:57.567000',NULL,NULL),(51,'plugin::users-permissions.email-templates.read',NULL,'{}','[]','2023-02-21 20:41:57.581000','2023-02-21 20:41:57.581000',NULL,NULL),(52,'plugin::users-permissions.email-templates.update',NULL,'{}','[]','2023-02-21 20:41:57.602000','2023-02-21 20:41:57.602000',NULL,NULL),(53,'plugin::users-permissions.advanced-settings.read',NULL,'{}','[]','2023-02-21 20:41:57.617000','2023-02-21 20:41:57.617000',NULL,NULL),(54,'plugin::users-permissions.advanced-settings.update',NULL,'{}','[]','2023-02-21 20:41:57.636000','2023-02-21 20:41:57.636000',NULL,NULL),(55,'plugin::navigation.read',NULL,'{}','[]','2023-02-21 20:41:57.651000','2023-02-21 20:41:57.651000',NULL,NULL),(56,'plugin::navigation.update',NULL,'{}','[]','2023-02-21 20:41:57.671000','2023-02-21 20:41:57.671000',NULL,NULL),(57,'admin::marketplace.read',NULL,'{}','[]','2023-02-21 20:41:57.688000','2023-02-21 20:41:57.688000',NULL,NULL),(60,'admin::webhooks.create',NULL,'{}','[]','2023-02-21 20:41:57.738000','2023-02-21 20:41:57.738000',NULL,NULL),(61,'admin::webhooks.read',NULL,'{}','[]','2023-02-21 20:41:57.758000','2023-02-21 20:41:57.758000',NULL,NULL),(62,'admin::webhooks.update',NULL,'{}','[]','2023-02-21 20:41:57.772000','2023-02-21 20:41:57.772000',NULL,NULL),(63,'admin::webhooks.delete',NULL,'{}','[]','2023-02-21 20:41:57.786000','2023-02-21 20:41:57.786000',NULL,NULL),(64,'admin::users.create',NULL,'{}','[]','2023-02-21 20:41:57.801000','2023-02-21 20:41:57.801000',NULL,NULL),(65,'admin::users.read',NULL,'{}','[]','2023-02-21 20:41:57.814000','2023-02-21 20:41:57.814000',NULL,NULL),(66,'admin::users.update',NULL,'{}','[]','2023-02-21 20:41:57.828000','2023-02-21 20:41:57.828000',NULL,NULL),(67,'admin::users.delete',NULL,'{}','[]','2023-02-21 20:41:57.843000','2023-02-21 20:41:57.843000',NULL,NULL),(68,'admin::roles.create',NULL,'{}','[]','2023-02-21 20:41:57.856000','2023-02-21 20:41:57.856000',NULL,NULL),(69,'admin::roles.read',NULL,'{}','[]','2023-02-21 20:41:57.872000','2023-02-21 20:41:57.872000',NULL,NULL),(70,'admin::roles.update',NULL,'{}','[]','2023-02-21 20:41:57.886000','2023-02-21 20:41:57.886000',NULL,NULL),(71,'admin::roles.delete',NULL,'{}','[]','2023-02-21 20:41:57.900000','2023-02-21 20:41:57.900000',NULL,NULL),(72,'admin::api-tokens.access',NULL,'{}','[]','2023-02-21 20:41:57.982000','2023-02-21 20:41:57.982000',NULL,NULL),(73,'admin::api-tokens.create',NULL,'{}','[]','2023-02-21 20:41:58.015000','2023-02-21 20:41:58.015000',NULL,NULL),(74,'admin::api-tokens.read',NULL,'{}','[]','2023-02-21 20:41:58.040000','2023-02-21 20:41:58.040000',NULL,NULL),(75,'admin::api-tokens.update',NULL,'{}','[]','2023-02-21 20:41:58.064000','2023-02-21 20:41:58.064000',NULL,NULL),(76,'admin::api-tokens.regenerate',NULL,'{}','[]','2023-02-21 20:41:58.086000','2023-02-21 20:41:58.086000',NULL,NULL),(77,'admin::api-tokens.delete',NULL,'{}','[]','2023-02-21 20:41:58.111000','2023-02-21 20:41:58.111000',NULL,NULL),(78,'admin::project-settings.update',NULL,'{}','[]','2023-02-21 20:41:58.134000','2023-02-21 20:41:58.134000',NULL,NULL),(79,'admin::project-settings.read',NULL,'{}','[]','2023-02-21 20:41:58.158000','2023-02-21 20:41:58.158000',NULL,NULL),(80,'plugin::content-manager.explorer.create','api::social-link.social-link','{\"fields\": [\"title\", \"icon\", \"url\"]}','[]','2023-02-22 19:03:55.480000','2023-02-22 19:03:55.480000',NULL,NULL),(81,'plugin::content-manager.explorer.read','api::social-link.social-link','{\"fields\": [\"title\", \"icon\", \"url\"]}','[]','2023-02-22 19:03:55.498000','2023-02-22 19:03:55.498000',NULL,NULL),(82,'plugin::content-manager.explorer.update','api::social-link.social-link','{\"fields\": [\"title\", \"icon\", \"url\"]}','[]','2023-02-22 19:03:55.512000','2023-02-22 19:03:55.512000',NULL,NULL),(83,'plugin::content-manager.explorer.delete','api::social-link.social-link','{}','[]','2023-02-22 19:03:55.526000','2023-02-22 19:03:55.526000',NULL,NULL),(84,'plugin::content-manager.explorer.publish','api::social-link.social-link','{}','[]','2023-02-22 19:03:55.543000','2023-02-22 19:03:55.543000',NULL,NULL),(88,'plugin::content-manager.explorer.delete','api::home-page.home-page','{}','[]','2023-02-22 20:38:00.969000','2023-02-22 20:38:00.969000',NULL,NULL),(95,'plugin::content-manager.explorer.create','api::service.service','{\"fields\": [\"title\", \"image\", \"url\"]}','[]','2023-02-22 22:57:18.371000','2023-02-22 22:57:18.371000',NULL,NULL),(96,'plugin::content-manager.explorer.read','api::service.service','{\"fields\": [\"title\", \"image\", \"url\"]}','[]','2023-02-22 22:57:18.394000','2023-02-22 22:57:18.394000',NULL,NULL),(97,'plugin::content-manager.explorer.update','api::service.service','{\"fields\": [\"title\", \"image\", \"url\"]}','[]','2023-02-22 22:57:18.418000','2023-02-22 22:57:18.418000',NULL,NULL),(98,'plugin::content-manager.explorer.delete','api::service.service','{}','[]','2023-02-22 22:57:18.437000','2023-02-22 22:57:18.437000',NULL,NULL),(99,'plugin::content-manager.explorer.publish','api::service.service','{}','[]','2023-02-22 22:57:18.458000','2023-02-22 22:57:18.458000',NULL,NULL),(103,'plugin::content-manager.explorer.create','api::home-page.home-page','{\"fields\": [\"slider.title\", \"slider.image\", \"slider.caption.title\", \"slider.caption.number\", \"slider.caption.details\", \"slider.caption.link_url\", \"slider.boxes.text\", \"about_us.title\", \"about_us.url\", \"about_us.image\", \"about_us.content\", \"business_section_title\", \"business_section_url\", \"business_section_link_title\", \"brief_section_title\", \"briefs.title\", \"briefs.number\", \"briefs.icon\"]}','[]','2023-02-23 21:22:36.141000','2023-02-23 21:22:36.141000',NULL,NULL),(104,'plugin::content-manager.explorer.read','api::home-page.home-page','{\"fields\": [\"slider.title\", \"slider.image\", \"slider.caption.title\", \"slider.caption.number\", \"slider.caption.details\", \"slider.caption.link_url\", \"slider.boxes.text\", \"about_us.title\", \"about_us.url\", \"about_us.image\", \"about_us.content\", \"business_section_title\", \"business_section_url\", \"business_section_link_title\", \"brief_section_title\", \"briefs.title\", \"briefs.number\", \"briefs.icon\"]}','[]','2023-02-23 21:22:36.183000','2023-02-23 21:22:36.183000',NULL,NULL),(105,'plugin::content-manager.explorer.update','api::home-page.home-page','{\"fields\": [\"slider.title\", \"slider.image\", \"slider.caption.title\", \"slider.caption.number\", \"slider.caption.details\", \"slider.caption.link_url\", \"slider.boxes.text\", \"about_us.title\", \"about_us.url\", \"about_us.image\", \"about_us.content\", \"business_section_title\", \"business_section_url\", \"business_section_link_title\", \"brief_section_title\", \"briefs.title\", \"briefs.number\", \"briefs.icon\"]}','[]','2023-02-23 21:22:36.220000','2023-02-23 21:22:36.220000',NULL,NULL),(109,'plugin::content-manager.explorer.delete','api::about-us.about-us','{}','[]','2023-02-25 20:37:07.302000','2023-02-25 20:37:07.302000',NULL,NULL),(110,'plugin::content-manager.explorer.create','api::about-us.about-us','{\"fields\": [\"title\", \"page_bar\", \"content_image\", \"content\", \"highlights.title\", \"highlights.text\", \"values_title\", \"values.title\", \"values.text\"]}','[]','2023-02-25 20:45:34.165000','2023-02-25 20:45:34.165000',NULL,NULL),(111,'plugin::content-manager.explorer.read','api::about-us.about-us','{\"fields\": [\"title\", \"page_bar\", \"content_image\", \"content\", \"highlights.title\", \"highlights.text\", \"values_title\", \"values.title\", \"values.text\"]}','[]','2023-02-25 20:45:34.208000','2023-02-25 20:45:34.208000',NULL,NULL),(112,'plugin::content-manager.explorer.update','api::about-us.about-us','{\"fields\": [\"title\", \"page_bar\", \"content_image\", \"content\", \"highlights.title\", \"highlights.text\", \"values_title\", \"values.title\", \"values.text\"]}','[]','2023-02-25 20:45:34.255000','2023-02-25 20:45:34.255000',NULL,NULL),(113,'plugin::content-manager.explorer.create','api::our-business.our-business','{\"fields\": [\"title\", \"page_bar\"]}','[]','2023-02-26 14:22:19.368000','2023-02-26 14:22:19.368000',NULL,NULL),(114,'plugin::content-manager.explorer.read','api::our-business.our-business','{\"fields\": [\"title\", \"page_bar\"]}','[]','2023-02-26 14:22:19.387000','2023-02-26 14:22:19.387000',NULL,NULL),(115,'plugin::content-manager.explorer.update','api::our-business.our-business','{\"fields\": [\"title\", \"page_bar\"]}','[]','2023-02-26 14:22:19.406000','2023-02-26 14:22:19.406000',NULL,NULL),(116,'plugin::content-manager.explorer.delete','api::our-business.our-business','{}','[]','2023-02-26 14:22:19.426000','2023-02-26 14:22:19.426000',NULL,NULL),(117,'plugin::content-manager.explorer.create','api::media-center.media-center','{\"fields\": [\"title\", \"page_bar\"]}','[]','2023-02-26 14:34:53.650000','2023-02-26 14:34:53.650000',NULL,NULL),(118,'plugin::content-manager.explorer.read','api::media-center.media-center','{\"fields\": [\"title\", \"page_bar\"]}','[]','2023-02-26 14:34:53.666000','2023-02-26 14:34:53.666000',NULL,NULL),(119,'plugin::content-manager.explorer.update','api::media-center.media-center','{\"fields\": [\"title\", \"page_bar\"]}','[]','2023-02-26 14:34:53.679000','2023-02-26 14:34:53.679000',NULL,NULL),(120,'plugin::content-manager.explorer.delete','api::media-center.media-center','{}','[]','2023-02-26 14:34:53.710000','2023-02-26 14:34:53.710000',NULL,NULL),(124,'plugin::content-manager.explorer.delete','api::media-item.media-item','{}','[]','2023-02-26 14:41:33.020000','2023-02-26 14:41:33.020000',NULL,NULL),(125,'plugin::content-manager.explorer.publish','api::media-item.media-item','{}','[]','2023-02-26 14:41:33.033000','2023-02-26 14:41:33.033000',NULL,NULL),(126,'plugin::content-manager.explorer.create','api::media-item.media-item','{\"fields\": [\"title\", \"url\", \"image\", \"youtube\"]}','[]','2023-02-26 20:40:55.765000','2023-02-26 20:40:55.765000',NULL,NULL),(127,'plugin::content-manager.explorer.read','api::media-item.media-item','{\"fields\": [\"title\", \"url\", \"image\", \"youtube\"]}','[]','2023-02-26 20:40:55.780000','2023-02-26 20:40:55.780000',NULL,NULL),(128,'plugin::content-manager.explorer.update','api::media-item.media-item','{\"fields\": [\"title\", \"url\", \"image\", \"youtube\"]}','[]','2023-02-26 20:40:55.795000','2023-02-26 20:40:55.795000',NULL,NULL),(129,'plugin::content-manager.explorer.create','api::career.career','{\"fields\": [\"title\", \"page_bar\"]}','[]','2023-02-26 21:23:25.251000','2023-02-26 21:23:25.251000',NULL,NULL),(130,'plugin::content-manager.explorer.read','api::career.career','{\"fields\": [\"title\", \"page_bar\"]}','[]','2023-02-26 21:23:25.267000','2023-02-26 21:23:25.267000',NULL,NULL),(131,'plugin::content-manager.explorer.update','api::career.career','{\"fields\": [\"title\", \"page_bar\"]}','[]','2023-02-26 21:23:25.281000','2023-02-26 21:23:25.281000',NULL,NULL),(132,'plugin::content-manager.explorer.delete','api::career.career','{}','[]','2023-02-26 21:23:25.301000','2023-02-26 21:23:25.301000',NULL,NULL),(133,'admin::transfer.tokens.access',NULL,'{}','[]','2023-03-02 19:06:44.129000','2023-03-02 19:06:44.129000',NULL,NULL),(134,'admin::transfer.tokens.create',NULL,'{}','[]','2023-03-02 19:06:44.147000','2023-03-02 19:06:44.147000',NULL,NULL),(135,'admin::transfer.tokens.read',NULL,'{}','[]','2023-03-02 19:06:44.162000','2023-03-02 19:06:44.162000',NULL,NULL),(136,'admin::transfer.tokens.update',NULL,'{}','[]','2023-03-02 19:06:44.189000','2023-03-02 19:06:44.189000',NULL,NULL),(137,'admin::transfer.tokens.regenerate',NULL,'{}','[]','2023-03-02 19:06:44.247000','2023-03-02 19:06:44.247000',NULL,NULL),(138,'admin::transfer.tokens.delete',NULL,'{}','[]','2023-03-02 19:06:44.277000','2023-03-02 19:06:44.277000',NULL,NULL),(139,'plugin::content-manager.explorer.create','api::vacancy.vacancy','{\"fields\": [\"title\", \"description\"]}','[]','2023-03-02 19:09:57.402000','2023-03-02 19:09:57.402000',NULL,NULL),(140,'plugin::content-manager.explorer.read','api::vacancy.vacancy','{\"fields\": [\"title\", \"description\"]}','[]','2023-03-02 19:09:57.422000','2023-03-02 19:09:57.422000',NULL,NULL),(141,'plugin::content-manager.explorer.update','api::vacancy.vacancy','{\"fields\": [\"title\", \"description\"]}','[]','2023-03-02 19:09:57.450000','2023-03-02 19:09:57.450000',NULL,NULL),(142,'plugin::content-manager.explorer.delete','api::vacancy.vacancy','{}','[]','2023-03-02 19:09:57.465000','2023-03-02 19:09:57.465000',NULL,NULL),(143,'plugin::content-manager.explorer.publish','api::vacancy.vacancy','{}','[]','2023-03-02 19:09:57.490000','2023-03-02 19:09:57.490000',NULL,NULL),(144,'plugin::content-manager.explorer.create','api::career-candidate.career-candidate','{\"fields\": [\"title\", \"first_name\", \"last_name\", \"email\", \"contact\", \"job_title\", \"cover_letter\"]}','[]','2023-03-03 23:55:10.956000','2023-03-03 23:55:10.956000',NULL,NULL),(145,'plugin::content-manager.explorer.read','api::career-candidate.career-candidate','{\"fields\": [\"title\", \"first_name\", \"last_name\", \"email\", \"contact\", \"job_title\", \"cover_letter\"]}','[]','2023-03-03 23:55:11.051000','2023-03-03 23:55:11.051000',NULL,NULL),(146,'plugin::content-manager.explorer.update','api::career-candidate.career-candidate','{\"fields\": [\"title\", \"first_name\", \"last_name\", \"email\", \"contact\", \"job_title\", \"cover_letter\"]}','[]','2023-03-03 23:55:11.089000','2023-03-03 23:55:11.089000',NULL,NULL),(147,'plugin::content-manager.explorer.delete','api::career-candidate.career-candidate','{}','[]','2023-03-03 23:55:11.116000','2023-03-03 23:55:11.116000',NULL,NULL),(148,'plugin::content-manager.explorer.create','api::contact.contact','{\"fields\": [\"title\", \"page_bar\", \"contact_info_title\", \"contact_info\"]}','[]','2023-03-04 14:35:54.559000','2023-03-04 14:35:54.559000',NULL,NULL),(149,'plugin::content-manager.explorer.read','api::contact.contact','{\"fields\": [\"title\", \"page_bar\", \"contact_info_title\", \"contact_info\"]}','[]','2023-03-04 14:35:54.574000','2023-03-04 14:35:54.574000',NULL,NULL),(150,'plugin::content-manager.explorer.update','api::contact.contact','{\"fields\": [\"title\", \"page_bar\", \"contact_info_title\", \"contact_info\"]}','[]','2023-03-04 14:35:54.594000','2023-03-04 14:35:54.594000',NULL,NULL),(151,'plugin::content-manager.explorer.delete','api::contact.contact','{}','[]','2023-03-04 14:35:54.611000','2023-03-04 14:35:54.611000',NULL,NULL),(152,'plugin::content-manager.explorer.create','api::contact-request.contact-request','{\"fields\": [\"name\", \"email\", \"contact\", \"message\"]}','[]','2023-03-04 14:48:29.771000','2023-03-04 14:48:29.771000',NULL,NULL),(153,'plugin::content-manager.explorer.read','api::contact-request.contact-request','{\"fields\": [\"name\", \"email\", \"contact\", \"message\"]}','[]','2023-03-04 14:48:29.789000','2023-03-04 14:48:29.789000',NULL,NULL),(154,'plugin::content-manager.explorer.update','api::contact-request.contact-request','{\"fields\": [\"name\", \"email\", \"contact\", \"message\"]}','[]','2023-03-04 14:48:29.809000','2023-03-04 14:48:29.809000',NULL,NULL),(155,'plugin::content-manager.explorer.delete','api::contact-request.contact-request','{}','[]','2023-03-04 14:48:29.835000','2023-03-04 14:48:29.835000',NULL,NULL),(156,'plugin::content-manager.explorer.create','api::search-page.search-page','{\"fields\": [\"title\", \"page_bar\"]}','[]','2023-03-05 10:14:23.713000','2023-03-05 10:14:23.713000',NULL,NULL),(157,'plugin::content-manager.explorer.read','api::search-page.search-page','{\"fields\": [\"title\", \"page_bar\"]}','[]','2023-03-05 10:14:23.739000','2023-03-05 10:14:23.739000',NULL,NULL),(158,'plugin::content-manager.explorer.update','api::search-page.search-page','{\"fields\": [\"title\", \"page_bar\"]}','[]','2023-03-05 10:14:23.772000','2023-03-05 10:14:23.772000',NULL,NULL),(159,'plugin::content-manager.explorer.delete','api::search-page.search-page','{}','[]','2023-03-05 10:14:23.790000','2023-03-05 10:14:23.790000',NULL,NULL);
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions_role_links`
--

DROP TABLE IF EXISTS `admin_permissions_role_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions_role_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_role_links_unique` (`permission_id`,`role_id`),
  KEY `admin_permissions_role_links_fk` (`permission_id`),
  KEY `admin_permissions_role_links_inv_fk` (`role_id`),
  KEY `admin_permissions_role_links_order_inv_fk` (`permission_order`),
  CONSTRAINT `admin_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions_role_links`
--

LOCK TABLES `admin_permissions_role_links` WRITE;
/*!40000 ALTER TABLE `admin_permissions_role_links` DISABLE KEYS */;
INSERT INTO `admin_permissions_role_links` VALUES (1,1,2,1),(2,2,2,2),(3,3,2,3),(4,4,2,4),(5,5,2,5),(6,6,2,6),(7,7,2,7),(8,8,2,8),(9,9,2,9),(10,10,2,10),(11,11,3,1),(12,12,3,2),(13,13,3,3),(14,14,3,4),(15,15,3,5),(16,16,3,6),(17,17,3,7),(18,18,3,8),(19,19,3,9),(20,20,3,10),(21,21,1,1),(22,22,1,2),(23,23,1,3),(24,24,1,4),(25,25,1,5),(26,26,1,6),(27,27,1,7),(28,28,1,8),(29,29,1,9),(30,30,1,10),(31,31,1,11),(32,32,1,12),(33,33,1,13),(34,34,1,14),(35,35,1,15),(36,36,1,16),(37,37,1,17),(38,38,1,18),(39,39,1,19),(40,40,1,20),(41,41,1,21),(42,42,1,22),(43,43,1,23),(44,44,1,24),(45,45,1,25),(46,46,1,26),(47,47,1,27),(48,48,1,28),(49,49,1,29),(50,50,1,30),(51,51,1,31),(52,52,1,32),(53,53,1,33),(54,54,1,34),(55,55,1,35),(56,56,1,36),(57,57,1,37),(60,60,1,40),(61,61,1,41),(62,62,1,42),(63,63,1,43),(64,64,1,44),(65,65,1,45),(66,66,1,46),(67,67,1,47),(68,68,1,48),(69,69,1,49),(70,70,1,50),(71,71,1,51),(72,72,1,52),(73,73,1,53),(74,74,1,54),(75,75,1,55),(76,76,1,56),(77,77,1,57),(78,78,1,58),(79,79,1,59),(80,80,1,60),(81,81,1,61),(82,82,1,62),(83,83,1,63),(84,84,1,64),(88,88,1,68),(95,95,1,72),(96,96,1,73),(97,97,1,74),(98,98,1,75),(99,99,1,76),(103,103,1,77),(104,104,1,78),(105,105,1,79),(109,109,1,83),(110,110,1,84),(111,111,1,85),(112,112,1,86),(113,113,1,87),(114,114,1,88),(115,115,1,89),(116,116,1,90),(117,117,1,91),(118,118,1,92),(119,119,1,93),(120,120,1,94),(124,124,1,98),(125,125,1,99),(126,126,1,100),(127,127,1,101),(128,128,1,102),(129,129,1,103),(130,130,1,104),(131,131,1,105),(132,132,1,106),(133,133,1,107),(134,134,1,108),(135,135,1,109),(136,136,1,110),(137,137,1,111),(138,138,1,112),(139,139,1,113),(140,140,1,114),(141,141,1,115),(142,142,1,116),(143,143,1,117),(144,144,1,118),(145,145,1,119),(146,146,1,120),(147,147,1,121),(148,148,1,122),(149,149,1,123),(150,150,1,124),(151,151,1,125),(152,152,1,126),(153,153,1,127),(154,154,1,128),(155,155,1,129),(156,156,1,130),(157,157,1,131),(158,158,1,132),(159,159,1,133);
/*!40000 ALTER TABLE `admin_permissions_role_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_roles_created_by_id_fk` (`created_by_id`),
  KEY `admin_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Super Admin','strapi-super-admin','Super Admins can access and manage all features and settings.','2023-02-21 20:41:56.522000','2023-02-21 20:41:56.522000',NULL,NULL),(2,'Editor','strapi-editor','Editors can manage and publish contents including those of other users.','2023-02-21 20:41:56.534000','2023-02-21 20:41:56.534000',NULL,NULL),(3,'Author','strapi-author','Authors can manage the content they have created.','2023-02-21 20:41:56.541000','2023-02-21 20:41:56.541000',NULL,NULL);
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reset_password_token` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `registration_token` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `prefered_language` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_users_created_by_id_fk` (`created_by_id`),
  KEY `admin_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'Ghaith','Sinjab',NULL,'g.sinjab@egv.com.lb','$2a$10$e4A1NC9jAw1oELTPb35sluplRP7KLatfywK.pZv2h8Owecw1QC0Q.',NULL,NULL,1,0,NULL,'2023-02-21 20:44:14.981000','2023-02-21 20:44:14.981000',NULL,NULL);
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users_roles_links`
--

DROP TABLE IF EXISTS `admin_users_roles_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users_roles_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `role_order` double unsigned DEFAULT NULL,
  `user_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_roles_links_unique` (`user_id`,`role_id`),
  KEY `admin_users_roles_links_fk` (`user_id`),
  KEY `admin_users_roles_links_inv_fk` (`role_id`),
  KEY `admin_users_roles_links_order_fk` (`role_order`),
  KEY `admin_users_roles_links_order_inv_fk` (`user_order`),
  CONSTRAINT `admin_users_roles_links_fk` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_users_roles_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users_roles_links`
--

LOCK TABLES `admin_users_roles_links` WRITE;
/*!40000 ALTER TABLE `admin_users_roles_links` DISABLE KEYS */;
INSERT INTO `admin_users_roles_links` VALUES (1,1,1,1,1);
/*!40000 ALTER TABLE `admin_users_roles_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audience`
--

DROP TABLE IF EXISTS `audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audience` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `audience_key_unique` (`key`),
  KEY `audience_created_by_id_fk` (`created_by_id`),
  KEY `audience_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `audience_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `audience_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audience`
--

LOCK TABLES `audience` WRITE;
/*!40000 ALTER TABLE `audience` DISABLE KEYS */;
/*!40000 ALTER TABLE `audience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `career_candidates`
--

DROP TABLE IF EXISTS `career_candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `career_candidates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cover_letter` longtext COLLATE utf8mb3_unicode_ci,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `career_candidates_created_by_id_fk` (`created_by_id`),
  KEY `career_candidates_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `career_candidates_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `career_candidates_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `career_candidates`
--

LOCK TABLES `career_candidates` WRITE;
/*!40000 ALTER TABLE `career_candidates` DISABLE KEYS */;
INSERT INTO `career_candidates` VALUES (13,'Eng.','Ghaith','Sinjab','ghaithsinjab@outlook.com','+905427146747','Job Title Goes Here','test','2023-03-04 14:18:45.201000','2023-03-04 14:18:45.201000',NULL,NULL);
/*!40000 ALTER TABLE `career_candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers`
--

DROP TABLE IF EXISTS `careers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `careers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `careers_created_by_id_fk` (`created_by_id`),
  KEY `careers_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `careers_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `careers_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers`
--

LOCK TABLES `careers` WRITE;
/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
INSERT INTO `careers` VALUES (1,'Careers','2023-02-26 21:24:11.986000','2023-02-26 21:24:11.986000',1,1);
/*!40000 ALTER TABLE `careers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_controls_banner_slider_boxes`
--

DROP TABLE IF EXISTS `components_controls_banner_slider_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_controls_banner_slider_boxes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `text` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_controls_banner_slider_boxes`
--

LOCK TABLES `components_controls_banner_slider_boxes` WRITE;
/*!40000 ALTER TABLE `components_controls_banner_slider_boxes` DISABLE KEYS */;
INSERT INTO `components_controls_banner_slider_boxes` VALUES (1,'01\nReal Estate'),(2,'Real estate is a core activity of Al ALZAROUNI Group which owns a large portfolio of land and buildings in the United Arab Emirates. The Group’s flagship property is one of the Emirate’s best known and most prestigious mixed-use developments'),(3,'01\nReal Estate'),(4,'Real estate is a core activity of Al ALZAROUNI Group which owns a large portfolio of land and buildings in the United Arab Emirates. The Group’s flagship property is one of the Emirate’s best known and most prestigious mixed-use developments');
/*!40000 ALTER TABLE `components_controls_banner_slider_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_controls_banner_slider_captions`
--

DROP TABLE IF EXISTS `components_controls_banner_slider_captions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_controls_banner_slider_captions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_controls_banner_slider_captions`
--

LOCK TABLES `components_controls_banner_slider_captions` WRITE;
/*!40000 ALTER TABLE `components_controls_banner_slider_captions` DISABLE KEYS */;
INSERT INTO `components_controls_banner_slider_captions` VALUES (1,'Services Beyond Expectations','01','Explore','/our-businesses'),(2,'Services Beyond Expectations','02','Explore','/our-businesses');
/*!40000 ALTER TABLE `components_controls_banner_slider_captions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_controls_banner_sliders`
--

DROP TABLE IF EXISTS `components_controls_banner_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_controls_banner_sliders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_controls_banner_sliders`
--

LOCK TABLES `components_controls_banner_sliders` WRITE;
/*!40000 ALTER TABLE `components_controls_banner_sliders` DISABLE KEYS */;
INSERT INTO `components_controls_banner_sliders` VALUES (1,'First Slide'),(2,'Second Slide');
/*!40000 ALTER TABLE `components_controls_banner_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_controls_banner_sliders_components`
--

DROP TABLE IF EXISTS `components_controls_banner_sliders_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_controls_banner_sliders_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_controls_banner_sliders_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_controls_banner_sliders_field_index` (`field`),
  KEY `components_controls_banner_sliders_component_type_index` (`component_type`),
  KEY `components_controls_banner_sliders_entity_fk` (`entity_id`),
  CONSTRAINT `components_controls_banner_sliders_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_controls_banner_sliders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_controls_banner_sliders_components`
--

LOCK TABLES `components_controls_banner_sliders_components` WRITE;
/*!40000 ALTER TABLE `components_controls_banner_sliders_components` DISABLE KEYS */;
INSERT INTO `components_controls_banner_sliders_components` VALUES (1,1,1,'controls.banner-slider-caption','caption',2),(2,1,1,'controls.banner-slider-box','boxes',1),(3,1,2,'controls.banner-slider-box','boxes',2),(22,2,2,'controls.banner-slider-caption','caption',NULL),(23,2,3,'controls.banner-slider-box','boxes',1),(24,2,4,'controls.banner-slider-box','boxes',2);
/*!40000 ALTER TABLE `components_controls_banner_sliders_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_controls_content_boxes`
--

DROP TABLE IF EXISTS `components_controls_content_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_controls_content_boxes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `text` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_controls_content_boxes`
--

LOCK TABLES `components_controls_content_boxes` WRITE;
/*!40000 ALTER TABLE `components_controls_content_boxes` DISABLE KEYS */;
INSERT INTO `components_controls_content_boxes` VALUES (1,'Our Vision','To build and own high-quality regional business champions that deliver long-term superior value for shareholders and stakeholders'),(2,'Our Mission','Adopt - A dynamic, visionary investment perspective Maintain - A financial standing that is steadfast and solid Adhere - A long-standing, proven governance discipline.'),(3,'Family Principles','Drawing from a legacy'),(4,'Business Ethics','Moving with integrity');
/*!40000 ALTER TABLE `components_controls_content_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_controls_icon_items`
--

DROP TABLE IF EXISTS `components_controls_icon_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_controls_icon_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_controls_icon_items`
--

LOCK TABLES `components_controls_icon_items` WRITE;
/*!40000 ALTER TABLE `components_controls_icon_items` DISABLE KEYS */;
INSERT INTO `components_controls_icon_items` VALUES (1,'Customers','50K'),(2,'Employees','2K'),(3,'Years','20'),(4,'Sectors','6');
/*!40000 ALTER TABLE `components_controls_icon_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_controls_section_contents`
--

DROP TABLE IF EXISTS `components_controls_section_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_controls_section_contents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb3_unicode_ci,
  `url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_controls_section_contents`
--

LOCK TABLES `components_controls_section_contents` WRITE;
/*!40000 ALTER TABLE `components_controls_section_contents` DISABLE KEYS */;
INSERT INTO `components_controls_section_contents` VALUES (1,'Our Company','<p>Established in 1990, AL ZAROUNI GROUP is one of the largest diversified enterprises in the country.&nbsp;</p><p>We see ourselves as a legacy of innovative businesses built on excellence, trust and responsibility. Our reach may have a global impact, but our roots are steeped in time-honoured family values that date back half a century.</p><p>In many ways, the AL ZAROUNI story and the history of the United Arab Emirates have been one narrative. Today, we stand proud in the knowledge of our achievements, and are embracing a future full of endless possibilities.</p>','/our-company');
/*!40000 ALTER TABLE `components_controls_section_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_requests`
--

DROP TABLE IF EXISTS `contact_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb3_unicode_ci,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_requests_created_by_id_fk` (`created_by_id`),
  KEY `contact_requests_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `contact_requests_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `contact_requests_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_requests`
--

LOCK TABLES `contact_requests` WRITE;
/*!40000 ALTER TABLE `contact_requests` DISABLE KEYS */;
INSERT INTO `contact_requests` VALUES (1,'Ghaith Sinjab','ghaithsinjab@outlook.com','+905427146747','testing messages','2023-03-04 15:08:12.214000','2023-03-04 15:08:12.214000',NULL,NULL);
/*!40000 ALTER TABLE `contact_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_info_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_info` longtext COLLATE utf8mb3_unicode_ci,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_created_by_id_fk` (`created_by_id`),
  KEY `contacts_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `contacts_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `contacts_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Contact Us','Contact Information','<p>Contact information goes here</p>','2023-03-04 14:40:05.240000','2023-03-04 14:40:05.240000',1,1);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `alternative_text` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `formats` json DEFAULT NULL,
  `hash` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ext` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `size` decimal(10,2) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `preview_url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `provider_metadata` json DEFAULT NULL,
  `folder_path` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_files_folder_path_index` (`folder_path`),
  KEY `upload_files_created_at_index` (`created_at`),
  KEY `upload_files_updated_at_index` (`updated_at`),
  KEY `upload_files_name_index` (`name`),
  KEY `upload_files_size_index` (`size`),
  KEY `upload_files_ext_index` (`ext`),
  KEY `files_created_by_id_fk` (`created_by_id`),
  KEY `files_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `files_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `files_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'01.webp',NULL,NULL,1920,1080,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_01_a40ef69214.webp\", \"hash\": \"thumbnail_01_a40ef69214\", \"mime\": \"image/webp\", \"name\": \"thumbnail_01.webp\", \"path\": null, \"size\": 1.64, \"width\": 245, \"height\": 138}}','01_a40ef69214','.webp','image/webp',22.11,'/uploads/01_a40ef69214.webp',NULL,'local',NULL,'/1','2023-02-22 20:43:42.432000','2023-02-22 20:43:42.432000',1,1),(2,'blank.webp',NULL,NULL,700,700,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_blank_a9fd62987e.webp\", \"hash\": \"thumbnail_blank_a9fd62987e\", \"mime\": \"image/webp\", \"name\": \"thumbnail_blank.webp\", \"path\": null, \"size\": 0.12, \"width\": 156, \"height\": 156}}','blank_a9fd62987e','.webp','image/webp',0.94,'/uploads/blank_a9fd62987e.webp',NULL,'local',NULL,'/2','2023-02-22 22:22:39.768000','2023-02-22 22:22:39.768000',1,1),(3,'01.webp',NULL,NULL,500,500,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_01_8f2d38acdb.webp\", \"hash\": \"thumbnail_01_8f2d38acdb\", \"mime\": \"image/webp\", \"name\": \"thumbnail_01.webp\", \"path\": null, \"size\": 3.87, \"width\": 156, \"height\": 156}}','01_8f2d38acdb','.webp','image/webp',16.63,'/uploads/01_8f2d38acdb.webp',NULL,'local',NULL,'/3','2023-02-22 22:59:32.227000','2023-02-22 22:59:32.227000',1,1),(4,'icon4.png',NULL,NULL,500,500,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_icon4_5a3a38fbaf.png\", \"hash\": \"thumbnail_icon4_5a3a38fbaf\", \"mime\": \"image/png\", \"name\": \"thumbnail_icon4.png\", \"path\": null, \"size\": 12.38, \"width\": 156, \"height\": 156}}','icon4_5a3a38fbaf','.png','image/png',6.21,'/uploads/icon4_5a3a38fbaf.png',NULL,'local',NULL,'/4','2023-02-23 19:42:16.171000','2023-02-23 19:42:16.171000',1,1),(5,'icon1.png',NULL,NULL,500,500,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_icon1_12dbb276d2.png\", \"hash\": \"thumbnail_icon1_12dbb276d2\", \"mime\": \"image/png\", \"name\": \"thumbnail_icon1.png\", \"path\": null, \"size\": 10.26, \"width\": 156, \"height\": 156}}','icon1_12dbb276d2','.png','image/png',5.30,'/uploads/icon1_12dbb276d2.png',NULL,'local',NULL,'/4','2023-02-23 19:42:16.198000','2023-02-23 19:42:16.198000',1,1),(6,'icon3.png',NULL,NULL,500,500,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_icon3_1d8dc48c9f.png\", \"hash\": \"thumbnail_icon3_1d8dc48c9f\", \"mime\": \"image/png\", \"name\": \"thumbnail_icon3.png\", \"path\": null, \"size\": 8.31, \"width\": 156, \"height\": 156}}','icon3_1d8dc48c9f','.png','image/png',4.78,'/uploads/icon3_1d8dc48c9f.png',NULL,'local',NULL,'/4','2023-02-23 19:42:16.228000','2023-02-23 19:42:16.228000',1,1),(7,'icon2.png',NULL,NULL,500,500,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_icon2_c0a566f958.png\", \"hash\": \"thumbnail_icon2_c0a566f958\", \"mime\": \"image/png\", \"name\": \"thumbnail_icon2.png\", \"path\": null, \"size\": 10.93, \"width\": 156, \"height\": 156}}','icon2_c0a566f958','.png','image/png',5.85,'/uploads/icon2_c0a566f958.png',NULL,'local',NULL,'/4','2023-02-23 19:42:16.231000','2023-02-23 19:42:52.009000',1,1),(8,'02.webp',NULL,NULL,500,500,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_02_16f3d3cc33.webp\", \"hash\": \"thumbnail_02_16f3d3cc33\", \"mime\": \"image/webp\", \"name\": \"thumbnail_02.webp\", \"path\": null, \"size\": 2.47, \"width\": 156, \"height\": 156}}','02_16f3d3cc33','.webp','image/webp',12.17,'/uploads/02_16f3d3cc33.webp',NULL,'local',NULL,'/3','2023-02-24 20:53:15.497000','2023-02-24 20:53:15.497000',1,1),(9,'03.webp',NULL,NULL,500,500,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_03_570a2d2f25.webp\", \"hash\": \"thumbnail_03_570a2d2f25\", \"mime\": \"image/webp\", \"name\": \"thumbnail_03.webp\", \"path\": null, \"size\": 2.66, \"width\": 156, \"height\": 156}}','03_570a2d2f25','.webp','image/webp',11.28,'/uploads/03_570a2d2f25.webp',NULL,'local',NULL,'/3','2023-02-24 20:53:15.771000','2023-02-24 20:53:15.771000',1,1),(10,'05.webp',NULL,NULL,500,500,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_05_6e6e5dc58e.webp\", \"hash\": \"thumbnail_05_6e6e5dc58e\", \"mime\": \"image/webp\", \"name\": \"thumbnail_05.webp\", \"path\": null, \"size\": 3.39, \"width\": 156, \"height\": 156}}','05_6e6e5dc58e','.webp','image/webp',15.07,'/uploads/05_6e6e5dc58e.webp',NULL,'local',NULL,'/3','2023-02-24 20:53:15.864000','2023-02-24 20:53:15.864000',1,1),(11,'04.webp',NULL,NULL,500,500,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_04_19b359a349.webp\", \"hash\": \"thumbnail_04_19b359a349\", \"mime\": \"image/webp\", \"name\": \"thumbnail_04.webp\", \"path\": null, \"size\": 3.9, \"width\": 156, \"height\": 156}}','04_19b359a349','.webp','image/webp',16.03,'/uploads/04_19b359a349.webp',NULL,'local',NULL,'/3','2023-02-24 20:53:15.871000','2023-02-24 20:53:15.871000',1,1),(12,'company.webp',NULL,NULL,1920,1080,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_company_afb7c27f92.webp\", \"hash\": \"thumbnail_company_afb7c27f92\", \"mime\": \"image/webp\", \"name\": \"thumbnail_company.webp\", \"path\": null, \"size\": 3.99, \"width\": 245, \"height\": 138}}','company_afb7c27f92','.webp','image/webp',85.71,'/uploads/company_afb7c27f92.webp',NULL,'local',NULL,'/5','2023-02-25 20:49:51.550000','2023-02-25 20:49:51.550000',1,1),(13,'business.webp',NULL,NULL,1920,1080,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_business_e8df747df3.webp\", \"hash\": \"thumbnail_business_e8df747df3\", \"mime\": \"image/webp\", \"name\": \"thumbnail_business.webp\", \"path\": null, \"size\": 4.75, \"width\": 245, \"height\": 138}}','business_e8df747df3','.webp','image/webp',72.79,'/uploads/business_e8df747df3.webp',NULL,'local',NULL,'/5','2023-02-26 14:24:07.974000','2023-02-26 14:24:07.974000',1,1),(14,'careers.webp',NULL,NULL,1920,1080,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_careers_65d42b2159.webp\", \"hash\": \"thumbnail_careers_65d42b2159\", \"mime\": \"image/webp\", \"name\": \"thumbnail_careers.webp\", \"path\": null, \"size\": 2.77, \"width\": 245, \"height\": 138}}','careers_65d42b2159','.webp','image/webp',30.35,'/uploads/careers_65d42b2159.webp',NULL,'local',NULL,'/5','2023-02-26 14:36:24.821000','2023-02-26 14:36:24.821000',1,1),(15,'contact.webp',NULL,NULL,1920,1080,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_contact_8af7098f4c.webp\", \"hash\": \"thumbnail_contact_8af7098f4c\", \"mime\": \"image/webp\", \"name\": \"thumbnail_contact.webp\", \"path\": null, \"size\": 1.73, \"width\": 245, \"height\": 138}}','contact_8af7098f4c','.webp','image/webp',24.20,'/uploads/contact_8af7098f4c.webp',NULL,'local',NULL,'/5','2023-02-26 14:36:25.132000','2023-02-26 14:36:25.132000',1,1),(16,'media.webp',NULL,NULL,1920,1080,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_media_4aa0c8d5f8.webp\", \"hash\": \"thumbnail_media_4aa0c8d5f8\", \"mime\": \"image/webp\", \"name\": \"thumbnail_media.webp\", \"path\": null, \"size\": 2.44, \"width\": 245, \"height\": 138}}','media_4aa0c8d5f8','.webp','image/webp',28.45,'/uploads/media_4aa0c8d5f8.webp',NULL,'local',NULL,'/5','2023-02-26 14:36:25.158000','2023-02-26 14:36:25.158000',1,1),(17,'01.webp',NULL,NULL,500,500,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_01_7efd442d08.webp\", \"hash\": \"thumbnail_01_7efd442d08\", \"mime\": \"image/webp\", \"name\": \"thumbnail_01.webp\", \"path\": null, \"size\": 6.57, \"width\": 156, \"height\": 156}}','01_7efd442d08','.webp','image/webp',25.21,'/uploads/01_7efd442d08.webp',NULL,'local',NULL,'/6','2023-02-26 20:16:53.628000','2023-02-26 20:16:53.628000',1,1),(18,'02.webp',NULL,NULL,500,500,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_02_0125c5d06d.webp\", \"hash\": \"thumbnail_02_0125c5d06d\", \"mime\": \"image/webp\", \"name\": \"thumbnail_02.webp\", \"path\": null, \"size\": 6.96, \"width\": 156, \"height\": 156}}','02_0125c5d06d','.webp','image/webp',39.05,'/uploads/02_0125c5d06d.webp',NULL,'local',NULL,'/6','2023-02-26 20:16:53.636000','2023-02-26 20:16:53.636000',1,1),(19,'04.webp',NULL,NULL,500,500,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_04_f59d00b6e6.webp\", \"hash\": \"thumbnail_04_f59d00b6e6\", \"mime\": \"image/webp\", \"name\": \"thumbnail_04.webp\", \"path\": null, \"size\": 2.98, \"width\": 156, \"height\": 156}}','04_f59d00b6e6','.webp','image/webp',11.19,'/uploads/04_f59d00b6e6.webp',NULL,'local',NULL,'/6','2023-02-26 20:16:53.894000','2023-02-26 20:16:53.894000',1,1),(20,'03.webp',NULL,NULL,500,500,'{\"thumbnail\": {\"ext\": \".webp\", \"url\": \"/uploads/thumbnail_03_8d393d8a71.webp\", \"hash\": \"thumbnail_03_8d393d8a71\", \"mime\": \"image/webp\", \"name\": \"thumbnail_03.webp\", \"path\": null, \"size\": 7.04, \"width\": 156, \"height\": 156}}','03_8d393d8a71','.webp','image/webp',39.99,'/uploads/03_8d393d8a71.webp',NULL,'local',NULL,'/6','2023-02-26 20:16:53.937000','2023-02-26 20:16:53.937000',1,1);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_folder_links`
--

DROP TABLE IF EXISTS `files_folder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_folder_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int unsigned DEFAULT NULL,
  `folder_id` int unsigned DEFAULT NULL,
  `file_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_folder_links_unique` (`file_id`,`folder_id`),
  KEY `files_folder_links_fk` (`file_id`),
  KEY `files_folder_links_inv_fk` (`folder_id`),
  KEY `files_folder_links_order_inv_fk` (`file_order`),
  CONSTRAINT `files_folder_links_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_folder_links_inv_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_folder_links`
--

LOCK TABLES `files_folder_links` WRITE;
/*!40000 ALTER TABLE `files_folder_links` DISABLE KEYS */;
INSERT INTO `files_folder_links` VALUES (1,1,1,1),(2,2,2,1),(3,3,3,1),(4,4,4,1),(5,5,4,2),(6,6,4,2),(7,7,4,3),(9,8,3,2),(10,9,3,3),(11,10,3,4),(12,11,3,4),(13,12,5,1),(14,13,5,2),(15,14,5,3),(16,15,5,4),(17,16,5,5),(18,17,6,1),(19,18,6,1),(20,19,6,2),(21,20,6,3);
/*!40000 ALTER TABLE `files_folder_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_related_morphs`
--

DROP TABLE IF EXISTS `files_related_morphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_related_morphs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int unsigned DEFAULT NULL,
  `related_id` int unsigned DEFAULT NULL,
  `related_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_related_morphs_fk` (`file_id`),
  CONSTRAINT `files_related_morphs_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_related_morphs`
--

LOCK TABLES `files_related_morphs` WRITE;
/*!40000 ALTER TABLE `files_related_morphs` DISABLE KEYS */;
INSERT INTO `files_related_morphs` VALUES (8,3,1,'api::service.service','image',1),(21,1,1,'controls.banner-slider','image',1),(22,1,2,'controls.banner-slider','image',1),(23,2,1,'controls.section-content','image',1),(24,5,1,'controls.icon-item','icon',1),(25,7,2,'controls.icon-item','icon',1),(26,6,3,'controls.icon-item','icon',1),(27,4,4,'controls.icon-item','icon',1),(28,8,2,'api::service.service','image',1),(29,9,3,'api::service.service','image',1),(30,11,4,'api::service.service','image',1),(31,10,5,'api::service.service','image',1),(36,12,1,'api::about-us.about-us','page_bar',1),(37,2,1,'api::about-us.about-us','content_image',1),(38,13,1,'api::our-business.our-business','page_bar',1),(39,16,1,'api::media-center.media-center','page_bar',1),(40,17,1,'api::media-item.media-item','main_image',1),(41,18,2,'api::media-item.media-item','main_image',1),(42,20,3,'api::media-item.media-item','main_image',1),(43,19,4,'api::media-item.media-item','main_image',1),(44,17,1,'api::media-item.media-item','image',1),(45,18,2,'api::media-item.media-item','image',1),(48,20,6,'api::media-item.media-item','image',1),(49,19,7,'api::media-item.media-item','image',1),(50,14,1,'api::career.career','page_bar',1),(51,15,1,'api::contact.contact','page_bar',1),(52,12,1,'api::search-page.search-page','page_bar',1);
/*!40000 ALTER TABLE `files_related_morphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_pages`
--

DROP TABLE IF EXISTS `home_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `business_section_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `business_section_url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `business_section_link_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `brief_section_title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_pages_created_by_id_fk` (`created_by_id`),
  KEY `home_pages_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `home_pages_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `home_pages_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_pages`
--

LOCK TABLES `home_pages` WRITE;
/*!40000 ALTER TABLE `home_pages` DISABLE KEYS */;
INSERT INTO `home_pages` VALUES (1,'2023-02-22 20:45:28.032000','2023-02-24 20:14:32.488000',1,1,'Our Business','/our-business','View All','Briefs');
/*!40000 ALTER TABLE `home_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_pages_components`
--

DROP TABLE IF EXISTS `home_pages_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_pages_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `home_pages_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `home_pages_field_index` (`field`),
  KEY `home_pages_component_type_index` (`component_type`),
  KEY `home_pages_entity_fk` (`entity_id`),
  CONSTRAINT `home_pages_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `home_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_pages_components`
--

LOCK TABLES `home_pages_components` WRITE;
/*!40000 ALTER TABLE `home_pages_components` DISABLE KEYS */;
INSERT INTO `home_pages_components` VALUES (1,1,1,'controls.banner-slider','slider',2),(3,1,1,'controls.section-content','about_us',1),(10,1,1,'controls.icon-item','briefs',1),(11,1,2,'controls.icon-item','briefs',2),(12,1,3,'controls.icon-item','briefs',3),(13,1,4,'controls.icon-item','briefs',4),(20,1,2,'controls.banner-slider','slider',4);
/*!40000 ALTER TABLE `home_pages_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i18n_locale`
--

DROP TABLE IF EXISTS `i18n_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `i18n_locale` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i18n_locale_created_by_id_fk` (`created_by_id`),
  KEY `i18n_locale_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `i18n_locale_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `i18n_locale_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i18n_locale`
--

LOCK TABLES `i18n_locale` WRITE;
/*!40000 ALTER TABLE `i18n_locale` DISABLE KEYS */;
INSERT INTO `i18n_locale` VALUES (1,'English (en)','en','2023-02-21 20:41:56.253000','2023-02-21 20:41:56.253000',NULL,NULL);
/*!40000 ALTER TABLE `i18n_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_centers`
--

DROP TABLE IF EXISTS `media_centers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_centers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_centers_created_by_id_fk` (`created_by_id`),
  KEY `media_centers_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `media_centers_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `media_centers_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_centers`
--

LOCK TABLES `media_centers` WRITE;
/*!40000 ALTER TABLE `media_centers` DISABLE KEYS */;
INSERT INTO `media_centers` VALUES (1,'Media Center','2023-02-26 14:36:33.720000','2023-02-26 14:36:33.720000',1,1);
/*!40000 ALTER TABLE `media_centers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_items`
--

DROP TABLE IF EXISTS `media_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_items_url_unique` (`url`),
  KEY `media_items_created_by_id_fk` (`created_by_id`),
  KEY `media_items_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `media_items_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `media_items_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_items`
--

LOCK TABLES `media_items` WRITE;
/*!40000 ALTER TABLE `media_items` DISABLE KEYS */;
INSERT INTO `media_items` VALUES (1,'Media Item 1','media-item-1',NULL,'2023-02-26 20:17:02.291000','2023-02-26 20:41:51.173000','2023-02-26 20:17:03.292000',1,1),(2,'Media Item 2','media-item-2',NULL,'2023-02-26 20:17:25.515000','2023-02-26 20:42:02.938000','2023-02-26 20:17:26.436000',1,1),(5,'Media Item 5','media-item-5','https://www.youtube.com/watch?v=Ht4G-3lFuVM','2023-02-26 20:18:48.613000','2023-02-26 20:18:49.529000','2023-02-26 20:18:49.522000',1,1),(6,'Media Item 3','media-item-3',NULL,'2023-02-26 21:14:20.452000','2023-02-26 21:14:21.494000','2023-02-26 21:14:21.487000',1,1),(7,'Media Item 4','media-item-4',NULL,'2023-02-26 21:14:37.261000','2023-02-26 21:14:39.039000','2023-02-26 21:14:39.033000',1,1);
/*!40000 ALTER TABLE `media_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations`
--

DROP TABLE IF EXISTS `navigations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb3_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `locale_code` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `navigations_slug_unique` (`slug`),
  KEY `navigations_created_by_id_fk` (`created_by_id`),
  KEY `navigations_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `navigations_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `navigations_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations`
--

LOCK TABLES `navigations` WRITE;
/*!40000 ALTER TABLE `navigations` DISABLE KEYS */;
INSERT INTO `navigations` VALUES (1,'Main navigation','main-navigation',1,'en','2023-02-21 20:41:56.481000','2023-02-21 20:41:56.481000',NULL,NULL);
/*!40000 ALTER TABLE `navigations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations_items`
--

DROP TABLE IF EXISTS `navigations_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8mb3_unicode_ci,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `path` longtext COLLATE utf8mb3_unicode_ci,
  `external_path` longtext COLLATE utf8mb3_unicode_ci,
  `ui_router_key` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `menu_attached` tinyint(1) DEFAULT NULL,
  `order` int DEFAULT NULL,
  `collapsed` tinyint(1) DEFAULT NULL,
  `additional_fields` json DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `navigations_items_created_by_id_fk` (`created_by_id`),
  KEY `navigations_items_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `navigations_items_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `navigations_items_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations_items`
--

LOCK TABLES `navigations_items` WRITE;
/*!40000 ALTER TABLE `navigations_items` DISABLE KEYS */;
INSERT INTO `navigations_items` VALUES (1,'Home','WRAPPER','home',NULL,'home-1',0,1,0,'{\"active\": true, \"sitemap\": true, \"template\": \"Home\", \"page_role\": \"Home\", \"item_template\": \"Content\"}','2023-02-21 20:52:50.222000','2023-02-25 20:14:29.753000',NULL,NULL),(2,'Our Company','INTERNAL','our-company',NULL,'our-company-1',0,2,0,'{\"active\": true, \"sitemap\": true, \"template\": \"About\", \"item_template\": \"Content\"}','2023-02-25 20:12:29.746000','2023-02-25 20:53:53.557000',NULL,NULL),(3,'Our Business','INTERNAL','our-business',NULL,'our-business-1',0,3,0,'{\"active\": true, \"sitemap\": true, \"template\": \"Services\", \"page_role\": \"Services\", \"item_template\": \"Content\"}','2023-02-26 14:18:38.431000','2023-02-26 14:25:04.445000',NULL,NULL),(4,'Media Center','INTERNAL','media-center',NULL,'media-center-1',0,4,0,'{\"active\": true, \"sitemap\": true, \"template\": \"Media Listing\", \"page_role\": \"Media\", \"item_template\": \"Content\"}','2023-02-26 14:37:14.877000','2023-02-26 20:37:14.993000',NULL,NULL),(5,'Careers','INTERNAL','careers',NULL,'careers',0,5,0,'{\"active\": true, \"sitemap\": true, \"template\": \"Career\", \"item_template\": \"Content\"}','2023-02-26 21:25:11.987000','2023-02-26 21:25:11.987000',NULL,NULL),(6,'Contact Us','INTERNAL','contact-us',NULL,'contact-us',0,6,0,'{\"active\": true, \"sitemap\": true, \"template\": \"Contact\", \"item_template\": \"Content\"}','2023-03-04 14:41:01.008000','2023-03-04 14:41:01.008000',NULL,NULL);
/*!40000 ALTER TABLE `navigations_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations_items_audience_links`
--

DROP TABLE IF EXISTS `navigations_items_audience_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations_items_audience_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `navigation_item_id` int unsigned DEFAULT NULL,
  `audience_id` int unsigned DEFAULT NULL,
  `audience_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `navigations_items_audience_links_unique` (`navigation_item_id`,`audience_id`),
  KEY `navigations_items_audience_links_fk` (`navigation_item_id`),
  KEY `navigations_items_audience_links_inv_fk` (`audience_id`),
  KEY `navigations_items_audience_links_order_fk` (`audience_order`),
  CONSTRAINT `navigations_items_audience_links_fk` FOREIGN KEY (`navigation_item_id`) REFERENCES `navigations_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `navigations_items_audience_links_inv_fk` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations_items_audience_links`
--

LOCK TABLES `navigations_items_audience_links` WRITE;
/*!40000 ALTER TABLE `navigations_items_audience_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigations_items_audience_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations_items_master_links`
--

DROP TABLE IF EXISTS `navigations_items_master_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations_items_master_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `navigation_item_id` int unsigned DEFAULT NULL,
  `navigation_id` int unsigned DEFAULT NULL,
  `navigation_item_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `navigations_items_master_links_unique` (`navigation_item_id`,`navigation_id`),
  KEY `navigations_items_master_links_fk` (`navigation_item_id`),
  KEY `navigations_items_master_links_inv_fk` (`navigation_id`),
  KEY `navigations_items_master_links_order_inv_fk` (`navigation_item_order`),
  CONSTRAINT `navigations_items_master_links_fk` FOREIGN KEY (`navigation_item_id`) REFERENCES `navigations_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `navigations_items_master_links_inv_fk` FOREIGN KEY (`navigation_id`) REFERENCES `navigations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations_items_master_links`
--

LOCK TABLES `navigations_items_master_links` WRITE;
/*!40000 ALTER TABLE `navigations_items_master_links` DISABLE KEYS */;
INSERT INTO `navigations_items_master_links` VALUES (1,1,1,1),(2,2,1,2),(6,3,1,3),(8,4,1,4),(10,5,1,5),(11,6,1,6);
/*!40000 ALTER TABLE `navigations_items_master_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations_items_parent_links`
--

DROP TABLE IF EXISTS `navigations_items_parent_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations_items_parent_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `navigation_item_id` int unsigned DEFAULT NULL,
  `inv_navigation_item_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `navigations_items_parent_links_unique` (`navigation_item_id`,`inv_navigation_item_id`),
  KEY `navigations_items_parent_links_fk` (`navigation_item_id`),
  KEY `navigations_items_parent_links_inv_fk` (`inv_navigation_item_id`),
  CONSTRAINT `navigations_items_parent_links_fk` FOREIGN KEY (`navigation_item_id`) REFERENCES `navigations_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `navigations_items_parent_links_inv_fk` FOREIGN KEY (`inv_navigation_item_id`) REFERENCES `navigations_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations_items_parent_links`
--

LOCK TABLES `navigations_items_parent_links` WRITE;
/*!40000 ALTER TABLE `navigations_items_parent_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigations_items_parent_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations_items_related`
--

DROP TABLE IF EXISTS `navigations_items_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations_items_related` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `related_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `related_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order` int DEFAULT NULL,
  `master` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `navigations_items_related_created_by_id_fk` (`created_by_id`),
  KEY `navigations_items_related_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `navigations_items_related_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `navigations_items_related_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations_items_related`
--

LOCK TABLES `navigations_items_related` WRITE;
/*!40000 ALTER TABLE `navigations_items_related` DISABLE KEYS */;
INSERT INTO `navigations_items_related` VALUES (1,'1','api::about-us.about-us','navigation',1,'1','2023-02-25 20:53:53.534000','2023-02-25 20:53:53.534000',NULL,NULL),(2,'1','api::our-business.our-business','navigation',1,'1','2023-02-26 14:25:04.436000','2023-02-26 14:25:04.436000',NULL,NULL),(3,'1','api::media-center.media-center','navigation',1,'1','2023-02-26 14:37:14.866000','2023-02-26 14:37:14.866000',NULL,NULL),(4,'1','api::career.career','navigation',1,'1','2023-02-26 21:25:11.978000','2023-02-26 21:25:11.978000',NULL,NULL),(5,'1','api::contact.contact','navigation',1,'1','2023-03-04 14:41:01.000000','2023-03-04 14:41:01.000000',NULL,NULL);
/*!40000 ALTER TABLE `navigations_items_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations_items_related_links`
--

DROP TABLE IF EXISTS `navigations_items_related_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations_items_related_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `navigation_item_id` int unsigned DEFAULT NULL,
  `navigations_items_related_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `navigations_items_related_links_unique` (`navigation_item_id`,`navigations_items_related_id`),
  KEY `navigations_items_related_links_fk` (`navigation_item_id`),
  KEY `navigations_items_related_links_inv_fk` (`navigations_items_related_id`),
  CONSTRAINT `navigations_items_related_links_fk` FOREIGN KEY (`navigation_item_id`) REFERENCES `navigations_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `navigations_items_related_links_inv_fk` FOREIGN KEY (`navigations_items_related_id`) REFERENCES `navigations_items_related` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations_items_related_links`
--

LOCK TABLES `navigations_items_related_links` WRITE;
/*!40000 ALTER TABLE `navigations_items_related_links` DISABLE KEYS */;
INSERT INTO `navigations_items_related_links` VALUES (1,2,1),(2,3,2),(3,4,3),(5,5,4),(6,6,5);
/*!40000 ALTER TABLE `navigations_items_related_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations_localizations_links`
--

DROP TABLE IF EXISTS `navigations_localizations_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations_localizations_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `navigation_id` int unsigned DEFAULT NULL,
  `inv_navigation_id` int unsigned DEFAULT NULL,
  `navigation_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `navigations_localizations_links_unique` (`navigation_id`,`inv_navigation_id`),
  KEY `navigations_localizations_links_fk` (`navigation_id`),
  KEY `navigations_localizations_links_inv_fk` (`inv_navigation_id`),
  KEY `navigations_localizations_links_order_fk` (`navigation_order`),
  CONSTRAINT `navigations_localizations_links_fk` FOREIGN KEY (`navigation_id`) REFERENCES `navigations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `navigations_localizations_links_inv_fk` FOREIGN KEY (`inv_navigation_id`) REFERENCES `navigations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations_localizations_links`
--

LOCK TABLES `navigations_localizations_links` WRITE;
/*!40000 ALTER TABLE `navigations_localizations_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigations_localizations_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `our_businesses`
--

DROP TABLE IF EXISTS `our_businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `our_businesses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `our_businesses_created_by_id_fk` (`created_by_id`),
  KEY `our_businesses_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `our_businesses_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `our_businesses_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `our_businesses`
--

LOCK TABLES `our_businesses` WRITE;
/*!40000 ALTER TABLE `our_businesses` DISABLE KEYS */;
INSERT INTO `our_businesses` VALUES (1,'Our Business','2023-02-26 14:24:13.081000','2023-02-26 14:24:13.081000',1,1);
/*!40000 ALTER TABLE `our_businesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_pages`
--

DROP TABLE IF EXISTS `search_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search_pages_created_by_id_fk` (`created_by_id`),
  KEY `search_pages_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `search_pages_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `search_pages_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_pages`
--

LOCK TABLES `search_pages` WRITE;
/*!40000 ALTER TABLE `search_pages` DISABLE KEYS */;
INSERT INTO `search_pages` VALUES (1,'Search','2023-03-05 10:15:34.942000','2023-03-05 10:15:34.942000',1,1);
/*!40000 ALTER TABLE `search_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `services_url_unique` (`url`),
  KEY `services_created_by_id_fk` (`created_by_id`),
  KEY `services_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `services_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `services_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Real Estate','real-estate','2023-02-22 22:59:37.848000','2023-02-22 23:06:58.067000','2023-02-22 23:06:58.052000',1,1),(2,'MOHRE Services','mohre-services','2023-02-24 20:53:48.459000','2023-02-24 20:53:51.168000','2023-02-24 20:53:51.163000',1,1),(3,'OTAREDAIR Cargo','otaredair-cargo','2023-02-24 20:54:45.173000','2023-02-24 20:54:46.687000','2023-02-24 20:54:46.684000',1,1),(4,'MECR Services','mecr-services','2023-02-24 20:55:37.347000','2023-02-24 20:55:40.549000','2023-02-24 20:55:40.542000',1,1),(5,'Another Service','another-service','2023-02-24 20:56:05.142000','2023-02-24 20:56:06.259000','2023-02-24 20:56:06.254000',1,1);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_links`
--

DROP TABLE IF EXISTS `social_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_links_created_by_id_fk` (`created_by_id`),
  KEY `social_links_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `social_links_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `social_links_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_links`
--

LOCK TABLES `social_links` WRITE;
/*!40000 ALTER TABLE `social_links` DISABLE KEYS */;
INSERT INTO `social_links` VALUES (1,'Facebook','icon-facebook','https://facebook.com/','2023-02-22 19:13:01.935000','2023-02-22 19:13:04.182000','2023-02-22 19:13:04.173000',1,1);
/*!40000 ALTER TABLE `social_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_token_permissions`
--

DROP TABLE IF EXISTS `strapi_api_token_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_api_token_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_token_permissions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_token_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_token_permissions`
--

LOCK TABLES `strapi_api_token_permissions` WRITE;
/*!40000 ALTER TABLE `strapi_api_token_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_api_token_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_token_permissions_token_links`
--

DROP TABLE IF EXISTS `strapi_api_token_permissions_token_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_api_token_permissions_token_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `api_token_permission_id` int unsigned DEFAULT NULL,
  `api_token_id` int unsigned DEFAULT NULL,
  `api_token_permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_api_token_permissions_token_links_unique` (`api_token_permission_id`,`api_token_id`),
  KEY `strapi_api_token_permissions_token_links_fk` (`api_token_permission_id`),
  KEY `strapi_api_token_permissions_token_links_inv_fk` (`api_token_id`),
  KEY `strapi_api_token_permissions_token_links_order_inv_fk` (`api_token_permission_order`),
  CONSTRAINT `strapi_api_token_permissions_token_links_fk` FOREIGN KEY (`api_token_permission_id`) REFERENCES `strapi_api_token_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_api_token_permissions_token_links_inv_fk` FOREIGN KEY (`api_token_id`) REFERENCES `strapi_api_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_token_permissions_token_links`
--

LOCK TABLES `strapi_api_token_permissions_token_links` WRITE;
/*!40000 ALTER TABLE `strapi_api_token_permissions_token_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_api_token_permissions_token_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_tokens`
--

DROP TABLE IF EXISTS `strapi_api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_api_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `access_key` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_tokens`
--

LOCK TABLES `strapi_api_tokens` WRITE;
/*!40000 ALTER TABLE `strapi_api_tokens` DISABLE KEYS */;
INSERT INTO `strapi_api_tokens` VALUES (1,'Website Token','The access token used by the website','full-access','3f3f2ce473d4ab6d482a196cc814ed65a0112f4d23b16f2dcc2b79e63049e20cd38959f4927bf4c0f82f9c01d75fe4a843359937d5c65935a0828972c135a53e','2023-03-05 20:26:30.646000',NULL,NULL,'2023-02-21 20:44:54.744000','2023-03-05 20:26:30.646000',NULL,NULL);
/*!40000 ALTER TABLE `strapi_api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_core_store_settings`
--

DROP TABLE IF EXISTS `strapi_core_store_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_core_store_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb3_unicode_ci,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_core_store_settings`
--

LOCK TABLES `strapi_core_store_settings` WRITE;
/*!40000 ALTER TABLE `strapi_core_store_settings` DISABLE KEYS */;
INSERT INTO `strapi_core_store_settings` VALUES (1,'strapi_content_types_schema','{\"admin::permission\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"admin::permission\",\"plugin\":\"admin\",\"globalId\":\"AdminPermission\"},\"admin::user\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"admin::user\",\"plugin\":\"admin\",\"globalId\":\"AdminUser\"},\"admin::role\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"admin::role\",\"plugin\":\"admin\",\"globalId\":\"AdminRole\"},\"admin::api-token\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"api-token\",\"connection\":\"default\",\"uid\":\"admin::api-token\",\"plugin\":\"admin\",\"globalId\":\"AdminApiToken\"},\"admin::api-token-permission\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"api-token-permission\",\"connection\":\"default\",\"uid\":\"admin::api-token-permission\",\"plugin\":\"admin\",\"globalId\":\"AdminApiTokenPermission\"},\"admin::transfer-token\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"transfer-token\",\"connection\":\"default\",\"uid\":\"admin::transfer-token\",\"plugin\":\"admin\",\"globalId\":\"AdminTransferToken\"},\"admin::transfer-token-permission\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"transfer-token-permission\",\"connection\":\"default\",\"uid\":\"admin::transfer-token-permission\",\"plugin\":\"admin\",\"globalId\":\"AdminTransferTokenPermission\"},\"plugin::upload.file\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"min\":1,\"required\":true,\"private\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"indexes\":[{\"name\":\"upload_files_folder_path_index\",\"columns\":[\"folder_path\"],\"type\":null},{\"name\":\"upload_files_created_at_index\",\"columns\":[\"created_at\"],\"type\":null},{\"name\":\"upload_files_updated_at_index\",\"columns\":[\"updated_at\"],\"type\":null},{\"name\":\"upload_files_name_index\",\"columns\":[\"name\"],\"type\":null},{\"name\":\"upload_files_size_index\",\"columns\":[\"size\"],\"type\":null},{\"name\":\"upload_files_ext_index\",\"columns\":[\"ext\"],\"type\":null}],\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"min\":1,\"required\":true,\"private\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"file\",\"connection\":\"default\",\"uid\":\"plugin::upload.file\",\"plugin\":\"upload\",\"globalId\":\"UploadFile\"},\"plugin::upload.folder\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"min\":1,\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"indexes\":[{\"name\":\"upload_folders_path_id_index\",\"columns\":[\"path_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_path_index\",\"columns\":[\"path\"],\"type\":\"unique\"}],\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"min\":1,\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"folder\",\"connection\":\"default\",\"uid\":\"plugin::upload.folder\",\"plugin\":\"upload\",\"globalId\":\"UploadFolder\"},\"plugin::i18n.locale\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"locale\",\"connection\":\"default\",\"uid\":\"plugin::i18n.locale\",\"plugin\":\"i18n\",\"collectionName\":\"i18n_locale\",\"globalId\":\"I18NLocale\"},\"plugin::users-permissions.permission\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.permission\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsPermission\"},\"plugin::users-permissions.role\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.role\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsRole\"},\"plugin::users-permissions.user\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"confirmationToken\":{\"hidden\":true},\"provider\":{\"hidden\":true}}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.user\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsUser\"},\"plugin::navigation.audience\":{\"collectionName\":\"audience\",\"info\":{\"singularName\":\"audience\",\"pluralName\":\"audiences\",\"displayName\":\"Audience\",\"name\":\"audience\"},\"options\":{\"increments\":true,\"comment\":\"Audience\"},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"key\":{\"type\":\"uid\",\"targetField\":\"name\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"audience\",\"info\":{\"singularName\":\"audience\",\"pluralName\":\"audiences\",\"displayName\":\"Audience\",\"name\":\"audience\"},\"options\":{\"increments\":true,\"comment\":\"Audience\"},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"key\":{\"type\":\"uid\",\"targetField\":\"name\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"audience\",\"connection\":\"default\",\"uid\":\"plugin::navigation.audience\",\"plugin\":\"navigation\",\"globalId\":\"NavigationAudience\"},\"plugin::navigation.navigation\":{\"collectionName\":\"navigations\",\"info\":{\"singularName\":\"navigation\",\"pluralName\":\"navigations\",\"displayName\":\"Navigation\",\"name\":\"navigation\"},\"options\":{\"increments\":true,\"comment\":\"\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"text\",\"configurable\":false,\"required\":true},\"slug\":{\"type\":\"uid\",\"target\":\"name\",\"configurable\":false,\"required\":true},\"visible\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"items\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::navigation.navigation-item\",\"configurable\":false,\"mappedBy\":\"master\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::navigation.navigation\"},\"localeCode\":{\"type\":\"string\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"navigations\",\"info\":{\"singularName\":\"navigation\",\"pluralName\":\"navigations\",\"displayName\":\"Navigation\",\"name\":\"navigation\"},\"options\":{\"increments\":true,\"comment\":\"\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"text\",\"configurable\":false,\"required\":true},\"slug\":{\"type\":\"uid\",\"target\":\"name\",\"configurable\":false,\"required\":true},\"visible\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"items\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::navigation.navigation-item\",\"configurable\":false,\"mappedBy\":\"master\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::navigation.navigation\"},\"localeCode\":{\"type\":\"string\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"navigation\",\"connection\":\"default\",\"uid\":\"plugin::navigation.navigation\",\"plugin\":\"navigation\",\"globalId\":\"NavigationNavigation\"},\"plugin::navigation.navigation-item\":{\"collectionName\":\"navigations_items\",\"info\":{\"singularName\":\"navigation-item\",\"pluralName\":\"navigation-items\",\"displayName\":\"Navigation Item\",\"name\":\"navigation-item\"},\"options\":{\"increments\":true,\"timestamps\":true,\"comment\":\"Navigation Item\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false},\"i18n\":{\"localized\":false}},\"attributes\":{\"title\":{\"type\":\"text\",\"configurable\":false,\"required\":true,\"pluginOptions\":{\"i18n\":{\"localized\":false}}},\"type\":{\"type\":\"enumeration\",\"enum\":[\"INTERNAL\",\"EXTERNAL\",\"WRAPPER\"],\"default\":\"INTERNAL\",\"configurable\":false},\"path\":{\"type\":\"text\",\"targetField\":\"title\",\"configurable\":false},\"externalPath\":{\"type\":\"text\",\"configurable\":false},\"uiRouterKey\":{\"type\":\"string\",\"configurable\":false},\"menuAttached\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"order\":{\"type\":\"integer\",\"default\":0,\"configurable\":false},\"collapsed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::navigation.navigations-items-related\",\"configurable\":false},\"parent\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::navigation.navigation-item\",\"configurable\":false,\"default\":null},\"master\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::navigation.navigation\",\"configurable\":false,\"inversedBy\":\"items\"},\"audience\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::navigation.audience\"},\"additionalFields\":{\"type\":\"json\",\"require\":false,\"default\":{}},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"navigations_items\",\"info\":{\"singularName\":\"navigation-item\",\"pluralName\":\"navigation-items\",\"displayName\":\"Navigation Item\",\"name\":\"navigation-item\"},\"options\":{\"increments\":true,\"timestamps\":true,\"comment\":\"Navigation Item\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false},\"i18n\":{\"localized\":false}},\"attributes\":{\"title\":{\"type\":\"text\",\"configurable\":false,\"required\":true,\"pluginOptions\":{\"i18n\":{\"localized\":false}}},\"type\":{\"type\":\"enumeration\",\"enum\":[\"INTERNAL\",\"EXTERNAL\",\"WRAPPER\"],\"default\":\"INTERNAL\",\"configurable\":false},\"path\":{\"type\":\"text\",\"targetField\":\"title\",\"configurable\":false},\"externalPath\":{\"type\":\"text\",\"configurable\":false},\"uiRouterKey\":{\"type\":\"string\",\"configurable\":false},\"menuAttached\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"order\":{\"type\":\"integer\",\"default\":0,\"configurable\":false},\"collapsed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::navigation.navigations-items-related\",\"configurable\":false},\"parent\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::navigation.navigation-item\",\"configurable\":false,\"default\":null},\"master\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::navigation.navigation\",\"configurable\":false,\"inversedBy\":\"items\"},\"audience\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::navigation.audience\"},\"additionalFields\":{\"type\":\"json\",\"require\":false,\"default\":{}}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"navigation-item\",\"connection\":\"default\",\"uid\":\"plugin::navigation.navigation-item\",\"plugin\":\"navigation\",\"globalId\":\"NavigationNavigationItem\"},\"plugin::navigation.navigations-items-related\":{\"collectionName\":\"navigations_items_related\",\"info\":{\"singularName\":\"navigations-items-related\",\"pluralName\":\"navigations-items-relateds\",\"displayName\":\"Navigations Items Related\",\"name\":\"navigations_items_related\"},\"options\":{\"increments\":true,\"timestamps\":false,\"populateCreatorFields\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false},\"i18n\":{\"localized\":false}},\"attributes\":{\"related_id\":{\"type\":\"string\",\"required\":true},\"related_type\":{\"type\":\"string\",\"required\":true},\"field\":{\"type\":\"string\",\"required\":true},\"order\":{\"type\":\"integer\",\"required\":true},\"master\":{\"type\":\"string\",\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"navigations_items_related\",\"info\":{\"singularName\":\"navigations-items-related\",\"pluralName\":\"navigations-items-relateds\",\"displayName\":\"Navigations Items Related\",\"name\":\"navigations_items_related\"},\"options\":{\"increments\":true,\"timestamps\":false,\"populateCreatorFields\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false},\"i18n\":{\"localized\":false}},\"attributes\":{\"related_id\":{\"type\":\"string\",\"required\":true},\"related_type\":{\"type\":\"string\",\"required\":true},\"field\":{\"type\":\"string\",\"required\":true},\"order\":{\"type\":\"integer\",\"required\":true},\"master\":{\"type\":\"string\",\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"navigations-items-related\",\"connection\":\"default\",\"uid\":\"plugin::navigation.navigations-items-related\",\"plugin\":\"navigation\",\"globalId\":\"NavigationNavigationsItemsRelated\"},\"api::about-us.about-us\":{\"kind\":\"singleType\",\"collectionName\":\"about_uses\",\"info\":{\"singularName\":\"about-us\",\"pluralName\":\"about-uses\",\"displayName\":\"About Us\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"page_bar\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\"]},\"content_image\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\"]},\"content\":{\"type\":\"richtext\",\"options\":{\"output\":\"HTML\",\"preset\":\"rich\"},\"customField\":\"plugin::ckeditor.CKEditor\"},\"highlights\":{\"displayName\":\"Content Box\",\"type\":\"component\",\"repeatable\":true,\"component\":\"controls.content-box\"},\"values_title\":{\"type\":\"string\"},\"values\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"controls.content-box\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"about_uses\",\"info\":{\"singularName\":\"about-us\",\"pluralName\":\"about-uses\",\"displayName\":\"About Us\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"page_bar\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\"]},\"content_image\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\"]},\"content\":{\"type\":\"customField\",\"options\":{\"output\":\"HTML\",\"preset\":\"rich\"},\"customField\":\"plugin::ckeditor.CKEditor\"},\"highlights\":{\"displayName\":\"Content Box\",\"type\":\"component\",\"repeatable\":true,\"component\":\"controls.content-box\"},\"values_title\":{\"type\":\"string\"},\"values\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"controls.content-box\"}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"about-us\",\"connection\":\"default\",\"uid\":\"api::about-us.about-us\",\"apiName\":\"about-us\",\"globalId\":\"AboutUs\",\"actions\":{},\"lifecycles\":{}},\"api::career.career\":{\"kind\":\"singleType\",\"collectionName\":\"careers\",\"info\":{\"singularName\":\"career\",\"pluralName\":\"careers\",\"displayName\":\"Careers\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"page_bar\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"careers\",\"info\":{\"singularName\":\"career\",\"pluralName\":\"careers\",\"displayName\":\"Careers\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"page_bar\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"career\",\"connection\":\"default\",\"uid\":\"api::career.career\",\"apiName\":\"career\",\"globalId\":\"Career\",\"actions\":{},\"lifecycles\":{}},\"api::career-candidate.career-candidate\":{\"kind\":\"collectionType\",\"collectionName\":\"career_candidates\",\"info\":{\"singularName\":\"career-candidate\",\"pluralName\":\"career-candidates\",\"displayName\":\"Career Candidates\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"private\":true},\"first_name\":{\"type\":\"string\",\"private\":true},\"last_name\":{\"type\":\"string\"},\"email\":{\"type\":\"string\"},\"contact\":{\"type\":\"string\"},\"job_title\":{\"type\":\"string\"},\"cover_letter\":{\"type\":\"richtext\",\"private\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"career_candidates\",\"info\":{\"singularName\":\"career-candidate\",\"pluralName\":\"career-candidates\",\"displayName\":\"Career Candidates\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"private\":true},\"first_name\":{\"type\":\"string\",\"private\":true},\"last_name\":{\"type\":\"string\"},\"email\":{\"type\":\"string\"},\"contact\":{\"type\":\"string\"},\"job_title\":{\"type\":\"string\"},\"cover_letter\":{\"type\":\"richtext\",\"private\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"career-candidate\",\"connection\":\"default\",\"uid\":\"api::career-candidate.career-candidate\",\"apiName\":\"career-candidate\",\"globalId\":\"CareerCandidate\",\"actions\":{},\"lifecycles\":{}},\"api::contact.contact\":{\"kind\":\"singleType\",\"collectionName\":\"contacts\",\"info\":{\"singularName\":\"contact\",\"pluralName\":\"contacts\",\"displayName\":\"Contact\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"page_bar\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false,\"required\":true},\"contact_info_title\":{\"type\":\"string\"},\"contact_info\":{\"type\":\"richtext\",\"options\":{\"output\":\"HTML\",\"preset\":\"rich\"},\"customField\":\"plugin::ckeditor.CKEditor\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"contacts\",\"info\":{\"singularName\":\"contact\",\"pluralName\":\"contacts\",\"displayName\":\"Contact\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"page_bar\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false,\"required\":true},\"contact_info_title\":{\"type\":\"string\"},\"contact_info\":{\"type\":\"customField\",\"options\":{\"output\":\"HTML\",\"preset\":\"rich\"},\"customField\":\"plugin::ckeditor.CKEditor\"}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"contact\",\"connection\":\"default\",\"uid\":\"api::contact.contact\",\"apiName\":\"contact\",\"globalId\":\"Contact\",\"actions\":{},\"lifecycles\":{}},\"api::contact-request.contact-request\":{\"kind\":\"collectionType\",\"collectionName\":\"contact_requests\",\"info\":{\"singularName\":\"contact-request\",\"pluralName\":\"contact-requests\",\"displayName\":\"Contact Requests\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"email\":{\"type\":\"string\"},\"contact\":{\"type\":\"string\"},\"message\":{\"type\":\"richtext\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"contact_requests\",\"info\":{\"singularName\":\"contact-request\",\"pluralName\":\"contact-requests\",\"displayName\":\"Contact Requests\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"email\":{\"type\":\"string\"},\"contact\":{\"type\":\"string\"},\"message\":{\"type\":\"richtext\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"contact-request\",\"connection\":\"default\",\"uid\":\"api::contact-request.contact-request\",\"apiName\":\"contact-request\",\"globalId\":\"ContactRequest\",\"actions\":{},\"lifecycles\":{}},\"api::home-page.home-page\":{\"kind\":\"singleType\",\"collectionName\":\"home_pages\",\"info\":{\"singularName\":\"home-page\",\"pluralName\":\"home-pages\",\"displayName\":\"Home Page\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"slider\":{\"displayName\":\"Banner Slider\",\"type\":\"component\",\"repeatable\":true,\"component\":\"controls.banner-slider\"},\"about_us\":{\"displayName\":\"Section Content\",\"type\":\"component\",\"repeatable\":false,\"component\":\"controls.section-content\"},\"business_section_title\":{\"type\":\"string\"},\"business_section_url\":{\"type\":\"string\"},\"business_section_link_title\":{\"type\":\"string\"},\"brief_section_title\":{\"type\":\"string\"},\"briefs\":{\"displayName\":\"Icon Item\",\"type\":\"component\",\"repeatable\":true,\"component\":\"controls.icon-item\",\"max\":4},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"home_pages\",\"info\":{\"singularName\":\"home-page\",\"pluralName\":\"home-pages\",\"displayName\":\"Home Page\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"slider\":{\"displayName\":\"Banner Slider\",\"type\":\"component\",\"repeatable\":true,\"component\":\"controls.banner-slider\"},\"about_us\":{\"displayName\":\"Section Content\",\"type\":\"component\",\"repeatable\":false,\"component\":\"controls.section-content\"},\"business_section_title\":{\"type\":\"string\"},\"business_section_url\":{\"type\":\"string\"},\"business_section_link_title\":{\"type\":\"string\"},\"brief_section_title\":{\"type\":\"string\"},\"briefs\":{\"displayName\":\"Icon Item\",\"type\":\"component\",\"repeatable\":true,\"component\":\"controls.icon-item\",\"max\":4}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"home-page\",\"connection\":\"default\",\"uid\":\"api::home-page.home-page\",\"apiName\":\"home-page\",\"globalId\":\"HomePage\",\"actions\":{},\"lifecycles\":{}},\"api::media-center.media-center\":{\"kind\":\"singleType\",\"collectionName\":\"media_centers\",\"info\":{\"singularName\":\"media-center\",\"pluralName\":\"media-centers\",\"displayName\":\"Media Center\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"page_bar\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"media_centers\",\"info\":{\"singularName\":\"media-center\",\"pluralName\":\"media-centers\",\"displayName\":\"Media Center\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"page_bar\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"media-center\",\"connection\":\"default\",\"uid\":\"api::media-center.media-center\",\"apiName\":\"media-center\",\"globalId\":\"MediaCenter\",\"actions\":{},\"lifecycles\":{}},\"api::media-item.media-item\":{\"kind\":\"collectionType\",\"collectionName\":\"media_items\",\"info\":{\"singularName\":\"media-item\",\"pluralName\":\"media-items\",\"displayName\":\"Media Items\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"url\":{\"type\":\"uid\",\"targetField\":\"title\",\"required\":true},\"image\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\"]},\"youtube\":{\"type\":\"string\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"media_items\",\"info\":{\"singularName\":\"media-item\",\"pluralName\":\"media-items\",\"displayName\":\"Media Items\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"url\":{\"type\":\"uid\",\"targetField\":\"title\",\"required\":true},\"image\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\"]},\"youtube\":{\"type\":\"string\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"media-item\",\"connection\":\"default\",\"uid\":\"api::media-item.media-item\",\"apiName\":\"media-item\",\"globalId\":\"MediaItem\",\"actions\":{},\"lifecycles\":{}},\"api::our-business.our-business\":{\"kind\":\"singleType\",\"collectionName\":\"our_businesses\",\"info\":{\"singularName\":\"our-business\",\"pluralName\":\"our-businesses\",\"displayName\":\"Our Business\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"page_bar\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false,\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"our_businesses\",\"info\":{\"singularName\":\"our-business\",\"pluralName\":\"our-businesses\",\"displayName\":\"Our Business\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"page_bar\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false,\"required\":true}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"our-business\",\"connection\":\"default\",\"uid\":\"api::our-business.our-business\",\"apiName\":\"our-business\",\"globalId\":\"OurBusiness\",\"actions\":{},\"lifecycles\":{}},\"api::search-page.search-page\":{\"kind\":\"singleType\",\"collectionName\":\"search_pages\",\"info\":{\"singularName\":\"search-page\",\"pluralName\":\"search-pages\",\"displayName\":\"Search Page\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"page_bar\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"search_pages\",\"info\":{\"singularName\":\"search-page\",\"pluralName\":\"search-pages\",\"displayName\":\"Search Page\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"page_bar\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"search-page\",\"connection\":\"default\",\"uid\":\"api::search-page.search-page\",\"apiName\":\"search-page\",\"globalId\":\"SearchPage\",\"actions\":{},\"lifecycles\":{}},\"api::service.service\":{\"kind\":\"collectionType\",\"collectionName\":\"services\",\"info\":{\"singularName\":\"service\",\"pluralName\":\"services\",\"displayName\":\"Services\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"image\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false,\"required\":true},\"url\":{\"type\":\"uid\",\"targetField\":\"title\",\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"services\",\"info\":{\"singularName\":\"service\",\"pluralName\":\"services\",\"displayName\":\"Services\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"image\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false,\"required\":true},\"url\":{\"type\":\"uid\",\"targetField\":\"title\",\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"service\",\"connection\":\"default\",\"uid\":\"api::service.service\",\"apiName\":\"service\",\"globalId\":\"Service\",\"actions\":{},\"lifecycles\":{}},\"api::social-link.social-link\":{\"kind\":\"collectionType\",\"collectionName\":\"social_links\",\"info\":{\"singularName\":\"social-link\",\"pluralName\":\"social-links\",\"displayName\":\"Social Links\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"icon\":{\"type\":\"string\",\"default\":\"icon-facebook\",\"required\":true},\"url\":{\"type\":\"string\",\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"social_links\",\"info\":{\"singularName\":\"social-link\",\"pluralName\":\"social-links\",\"displayName\":\"Social Links\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"icon\":{\"type\":\"string\",\"default\":\"icon-facebook\",\"required\":true},\"url\":{\"type\":\"string\",\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"social-link\",\"connection\":\"default\",\"uid\":\"api::social-link.social-link\",\"apiName\":\"social-link\",\"globalId\":\"SocialLink\",\"actions\":{},\"lifecycles\":{}},\"api::vacancy.vacancy\":{\"kind\":\"collectionType\",\"collectionName\":\"vacancies\",\"info\":{\"singularName\":\"vacancy\",\"pluralName\":\"vacancies\",\"displayName\":\"Career Vacancies\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"description\":{\"type\":\"richtext\",\"options\":{\"output\":\"HTML\",\"preset\":\"rich\"},\"customField\":\"plugin::ckeditor.CKEditor\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"vacancies\",\"info\":{\"singularName\":\"vacancy\",\"pluralName\":\"vacancies\",\"displayName\":\"Career Vacancies\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"description\":{\"type\":\"customField\",\"options\":{\"output\":\"HTML\",\"preset\":\"rich\"},\"customField\":\"plugin::ckeditor.CKEditor\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"vacancy\",\"connection\":\"default\",\"uid\":\"api::vacancy.vacancy\",\"apiName\":\"vacancy\",\"globalId\":\"Vacancy\",\"actions\":{},\"lifecycles\":{}}}','object',NULL,NULL),(2,'plugin_content_manager_configuration_content_types::admin::permission','{\"uid\":\"admin::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"properties\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}],[{\"name\":\"role\",\"size\":6}]]}}','object',NULL,NULL),(3,'plugin_content_manager_configuration_content_types::admin::user','{\"uid\":\"admin::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"registrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"registrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"isActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"preferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"preferedLanguage\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"registrationToken\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"roles\",\"size\":6},{\"name\":\"blocked\",\"size\":4}],[{\"name\":\"preferedLanguage\",\"size\":6}]]}}','object',NULL,NULL),(4,'plugin_content_manager_configuration_content_types::admin::api-token','{\"uid\":\"admin::api-token\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"accessKey\",\"size\":6}],[{\"name\":\"lastUsedAt\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"expiresAt\",\"size\":6},{\"name\":\"lifespan\",\"size\":4}]]}}','object',NULL,NULL),(5,'plugin_content_manager_configuration_content_types::admin::role','{\"uid\":\"admin::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6},{\"name\":\"users\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6}]]}}','object',NULL,NULL),(6,'plugin_content_manager_configuration_content_types::admin::api-token-permission','{\"uid\":\"admin::api-token-permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]}}','object',NULL,NULL),(7,'plugin_content_manager_configuration_content_types::plugin::upload.file','{\"uid\":\"plugin::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"alternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"alternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"previewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"previewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider_metadata\",\"searchable\":false,\"sortable\":false}},\"folder\":{\"edit\":{\"label\":\"folder\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"folder\",\"searchable\":true,\"sortable\":true}},\"folderPath\":{\"edit\":{\"label\":\"folderPath\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"folderPath\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}],[{\"name\":\"folder\",\"size\":6},{\"name\":\"folderPath\",\"size\":6}]]}}','object',NULL,NULL),(8,'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission','{\"uid\":\"plugin::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"role\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"role\",\"size\":6}]]}}','object',NULL,NULL),(9,'plugin_content_manager_configuration_content_types::plugin::navigation.navigation-item','{\"uid\":\"plugin::navigation.navigation-item\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"uiRouterKey\",\"defaultSortBy\":\"uiRouterKey\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"path\":{\"edit\":{\"label\":\"path\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"path\",\"searchable\":true,\"sortable\":true}},\"externalPath\":{\"edit\":{\"label\":\"externalPath\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"externalPath\",\"searchable\":true,\"sortable\":true}},\"uiRouterKey\":{\"edit\":{\"label\":\"uiRouterKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"uiRouterKey\",\"searchable\":true,\"sortable\":true}},\"menuAttached\":{\"edit\":{\"label\":\"menuAttached\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"menuAttached\",\"searchable\":true,\"sortable\":true}},\"order\":{\"edit\":{\"label\":\"order\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"order\",\"searchable\":true,\"sortable\":true}},\"collapsed\":{\"edit\":{\"label\":\"collapsed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"collapsed\",\"searchable\":true,\"sortable\":true}},\"related\":{\"edit\":{\"label\":\"related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"related_id\"},\"list\":{\"label\":\"related\",\"searchable\":true,\"sortable\":true}},\"parent\":{\"edit\":{\"label\":\"parent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"uiRouterKey\"},\"list\":{\"label\":\"parent\",\"searchable\":true,\"sortable\":true}},\"master\":{\"edit\":{\"label\":\"master\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"localeCode\"},\"list\":{\"label\":\"master\",\"searchable\":true,\"sortable\":true}},\"audience\":{\"edit\":{\"label\":\"audience\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"audience\",\"searchable\":false,\"sortable\":false}},\"additionalFields\":{\"edit\":{\"label\":\"additionalFields\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"additionalFields\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"type\",\"path\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"type\",\"size\":6}],[{\"name\":\"path\",\"size\":6},{\"name\":\"externalPath\",\"size\":6}],[{\"name\":\"uiRouterKey\",\"size\":6},{\"name\":\"menuAttached\",\"size\":4}],[{\"name\":\"order\",\"size\":4},{\"name\":\"collapsed\",\"size\":4}],[{\"name\":\"related\",\"size\":6},{\"name\":\"parent\",\"size\":6}],[{\"name\":\"master\",\"size\":6},{\"name\":\"audience\",\"size\":6}],[{\"name\":\"additionalFields\",\"size\":12}]]}}','object',NULL,NULL),(10,'plugin_content_manager_configuration_content_types::plugin::i18n.locale','{\"uid\":\"plugin::i18n.locale\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"createdAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]]}}','object',NULL,NULL),(11,'plugin_content_manager_configuration_content_types::plugin::upload.folder','{\"uid\":\"plugin::upload.folder\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"pathId\":{\"edit\":{\"label\":\"pathId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"pathId\",\"searchable\":true,\"sortable\":true}},\"parent\":{\"edit\":{\"label\":\"parent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"parent\",\"searchable\":true,\"sortable\":true}},\"children\":{\"edit\":{\"label\":\"children\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"children\",\"searchable\":false,\"sortable\":false}},\"files\":{\"edit\":{\"label\":\"files\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"files\",\"searchable\":false,\"sortable\":false}},\"path\":{\"edit\":{\"label\":\"path\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"path\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"pathId\",\"parent\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"pathId\",\"size\":4}],[{\"name\":\"parent\",\"size\":6},{\"name\":\"children\",\"size\":6}],[{\"name\":\"files\",\"size\":6},{\"name\":\"path\",\"size\":6}]]}}','object',NULL,NULL),(12,'plugin_content_manager_configuration_content_types::plugin::users-permissions.role','{\"uid\":\"plugin::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"users\",\"size\":6}]]}}','object',NULL,NULL),(13,'plugin_content_manager_configuration_content_types::plugin::users-permissions.user','{\"uid\":\"plugin::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"confirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"confirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"role\",\"size\":6}]]}}','object',NULL,NULL),(14,'plugin_content_manager_configuration_content_types::plugin::navigation.audience','{\"uid\":\"plugin::navigation.audience\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"key\":{\"edit\":{\"label\":\"key\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"key\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"key\",\"createdAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"key\",\"size\":6}]]}}','object',NULL,NULL),(15,'plugin_content_manager_configuration_content_types::plugin::navigation.navigation','{\"uid\":\"plugin::navigation.navigation\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"localeCode\",\"defaultSortBy\":\"localeCode\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"visible\":{\"edit\":{\"label\":\"visible\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"visible\",\"searchable\":true,\"sortable\":true}},\"items\":{\"edit\":{\"label\":\"items\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"uiRouterKey\"},\"list\":{\"label\":\"items\",\"searchable\":false,\"sortable\":false}},\"localizations\":{\"edit\":{\"label\":\"localizations\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"localeCode\"},\"list\":{\"label\":\"localizations\",\"searchable\":false,\"sortable\":false}},\"localeCode\":{\"edit\":{\"label\":\"localeCode\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"localeCode\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"slug\",\"visible\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"slug\",\"size\":6}],[{\"name\":\"visible\",\"size\":4},{\"name\":\"items\",\"size\":6}],[{\"name\":\"localizations\",\"size\":6},{\"name\":\"localeCode\",\"size\":6}]]}}','object',NULL,NULL),(16,'plugin_content_manager_configuration_content_types::plugin::navigation.navigations-items-related','{\"uid\":\"plugin::navigation.navigations-items-related\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"related_id\",\"defaultSortBy\":\"related_id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"related_id\":{\"edit\":{\"label\":\"related_id\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"related_id\",\"searchable\":true,\"sortable\":true}},\"related_type\":{\"edit\":{\"label\":\"related_type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"related_type\",\"searchable\":true,\"sortable\":true}},\"field\":{\"edit\":{\"label\":\"field\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"field\",\"searchable\":true,\"sortable\":true}},\"order\":{\"edit\":{\"label\":\"order\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"order\",\"searchable\":true,\"sortable\":true}},\"master\":{\"edit\":{\"label\":\"master\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"master\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"related_id\",\"related_type\",\"field\"],\"edit\":[[{\"name\":\"related_id\",\"size\":6},{\"name\":\"related_type\",\"size\":6}],[{\"name\":\"field\",\"size\":6},{\"name\":\"order\",\"size\":4}],[{\"name\":\"master\",\"size\":6}]]}}','object',NULL,NULL),(17,'plugin_upload_settings','{\"sizeOptimization\":true,\"responsiveDimensions\":false,\"autoOrientation\":false}','object',NULL,NULL),(18,'plugin_upload_view_configuration','{\"pageSize\":10,\"sort\":\"createdAt:DESC\"}','object',NULL,NULL),(19,'plugin_upload_metrics','{\"weeklySchedule\":\"56 46 20 * * 2\",\"lastWeeklyUpdate\":1677606416048}','object',NULL,NULL),(20,'plugin_i18n_default_locale','\"en\"','string',NULL,NULL),(21,'plugin_users-permissions_grant','{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"api/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"enabled\":false,\"icon\":\"reddit\",\"key\":\"\",\"secret\":\"\",\"state\":true,\"callback\":\"api/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"api/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"enabled\":false,\"icon\":\"book\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"},\"patreon\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/patreon/callback\",\"scope\":[\"identity\",\"identity[email]\"]}}','object',NULL,NULL),(22,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}','object',NULL,NULL),(23,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":false,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":\"\",\"default_role\":\"authenticated\"}','object',NULL,NULL),(24,'plugin_navigation_config','{\"additionalFields\":[{\"name\":\"active\",\"label\":\"Active\",\"type\":\"boolean\",\"required\":true,\"multi\":false,\"options\":[],\"enabled\":true},{\"name\":\"sitemap\",\"label\":\"Include in Sitemap\",\"type\":\"boolean\",\"required\":true,\"multi\":false,\"options\":[],\"enabled\":true},{\"name\":\"item_template\",\"label\":\"Page Item Template\",\"type\":\"select\",\"required\":true,\"multi\":false,\"options\":[\"Content\"],\"enabled\":true},{\"name\":\"template\",\"label\":\"Page Template\",\"type\":\"select\",\"required\":true,\"multi\":false,\"options\":[\"Home\",\"About\",\"Services\",\"Media Listing\",\"Career\",\"Contact\"],\"enabled\":true},{\"name\":\"page_role\",\"label\":\"Page Role\",\"type\":\"select\",\"required\":false,\"multi\":false,\"options\":[\"Home\",\"Services\",\"Media\"],\"enabled\":true}],\"contentTypes\":[\"api::about-us.about-us\",\"api::our-business.our-business\",\"api::media-center.media-center\",\"api::career.career\",\"api::contact.contact\"],\"contentTypesNameFields\":{\"default\":[\"title\",\"subject\",\"name\"],\"api::about-us.about-us\":[\"title\"],\"api::our-business.our-business\":[\"title\"],\"api::media-center.media-center\":[\"title\"],\"api::career.career\":[\"title\"],\"api::contact.contact\":[\"title\"]},\"contentTypesPopulate\":{\"api::about-us.about-us\":[\"content_image\",\"highlights\",\"page_bar\",\"values\"],\"api::our-business.our-business\":[\"page_bar\"],\"api::media-center.media-center\":[\"page_bar\"],\"api::career.career\":[\"page_bar\"],\"api::contact.contact\":[\"page_bar\"]},\"allowedLevels\":1,\"gql\":{\"navigationItemRelated\":[\"AboutUs\",\"OurBusiness\",\"MediaCenter\",\"Career\",\"Contact\"]},\"i18nEnabled\":false,\"pruneObsoleteI18nNavigations\":false,\"pathDefaultFields\":{\"api::about-us.about-us\":[\"title\"],\"api::our-business.our-business\":[\"title\"],\"api::media-center.media-center\":[\"title\"],\"api::career.career\":[\"title\"],\"api::contact.contact\":[\"title\"]},\"cascadeMenuAttached\":true}','object',NULL,NULL),(25,'core_admin_auth','{\"providers\":{\"autoRegister\":false,\"defaultRole\":null}}','object',NULL,NULL),(26,'plugin_content_manager_configuration_content_types::api::social-link.social-link','{\"uid\":\"api::social-link.social-link\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"The social media channel name\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"icon\":{\"edit\":{\"label\":\"Icon\",\"description\":\"The icon to be shown on website\",\"placeholder\":\"icon-facebook\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"icon\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"Link URL\",\"description\":\"The link to your social media page\",\"placeholder\":\"https://facebook.com/your_page_link\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"icon\",\"size\":6}],[{\"name\":\"url\",\"size\":12}]],\"list\":[\"id\",\"title\",\"icon\",\"url\"]}}','object',NULL,NULL),(27,'plugin_content_manager_configuration_components::controls.banner-slider-box','{\"uid\":\"controls.banner-slider-box\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"text\":{\"edit\":{\"label\":\"Text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"text\"],\"edit\":[[{\"name\":\"text\",\"size\":12}]]},\"isComponent\":true}','object',NULL,NULL),(28,'plugin_content_manager_configuration_components::controls.banner-slider-caption','{\"uid\":\"controls.banner-slider-caption\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"Caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"number\":{\"edit\":{\"label\":\"Caption Number\",\"description\":\"You can leave empty\",\"placeholder\":\"01\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"number\",\"searchable\":true,\"sortable\":true}},\"details\":{\"edit\":{\"label\":\"Caption Details\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"details\",\"searchable\":true,\"sortable\":true}},\"link_url\":{\"edit\":{\"label\":\"Caption Link URL\",\"description\":\"You can leave empty\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"link_url\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"number\",\"details\"],\"edit\":[[{\"name\":\"number\",\"size\":6},{\"name\":\"title\",\"size\":6}],[{\"name\":\"details\",\"size\":12}],[{\"name\":\"link_url\",\"size\":12}]]},\"isComponent\":true}','object',NULL,NULL),(29,'plugin_content_manager_configuration_components::controls.banner-slider','{\"uid\":\"controls.banner-slider\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"not shown on website\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"image\":{\"edit\":{\"label\":\"Slide Image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"image\",\"searchable\":false,\"sortable\":false}},\"caption\":{\"edit\":{\"label\":\"Slide Caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"caption\",\"searchable\":false,\"sortable\":false}},\"boxes\":{\"edit\":{\"label\":\"Information Boxes\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"boxes\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"title\",\"image\",\"caption\"],\"edit\":[[{\"name\":\"title\",\"size\":12}],[{\"name\":\"image\",\"size\":12}],[{\"name\":\"caption\",\"size\":12}],[{\"name\":\"boxes\",\"size\":12}]]},\"isComponent\":true}','object',NULL,NULL),(30,'plugin_content_manager_configuration_content_types::api::home-page.home-page','{\"uid\":\"api::home-page.home-page\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"slider\":{\"edit\":{\"label\":\"Banner Slider of Images\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slider\",\"searchable\":false,\"sortable\":false}},\"about_us\":{\"edit\":{\"label\":\"About Us Section\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"about_us\",\"searchable\":false,\"sortable\":false}},\"business_section_title\":{\"edit\":{\"label\":\"Business Section Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"business_section_title\",\"searchable\":true,\"sortable\":true}},\"business_section_url\":{\"edit\":{\"label\":\"Business Section Link URL\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"business_section_url\",\"searchable\":true,\"sortable\":true}},\"business_section_link_title\":{\"edit\":{\"label\":\"Business Section Link Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"business_section_link_title\",\"searchable\":true,\"sortable\":true}},\"brief_section_title\":{\"edit\":{\"label\":\"Brief Section Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"brief_section_title\",\"searchable\":true,\"sortable\":true}},\"briefs\":{\"edit\":{\"label\":\"Briefs\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"briefs\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"slider\",\"size\":12}],[{\"name\":\"about_us\",\"size\":12}],[{\"name\":\"business_section_title\",\"size\":12}],[{\"name\":\"business_section_link_title\",\"size\":6},{\"name\":\"business_section_url\",\"size\":6}],[{\"name\":\"brief_section_title\",\"size\":12}],[{\"name\":\"briefs\",\"size\":12}]],\"list\":[\"id\",\"slider\",\"createdAt\",\"updatedAt\"]}}','object',NULL,NULL),(31,'plugin_content_manager_configuration_components::controls.section-content','{\"uid\":\"controls.section-content\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"content\":{\"edit\":{\"label\":\"Content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"content\",\"searchable\":false,\"sortable\":false}},\"url\":{\"edit\":{\"label\":\"Link URL\",\"description\":\"Optional url to appear as a read more button\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"image\":{\"edit\":{\"label\":\"Image\",\"description\":\"Optional image that appears to the side of the content\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"image\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"title\",\"url\",\"image\"],\"edit\":[[{\"name\":\"title\",\"size\":12}],[{\"name\":\"content\",\"size\":12}],[{\"name\":\"url\",\"size\":6},{\"name\":\"image\",\"size\":6}]]},\"isComponent\":true}','object',NULL,NULL),(32,'plugin_content_manager_configuration_content_types::api::service.service','{\"uid\":\"api::service.service\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"image\":{\"edit\":{\"label\":\"Image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"image\",\"searchable\":false,\"sortable\":false}},\"url\":{\"edit\":{\"label\":\"URL\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"url\",\"size\":6}],[{\"name\":\"image\",\"size\":6}]],\"list\":[\"id\",\"title\",\"image\",\"url\"]}}','object',NULL,NULL),(33,'plugin_content_manager_configuration_components::controls.icon-item','{\"uid\":\"controls.icon-item\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"Item title\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"number\":{\"edit\":{\"label\":\"Item Number (optional)\",\"description\":\"You can leave empty\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"number\",\"searchable\":true,\"sortable\":true}},\"icon\":{\"edit\":{\"label\":\"Item Icon Image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"icon\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"title\",\"number\",\"icon\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"icon\",\"size\":6}],[{\"name\":\"number\",\"size\":6}]]},\"isComponent\":true}','object',NULL,NULL),(34,'plugin_content_manager_configuration_components::controls.content-box','{\"uid\":\"controls.content-box\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"Item Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"text\":{\"edit\":{\"label\":\"Item Text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"text\"],\"edit\":[[{\"name\":\"title\",\"size\":12}],[{\"name\":\"text\",\"size\":12}]]},\"isComponent\":true}','object',NULL,NULL),(35,'plugin_content_manager_configuration_content_types::api::about-us.about-us','{\"uid\":\"api::about-us.about-us\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Page Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"page_bar\":{\"edit\":{\"label\":\"Page Bar Image\",\"description\":\"The image behind the website header\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"page_bar\",\"searchable\":false,\"sortable\":false}},\"content_image\":{\"edit\":{\"label\":\"Content Image\",\"description\":\"The image that appears to the right of content (optional)\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"content_image\",\"searchable\":false,\"sortable\":false}},\"content\":{\"edit\":{\"label\":\"Content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"content\",\"searchable\":false,\"sortable\":false}},\"highlights\":{\"edit\":{\"label\":\"Highlights (mission & vision)\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"highlights\",\"searchable\":false,\"sortable\":false}},\"values_title\":{\"edit\":{\"label\":\"Values Section Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"values_title\",\"searchable\":true,\"sortable\":true}},\"values\":{\"edit\":{\"label\":\"values\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"values\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"title\",\"size\":12}],[{\"name\":\"page_bar\",\"size\":6},{\"name\":\"content_image\",\"size\":6}],[{\"name\":\"content\",\"size\":12}],[{\"name\":\"highlights\",\"size\":12}],[{\"name\":\"values_title\",\"size\":12}],[{\"name\":\"values\",\"size\":12}]],\"list\":[\"id\",\"title\",\"page_bar\",\"content_image\"]}}','object',NULL,NULL),(36,'plugin_content_manager_configuration_content_types::api::our-business.our-business','{\"uid\":\"api::our-business.our-business\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Page Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"page_bar\":{\"edit\":{\"label\":\"Page Bar Image\",\"description\":\"The image behind the website header\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"page_bar\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"title\",\"size\":12}],[{\"name\":\"page_bar\",\"size\":6}]],\"list\":[\"id\",\"title\",\"page_bar\",\"createdAt\"]}}','object',NULL,NULL),(37,'plugin_content_manager_configuration_content_types::api::media-center.media-center','{\"uid\":\"api::media-center.media-center\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Page Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"page_bar\":{\"edit\":{\"label\":\"Page Bar Image\",\"description\":\"The image behind the website header\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"page_bar\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"title\",\"size\":12}],[{\"name\":\"page_bar\",\"size\":6}]],\"list\":[\"id\",\"title\",\"page_bar\",\"createdAt\"]}}','object',NULL,NULL),(38,'plugin_content_manager_configuration_content_types::api::media-item.media-item','{\"uid\":\"api::media-item.media-item\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"URL\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"image\":{\"edit\":{\"label\":\"Image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"image\",\"searchable\":false,\"sortable\":false}},\"youtube\":{\"edit\":{\"label\":\"YouTube Video Link\",\"description\":\"Embedded YouTube video to replace the listing image\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"youtube\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"url\",\"size\":6}],[{\"name\":\"youtube\",\"size\":6},{\"name\":\"image\",\"size\":6}]],\"list\":[\"id\",\"title\",\"url\",\"image\"]}}','object',NULL,NULL),(39,'plugin_content_manager_configuration_content_types::api::career.career','{\"uid\":\"api::career.career\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Page Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"page_bar\":{\"edit\":{\"label\":\"Page Bar Image\",\"description\":\"The image behind the website header\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"page_bar\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"title\",\"size\":12}],[{\"name\":\"page_bar\",\"size\":6}]],\"list\":[\"id\",\"title\",\"page_bar\",\"createdAt\"]}}','object',NULL,NULL),(40,'plugin_content_manager_configuration_content_types::admin::transfer-token','{\"uid\":\"admin::transfer-token\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"accessKey\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"accessKey\",\"size\":6},{\"name\":\"lastUsedAt\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6},{\"name\":\"expiresAt\",\"size\":6}],[{\"name\":\"lifespan\",\"size\":4}]]}}','object',NULL,NULL),(41,'plugin_content_manager_configuration_content_types::admin::transfer-token-permission','{\"uid\":\"admin::transfer-token-permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]}}','object',NULL,NULL),(42,'plugin_content_manager_configuration_content_types::api::vacancy.vacancy','{\"uid\":\"api::vacancy.vacancy\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"title\",\"size\":12}],[{\"name\":\"description\",\"size\":12}]],\"list\":[\"id\",\"title\",\"createdAt\",\"updatedAt\"]}}','object',NULL,NULL),(43,'plugin_content_manager_configuration_content_types::api::career-candidate.career-candidate','{\"uid\":\"api::career-candidate.career-candidate\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":false},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"first_name\":{\"edit\":{\"label\":\"First Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":false},\"list\":{\"label\":\"first_name\",\"searchable\":true,\"sortable\":true}},\"last_name\":{\"edit\":{\"label\":\"Last Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":false},\"list\":{\"label\":\"last_name\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":false},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"contact\":{\"edit\":{\"label\":\"Contact\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":false},\"list\":{\"label\":\"contact\",\"searchable\":true,\"sortable\":true}},\"job_title\":{\"edit\":{\"label\":\"Job Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":false},\"list\":{\"label\":\"job_title\",\"searchable\":true,\"sortable\":true}},\"cover_letter\":{\"edit\":{\"label\":\"Cover Letter\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":false},\"list\":{\"label\":\"cover_letter\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"title\",\"size\":4},{\"name\":\"first_name\",\"size\":4},{\"name\":\"last_name\",\"size\":4}],[{\"name\":\"email\",\"size\":6},{\"name\":\"contact\",\"size\":6}],[{\"name\":\"job_title\",\"size\":12}],[{\"name\":\"cover_letter\",\"size\":12}]],\"list\":[\"id\",\"title\",\"first_name\",\"last_name\"]}}','object',NULL,NULL),(44,'plugin_content_manager_configuration_content_types::api::contact.contact','{\"uid\":\"api::contact.contact\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Page Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"page_bar\":{\"edit\":{\"label\":\"Page Bar Image\",\"description\":\"The image behind the website header\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"page_bar\",\"searchable\":false,\"sortable\":false}},\"contact_info_title\":{\"edit\":{\"label\":\"Contact Information Section Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"contact_info_title\",\"searchable\":true,\"sortable\":true}},\"contact_info\":{\"edit\":{\"label\":\"Contact Information\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"contact_info\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"page_bar\",\"size\":6}],[{\"name\":\"contact_info_title\",\"size\":12}],[{\"name\":\"contact_info\",\"size\":12}]],\"list\":[\"id\",\"title\",\"page_bar\",\"contact_info_title\"]}}','object',NULL,NULL),(45,'plugin_content_manager_configuration_content_types::api::contact-request.contact-request','{\"uid\":\"api::contact-request.contact-request\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"contact\":{\"edit\":{\"label\":\"Contact Number\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"contact\",\"searchable\":true,\"sortable\":true}},\"message\":{\"edit\":{\"label\":\"Request\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"message\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"name\",\"size\":12}],[{\"name\":\"email\",\"size\":6},{\"name\":\"contact\",\"size\":6}],[{\"name\":\"message\",\"size\":12}]],\"list\":[\"id\",\"name\",\"email\",\"contact\"]}}','object',NULL,NULL),(46,'plugin_content_manager_configuration_content_types::api::search-page.search-page','{\"uid\":\"api::search-page.search-page\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"page_bar\":{\"edit\":{\"label\":\"Page Bar Image\",\"description\":\"The image behind the website header\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"page_bar\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"page_bar\",\"size\":6}]],\"list\":[\"id\",\"title\",\"page_bar\",\"createdAt\"]}}','object',NULL,NULL);
/*!40000 ALTER TABLE `strapi_core_store_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_database_schema`
--

DROP TABLE IF EXISTS `strapi_database_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_database_schema` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `schema` json DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `hash` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_database_schema`
--

LOCK TABLES `strapi_database_schema` WRITE;
/*!40000 ALTER TABLE `strapi_database_schema` DISABLE KEYS */;
INSERT INTO `strapi_database_schema` VALUES (21,'{\"tables\": [{\"name\": \"strapi_core_store_settings\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"value\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"environment\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"tag\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"strapi_webhooks\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"url\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"headers\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"events\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"enabled\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"admin_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"subject\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"properties\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"conditions\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"admin_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"admin_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_users\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"firstname\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"lastname\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"username\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"password\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"reset_password_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"registration_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"is_active\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"blocked\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"prefered_language\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_users_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"admin_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"admin_users_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_roles\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"code\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"admin_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"admin_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_api_tokens\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"access_key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"last_used_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"expires_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"lifespan\", \"type\": \"bigInteger\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_api_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_api_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_api_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_api_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_api_token_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_api_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_api_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_api_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_api_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_transfer_tokens\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"access_key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"last_used_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"expires_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"lifespan\", \"type\": \"bigInteger\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_transfer_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_transfer_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_transfer_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_transfer_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_transfer_token_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_transfer_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_transfer_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_transfer_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_transfer_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"files\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"alternative_text\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"caption\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"width\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"height\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"formats\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"hash\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"ext\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"mime\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [10, 2], \"name\": \"size\", \"type\": \"decimal\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"preview_url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"provider\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"provider_metadata\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"folder_path\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"upload_files_folder_path_index\", \"type\": null, \"columns\": [\"folder_path\"]}, {\"name\": \"upload_files_created_at_index\", \"type\": null, \"columns\": [\"created_at\"]}, {\"name\": \"upload_files_updated_at_index\", \"type\": null, \"columns\": [\"updated_at\"]}, {\"name\": \"upload_files_name_index\", \"type\": null, \"columns\": [\"name\"]}, {\"name\": \"upload_files_size_index\", \"type\": null, \"columns\": [\"size\"]}, {\"name\": \"upload_files_ext_index\", \"type\": null, \"columns\": [\"ext\"]}, {\"name\": \"files_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"files_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"files_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"files_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"upload_folders\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"path_id\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"path\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"upload_folders_path_id_index\", \"type\": \"unique\", \"columns\": [\"path_id\"]}, {\"name\": \"upload_folders_path_index\", \"type\": \"unique\", \"columns\": [\"path\"]}, {\"name\": \"upload_folders_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"upload_folders_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"upload_folders_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"upload_folders_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"i18n_locale\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"code\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"i18n_locale_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"i18n_locale_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"i18n_locale_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"i18n_locale_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"up_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"up_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_roles\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"up_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"up_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_users\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"username\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"provider\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"password\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"reset_password_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"confirmation_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"confirmed\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"blocked\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_users_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"up_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"up_users_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"audience\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"key\", \"type\": \"string\", \"unique\": true, \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"audience_key_unique\", \"type\": \"unique\", \"columns\": [\"key\"]}, {\"name\": \"audience_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"audience_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"audience_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"audience_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"navigations\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [\"longtext\"], \"name\": \"name\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"slug\", \"type\": \"string\", \"unique\": true, \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"visible\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale_code\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"navigations_slug_unique\", \"type\": \"unique\", \"columns\": [\"slug\"]}, {\"name\": \"navigations_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"navigations_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"navigations_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"navigations_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"navigations_items\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [\"longtext\"], \"name\": \"title\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"path\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"external_path\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"ui_router_key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"menu_attached\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"collapsed\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"additional_fields\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"navigations_items_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"navigations_items_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"navigations_items_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"navigations_items_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"navigations_items_related\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"related_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"related_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"master\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"navigations_items_related_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"navigations_items_related_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"navigations_items_related_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"navigations_items_related_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"about_uses\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"content\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"values_title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"about_uses_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"about_uses_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"about_uses_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"about_uses_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"careers\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"careers_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"careers_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"careers_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"careers_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"career_candidates\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"first_name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"last_name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"contact\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"job_title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"cover_letter\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"career_candidates_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"career_candidates_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"career_candidates_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"career_candidates_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"contacts\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"contact_info_title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"contact_info\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"contacts_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"contacts_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"contacts_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"contacts_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"contact_requests\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"contact\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"message\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"contact_requests_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"contact_requests_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"contact_requests_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"contact_requests_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"home_pages\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"business_section_title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"business_section_url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"business_section_link_title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"brief_section_title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"home_pages_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"home_pages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"home_pages_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"home_pages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"media_centers\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"media_centers_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"media_centers_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"media_centers_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"media_centers_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"media_items\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"url\", \"type\": \"string\", \"unique\": true, \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"youtube\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"media_items_url_unique\", \"type\": \"unique\", \"columns\": [\"url\"]}, {\"name\": \"media_items_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"media_items_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"media_items_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"media_items_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"our_businesses\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"our_businesses_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"our_businesses_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"our_businesses_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"our_businesses_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"search_pages\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"search_pages_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"search_pages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"search_pages_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"search_pages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"services\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"url\", \"type\": \"string\", \"unique\": true, \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"services_url_unique\", \"type\": \"unique\", \"columns\": [\"url\"]}, {\"name\": \"services_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"services_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"services_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"services_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"social_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"icon\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"social_links_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"social_links_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"social_links_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"social_links_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"vacancies\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"vacancies_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"vacancies_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"vacancies_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"vacancies_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_controls_banner_slider_boxes\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [\"longtext\"], \"name\": \"text\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_controls_banner_slider_captions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"number\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"details\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"link_url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_controls_banner_sliders\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_controls_content_boxes\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"text\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_controls_icon_items\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"number\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_controls_section_contents\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"content\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"admin_permissions_role_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"permission_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_permissions_role_links_fk\", \"columns\": [\"permission_id\"]}, {\"name\": \"admin_permissions_role_links_inv_fk\", \"columns\": [\"role_id\"]}, {\"name\": \"admin_permissions_role_links_unique\", \"type\": \"unique\", \"columns\": [\"permission_id\", \"role_id\"]}, {\"name\": \"admin_permissions_role_links_order_inv_fk\", \"columns\": [\"permission_order\"]}], \"foreignKeys\": [{\"name\": \"admin_permissions_role_links_fk\", \"columns\": [\"permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_permissions_role_links_inv_fk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_users_roles_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"user_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"user_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_users_roles_links_fk\", \"columns\": [\"user_id\"]}, {\"name\": \"admin_users_roles_links_inv_fk\", \"columns\": [\"role_id\"]}, {\"name\": \"admin_users_roles_links_unique\", \"type\": \"unique\", \"columns\": [\"user_id\", \"role_id\"]}, {\"name\": \"admin_users_roles_links_order_fk\", \"columns\": [\"role_order\"]}, {\"name\": \"admin_users_roles_links_order_inv_fk\", \"columns\": [\"user_order\"]}], \"foreignKeys\": [{\"name\": \"admin_users_roles_links_fk\", \"columns\": [\"user_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_users_roles_links_inv_fk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_api_token_permissions_token_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"api_token_permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"api_token_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"api_token_permission_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_api_token_permissions_token_links_fk\", \"columns\": [\"api_token_permission_id\"]}, {\"name\": \"strapi_api_token_permissions_token_links_inv_fk\", \"columns\": [\"api_token_id\"]}, {\"name\": \"strapi_api_token_permissions_token_links_unique\", \"type\": \"unique\", \"columns\": [\"api_token_permission_id\", \"api_token_id\"]}, {\"name\": \"strapi_api_token_permissions_token_links_order_inv_fk\", \"columns\": [\"api_token_permission_order\"]}], \"foreignKeys\": [{\"name\": \"strapi_api_token_permissions_token_links_fk\", \"columns\": [\"api_token_permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_api_token_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_api_token_permissions_token_links_inv_fk\", \"columns\": [\"api_token_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_api_tokens\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_transfer_token_permissions_token_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"transfer_token_permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"transfer_token_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"transfer_token_permission_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_transfer_token_permissions_token_links_fk\", \"columns\": [\"transfer_token_permission_id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_links_inv_fk\", \"columns\": [\"transfer_token_id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_links_unique\", \"type\": \"unique\", \"columns\": [\"transfer_token_permission_id\", \"transfer_token_id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_links_order_inv_fk\", \"columns\": [\"transfer_token_permission_order\"]}], \"foreignKeys\": [{\"name\": \"strapi_transfer_token_permissions_token_links_fk\", \"columns\": [\"transfer_token_permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_transfer_token_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_links_inv_fk\", \"columns\": [\"transfer_token_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_transfer_tokens\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"files_related_morphs\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"file_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"related_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"related_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"files_related_morphs_fk\", \"columns\": [\"file_id\"]}], \"foreignKeys\": [{\"name\": \"files_related_morphs_fk\", \"columns\": [\"file_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"files\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"files_folder_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"file_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"folder_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"file_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"files_folder_links_fk\", \"columns\": [\"file_id\"]}, {\"name\": \"files_folder_links_inv_fk\", \"columns\": [\"folder_id\"]}, {\"name\": \"files_folder_links_unique\", \"type\": \"unique\", \"columns\": [\"file_id\", \"folder_id\"]}, {\"name\": \"files_folder_links_order_inv_fk\", \"columns\": [\"file_order\"]}], \"foreignKeys\": [{\"name\": \"files_folder_links_fk\", \"columns\": [\"file_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"files\", \"referencedColumns\": [\"id\"]}, {\"name\": \"files_folder_links_inv_fk\", \"columns\": [\"folder_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"upload_folders\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"upload_folders_parent_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"folder_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"inv_folder_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"folder_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"upload_folders_parent_links_fk\", \"columns\": [\"folder_id\"]}, {\"name\": \"upload_folders_parent_links_inv_fk\", \"columns\": [\"inv_folder_id\"]}, {\"name\": \"upload_folders_parent_links_unique\", \"type\": \"unique\", \"columns\": [\"folder_id\", \"inv_folder_id\"]}, {\"name\": \"upload_folders_parent_links_order_inv_fk\", \"columns\": [\"folder_order\"]}], \"foreignKeys\": [{\"name\": \"upload_folders_parent_links_fk\", \"columns\": [\"folder_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"upload_folders\", \"referencedColumns\": [\"id\"]}, {\"name\": \"upload_folders_parent_links_inv_fk\", \"columns\": [\"inv_folder_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"upload_folders\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_permissions_role_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"permission_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_permissions_role_links_fk\", \"columns\": [\"permission_id\"]}, {\"name\": \"up_permissions_role_links_inv_fk\", \"columns\": [\"role_id\"]}, {\"name\": \"up_permissions_role_links_unique\", \"type\": \"unique\", \"columns\": [\"permission_id\", \"role_id\"]}, {\"name\": \"up_permissions_role_links_order_inv_fk\", \"columns\": [\"permission_order\"]}], \"foreignKeys\": [{\"name\": \"up_permissions_role_links_fk\", \"columns\": [\"permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_permissions_role_links_inv_fk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_users_role_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"user_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"user_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_users_role_links_fk\", \"columns\": [\"user_id\"]}, {\"name\": \"up_users_role_links_inv_fk\", \"columns\": [\"role_id\"]}, {\"name\": \"up_users_role_links_unique\", \"type\": \"unique\", \"columns\": [\"user_id\", \"role_id\"]}, {\"name\": \"up_users_role_links_order_inv_fk\", \"columns\": [\"user_order\"]}], \"foreignKeys\": [{\"name\": \"up_users_role_links_fk\", \"columns\": [\"user_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_users_role_links_inv_fk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"navigations_localizations_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"navigation_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"inv_navigation_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"navigation_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"navigations_localizations_links_fk\", \"columns\": [\"navigation_id\"]}, {\"name\": \"navigations_localizations_links_inv_fk\", \"columns\": [\"inv_navigation_id\"]}, {\"name\": \"navigations_localizations_links_unique\", \"type\": \"unique\", \"columns\": [\"navigation_id\", \"inv_navigation_id\"]}, {\"name\": \"navigations_localizations_links_order_fk\", \"columns\": [\"navigation_order\"]}], \"foreignKeys\": [{\"name\": \"navigations_localizations_links_fk\", \"columns\": [\"navigation_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"navigations\", \"referencedColumns\": [\"id\"]}, {\"name\": \"navigations_localizations_links_inv_fk\", \"columns\": [\"inv_navigation_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"navigations\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"navigations_items_related_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"navigation_item_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"navigations_items_related_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"navigations_items_related_links_fk\", \"columns\": [\"navigation_item_id\"]}, {\"name\": \"navigations_items_related_links_inv_fk\", \"columns\": [\"navigations_items_related_id\"]}, {\"name\": \"navigations_items_related_links_unique\", \"type\": \"unique\", \"columns\": [\"navigation_item_id\", \"navigations_items_related_id\"]}], \"foreignKeys\": [{\"name\": \"navigations_items_related_links_fk\", \"columns\": [\"navigation_item_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"navigations_items\", \"referencedColumns\": [\"id\"]}, {\"name\": \"navigations_items_related_links_inv_fk\", \"columns\": [\"navigations_items_related_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"navigations_items_related\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"navigations_items_parent_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"navigation_item_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"inv_navigation_item_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"navigations_items_parent_links_fk\", \"columns\": [\"navigation_item_id\"]}, {\"name\": \"navigations_items_parent_links_inv_fk\", \"columns\": [\"inv_navigation_item_id\"]}, {\"name\": \"navigations_items_parent_links_unique\", \"type\": \"unique\", \"columns\": [\"navigation_item_id\", \"inv_navigation_item_id\"]}], \"foreignKeys\": [{\"name\": \"navigations_items_parent_links_fk\", \"columns\": [\"navigation_item_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"navigations_items\", \"referencedColumns\": [\"id\"]}, {\"name\": \"navigations_items_parent_links_inv_fk\", \"columns\": [\"inv_navigation_item_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"navigations_items\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"navigations_items_master_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"navigation_item_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"navigation_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"navigation_item_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"navigations_items_master_links_fk\", \"columns\": [\"navigation_item_id\"]}, {\"name\": \"navigations_items_master_links_inv_fk\", \"columns\": [\"navigation_id\"]}, {\"name\": \"navigations_items_master_links_unique\", \"type\": \"unique\", \"columns\": [\"navigation_item_id\", \"navigation_id\"]}, {\"name\": \"navigations_items_master_links_order_inv_fk\", \"columns\": [\"navigation_item_order\"]}], \"foreignKeys\": [{\"name\": \"navigations_items_master_links_fk\", \"columns\": [\"navigation_item_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"navigations_items\", \"referencedColumns\": [\"id\"]}, {\"name\": \"navigations_items_master_links_inv_fk\", \"columns\": [\"navigation_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"navigations\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"navigations_items_audience_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"navigation_item_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"audience_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"audience_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"navigations_items_audience_links_fk\", \"columns\": [\"navigation_item_id\"]}, {\"name\": \"navigations_items_audience_links_inv_fk\", \"columns\": [\"audience_id\"]}, {\"name\": \"navigations_items_audience_links_unique\", \"type\": \"unique\", \"columns\": [\"navigation_item_id\", \"audience_id\"]}, {\"name\": \"navigations_items_audience_links_order_fk\", \"columns\": [\"audience_order\"]}], \"foreignKeys\": [{\"name\": \"navigations_items_audience_links_fk\", \"columns\": [\"navigation_item_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"navigations_items\", \"referencedColumns\": [\"id\"]}, {\"name\": \"navigations_items_audience_links_inv_fk\", \"columns\": [\"audience_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"audience\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"about_uses_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"about_uses_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"about_uses_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"about_uses_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"about_uses_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"about_uses_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"about_uses\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"home_pages_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"home_pages_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"home_pages_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"home_pages_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"home_pages_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"home_pages_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"home_pages\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_controls_banner_sliders_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"components_controls_banner_sliders_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"components_controls_banner_sliders_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"components_controls_banner_sliders_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"components_controls_banner_sliders_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"components_controls_banner_sliders_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"components_controls_banner_sliders\", \"referencedColumns\": [\"id\"]}]}]}','2023-03-05 10:14:23','b4b7420340847d8c3d3d42f95919a809');
/*!40000 ALTER TABLE `strapi_database_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_migrations`
--

DROP TABLE IF EXISTS `strapi_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_migrations`
--

LOCK TABLES `strapi_migrations` WRITE;
/*!40000 ALTER TABLE `strapi_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_token_permissions`
--

DROP TABLE IF EXISTS `strapi_transfer_token_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_transfer_token_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_transfer_token_permissions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_transfer_token_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_transfer_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_transfer_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_token_permissions`
--

LOCK TABLES `strapi_transfer_token_permissions` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_token_permissions_token_links`
--

DROP TABLE IF EXISTS `strapi_transfer_token_permissions_token_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_transfer_token_permissions_token_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transfer_token_permission_id` int unsigned DEFAULT NULL,
  `transfer_token_id` int unsigned DEFAULT NULL,
  `transfer_token_permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_transfer_token_permissions_token_links_unique` (`transfer_token_permission_id`,`transfer_token_id`),
  KEY `strapi_transfer_token_permissions_token_links_fk` (`transfer_token_permission_id`),
  KEY `strapi_transfer_token_permissions_token_links_inv_fk` (`transfer_token_id`),
  KEY `strapi_transfer_token_permissions_token_links_order_inv_fk` (`transfer_token_permission_order`),
  CONSTRAINT `strapi_transfer_token_permissions_token_links_fk` FOREIGN KEY (`transfer_token_permission_id`) REFERENCES `strapi_transfer_token_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_transfer_token_permissions_token_links_inv_fk` FOREIGN KEY (`transfer_token_id`) REFERENCES `strapi_transfer_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_token_permissions_token_links`
--

LOCK TABLES `strapi_transfer_token_permissions_token_links` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions_token_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions_token_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_tokens`
--

DROP TABLE IF EXISTS `strapi_transfer_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_transfer_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `access_key` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_transfer_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_transfer_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_transfer_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_transfer_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_tokens`
--

LOCK TABLES `strapi_transfer_tokens` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_webhooks`
--

DROP TABLE IF EXISTS `strapi_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_webhooks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url` longtext COLLATE utf8mb3_unicode_ci,
  `headers` json DEFAULT NULL,
  `events` json DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_webhooks`
--

LOCK TABLES `strapi_webhooks` WRITE;
/*!40000 ALTER TABLE `strapi_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_permissions`
--

DROP TABLE IF EXISTS `up_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_permissions_created_by_id_fk` (`created_by_id`),
  KEY `up_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_permissions`
--

LOCK TABLES `up_permissions` WRITE;
/*!40000 ALTER TABLE `up_permissions` DISABLE KEYS */;
INSERT INTO `up_permissions` VALUES (1,'plugin::users-permissions.user.me','2023-02-21 20:41:56.372000','2023-02-21 20:41:56.372000',NULL,NULL),(2,'plugin::users-permissions.auth.changePassword','2023-02-21 20:41:56.372000','2023-02-21 20:41:56.372000',NULL,NULL),(3,'plugin::users-permissions.auth.callback','2023-02-21 20:41:56.394000','2023-02-21 20:41:56.394000',NULL,NULL),(4,'plugin::users-permissions.auth.connect','2023-02-21 20:41:56.394000','2023-02-21 20:41:56.394000',NULL,NULL),(5,'plugin::users-permissions.auth.forgotPassword','2023-02-21 20:41:56.394000','2023-02-21 20:41:56.394000',NULL,NULL),(6,'plugin::users-permissions.auth.resetPassword','2023-02-21 20:41:56.394000','2023-02-21 20:41:56.394000',NULL,NULL),(7,'plugin::users-permissions.auth.emailConfirmation','2023-02-21 20:41:56.394000','2023-02-21 20:41:56.394000',NULL,NULL),(8,'plugin::users-permissions.auth.register','2023-02-21 20:41:56.394000','2023-02-21 20:41:56.394000',NULL,NULL),(9,'plugin::users-permissions.auth.sendEmailConfirmation','2023-02-21 20:41:56.394000','2023-02-21 20:41:56.394000',NULL,NULL);
/*!40000 ALTER TABLE `up_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_permissions_role_links`
--

DROP TABLE IF EXISTS `up_permissions_role_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_permissions_role_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_permissions_role_links_unique` (`permission_id`,`role_id`),
  KEY `up_permissions_role_links_fk` (`permission_id`),
  KEY `up_permissions_role_links_inv_fk` (`role_id`),
  KEY `up_permissions_role_links_order_inv_fk` (`permission_order`),
  CONSTRAINT `up_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `up_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_permissions_role_links`
--

LOCK TABLES `up_permissions_role_links` WRITE;
/*!40000 ALTER TABLE `up_permissions_role_links` DISABLE KEYS */;
INSERT INTO `up_permissions_role_links` VALUES (1,1,1,1),(2,2,1,1),(3,3,2,1),(4,4,2,1),(5,7,2,1),(6,6,2,1),(7,5,2,2),(8,9,2,2),(9,8,2,2);
/*!40000 ALTER TABLE `up_permissions_role_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_roles`
--

DROP TABLE IF EXISTS `up_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_roles_created_by_id_fk` (`created_by_id`),
  KEY `up_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_roles`
--

LOCK TABLES `up_roles` WRITE;
/*!40000 ALTER TABLE `up_roles` DISABLE KEYS */;
INSERT INTO `up_roles` VALUES (1,'Authenticated','Default role given to authenticated user.','authenticated','2023-02-21 20:41:56.342000','2023-02-21 20:41:56.342000',NULL,NULL),(2,'Public','Default role given to unauthenticated user.','public','2023-02-21 20:41:56.354000','2023-02-21 20:41:56.354000',NULL,NULL);
/*!40000 ALTER TABLE `up_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_users`
--

DROP TABLE IF EXISTS `up_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reset_password_token` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_users_created_by_id_fk` (`created_by_id`),
  KEY `up_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_users`
--

LOCK TABLES `up_users` WRITE;
/*!40000 ALTER TABLE `up_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `up_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_users_role_links`
--

DROP TABLE IF EXISTS `up_users_role_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_users_role_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `user_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_users_role_links_unique` (`user_id`,`role_id`),
  KEY `up_users_role_links_fk` (`user_id`),
  KEY `up_users_role_links_inv_fk` (`role_id`),
  KEY `up_users_role_links_order_inv_fk` (`user_order`),
  CONSTRAINT `up_users_role_links_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_users_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_users_role_links`
--

LOCK TABLES `up_users_role_links` WRITE;
/*!40000 ALTER TABLE `up_users_role_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `up_users_role_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_folders`
--

DROP TABLE IF EXISTS `upload_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_folders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `path_id` int DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_path_id_index` (`path_id`),
  UNIQUE KEY `upload_folders_path_index` (`path`),
  KEY `upload_folders_created_by_id_fk` (`created_by_id`),
  KEY `upload_folders_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `upload_folders_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `upload_folders_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_folders`
--

LOCK TABLES `upload_folders` WRITE;
/*!40000 ALTER TABLE `upload_folders` DISABLE KEYS */;
INSERT INTO `upload_folders` VALUES (1,'slider images',1,'/1','2023-02-22 20:43:09.016000','2023-02-22 20:43:12.194000',1,1),(2,'home page',2,'/2','2023-02-22 22:22:16.125000','2023-02-22 22:22:16.125000',1,1),(3,'services',3,'/3','2023-02-22 22:59:06.980000','2023-02-22 22:59:06.980000',1,1),(4,'icons',4,'/4','2023-02-23 19:41:56.629000','2023-02-23 19:41:56.629000',1,1),(5,'page bar images',5,'/5','2023-02-25 20:49:05.905000','2023-02-25 20:49:05.905000',1,1),(6,'media',6,'/6','2023-02-26 20:16:34.880000','2023-02-26 20:16:34.880000',1,1);
/*!40000 ALTER TABLE `upload_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_folders_parent_links`
--

DROP TABLE IF EXISTS `upload_folders_parent_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_folders_parent_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int unsigned DEFAULT NULL,
  `inv_folder_id` int unsigned DEFAULT NULL,
  `folder_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_parent_links_unique` (`folder_id`,`inv_folder_id`),
  KEY `upload_folders_parent_links_fk` (`folder_id`),
  KEY `upload_folders_parent_links_inv_fk` (`inv_folder_id`),
  KEY `upload_folders_parent_links_order_inv_fk` (`folder_order`),
  CONSTRAINT `upload_folders_parent_links_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_folders_parent_links_inv_fk` FOREIGN KEY (`inv_folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_folders_parent_links`
--

LOCK TABLES `upload_folders_parent_links` WRITE;
/*!40000 ALTER TABLE `upload_folders_parent_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_folders_parent_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacancies`
--

DROP TABLE IF EXISTS `vacancies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacancies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb3_unicode_ci,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vacancies_created_by_id_fk` (`created_by_id`),
  KEY `vacancies_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `vacancies_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `vacancies_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacancies`
--

LOCK TABLES `vacancies` WRITE;
/*!40000 ALTER TABLE `vacancies` DISABLE KEYS */;
INSERT INTO `vacancies` VALUES (1,'Job Title Goes Here','<p>Job Description goes here, you can write detailed job description.</p>','2023-03-02 19:13:42.571000','2023-03-02 19:13:44.995000','2023-03-02 19:13:44.988000',1,1);
/*!40000 ALTER TABLE `vacancies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 20:30:32
