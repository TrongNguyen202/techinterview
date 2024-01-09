CREATE DATABASE  IF NOT EXISTS `techinterview` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `techinterview`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: techinterview
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `api_category`
--

DROP TABLE IF EXISTS `api_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `api_category_parent_category_id_9631abbd_fk_api_categ` (`parent_category_id`),
  CONSTRAINT `api_category_parent_category_id_9631abbd_fk_api_categ` FOREIGN KEY (`parent_category_id`) REFERENCES `api_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_category`
--

LOCK TABLES `api_category` WRITE;
/*!40000 ALTER TABLE `api_category` DISABLE KEYS */;
INSERT INTO `api_category` VALUES (1,'ao',NULL),(2,'ao mua dong',1),(3,'ao jaky',2);
/*!40000 ALTER TABLE `api_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_customuser`
--

DROP TABLE IF EXISTS `api_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_customuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `verify_token` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `api_customuser_user_id_a4f4408c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_customuser`
--

LOCK TABLES `api_customuser` WRITE;
/*!40000 ALTER TABLE `api_customuser` DISABLE KEYS */;
INSERT INTO `api_customuser` VALUES (1,'test',1,'https://pgddttieucan.edu.vn/wp-content/uploads/2022/08/hinh-anh-dong-don-gian-Hinh-anh-dong-don-gian.png');
/*!40000 ALTER TABLE `api_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_pricehistory`
--

DROP TABLE IF EXISTS `api_pricehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_pricehistory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_shop_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_pricehistory_product_shop_id_b88854f1_fk_api_productshop_id` (`product_shop_id`),
  CONSTRAINT `api_pricehistory_product_shop_id_b88854f1_fk_api_productshop_id` FOREIGN KEY (`product_shop_id`) REFERENCES `api_productshop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_pricehistory`
--

LOCK TABLES `api_pricehistory` WRITE;
/*!40000 ALTER TABLE `api_pricehistory` DISABLE KEYS */;
INSERT INTO `api_pricehistory` VALUES (1,9990.00,'2024-01-07 05:36:44.127199',1),(2,2.00,'2024-01-07 05:37:20.403774',1),(3,800.00,'2024-01-07 05:42:40.674024',3),(4,399.00,'2024-01-08 16:34:13.182328',1);
/*!40000 ALTER TABLE `api_pricehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_product`
--

DROP TABLE IF EXISTS `api_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `description` longtext NOT NULL DEFAULT (_utf8mb3'no description'),
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_product`
--

LOCK TABLES `api_product` WRITE;
/*!40000 ALTER TABLE `api_product` DISABLE KEYS */;
INSERT INTO `api_product` VALUES (1,'Bộ Hub mở rộng Baseus Metal Gleam 2 Series 4K60Hz','<div>\r\n      <h1>⚡️ LƯU Ý QUAN TRỌNG:</h1>\r\n      <p>????Sản phẩm có nhiều phiên bản, quý khách vui lòng đọc kỹ thông tin và chọn phiên bản phù hợp</p>\r\n      <p>????Sử dụng cho Máy tính xách tay / Máy tính bảng / Điện thoại có cổng Type C</p>\r\n      <p>????Phiên bản (60Hz) hỗ trợ 4K / 60Hz, phiên bản khác hỗ trợ 4K / 30Hz.</p>\r\n      {/* Add more paragraphs based on your text */}\r\n      <h1>⚡️ THÔNG SỐ KỸ THUẬT chung:</h1>\r\n      {/* Display technical specifications using paragraphs or lists */}\r\n      <h1>⚡️ Thông số từng phiên bản:</h1>\r\n      {/* Display specifications for each version using paragraphs or lists */}\r\n      <h1>⚡️ THỜI GIAN BẢO HÀNH:</h1>\r\n      <p>????Bảo hành chính hãng 12 tháng</p>\r\n      <p>---------------------------------------------------------------------------</p>\r\n      <p>???? Chú Bé Shop - cáp sạc laptop, hub chuyển, thiết bị lưu trữ, phụ kiện công nghệ chính hãng</p>\r\n      <p>???? Chính sách bảo hành: <a href=\"https://chube.vn/chinh-sach-bao-hanh\">https://chube.vn/chinh-sach-bao-hanh</a></p>\r\n      <p>???? Hotline: 028 9999 8880</p>\r\n    </div>'),(2,'ao jack','no description'),(3,'quan dui','no'),(4,'quan dui','no'),(5,'quan dui','no'),(6,'quan dui','no'),(7,'ao','no description');
/*!40000 ALTER TABLE `api_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_product_images`
--

DROP TABLE IF EXISTS `api_product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_product_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `productimage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_product_images_product_id_productimage_id_aa26cac6_uniq` (`product_id`,`productimage_id`),
  KEY `api_product_images_productimage_id_1710ef24_fk_api_produ` (`productimage_id`),
  CONSTRAINT `api_product_images_product_id_41c2c81b_fk_api_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `api_product` (`product_id`),
  CONSTRAINT `api_product_images_productimage_id_1710ef24_fk_api_produ` FOREIGN KEY (`productimage_id`) REFERENCES `api_productimage` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_product_images`
--

LOCK TABLES `api_product_images` WRITE;
/*!40000 ALTER TABLE `api_product_images` DISABLE KEYS */;
INSERT INTO `api_product_images` VALUES (6,1,7),(7,1,8),(8,7,9);
/*!40000 ALTER TABLE `api_product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_productcategory`
--

DROP TABLE IF EXISTS `api_productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_productcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_productcategory_product_id_category_id_df316bd8_uniq` (`product_id`,`category_id`),
  KEY `api_productcategory_category_id_c7b2f066_fk_api_categ` (`category_id`),
  CONSTRAINT `api_productcategory_category_id_c7b2f066_fk_api_categ` FOREIGN KEY (`category_id`) REFERENCES `api_category` (`category_id`),
  CONSTRAINT `api_productcategory_product_id_93bf5c0d_fk_api_produ` FOREIGN KEY (`product_id`) REFERENCES `api_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_productcategory`
--

LOCK TABLES `api_productcategory` WRITE;
/*!40000 ALTER TABLE `api_productcategory` DISABLE KEYS */;
INSERT INTO `api_productcategory` VALUES (1,1,2),(2,2,2);
/*!40000 ALTER TABLE `api_productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_productimage`
--

DROP TABLE IF EXISTS `api_productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_productimage` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(200) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_productimage`
--

LOCK TABLES `api_productimage` WRITE;
/*!40000 ALTER TABLE `api_productimage` DISABLE KEYS */;
INSERT INTO `api_productimage` VALUES (6,'https://cf.shopee.vn/file/0831df249013d5ae50d7ed42996412c8'),(7,'https://cf.shopee.vn/file/0831df249013d5ae50d7ed42996412c8'),(8,'https://cf.shopee.vn/file/vn-11134207-7r98o-lnqi3aa07ce294'),(9,'https://ngoaingutomato.edu.vn/Data/images/hinh-anh-co-gai-cute-anime.jpeg');
/*!40000 ALTER TABLE `api_productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_productshop`
--

DROP TABLE IF EXISTS `api_productshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_productshop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stock_quantity` int(10) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_productshop_product_id_2292fda9_fk_api_product_product_id` (`product_id`),
  KEY `api_productshop_shop_id_6169651b_fk_api_shop_shop_id` (`shop_id`),
  CONSTRAINT `api_productshop_product_id_2292fda9_fk_api_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `api_product` (`product_id`),
  CONSTRAINT `api_productshop_shop_id_6169651b_fk_api_shop_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `api_shop` (`shop_id`),
  CONSTRAINT `api_productshop_chk_1` CHECK ((`stock_quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_productshop`
--

LOCK TABLES `api_productshop` WRITE;
/*!40000 ALTER TABLE `api_productshop` DISABLE KEYS */;
INSERT INTO `api_productshop` VALUES (1,3,1,1,399.00),(2,12,2,1,1000.00),(3,3,6,1,800.00),(4,2,7,1,300.00),(5,2,7,2,600.00);
/*!40000 ALTER TABLE `api_productshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_review`
--

DROP TABLE IF EXISTS `api_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `review_comment` longtext,
  `created_at` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_review_product_id_78d61c8d_fk_api_product_product_id` (`product_id`),
  KEY `api_review_user_id_8bf97ad4_fk_api_customuser_id` (`user_id`),
  CONSTRAINT `api_review_product_id_78d61c8d_fk_api_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `api_product` (`product_id`),
  CONSTRAINT `api_review_user_id_8bf97ad4_fk_api_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `api_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_review`
--

LOCK TABLES `api_review` WRITE;
/*!40000 ALTER TABLE `api_review` DISABLE KEYS */;
INSERT INTO `api_review` VALUES (1,3,'san pham tot qua','2024-01-07 10:06:38.640934',1,1);
/*!40000 ALTER TABLE `api_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_reviewimage`
--

DROP TABLE IF EXISTS `api_reviewimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_reviewimage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(200) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_reviewimage_review_id_6e92f5bc_fk_api_review_id` (`review_id`),
  CONSTRAINT `api_reviewimage_review_id_6e92f5bc_fk_api_review_id` FOREIGN KEY (`review_id`) REFERENCES `api_review` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_reviewimage`
--

LOCK TABLES `api_reviewimage` WRITE;
/*!40000 ALTER TABLE `api_reviewimage` DISABLE KEYS */;
INSERT INTO `api_reviewimage` VALUES (1,'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/08/Hinh-nen-anime-cute-8-1.jpg',1),(2,'https://ngoaingutomato.edu.vn/Data/images/hinh-anh-co-gai-cute-anime.jpeg',1);
/*!40000 ALTER TABLE `api_reviewimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_shop`
--

DROP TABLE IF EXISTS `api_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_shop` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_shop`
--

LOCK TABLES `api_shop` WRITE;
/*!40000 ALTER TABLE `api_shop` DISABLE KEYS */;
INSERT INTO `api_shop` VALUES (1,'TestShop','Ha Noi'),(2,'lazada','Ha Noi');
/*!40000 ALTER TABLE `api_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add comment',8,'add_comment'),(30,'Can change comment',8,'change_comment'),(31,'Can delete comment',8,'delete_comment'),(32,'Can view comment',8,'view_comment'),(33,'Can add product',9,'add_product'),(34,'Can change product',9,'change_product'),(35,'Can delete product',9,'delete_product'),(36,'Can view product',9,'view_product'),(37,'Can add product image',10,'add_productimage'),(38,'Can change product image',10,'change_productimage'),(39,'Can delete product image',10,'delete_productimage'),(40,'Can view product image',10,'view_productimage'),(41,'Can add shop',11,'add_shop'),(42,'Can change shop',11,'change_shop'),(43,'Can delete shop',11,'delete_shop'),(44,'Can view shop',11,'view_shop'),(45,'Can add product shop',12,'add_productshop'),(46,'Can change product shop',12,'change_productshop'),(47,'Can delete product shop',12,'delete_productshop'),(48,'Can view product shop',12,'view_productshop'),(49,'Can add product category',13,'add_productcategory'),(50,'Can change product category',13,'change_productcategory'),(51,'Can delete product category',13,'delete_productcategory'),(52,'Can view product category',13,'view_productcategory'),(53,'Can add custom user',14,'add_customuser'),(54,'Can change custom user',14,'change_customuser'),(55,'Can delete custom user',14,'delete_customuser'),(56,'Can view custom user',14,'view_customuser'),(57,'Can add comment image',15,'add_commentimage'),(58,'Can change comment image',15,'change_commentimage'),(59,'Can delete comment image',15,'delete_commentimage'),(60,'Can view comment image',15,'view_commentimage'),(61,'Can add review',16,'add_review'),(62,'Can change review',16,'change_review'),(63,'Can delete review',16,'delete_review'),(64,'Can view review',16,'view_review'),(65,'Can add price history',17,'add_pricehistory'),(66,'Can change price history',17,'change_pricehistory'),(67,'Can delete price history',17,'delete_pricehistory'),(68,'Can view price history',17,'view_pricehistory'),(69,'Can add review image',18,'add_reviewimage'),(70,'Can change review image',18,'change_reviewimage'),(71,'Can delete review image',18,'delete_reviewimage'),(72,'Can view review image',18,'view_reviewimage');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$mtZxvYBYaF4zaItWkmOpKQ$kVFsXSLG4UNjkVGa2h69X+6oygEZvIsCVFFVAi6QPcU=','2024-01-05 16:35:36.318915',1,'trongprotein','','','trongprotein@gmail.com',1,1,'2024-01-05 16:35:28.834172');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-01-05 16:35:52.642914','1','Shop object (1)',1,'[{\"added\": {}}]',11,1),(2,'2024-01-05 16:36:31.471706','1','ProductImage object (1)',1,'[{\"added\": {}}]',10,1),(3,'2024-01-05 16:36:34.565105','1','Product object (1)',1,'[{\"added\": {}}]',9,1),(4,'2024-01-05 16:38:40.829768','1','ProductShop object (1)',1,'[{\"added\": {}}]',12,1),(5,'2024-01-05 16:46:34.061592','1','ProductImage object (1)',2,'[{\"changed\": {\"fields\": [\"Image url\"]}}]',10,1),(6,'2024-01-05 16:48:50.759910','2','ProductImage object (2)',1,'[{\"added\": {}}]',10,1),(7,'2024-01-05 16:48:57.536807','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(8,'2024-01-07 02:32:15.430701','3','ProductImage object (3)',1,'[{\"added\": {}}]',10,1),(9,'2024-01-07 02:32:16.820992','2','Product object (2)',1,'[{\"added\": {}}]',9,1),(10,'2024-01-07 02:32:27.998107','1','Category object (1)',1,'[{\"added\": {}}]',7,1),(11,'2024-01-07 02:32:35.753713','2','Category object (2)',1,'[{\"added\": {}}]',7,1),(12,'2024-01-07 02:32:46.082135','3','Category object (3)',1,'[{\"added\": {}}]',7,1),(13,'2024-01-07 02:32:56.144675','1','ProductCategory object (1)',1,'[{\"added\": {}}]',13,1),(14,'2024-01-07 02:33:06.022408','2','ProductCategory object (2)',1,'[{\"added\": {}}]',13,1),(15,'2024-01-07 02:33:19.929281','2','ProductShop object (2)',1,'[{\"added\": {}}]',12,1),(16,'2024-01-07 10:05:23.892044','1','CustomUser object (1)',1,'[{\"added\": {}}]',14,1),(17,'2024-01-07 10:06:38.648933','1','Review object (1)',1,'[{\"added\": {}}]',16,1),(18,'2024-01-07 10:07:11.245735','1','ReviewImage object (1)',1,'[{\"added\": {}}]',18,1),(19,'2024-01-07 10:07:17.810984','2','ReviewImage object (2)',1,'[{\"added\": {}}]',18,1),(20,'2024-01-07 15:26:27.326416','4','ProductImage object (4)',1,'[{\"added\": {}}]',10,1),(21,'2024-01-07 15:26:29.114256','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Product name\", \"Images\"]}}]',9,1),(22,'2024-01-07 15:36:42.758383','1','ProductImage object (1)',3,'',10,1),(23,'2024-01-07 15:36:46.788781','2','ProductImage object (2)',3,'',10,1),(24,'2024-01-07 15:36:50.340749','3','ProductImage object (3)',3,'',10,1),(25,'2024-01-07 15:36:53.628521','4','ProductImage object (4)',3,'',10,1),(26,'2024-01-07 15:37:26.059968','5','ProductImage object (5)',1,'[{\"added\": {}}]',10,1),(27,'2024-01-07 15:37:36.274931','5','ProductImage object (5)',3,'',10,1),(28,'2024-01-07 15:37:44.601071','6','ProductImage object (6)',1,'[{\"added\": {}}]',10,1),(29,'2024-01-07 15:38:17.391938','7','ProductImage object (7)',1,'[{\"added\": {}}]',10,1),(30,'2024-01-07 15:38:22.010356','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(31,'2024-01-07 15:38:39.970964','8','ProductImage object (8)',1,'[{\"added\": {}}]',10,1),(32,'2024-01-07 15:38:40.820919','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',9,1),(33,'2024-01-08 16:28:15.893038','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',9,1),(34,'2024-01-08 16:30:50.713125','9','ProductImage object (9)',1,'[{\"added\": {}}]',10,1),(35,'2024-01-08 16:30:51.930167','7','Product object (7)',1,'[{\"added\": {}}]',9,1),(36,'2024-01-08 16:32:48.866376','7','Product object (7)',2,'[{\"changed\": {\"fields\": [\"Product name\"]}}]',9,1),(37,'2024-01-08 16:33:05.093434','4','ProductShop object (4)',1,'[{\"added\": {}}]',12,1),(38,'2024-01-08 16:35:00.314439','2','Shop object (2)',1,'[{\"added\": {}}]',11,1),(39,'2024-01-08 16:35:27.855634','5','ProductShop object (5)',1,'[{\"added\": {}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'api','category'),(8,'api','comment'),(15,'api','commentimage'),(14,'api','customuser'),(17,'api','pricehistory'),(9,'api','product'),(13,'api','productcategory'),(10,'api','productimage'),(12,'api','productshop'),(16,'api','review'),(18,'api','reviewimage'),(11,'api','shop'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-01-04 15:38:01.218652'),(2,'auth','0001_initial','2024-01-04 15:38:01.880049'),(3,'admin','0001_initial','2024-01-04 15:38:02.035027'),(4,'admin','0002_logentry_remove_auto_add','2024-01-04 15:38:02.043681'),(5,'admin','0003_logentry_add_action_flag_choices','2024-01-04 15:38:02.051642'),(6,'api','0001_initial','2024-01-04 15:38:03.098889'),(7,'api','0002_product_description','2024-01-04 15:38:03.151981'),(8,'contenttypes','0002_remove_content_type_name','2024-01-04 15:38:03.272682'),(9,'auth','0002_alter_permission_name_max_length','2024-01-04 15:38:03.344435'),(10,'auth','0003_alter_user_email_max_length','2024-01-04 15:38:03.374300'),(11,'auth','0004_alter_user_username_opts','2024-01-04 15:38:03.384268'),(12,'auth','0005_alter_user_last_login_null','2024-01-04 15:38:03.454970'),(13,'auth','0006_require_contenttypes_0002','2024-01-04 15:38:03.459882'),(14,'auth','0007_alter_validators_add_error_messages','2024-01-04 15:38:03.469880'),(15,'auth','0008_alter_user_username_max_length','2024-01-04 15:38:03.543611'),(16,'auth','0009_alter_user_last_name_max_length','2024-01-04 15:38:03.614175'),(17,'auth','0010_alter_group_name_max_length','2024-01-04 15:38:03.641069'),(18,'auth','0011_update_proxy_permissions','2024-01-04 15:38:03.656331'),(19,'auth','0012_alter_user_first_name_max_length','2024-01-04 15:38:03.720165'),(20,'sessions','0001_initial','2024-01-04 15:38:03.759926'),(21,'api','0003_review_comment_review','2024-01-07 02:31:06.071153'),(22,'api','0004_remove_product_price_productshop_price','2024-01-07 02:31:06.335125'),(23,'api','0005_pricehistory','2024-01-07 02:31:06.448256'),(24,'api','0006_alter_productshop_stock_quantity','2024-01-07 05:42:31.875174'),(25,'api','0007_reviewimage_remove_commentimage_comment_and_more','2024-01-07 10:03:44.508621'),(26,'api','0008_alter_review_user','2024-01-08 16:23:23.562947');
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
INSERT INTO `django_session` VALUES ('x3vj2g79rtrpwnfz5c9abiwr0q7ognoj','.eJxVjMsOwiAQAP-FsyELXR569O43NMsCUjWQlPZk_HdD0oNeZybzFjPtW5n3ntZ5ieIilDj9skD8THWI-KB6b5Jb3dYlyJHIw3Z5azG9rkf7NyjUy9ieE2OkPIGyil2IjIm9BjsBeOM1A2XM2XJWgM4bbcgSOtKBHCsk8fkC5qg35A:1rLnAW:1Hfap0WIPczn-K9Ivow0SNsAqSU812397EwIi0tkkT4','2024-01-19 16:35:36.323915');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-09  9:13:56
