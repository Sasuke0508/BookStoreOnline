CREATE DATABASE  IF NOT EXISTS `bookshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `bookshop`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: bookshop
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `ID` varchar(255) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('1d94f47d-a0cf-4b8b-ae7c-c999f8d5eaf2','Hoàng Phong','19050820');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `ID` varchar(255) NOT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Province` varchar(255) DEFAULT NULL,
  `District` varchar(255) DEFAULT NULL,
  `Ward` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('9fa79685-ea5c-41ac-891a-6c0a5aeba8a8','Tân Phú','Quốc Oai','Hà Nội','Phú Hạng, Tân Phú, Quốc Oai, Hà Nội');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `author` (
  `ID` varchar(255) NOT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `Biography` varchar(1000) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Dob` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES ('TG01','Nguyễn Nhật Ánh','Nguyễn Nhật Ánh sinh ngày 7 tháng 5 năm 1955 tại tỉnh Quảng Nam.  Ông được coi là một trong những nhà văn thành công nhất viết sách cho tuổi thơ, tuồi mới lớn với hơn 100 tác phẩm các thể loại.','Thăng Bình','nguyennhatanh@gmail.com','1955-05-07'),('TG02','Roise Nguyễn','Không chỉ là một blogger du lịch nổi tiếng trong cộng đồng phượt thủ Việt, Rosie Nguyễn - tác giả quyển sách Ta ba lô trên đất Á - còn là một người có thành tích đọc sách đáng nể.','Hồ Chí Minh','roisenguyen@gmail.com','1990-09-19'),('TG03','Park Seung Oh','Park Seung Oh đã từng đột nhiên bị mất thị lực khi đang học tại đại học KAIST, áp lực của việc thức thâu đêm học bài đã vượt qua sức chịu đựng của đôi mắt, khiến tác giả sống trong những ngày tháng mờ mịt. Nhưng lúc đó, việc gặp người thầy của mình đã giúp tác giả tìm ra giá trị của bản thân, bắt đầu lại hành trình cuộc đời với vai trò là một người thầy. Tác giả Park Seung Oh cũng từng làm việc tại hãng điện tử LG, Midasit và viện nghiên cứu Carnegie, và vẫn đang tiếp tục cống hiến để chia sẻ nhận thức của mình qua những cuốn sách.','Hàn Quốc','pko@gmail.com','1989-09-09'),('TG04','Kim Young Gwang','Tác giả Kim Young Gwang có một khởi đầu hoàn toàn khác với vị trí nhân viên tại một doanh nghiệp lớn, nhưng vẫn luôn băn khoăn về ước mơ thật sự của mình. Trong quá trình tìm ra những trăn trở, anh bắt đầu nghỉ việc tại công ty, thành lập tổ chức quyên góp tài năng Kkichin và với vai trò là một người thầy và nhà văn, Kim Young Gwang vẫn đang từng ngày nỗ lực để giúp thanh thiếu niên tìm ra được ước mơ của mình.','Hàn Quốc','kyg@gmail.com','1992-12-12');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book` (
  `ID` varchar(255) NOT NULL,
  `OrderID` varchar(255) DEFAULT NULL,
  `BookItemID` varchar(255) NOT NULL,
  `ImportPrice` double NOT NULL,
  `CreateDate` date DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKBook313834` (`BookItemID`),
  KEY `FKBook75827` (`OrderID`),
  CONSTRAINT `FKBook313834` FOREIGN KEY (`BookItemID`) REFERENCES `bookitem` (`ID`),
  CONSTRAINT `FKBook75827` FOREIGN KEY (`OrderID`) REFERENCES `order` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('B01','26b852f5-12bf-4a9a-b2b1-d30d6a7f207a','BI01',60000,'2022-01-01','Sold');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookitem`
--

DROP TABLE IF EXISTS `bookitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookitem` (
  `ID` varchar(255) NOT NULL,
  `CategoryID` varchar(255) NOT NULL,
  `PublisherID` varchar(255) NOT NULL,
  `ISBN` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Summary` varchar(1000) DEFAULT NULL,
  `PublicationDate` date DEFAULT NULL,
  `NumberOfPage` int(10) NOT NULL,
  `BuyPrice` double NOT NULL,
  `Quantity` int(10) NOT NULL,
  `CreateDate` date DEFAULT NULL,
  `SoldQuantity` int(10) NOT NULL,
  `Weight` double NOT NULL,
  `Size` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKBookItem856437` (`PublisherID`),
  KEY `FKBookItem155273` (`CategoryID`),
  CONSTRAINT `FKBookItem155273` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`),
  CONSTRAINT `FKBookItem856437` FOREIGN KEY (`PublisherID`) REFERENCES `publisher` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookitem`
--

LOCK TABLES `bookitem` WRITE;
/*!40000 ALTER TABLE `bookitem` DISABLE KEYS */;
INSERT INTO `bookitem` VALUES ('BI01','CTT','PL01','TTHVTCX000111','Tôi thấy hoa vàng trên cỏ xanh','Cuốn Tôi thấy hoa vàng trên cỏ xanh kể về tuổi thơ nghèo khó của hai anh em Thiều và Tường cùng cô bạn thân hàng xóm. Mạch truyện tự nhiên, dẫn dắt người đọc chứng kiến những rung động đầu đời của tụi nhỏ, xen vào đó là những nét đẹp của tình anh em và vài nốt trầm của sự đau đớn khi trưởng thành. Truyện Nguyễn Nhật Ánh thường không nói quá nhiều về trắng đen, thiện ác nhưng trong tác phẩm này, tác giả đã đưa vấn đề đạo đức vào sách và khiến người đọc suy ngẫm.','2018-12-12',378,79000,100,'2022-01-01',60,300,'60x40'),('BI02','CTKNS','PL02','VOTKCKBKCUM212','Vẫn ổn thôi kể cả khi bạn không có ước mơ','“Vẫn ổn thôi kể cả khi bạn không có ước mơ” được xuất bản tại Hàn Quốc vào năm 2015 và được chọn là một trong những cuốn sách mà ai cũng nên đọc, cũng như dành được rất nhiều sự tin tưởng từ các bậc phụ huynh tại Hàn Quốc, cuốn sách được đến với độc giả Việt Nam vào đầu năm 2020 và dành được nhiều sự quan tâm của độc giả.','2020-10-10',256,89000,50,'2021-10-10',30,289,'60x40');
/*!40000 ALTER TABLE `bookitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookitem_author`
--

DROP TABLE IF EXISTS `bookitem_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookitem_author` (
  `BookItemID` varchar(255) NOT NULL,
  `AuthorID` varchar(255) NOT NULL,
  PRIMARY KEY (`BookItemID`,`AuthorID`),
  KEY `FKBookItem_A711079` (`AuthorID`),
  CONSTRAINT `FKBookItem_A269348` FOREIGN KEY (`BookItemID`) REFERENCES `bookitem` (`ID`),
  CONSTRAINT `FKBookItem_A711079` FOREIGN KEY (`AuthorID`) REFERENCES `author` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookitem_author`
--

LOCK TABLES `bookitem_author` WRITE;
/*!40000 ALTER TABLE `bookitem_author` DISABLE KEYS */;
INSERT INTO `bookitem_author` VALUES ('BI01','TG01'),('BI02','TG03'),('BI02','TG04');
/*!40000 ALTER TABLE `bookitem_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `ID` varchar(255) NOT NULL,
  `CustomerID` varchar(255) NOT NULL,
  `Total` double NOT NULL,
  `Status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKCart972029` (`CustomerID`),
  CONSTRAINT `FKCart972029` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('033942d6-cb00-4b37-8c28-40f6d6453562','2ce3bdc9-8356-499f-8354-dd937f630dde',0,'InProgress'),('38d1aefe-b33d-46be-95f0-bbe3ee979f63','2ce3bdc9-8356-499f-8354-dd937f630dde',158000,'Completed'),('5e36fa3d-d554-4cee-a814-f10c42ded410','2ce3bdc9-8356-499f-8354-dd937f630dde',0,'Completed'),('94b4cdac-4204-408e-89fc-7d5e650f0343','2ce3bdc9-8356-499f-8354-dd937f630dde',257000,'Completed'),('ae8516f9-0213-4784-8975-30ffd4c92d98','2ce3bdc9-8356-499f-8354-dd937f630dde',0,'Completed'),('d30e623b-c4e7-493d-9920-9c1ac3ed9868','2ce3bdc9-8356-499f-8354-dd937f630dde',237000,'Completed'),('fb005ff8-8f20-4797-b81f-7fda50e96bfd','2ce3bdc9-8356-499f-8354-dd937f630dde',514000,'Completed'),('fea6d004-36a5-4ce3-9260-e6fe1642ac6a','2ce3bdc9-8356-499f-8354-dd937f630dde',158000,'Completed');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartdetail`
--

DROP TABLE IF EXISTS `cartdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cartdetail` (
  `ID` varchar(255) NOT NULL,
  `Quantity` int(10) NOT NULL,
  `BuyPrice` double NOT NULL,
  `BookItemID` varchar(255) NOT NULL,
  `CartID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CartDetail` (`BookItemID`),
  KEY `CartDetail2` (`CartID`),
  CONSTRAINT `CartDetail` FOREIGN KEY (`BookItemID`) REFERENCES `bookitem` (`ID`),
  CONSTRAINT `CartDetail2` FOREIGN KEY (`CartID`) REFERENCES `cart` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartdetail`
--

LOCK TABLES `cartdetail` WRITE;
/*!40000 ALTER TABLE `cartdetail` DISABLE KEYS */;
INSERT INTO `cartdetail` VALUES ('002e83d7-1f50-4941-815d-68ae38fbc3fc',2,79000,'BI01','fb005ff8-8f20-4797-b81f-7fda50e96bfd'),('1204ec40-e4f1-4666-8820-21d2fb12fa9b',2,79000,'BI01','fea6d004-36a5-4ce3-9260-e6fe1642ac6a'),('2fd16f7c-0598-49a9-84bc-9e16ce9493ea',1,79000,'BI01','94b4cdac-4204-408e-89fc-7d5e650f0343'),('7a6e8d7e-12ce-45f7-8e79-d4d9b467c76c',4,89000,'BI02','fb005ff8-8f20-4797-b81f-7fda50e96bfd'),('8525d51e-effd-4f21-ac2c-f557b818aba4',3,79000,'BI01','d30e623b-c4e7-493d-9920-9c1ac3ed9868'),('a51db687-5482-443e-bf30-8dce52f3231d',2,79000,'BI01','38d1aefe-b33d-46be-95f0-bbe3ee979f63'),('f18f23b5-cd12-4e1d-89db-c31d6edf486c',2,89000,'BI02','94b4cdac-4204-408e-89fc-7d5e650f0343');
/*!40000 ALTER TABLE `cartdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `Name` varchar(255) DEFAULT NULL,
  `ID` varchar(255) NOT NULL,
  `Quantity` int(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('Kinh doanh','CTKD',10),('Khoa học','CTKH',10),('Kỹ năng sống','CTKNS',10),('Truyện, hồi kí','CTT',10),('Văn học','CTVH',10);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cod`
--

DROP TABLE IF EXISTS `cod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cod` (
  `Status` varchar(255) DEFAULT NULL,
  `PaymentID` varchar(255) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  CONSTRAINT `FKCOD479041` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cod`
--

LOCK TABLES `cod` WRITE;
/*!40000 ALTER TABLE `cod` DISABLE KEYS */;
INSERT INTO `cod` VALUES ('Unpaid','0693791e-13dc-4581-bc7d-470e6298e9bc'),('Unpaid','b22bac8a-37fa-4eca-95d5-bb3383a4a182'),('Unpaid','db148743-9ff2-4496-a6f0-57f1ac2717fb'),('Unpaid','fecd5dba-56c6-4302-aa40-445bb73d101c');
/*!40000 ALTER TABLE `cod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit`
--

DROP TABLE IF EXISTS `credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `credit` (
  `Number` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `ExpireDate` date DEFAULT NULL,
  `PaymentID` varchar(255) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  CONSTRAINT `FKCredit998953` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit`
--

LOCK TABLES `credit` WRITE;
/*!40000 ALTER TABLE `credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `MemberLevel` varchar(255) DEFAULT NULL,
  `UserID` varchar(255) NOT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `FKCustomer697196` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('Standard','2ce3bdc9-8356-499f-8354-dd937f630dde');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electricwallet`
--

DROP TABLE IF EXISTS `electricwallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `electricwallet` (
  `WalletHolder` varchar(255) DEFAULT NULL,
  `WalletNumber` varchar(255) DEFAULT NULL,
  `PaymentID` varchar(255) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  CONSTRAINT `FKElectricWa333787` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electricwallet`
--

LOCK TABLES `electricwallet` WRITE;
/*!40000 ALTER TABLE `electricwallet` DISABLE KEYS */;
INSERT INTO `electricwallet` VALUES ('Nguyễn Văn Quân','001200028950','2db5feb5-9208-4e70-baea-e20fce60ddad'),(NULL,NULL,'b5bcd063-eb89-4801-9fd7-24ebbc033818'),('Nguyễn Văn Quân','001200028950','ddeefcc4-7b9c-4e80-b7f9-de26e541cee3');
/*!40000 ALTER TABLE `electricwallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fullname`
--

DROP TABLE IF EXISTS `fullname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fullname` (
  `ID` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fullname`
--

LOCK TABLES `fullname` WRITE;
/*!40000 ALTER TABLE `fullname` DISABLE KEYS */;
INSERT INTO `fullname` VALUES ('58c8806b-c602-429f-8370-ac56c5d5eb70','Nguyễn','Quân');
/*!40000 ALTER TABLE `fullname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `image` (
  `ID` varchar(255) NOT NULL,
  `BookItemID` varchar(255) NOT NULL,
  `Path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKImage998240` (`BookItemID`),
  CONSTRAINT `FKImage998240` FOREIGN KEY (`BookItemID`) REFERENCES `bookitem` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES ('IM01','BI01','https://cuahang.revisach.com/wp-content/uploads/2021/03/toi-thay-hoa-vang-tren-co-xanh-1.jpg'),('IM02','BI02','https://cuahang.revisach.com/wp-content/uploads/2021/03/sach-van-on-ke-ca-khi-ban-khong-co-uoc-mo.png');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `ID` varchar(255) NOT NULL,
  `CreateTime` date DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `ShipmentID` varchar(255) NOT NULL,
  `PaymentID` varchar(255) NOT NULL,
  `CartID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKOrder751924` (`ShipmentID`),
  KEY `FKOrder92191` (`PaymentID`),
  KEY `FKOrder795597` (`CartID`),
  CONSTRAINT `FKOrder751924` FOREIGN KEY (`ShipmentID`) REFERENCES `shipment` (`ID`),
  CONSTRAINT `FKOrder795597` FOREIGN KEY (`CartID`) REFERENCES `cart` (`ID`),
  CONSTRAINT `FKOrder92191` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('26b852f5-12bf-4a9a-b2b1-d30d6a7f207a','2022-01-06','Pending','bfafbe3b-67b7-4ee3-a279-04742b0cc983','fecd5dba-56c6-4302-aa40-445bb73d101c','fea6d004-36a5-4ce3-9260-e6fe1642ac6a'),('5708ab12-ed07-4669-a553-fcab88e4212b','2022-01-06','Pending','fb860ceb-2623-409d-be4e-6812124cc13c','2db5feb5-9208-4e70-baea-e20fce60ddad','d30e623b-c4e7-493d-9920-9c1ac3ed9868'),('897d6947-0352-432b-be44-aa51974a9dfd','2022-04-22','Pending','d5f45541-ee39-4880-9a9f-1de0c1ad5c14','db148743-9ff2-4496-a6f0-57f1ac2717fb','fb005ff8-8f20-4797-b81f-7fda50e96bfd'),('effdb7a2-b126-4fc2-b7ca-442c78480d2a','2022-01-09','Pending','d6f04e61-9a13-4327-bd3b-eb1cc013c4a8','ddeefcc4-7b9c-4e80-b7f9-de26e541cee3','94b4cdac-4204-408e-89fc-7d5e650f0343'),('f5256fe6-a5c2-4d3d-8b2b-ce33e6cf8985','2022-05-16','Pending','0d368d22-f7a4-4695-ac10-2c149dbef2fd','b22bac8a-37fa-4eca-95d5-bb3383a4a182','38d1aefe-b33d-46be-95f0-bbe3ee979f63');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment` (
  `ID` varchar(255) NOT NULL,
  `Amount` double NOT NULL,
  `CreateTime` date DEFAULT NULL,
  `PaymentType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('0693791e-13dc-4581-bc7d-470e6298e9bc',10000,'2022-01-06','COD'),('2db5feb5-9208-4e70-baea-e20fce60ddad',247000,'2022-01-06','ElectricWallet'),('b22bac8a-37fa-4eca-95d5-bb3383a4a182',168000,'2022-05-16','COD'),('b5bcd063-eb89-4801-9fd7-24ebbc033818',10000,'2022-01-06','ElectricWallet'),('db148743-9ff2-4496-a6f0-57f1ac2717fb',524000,'2022-04-22','COD'),('ddeefcc4-7b9c-4e80-b7f9-de26e541cee3',277000,'2022-01-09','ElectricWallet'),('fecd5dba-56c6-4302-aa40-445bb73d101c',168000,'2022-01-06','COD');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `publisher` (
  `ID` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES ('PL01','NXB Kim Đồng','Kim Đồng, Hà Nội'),('PL02','NXB Trẻ','Hà Nội'),('PL03','Nhã Nam','Hà Nội'),('PL04','Fahassha','Hồ Chí Minh');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipment` (
  `ID` varchar(255) NOT NULL,
  `ShipmentTypeID` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Note` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKShipment2868` (`ShipmentTypeID`),
  CONSTRAINT `FKShipment2868` FOREIGN KEY (`ShipmentTypeID`) REFERENCES `shipmenttype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES ('018bd5ac-a4c5-44fe-87a3-1305d7646682','SHIP01','Phú Hạng, Tân Phú, Quốc Oai, Hà Nội','0846001460','Tôi có thể nhận vào giờ hành chính!'),('0d368d22-f7a4-4695-ac10-2c149dbef2fd','SHIP01','Phú Hạng, Tân Phú, Quốc Oai, Hà Nội, Tân Phú, Quốc Oai, Hà Nội','0846001460','Tôi có thể nhận vào giờ hành chính!'),('8dec2eff-acc7-4ff6-83c5-e1256cdeef8b','SHIP01','Phú Hạng, Tân Phú, Quốc Oai, Hà Nội','0846001460','Tôi có thể nhận vào giờ hành chính!'),('bfafbe3b-67b7-4ee3-a279-04742b0cc983','SHIP01','Phú Hạng, Tân Phú, Quốc Oai, Hà Nội','0846001460','Tôi có thể nhận vào giờ hành chính!'),('d5f45541-ee39-4880-9a9f-1de0c1ad5c14','SHIP01','Phú Hạng, Tân Phú, Quốc Oai, Hà Nội, Tân Phú, Quốc Oai, Hà Nội','0846001460','Tôi có thể nhận vào giờ hành chính!'),('d6f04e61-9a13-4327-bd3b-eb1cc013c4a8','SHIP02','Phú Hạng, Tân Phú, Quốc Oai, Hà Nội, Tân Phú, Quốc Oai, Hà Nội','0846001460','Tôi có thể nhận vào giờ hành chính!'),('fb860ceb-2623-409d-be4e-6812124cc13c','SHIP01','Phú Hạng, Tân Phú, Quốc Oai, Hà Nội, Tân Phú, Quốc Oai, Hà Nội','0846001460','Tôi có thể nhận vào giờ hành chính!');
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipmenttype`
--

DROP TABLE IF EXISTS `shipmenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipmenttype` (
  `ID` varchar(255) NOT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Fee` double NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipmenttype`
--

LOCK TABLES `shipmenttype` WRITE;
/*!40000 ALTER TABLE `shipmenttype` DISABLE KEYS */;
INSERT INTO `shipmenttype` VALUES ('SHIP01','Giao hàng tiết kiệm',10000),('SHIP02','Giao hàng nhanh',20000);
/*!40000 ALTER TABLE `shipmenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff` (
  `Position` varchar(255) DEFAULT NULL,
  `Rate` double NOT NULL,
  `UserID` varchar(255) NOT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `FKStaff312633` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `ID` varchar(255) NOT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(255) DEFAULT NULL,
  `Dob` date DEFAULT NULL,
  `Role` varchar(255) DEFAULT NULL,
  `AccountID` varchar(255) NOT NULL,
  `AddressID` varchar(255) NOT NULL,
  `FullnameID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKUser921365` (`AccountID`),
  KEY `FKUser847543` (`AddressID`),
  KEY `FKUser481364` (`FullnameID`),
  CONSTRAINT `FKUser481364` FOREIGN KEY (`FullnameID`) REFERENCES `fullname` (`ID`),
  CONSTRAINT `FKUser847543` FOREIGN KEY (`AddressID`) REFERENCES `address` (`ID`),
  CONSTRAINT `FKUser921365` FOREIGN KEY (`AccountID`) REFERENCES `account` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('2ce3bdc9-8356-499f-8354-dd937f630dde','Male','quana62000@gmail.com','0846001460','2000-08-05','Customer','1d94f47d-a0cf-4b8b-ae7c-c999f8d5eaf2','9fa79685-ea5c-41ac-891a-6c0a5aeba8a8','58c8806b-c602-429f-8370-ac56c5d5eb70');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-16 15:16:24
