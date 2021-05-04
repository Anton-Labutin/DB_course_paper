-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.25


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema internet_provider
--

CREATE DATABASE IF NOT EXISTS internet_provider;
USE internet_provider;

--
-- Temporary table structure for view `ch`
--
DROP TABLE IF EXISTS `ch`;
DROP VIEW IF EXISTS `ch`;
CREATE TABLE `ch` (
  `c_id` int(11),
  `h_count` bigint(21),
  `h_sum` double
);

--
-- Definition of table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `C_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Номер договора клиента',
  `C_name` varchar(100) NOT NULL,
  `C_passport` int(11) NOT NULL,
  `Start_date` date NOT NULL,
  `End_date` date DEFAULT NULL COMMENT 'Дата расторжения договора',
  PRIMARY KEY (`C_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Клиент';

--
-- Dumping data for table `client`
--

/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`C_id`,`C_name`,`C_passport`,`Start_date`,`End_date`) VALUES 
 (1,'Ванторин Никита Александрович',436954,'2004-09-27','2007-10-25'),
 (2,'Кадырбеков Данияр Мухаммадиярович',805846,'2006-11-13',NULL),
 (3,'Кизименко Валерий Алексеевич',589645,'2011-02-28',NULL),
 (4,'Лабутин Антон Александрович',551200,'2009-04-01',NULL),
 (5,'Лаишевский Иван Александрович',113844,'2014-04-30',NULL),
 (6,'Лищук Данила Андреевич',625697,'2007-01-12',NULL),
 (7,'Мельникова Вероника Дмитриевна',972086,'2002-11-01','2005-01-01'),
 (8,'Муратов Кирилл Леонидович',407685,'2017-04-23',NULL),
 (9,'Мягкова Анастасия Сергеевна',836178,'2009-09-30',NULL),
 (10,'Незнамова Анастасия Александровна',906160,'2012-02-02',NULL),
 (11,'Неклюдов Семён Александрович',503421,'2014-12-24',NULL),
 (12,'Низамутдинов Камиль Мадридович',349380,'2012-04-11',NULL),
 (13,'Николаева Мария Витальевна',872113,'2017-03-26',NULL),
 (14,'Попов Андрей Алексеевич',377230,'2003-03-22','2006-02-15'),
 (15,'Разумов Руслан Александрович',849234,'2015-12-16',NULL),
 (16,'Тесницкая Виктория Владимировна',207644,'2000-12-19','2002-09-17'),
 (17,'Титова Каролина Дмитриевна',613312,'2006-03-14',NULL),
 (18,'Чикичёв Тимур Вадимович',239089,'2005-10-04',NULL),
 (19,'Шайнуров Руслан Раисович',141867,'2014-08-17',NULL);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;


--
-- Definition of table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `E_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Номер оборудования',
  `E_name` varchar(100) NOT NULL COMMENT 'Название оборудования',
  `E_price` double NOT NULL COMMENT 'Цена оборудования',
  PRIMARY KEY (`E_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Оборудование';

--
-- Dumping data for table `equipment`
--

/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` (`E_id`,`E_name`,`E_price`) VALUES 
 (1,'Locus MOBI 3G street PLUS - Усилитель сигнала 3G интернета',8200),
 (2,'Openbox AIR - Беспроводной USB адаптер Wi-Fi 150Mbps 802.11n',950),
 (3,'PLC-мост MTC QPLA-200v.2p (интернет по электросети)',2500),
 (4,'Wi-Fi адаптер для ресиверов Dr.HD',800),
 (5,'Комплект для приёма спутникового интернета',29900),
 (6,'Комплект РЭМО Greenway Combi 3G/4G',4200),
 (7,'Усилитель интернет-сигнала РЭМО Connect 2.0',1150),
 (8,'Home Plug - Mini PowerLine Ethernet Adapter 200Mbps',2500),
 (9,'TP-Link Powerline AV200 TL-PA2010KIT - комплект Nano адаптеров',2600),
 (10,'TP-Link TL-WR740N - беспроводной маршрутизатор (Wi-Fi роутер)',1250),
 (11,'Адаптер для интернета по электросети ZTE H512A',2500),
 (12,'Антенна 3G РЭМО Connect Street',2450),
 (13,'Внешний USB Wi-FI адаптер GI Wi-Fi 11N',1450),
 (14,'Внешний USB Wi-Fi адаптер Gi Wi-Fi Nano',1350),
 (15,'Мини Wi-Fi адаптер SWF-3S4T',850);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;


--
-- Definition of table `equipment_list`
--

DROP TABLE IF EXISTS `equipment_list`;
CREATE TABLE `equipment_list` (
  `E_l_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Номер строки',
  `H_id` int(11) NOT NULL COMMENT 'Номер заказа',
  `E_id` int(11) NOT NULL COMMENT 'Шифр оборудования',
  `E_count` int(11) NOT NULL COMMENT 'Количество единиц',
  PRIMARY KEY (`E_l_id`),
  KEY `FK_equipment_list_1` (`H_id`),
  KEY `FK_equipment_list_2` (`E_id`),
  CONSTRAINT `FK_equipment_list_1` FOREIGN KEY (`H_id`) REFERENCES `hold` (`H_id`),
  CONSTRAINT `FK_equipment_list_2` FOREIGN KEY (`E_id`) REFERENCES `equipment` (`E_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='Список оборудования в заказе';

--
-- Dumping data for table `equipment_list`
--

/*!40000 ALTER TABLE `equipment_list` DISABLE KEYS */;
INSERT INTO `equipment_list` (`E_l_id`,`H_id`,`E_id`,`E_count`) VALUES 
 (1,1,1,1),
 (2,1,2,1),
 (3,2,3,1),
 (4,3,4,2),
 (5,4,5,1),
 (6,5,6,1),
 (7,6,5,1),
 (8,7,13,1),
 (9,7,14,1),
 (10,8,10,1),
 (11,9,12,1),
 (12,10,7,1),
 (13,11,1,1),
 (14,12,2,1),
 (16,12,3,1),
 (17,12,4,1),
 (18,13,11,1),
 (19,14,6,1),
 (20,15,4,2),
 (21,16,5,1),
 (22,17,8,1),
 (23,18,13,1),
 (24,19,9,1),
 (25,20,5,1),
 (26,21,4,1),
 (27,22,7,2),
 (28,23,11,1),
 (29,24,1,1),
 (30,25,2,2),
 (31,26,10,1),
 (32,27,14,2),
 (33,28,7,1),
 (34,29,3,1);
/*!40000 ALTER TABLE `equipment_list` ENABLE KEYS */;


--
-- Definition of table `hold`
--

DROP TABLE IF EXISTS `hold`;
CREATE TABLE `hold` (
  `H_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Номер заказа',
  `C_id` int(11) NOT NULL COMMENT 'Номер договора клиента',
  `H_date` date NOT NULL COMMENT 'Дата заказа',
  `M_id` int(11) NOT NULL COMMENT 'Табельный номер монтажника, выполнившего заказа',
  `H_price` double DEFAULT NULL COMMENT 'Стоимость заказа',
  PRIMARY KEY (`H_id`),
  KEY `FK_hold_1` (`C_id`),
  KEY `FK_hold_2` (`M_id`),
  CONSTRAINT `FK_hold_1` FOREIGN KEY (`C_id`) REFERENCES `client` (`C_id`),
  CONSTRAINT `FK_hold_2` FOREIGN KEY (`M_id`) REFERENCES `mounter` (`M_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='Заказ';

--
-- Dumping data for table `hold`
--

/*!40000 ALTER TABLE `hold` DISABLE KEYS */;
INSERT INTO `hold` (`H_id`,`C_id`,`H_date`,`M_id`,`H_price`) VALUES 
 (1,1,'2004-09-27',1,9550),
 (2,2,'2006-11-13',4,2800),
 (3,3,'2011-02-28',6,1600),
 (4,4,'2009-04-01',2,30400),
 (5,5,'2014-04-30',12,4500),
 (6,6,'2007-01-12',14,30400),
 (7,7,'2002-11-01',3,2800),
 (8,8,'2017-04-23',15,1550),
 (9,9,'2009-09-30',8,2750),
 (10,10,'2012-02-02',11,1450),
 (11,11,'2014-12-24',12,8600),
 (12,12,'2012-04-11',14,4550),
 (13,13,'2017-03-26',2,2800),
 (14,14,'2003-03-22',6,4500),
 (15,15,'2015-12-16',7,1600),
 (16,16,'2000-12-19',13,30400),
 (17,17,'2006-03-14',10,2800),
 (18,18,'2005-10-04',14,1450),
 (19,19,'2014-08-17',12,2900),
 (20,3,'2013-07-25',13,30400),
 (21,11,'2015-08-06',4,800),
 (22,9,'2014-09-16',8,2500),
 (23,16,'2001-05-10',11,2800),
 (24,2,'2009-09-15',1,8200),
 (25,4,'2009-09-01',2,1900),
 (26,6,'2009-09-12',3,1250),
 (27,17,'2009-09-25',4,2700),
 (28,18,'2009-09-18',6,1150),
 (29,4,'2009-09-21',7,2500);
/*!40000 ALTER TABLE `hold` ENABLE KEYS */;


--
-- Definition of table `mounter`
--

DROP TABLE IF EXISTS `mounter`;
CREATE TABLE `mounter` (
  `M_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Табельный номер монтажника',
  `M_name` varchar(60) NOT NULL COMMENT 'ФИО монтажника',
  `M_passport` int(11) NOT NULL COMMENT 'Паспорт монтажника',
  `M_work_date` date NOT NULL COMMENT 'Дата приёма монтажник ана работу',
  PRIMARY KEY (`M_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Монтажник';

--
-- Dumping data for table `mounter`
--

/*!40000 ALTER TABLE `mounter` DISABLE KEYS */;
INSERT INTO `mounter` (`M_id`,`M_name`,`M_passport`,`M_work_date`) VALUES 
 (1,'Александров Дмитрий Валентинович',246595,'1980-12-16'),
 (2,'Викулин Сергей Дмитриевич',680717,'2005-08-19'),
 (3,'Гарифуллин Тимур Талгатович',504606,'1981-12-06'),
 (4,'Гафт Илья Маратович',443851,'2000-06-16'),
 (5,'Громов Иван Сергеевич',524928,'2016-08-05'),
 (6,'Головко Антон Павлович',193616,'1986-08-02'),
 (7,'Голубицкий Савва Романович',407024,'1987-02-04'),
 (8,'Догадин Кирилл Константинович',735618,'1994-07-02'),
 (9,'Ерёмин Александр Александрович',169167,'1999-09-13'),
 (10,'Жилин Павел Владимирович',835320,'2003-12-31'),
 (11,'Захаров Дмитрий Олегович',998183,'1998-06-21'),
 (12,'Захарян Никита Русланович',737310,'2011-06-08'),
 (13,'Иванов Борис Константинович',257060,'1984-04-27'),
 (14,'Иевлев Алгыс Андрианович',524725,'1988-03-13'),
 (15,'Карапетян Тигран Викторович',390574,'2015-05-01');
/*!40000 ALTER TABLE `mounter` ENABLE KEYS */;


--
-- Definition of table `total`
--

DROP TABLE IF EXISTS `total`;
CREATE TABLE `total` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Year` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `E_id` int(11) DEFAULT NULL,
  `E_count` int(11) DEFAULT NULL,
  `E_total` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `total`
--

/*!40000 ALTER TABLE `total` DISABLE KEYS */;
INSERT INTO `total` (`id`,`Year`,`Month`,`E_id`,`E_count`,`E_total`) VALUES 
 (50,2009,9,1,1,8200),
 (51,2009,9,2,2,1900),
 (52,2009,9,3,1,2500),
 (53,2009,9,7,1,1150),
 (54,2009,9,10,1,1250),
 (55,2009,9,12,1,2450),
 (56,2009,9,14,2,2700);
/*!40000 ALTER TABLE `total` ENABLE KEYS */;


--
-- Definition of table `work_list`
--

DROP TABLE IF EXISTS `work_list`;
CREATE TABLE `work_list` (
  `W_l_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Номер строки',
  `H_id` int(11) NOT NULL COMMENT 'Номер заказа',
  `W_id` int(11) NOT NULL COMMENT 'Шифр работы',
  PRIMARY KEY (`W_l_id`),
  KEY `FK_work_list_1` (`H_id`),
  KEY `FK_work_list_2` (`W_id`),
  CONSTRAINT `FK_work_list_1` FOREIGN KEY (`H_id`) REFERENCES `hold` (`H_id`),
  CONSTRAINT `FK_work_list_2` FOREIGN KEY (`W_id`) REFERENCES `working` (`W_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Список работ в заказе';

--
-- Dumping data for table `work_list`
--

/*!40000 ALTER TABLE `work_list` DISABLE KEYS */;
INSERT INTO `work_list` (`W_l_id`,`H_id`,`W_id`) VALUES 
 (1,1,1),
 (2,2,2),
 (3,4,3),
 (4,5,4),
 (5,6,3),
 (6,8,8),
 (7,9,10),
 (8,10,7),
 (9,11,1),
 (10,12,2),
 (11,13,9),
 (12,14,4),
 (13,16,3),
 (14,17,6),
 (15,19,7),
 (16,20,3),
 (17,22,5),
 (18,23,9);
/*!40000 ALTER TABLE `work_list` ENABLE KEYS */;


--
-- Definition of table `working`
--

DROP TABLE IF EXISTS `working`;
CREATE TABLE `working` (
  `W_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Номер работы',
  `W_name` varchar(100) NOT NULL COMMENT 'Название работы',
  `W_price` double NOT NULL COMMENT 'Стоимость работы',
  PRIMARY KEY (`W_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Работа';

--
-- Dumping data for table `working`
--

/*!40000 ALTER TABLE `working` DISABLE KEYS */;
INSERT INTO `working` (`W_id`,`W_name`,`W_price`) VALUES 
 (1,'Установка оборудования 1',400),
 (2,'Устновка оборудования 3',300),
 (3,'Устновка оборудования 5',500),
 (4,'Установка оборудования 6',300),
 (5,'Установка оборудования 7',200),
 (6,'Установка оборудования 8',300),
 (7,'Установка оборудования 9',300),
 (8,'Установка оборудования 10',300),
 (9,'Установка оборудования 11',300),
 (10,'Установка оборудования 12',300);
/*!40000 ALTER TABLE `working` ENABLE KEYS */;


--
-- Definition of procedure `Total`
--

DROP PROCEDURE IF EXISTS `Total`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`Anton_Labutin`@`localhost` PROCEDURE `Total`(m integer, y integer)
BEGIN
declare id integer;
declare price double;
declare eq_count integer;
declare done integer default 0;
declare c cursor for
  select e_id, e_price, sum(e_count)
  from equipment join equipment_list using(e_id) join hold using(h_id)
  where month(h_date)=m and year(h_date)=y
  group by e_id;
declare continue handler for sqlstate  '02000' set done=1;
open c;
repeat
  fetch c into id,price,eq_count;
  if done=0 then
    insert into total values(null,y,m,id,eq_count,price*eq_count);
  end if;
until(done=1) end repeat;
close c;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of view `ch`
--

DROP TABLE IF EXISTS `ch`;
DROP VIEW IF EXISTS `ch`;
CREATE ALGORITHM=UNDEFINED DEFINER=`Anton_Labutin`@`localhost` SQL SECURITY DEFINER VIEW `ch` AS select `hold`.`C_id` AS `c_id`,count(`hold`.`H_id`) AS `h_count`,sum(`hold`.`H_price`) AS `h_sum` from `hold` group by `hold`.`C_id`;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
