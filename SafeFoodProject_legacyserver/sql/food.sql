CREATE TABLE `food` (
  `code` int(10) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `supportpereat` double DEFAULT NULL,
  `calory` double DEFAULT NULL,
  `carbo` double DEFAULT NULL,
  `protein` double DEFAULT NULL,
  `fat` double DEFAULT NULL,
  `sugar` double DEFAULT NULL,
  `natrium` double DEFAULT NULL,
  `chole` double DEFAULT NULL,
  `fattyacid` double DEFAULT NULL,
  `transfat` double DEFAULT NULL,
  `maker` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `material` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `img` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `allergy` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `count` int(3) DEFAULT NULL,
  `search_count` int(3) DEFAULT NULL,
  PRIMARY KEY (`code`)
);