# ************************************************************
# Sequel Ace SQL dump
# Version 20093
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: v.je (MySQL 11.7.2-MariaDB-ubu2404)
# Database: quizCity
# Generation Time: 2025-05-06 07:47:23 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table miasta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `miasta`;

CREATE TABLE `miasta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) NOT NULL,
  `lat` float NOT NULL,
  `lon` float NOT NULL,
  `kraj` varchar(100) NOT NULL,
  `iso2` varchar(2) NOT NULL,
  `wojewodztwo` varchar(100) NOT NULL,
  `populacja` int(11) NOT NULL,
  `populacja_wlasciwa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

LOCK TABLES `miasta` WRITE;
/*!40000 ALTER TABLE `miasta` DISABLE KEYS */;

INSERT INTO `miasta` (`id`, `nazwa`, `lat`, `lon`, `kraj`, `iso2`, `wojewodztwo`, `populacja`, `populacja_wlasciwa`)
VALUES
	(1,'Warsaw',52.23,21.0111,'Poland','PL','Mazowieckie',1860281,1860281),
	(2,'Kraków',50.0614,19.9372,'Poland','PL','Małopolskie',804237,804237),
	(3,'Wrocław',51.11,17.0325,'Poland','PL','Dolnośląskie',672929,672929),
	(4,'Łódź',51.7769,19.4547,'Poland','PL','Łódzkie',670642,670642),
	(5,'Poznań',52.4083,16.9336,'Poland','PL','Wielkopolskie',546859,546859),
	(6,'Gdańsk',54.3475,18.6453,'Poland','PL','Pomorskie',486022,486022),
	(7,'Szczecin',53.4325,14.5481,'Poland','PL','Zachodniopomorskie',396168,396168),
	(8,'Bydgoszcz',53.1219,18.0003,'Poland','PL','Kujawsko-Pomorskie',337666,337666),
	(9,'Lublin',51.25,22.5667,'Poland','PL','Lubelskie',334681,334681),
	(10,'Białystok',53.1353,23.1456,'Poland','PL','Podlaskie',294242,294242),
	(11,'Katowice',50.2625,19.0217,'Poland','PL','Śląskie',285711,285711),
	(12,'Gdynia',54.5175,18.54,'Poland','PL','Pomorskie',245222,245222),
	(13,'Zielona Góra',51.9333,15.5,'Poland','PL','Lubuskie',216781,140002),
	(14,'Częstochowa',50.8,19.1167,'Poland','PL','Śląskie',213107,213107),
	(15,'Radom',51.4036,21.1567,'Poland','PL','Mazowieckie',201601,201601),
	(16,'Toruń',53.0222,18.6111,'Poland','PL','Kujawsko-Pomorskie',198273,198273),
	(17,'Rzeszów',50.0333,22,'Poland','PL','Podkarpackie',195871,195871),
	(18,'Sosnowiec',50.2833,19.1333,'Poland','PL','Śląskie',193660,193660),
	(19,'Kielce',50.8742,20.6333,'Poland','PL','Świętokrzyskie',186894,186894),
	(20,'Gliwice',50.2833,18.6667,'Poland','PL','Śląskie',174016,174016),
	(21,'Olsztyn',53.7778,20.4792,'Poland','PL','Warmińsko-Mazurskie',170225,170225),
	(22,'Bielsko-Biała',49.8225,19.0444,'Poland','PL','Śląskie',169089,169089),
	(23,'Zabrze',50.3025,18.7781,'Poland','PL','Śląskie',158307,158307),
	(24,'Bytom',50.3483,18.9156,'Poland','PL','Śląskie',153274,153274),
	(25,'Ruda Śląska',50.2628,18.8536,'Poland','PL','Śląskie',133793,133793),
	(26,'Rybnik',50.0833,18.55,'Poland','PL','Śląskie',133772,133772),
	(27,'Opole',50.6667,17.9333,'Poland','PL','Opolskie',127387,127387),
	(28,'Tychy',50.1236,18.9867,'Poland','PL','Śląskie',124882,124882),
	(29,'Gorzów Wielkopolski',52.7333,15.25,'Poland','PL','Lubuskie',119964,119964),
	(30,'Dąbrowa Górnicza',50.3214,19.1872,'Poland','PL','Śląskie',116930,116930),
	(31,'Elbląg',54.1667,19.4,'Poland','PL','Warmińsko-Mazurskie',115220,115220),
	(32,'Płock',52.55,19.7,'Poland','PL','Mazowieckie',114594,114594),
	(33,'Tarnów',50.0125,20.9886,'Poland','PL','Małopolskie',106259,106259),
	(34,'Koszalin',54.2,16.1833,'Poland','PL','Zachodniopomorskie',105883,105883),
	(35,'Włocławek',52.6592,19.0681,'Poland','PL','Kujawsko-Pomorskie',104705,104705),
	(36,'Wałbrzych',50.7667,16.2833,'Poland','PL','Dolnośląskie',104401,104401),
	(37,'Chorzów',50.3,18.95,'Poland','PL','Śląskie',104193,104193),
	(38,'Kalisz',51.7575,18.08,'Poland','PL','Wielkopolskie',95905,95905),
	(39,'Legnica',51.2083,16.1603,'Poland','PL','Dolnośląskie',94878,94878),
	(40,'Nowy Sącz',49.6239,20.6972,'Poland','PL','Małopolskie',81281,81281),
	(41,'Mysłowice',50.2333,19.1333,'Poland','PL','Śląskie',72553,72553),
	(42,'Ostrów Wielkopolski',51.6494,17.8164,'Poland','PL','Wielkopolskie',70725,70725),
	(43,'Lubin',51.4,16.2,'Poland','PL','Dolnośląskie',70016,70016),
	(44,'Inowrocław',52.7931,18.2611,'Poland','PL','Kujawsko-Pomorskie',69576,69576),
	(45,'Stargard Szczeciński',53.3333,15.0333,'Poland','PL','Zachodniopomorskie',67348,67348),
	(46,'Gniezno',52.5358,17.5958,'Poland','PL','Wielkopolskie',65452,65452),
	(47,'Pruszków',52.1667,20.8,'Poland','PL','Mazowieckie',65283,65283),
	(48,'Ostrowiec Świętokrzyski',50.9333,21.4,'Poland','PL','Świętokrzyskie',64796,64796),
	(49,'Siemianowice Śląskie',50.2758,18.9858,'Poland','PL','Śląskie',64676,64676),
	(50,'Głogów',51.6589,16.0803,'Poland','PL','Dolnośląskie',64261,64261),
	(51,'Pabianice',51.65,19.3833,'Poland','PL','Łódzkie',62954,62954),
	(52,'Leszno',51.8458,16.5806,'Poland','PL','Wielkopolskie',61791,61791),
	(53,'Ełk',53.8214,22.3622,'Poland','PL','Warmińsko-Mazurskie',60390,60390),
	(54,'Zamość',50.7167,23.2528,'Poland','PL','Lubelskie',60148,60148),
	(55,'Chełm',51.1322,23.4778,'Poland','PL','Lubelskie',59546,59546),
	(56,'Tomaszów Mazowiecki',51.5167,20.0167,'Poland','PL','Łódzkie',59388,59388),
	(57,'Mielec',50.2833,21.4333,'Poland','PL','Podkarpackie',58213,58213),
	(58,'Tczew',54.0875,18.7972,'Poland','PL','Pomorskie',57990,57990),
	(59,'Będzin',50.3333,19.1167,'Poland','PL','Śląskie',55695,55695),
	(60,'Zgierz',51.85,19.4167,'Poland','PL','Łódzkie',55079,55079),
	(61,'Świdnica',50.85,16.4833,'Poland','PL','Dolnośląskie',54792,54792),
	(62,'Bełchatów',51.3667,19.3667,'Poland','PL','Łódzkie',54338,54338),
	(63,'Legionowo',52.4,20.8833,'Poland','PL','Mazowieckie',53216,53216),
	(64,'Piekary Śląskie',50.3833,18.95,'Poland','PL','Śląskie',53017,53017),
	(65,'Rumia',54.5667,18.4,'Poland','PL','Pomorskie',51879,51879),
	(66,'Ostrołęka',53.0667,21.5667,'Poland','PL','Mazowieckie',49805,49805),
	(67,'Wejherowo',54.6,18.25,'Poland','PL','Pomorskie',47357,47357),
	(68,'Świętochłowice',50.2919,18.9178,'Poland','PL','Śląskie',46494,46494),
	(69,'Starogard Gdański',53.9667,18.5333,'Poland','PL','Pomorskie',46373,46373),
	(70,'Starachowice',51.05,21.0667,'Poland','PL','Świętokrzyskie',46270,46270),
	(71,'Kołobrzeg',54.1761,15.5761,'Poland','PL','Zachodniopomorskie',44340,44340),
	(72,'Dębica',50.05,21.4167,'Poland','PL','Podkarpackie',44047,44047),
	(73,'Ząbki',52.2928,21.1161,'Poland','PL','Mazowieckie',43740,43740),
	(74,'Marki',52.3333,21.1,'Poland','PL','Mazowieckie',42252,42252),
	(75,'Mińsk Mazowiecki',52.1833,21.5667,'Poland','PL','Mazowieckie',40467,40467),
	(76,'Żyrardów',52.05,20.4333,'Poland','PL','Mazowieckie',39374,39374),
	(77,'Chojnice',53.7,17.55,'Poland','PL','Pomorskie',39275,39275),
	(78,'Świdnik',51.2167,22.7,'Poland','PL','Lubelskie',37884,37884),
	(79,'Kwidzyn',53.7358,18.9308,'Poland','PL','Pomorskie',37768,37768),
	(80,'Malbork',54.0333,19.0333,'Poland','PL','Pomorskie',37635,37635),
	(81,'Bolesławiec',51.2667,15.5667,'Poland','PL','Dolnośląskie',37559,37559),
	(82,'Oświęcim',50.0381,19.2214,'Poland','PL','Małopolskie',36956,36956),
	(83,'Nowa Sól',51.8,15.7167,'Poland','PL','Lubuskie',36843,36843),
	(84,'Knurów',50.2167,18.6833,'Poland','PL','Śląskie',36498,36498),
	(85,'Wołomin',52.35,21.2333,'Poland','PL','Mazowieckie',36311,36311),
	(86,'Żary',51.6333,15.1333,'Poland','PL','Lubuskie',36004,36004),
	(87,'Oleśnica',51.2,17.3833,'Poland','PL','Dolnośląskie',35856,35856),
	(88,'Czechowice-Dziedzice',49.9131,19.0064,'Poland','PL','Śląskie',35261,35261),
	(89,'Lębork',54.55,17.75,'Poland','PL','Pomorskie',34500,34500),
	(90,'Brzeg',50.8667,17.4833,'Poland','PL','Opolskie',34492,34492),
	(91,'Sochaczew',52.2333,20.2333,'Poland','PL','Mazowieckie',34439,34439),
	(92,'Podgórze',50.0417,19.9833,'Poland','PL','Małopolskie',34045,34045),
	(93,'Cieszyn',49.7484,18.6332,'Poland','PL','Śląskie',33958,33958),
	(94,'Oława',50.9333,17.3,'Poland','PL','Dolnośląskie',33268,33268),
	(95,'Luboń',52.3333,16.8833,'Poland','PL','Wielkopolskie',33024,33024),
	(96,'Sopot',54.4333,18.55,'Poland','PL','Pomorskie',32962,32962),
	(97,'Iława',53.5964,19.5656,'Poland','PL','Warmińsko-Mazurskie',32664,32664),
	(98,'Kraśnik',50.9167,22.2167,'Poland','PL','Lubelskie',32593,32593),
	(99,'Dzierżoniów',50.7281,16.6511,'Poland','PL','Dolnośląskie',31866,31866),
	(100,'Pruszcz Gdański',54.2667,18.6333,'Poland','PL','Pomorskie',31582,31582),
	(101,'Czeladź',50.3333,19.0833,'Poland','PL','Śląskie',30681,30681),
	(102,'Rury',51.2386,22.5164,'Poland','PL','Lubelskie',30093,30093),
	(103,'Zgorzelec',51.15,15.0083,'Poland','PL','Dolnośląskie',29966,29966),
	(104,'Brodnica',53.2597,19.3956,'Poland','PL','Kujawsko-Pomorskie',28536,28536),
	(105,'Giżycko',54.04,21.7589,'Poland','PL','Warmińsko-Mazurskie',28233,28233),
	(106,'Kobyłka',52.3333,21.2,'Poland','PL','Mazowieckie',27185,27185),
	(107,'Łowicz',52.1,19.9333,'Poland','PL','Łódzkie',26928,26928),
	(108,'Gorlice',49.6547,21.1597,'Poland','PL','Małopolskie',26405,26405),
	(109,'Kętrzyn',54.0833,21.3833,'Poland','PL','Warmińsko-Mazurskie',26174,26174),
	(110,'Halemba',50.2378,18.8633,'Poland','PL','Śląskie',26080,26080),
	(111,'Wągrowiec',52.8,17.2,'Poland','PL','Wielkopolskie',25773,25773),
	(112,'Biłgoraj',50.55,22.7333,'Poland','PL','Lubelskie',25459,25459),
	(113,'Turek',52.0167,18.5,'Poland','PL','Wielkopolskie',25376,25376),
	(114,'Skawina',49.9833,19.8333,'Poland','PL','Małopolskie',24177,24177),
	(115,'Kościan',52.0833,16.65,'Poland','PL','Wielkopolskie',24022,24022),
	(116,'Kościerzyna',54.1167,17.9833,'Poland','PL','Pomorskie',23723,23723),
	(117,'Piastów',52.1833,20.85,'Poland','PL','Mazowieckie',23281,23281),
	(118,'Szczytno',53.5628,20.9853,'Poland','PL','Warmińsko-Mazurskie',22389,22389),
	(119,'Bartoszyce',54.25,20.8,'Poland','PL','Warmińsko-Mazurskie',22281,22281),
	(120,'Płońsk',52.6333,20.3833,'Poland','PL','Mazowieckie',21800,21800),
	(121,'Jawor',51.05,16.2,'Poland','PL','Dolnośląskie',21494,21494),
	(122,'Grajewo',53.65,22.45,'Poland','PL','Podlaskie',21395,21395),
	(123,'Zambrów',52.9833,22.25,'Poland','PL','Podlaskie',21351,21351),
	(124,'Mrągowo',53.8667,21.3,'Poland','PL','Warmińsko-Mazurskie',21325,21325),
	(125,'Sulejówek',52.2442,21.28,'Poland','PL','Mazowieckie',21248,21248),
	(126,'Działdowo',53.2333,20.1833,'Poland','PL','Warmińsko-Mazurskie',20670,20670),
	(127,'Lubartów',51.4667,22.6,'Poland','PL','Lubelskie',20494,20494),
	(128,'Koło',52.2,18.6333,'Poland','PL','Wielkopolskie',20380,20380),
	(129,'Lubań',51.1181,15.2889,'Poland','PL','Dolnośląskie',20096,20096),
	(130,'Chełmno',53.3492,18.4231,'Poland','PL','Kujawsko-Pomorskie',18837,18837),
	(131,'Złotów',53.3603,17.0408,'Poland','PL','Wielkopolskie',18768,18768),
	(132,'Ozorków',51.9667,19.2833,'Poland','PL','Łódzkie',18721,18721),
	(133,'Tomaszów Lubelski',50.45,23.4167,'Poland','PL','Lubelskie',18567,18567),
	(134,'Giszowiec',50.2236,19.0694,'Poland','PL','Śląskie',18475,18475),
	(135,'Łomianki',52.3333,20.8833,'Poland','PL','Mazowieckie',18124,18124),
	(136,'Chodzież',52.9833,16.9,'Poland','PL','Wielkopolskie',18044,18044),
	(137,'Jasien',54.3667,18.6333,'Poland','PL','Pomorskie',18014,18014),
	(138,'Łańcut',50.0667,22.2333,'Poland','PL','Podkarpackie',17768,17768),
	(139,'Bogucice',50.2668,19.0397,'Poland','PL','Śląskie',16538,16538),
	(140,'Milanówek',52.1167,20.65,'Poland','PL','Mazowieckie',16490,16490),
	(141,'Braniewo',54.3833,19.8333,'Poland','PL','Warmińsko-Mazurskie',16480,16480),
	(142,'Rawa Mazowiecka',51.7658,20.2533,'Poland','PL','Łódzkie',16429,16429),
	(143,'Radzionków Nowy',50.3833,18.8833,'Poland','PL','Śląskie',16253,16253),
	(144,'Osowa',54.4272,18.4708,'Poland','PL','Pomorskie',15843,15843),
	(145,'Rypin',53.0667,19.45,'Poland','PL','Kujawsko-Pomorskie',15832,15832),
	(146,'Lidzbark Warmiński',54.1167,20.5833,'Poland','PL','Warmińsko-Mazurskie',14878,14878),
	(147,'Złotoryja',51.1333,15.9167,'Poland','PL','Dolnośląskie',14656,14656),
	(148,'Ustka',54.5833,16.85,'Poland','PL','Pomorskie',14321,14321),
	(149,'Biały Kamień',50.7814,16.2539,'Poland','PL','Dolnośląskie',14278,14278),
	(150,'Chełmża',53.1847,18.6042,'Poland','PL','Kujawsko-Pomorskie',14045,14045),
	(151,'Lipno',52.85,19.1667,'Poland','PL','Kujawsko-Pomorskie',13752,13752),
	(152,'Łęczyca',52.05,19.2,'Poland','PL','Łódzkie',13587,13587),
	(153,'Zawodzie',50.2585,19.0449,'Poland','PL','Śląskie',13406,13406),
	(154,'Słupca',52.3,17.8667,'Poland','PL','Wielkopolskie',13353,13353),
	(155,'Człuchów',53.65,17.3667,'Poland','PL','Pomorskie',13343,13343),
	(156,'Wąbrzeźno',53.2833,18.95,'Poland','PL','Kujawsko-Pomorskie',13317,13317),
	(157,'Sidlice',54.3471,18.6171,'Poland','PL','Pomorskie',12842,12842),
	(158,'Chojnów',51.2667,15.9333,'Poland','PL','Dolnośląskie',12769,12769),
	(159,'Chropaczów',50.3131,18.915,'Poland','PL','Śląskie',12589,12589),
	(160,'Koszutka',50.2711,19.0211,'Poland','PL','Śląskie',12431,12431),
	(161,'Golub-Dobrzyń',53.1,19.05,'Poland','PL','Kujawsko-Pomorskie',11722,11722),
	(162,'Aleksandrów Kujawski',52.8767,18.6936,'Poland','PL','Kujawsko-Pomorskie',11719,11719),
	(163,'Puck',54.7,18.4,'Poland','PL','Pomorskie',10868,10868),
	(164,'Suchanino',54.3667,18.65,'Poland','PL','Pomorskie',10392,10392),
	(165,'Czarnków',52.9,16.5667,'Poland','PL','Wielkopolskie',10370,10370),
	(166,'Załęże',50.2672,18.9892,'Poland','PL','Śląskie',10185,10185),
	(167,'Dąb',50.2739,18.9992,'Poland','PL','Śląskie',7694,7694),
	(168,'Chruszczów',50.3333,18.8833,'Poland','PL','Śląskie',7464,7464),
	(169,'Ksawerów',51.6822,19.4028,'Poland','PL','Łódzkie',6897,6897),
	(170,'Wola Rzędzińska',50.05,21.0833,'Poland','PL','Małopolskie',5869,5869),
	(171,'Dąbrówka Mała',50.2769,19.0808,'Poland','PL','Śląskie',5411,5411),
	(172,'Sejny',54.1167,23.3667,'Poland','PL','Podlaskie',5075,5075),
	(173,'Raciąż',52.7794,20.1153,'Poland','PL','Mazowieckie',4146,4146),
	(174,'Górowo Iławeckie',54.2861,20.4917,'Poland','PL','Warmińsko-Mazurskie',3797,3797),
	(175,'Zgłobice',49.9833,20.9167,'Poland','PL','Małopolskie',3030,3030),
	(176,'Libertów',49.9667,19.8833,'Poland','PL','Małopolskie',3029,3029),
	(177,'Zbylitowska Góra',49.9833,20.9167,'Poland','PL','Małopolskie',2695,2695),
	(178,'Wiśniowa Góra',51.7167,19.6333,'Poland','PL','Łódzkie',2569,2569),
	(179,'Koszyce',49.9689,20.9475,'Poland','PL','Małopolskie',2207,2207),
	(180,'Aleksandrowice',49.8144,19.2333,'Poland','PL','Śląskie',1821,1821),
	(181,'Latoszyn',50.0333,21.3667,'Poland','PL','Podkarpackie',1560,1560),
	(182,'Jodłówka',50.0628,21.1122,'Poland','PL','Małopolskie',1282,1282),
	(183,'Długa Szlachecka',52.25,21.3167,'Poland','PL','Mazowieckie',1060,1060),
	(184,'Kajkowo',53.6667,19.9667,'Poland','PL','Warmińsko-Mazurskie',1017,1017);

/*!40000 ALTER TABLE `miasta` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
