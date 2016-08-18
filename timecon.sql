/*
Navicat MySQL Data Transfer

Source Server         : Pruebas
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : timecon

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-08-17 18:04:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for us_rol
-- ----------------------------
DROP TABLE IF EXISTS `us_rol`;
CREATE TABLE `us_rol` (
  `us_id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`us_id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of us_rol
-- ----------------------------
INSERT INTO `us_rol` VALUES ('1', 'System Administrator');
INSERT INTO `us_rol` VALUES ('2', 'Manager');
INSERT INTO `us_rol` VALUES ('3', 'Employee');

-- ----------------------------
-- Table structure for us_usuario
-- ----------------------------
DROP TABLE IF EXISTS `us_usuario`;
CREATE TABLE `us_usuario` (
  `us_id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `password` varchar(45) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `us_id_rol` int(11) NOT NULL,
  `isDeleted` varchar(45) NOT NULL,
  `createdBy` varchar(45) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  PRIMARY KEY (`us_id_usuario`,`us_id_rol`),
  KEY `fk_us_usuario_copy1_us_rol_idx` (`us_id_rol`),
  CONSTRAINT `us_usuario_ibfk_1` FOREIGN KEY (`us_id_rol`) REFERENCES `us_rol` (`us_id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of us_usuario
-- ----------------------------
INSERT INTO `us_usuario` VALUES ('1', 'productochile@festina.com', '21232f297a57a5a743894a0e4a801fc3', 'Rodrigo Riveros', '984100228', '1', '0', '0', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('2', 'rfernandez@festina.com', 'e10adc3949ba59abbe56e057f20f883e', 'Roberto Fernandez', '913083393', '2', '0', '0', '2016-08-01 18:56:49', '2', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('3', 'metevinod@gmail.com', 'd2c51c9cde1f15b718296c99ae362fb1', 'Vinod Mete', '982229822', '3', '0', '0', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('4', 'pjayle7@gmail.com', 'af948f0b6334c5d6e822c9bc8cf24034', 'Prashant Jayle', '814916376', '2', '0', '0', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('5', 'pimplesushant@gmail.com', 'dea5687d7786d43266cf55d7be014530', 'Sushant Pimple', '956109114', '3', '0', '1', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('6', 'pankaj@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'Pankaj Saboo', '950389100', '3', '1', '1', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('7', 'mahesh@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Mahesh Patil', '860038764', '2', '1', '1', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('8', 'yogesh.8488@gmail.com', 'fff35ff9f95f0bf058dd5b3988c06080', 'Balasaheb Mule', '996084800', '2', '0', '1', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('9', 'landesachin14@gmail.com', '15285722f9def45c091725aee9c387cb', 'Sachin Lande', '827500422', '3', '0', '1', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('10', 'skcomputerworld@rediffmail.com', 'cea16606bde1d20889b8b3ddafe5ca1d', 'Sachin Kalane', '973041404', '3', '0', '1', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('11', 'pravin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'Pravin Survase', '989898989', '3', '0', '1', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('12', 'harshghotkar1@gmail.com', 'd4e3730e8cba214f85cddae5f9331d74', 'Harsh Ghotkar', '966567686', '2', '0', '1', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('13', 'suraj.nipane999@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'Suraj Nipane', '902190911', '2', '0', '1', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('14', 'quazisalahuddin4@gmail.com', '037e133114db31a4586b8e59f604e89e', 'Salahuddin Quazi', '844681408', '3', '0', '1', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('15', 'dms10xxx@gmail.com', '57a2f49b78040585ce96aeb70617ef67', 'Dipak Salunke', '814955655', '2', '0', '1', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('16', 'employee@codeinsect.com', '6024bb4b0cdaeeb3fffd6e7c920ca30e', 'Employee', '982209822', '2', '0', '1', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('17', 'manager@codeinsect.com', '6024bb4b0cdaeeb3fffd6e7c920ca30e', 'Manager', '986009860', '2', '0', '1', '2016-08-01 18:56:49', '1', '2016-08-01 18:56:49');
INSERT INTO `us_usuario` VALUES ('18', 'yo@yo.cl', 'e10adc3949ba59abbe56e057f20f883e', 'Yo', '984100228', '3', '1', '1', '2016-08-16 15:25:29', '1', '2016-08-16 15:37:17');
INSERT INTO `us_usuario` VALUES ('19', 'yo@yo.cl', 'e10adc3949ba59abbe56e057f20f883e', 'Yo', '984100228', '3', '1', '1', '2016-08-16 15:50:31', '1', '2016-08-16 16:02:16');
