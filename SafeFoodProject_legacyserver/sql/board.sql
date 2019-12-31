CREATE TABLE `board` (
  `NUM` int(10) NOT NULL AUTO_INCREMENT,
  `PASS` varchar(20) COLLATE utf8_bin NOT NULL,
  `NAME` varchar(20) COLLATE utf8_bin NOT NULL,
  `WDATE` date NOT NULL,
  `TITLE` varchar(40) COLLATE utf8_bin NOT NULL,
  `CONTENT` varchar(100) COLLATE utf8_bin NOT NULL,
  `COUNT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`NUM`)
);