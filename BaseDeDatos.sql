/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS `based_aerolinea` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `based_aerolinea`;

CREATE TABLE IF NOT EXISTS `avion` (
  `cod_avion` int(11) NOT NULL AUTO_INCREMENT,
  `descripción` varchar(100) DEFAULT NULL,
  `capacidad` varchar(100) DEFAULT NULL,
  `id_modelo` int(11) NOT NULL,
  `id_tripulacion` int(11) NOT NULL,
  `id_piloto` int(11) NOT NULL,
  `id_hangar` int(11) NOT NULL,
  `id_lista_pasajero` int(11) NOT NULL,
  `id_puerta_abordaje` int(11) NOT NULL,
  `modelo_id_modelo` int(11) NOT NULL,
  `piloto_id_piloto` int(11) NOT NULL,
  `hangar_id_hangar` int(11) NOT NULL,
  `puerta_abordaje_id_puerta_abordaje` int(11) NOT NULL,
  `tripulacion_id_tripulacion` int(11) NOT NULL,
  `lista_pasajero_id_lista_pasajero` int(11) NOT NULL,
  PRIMARY KEY (`cod_avion`),
  KEY `fkcodavion_modelo` (`modelo_id_modelo`),
  KEY `fkcodavion_piloto` (`piloto_id_piloto`),
  KEY `fkcodavion_hangar` (`hangar_id_hangar`),
  KEY `fkcodavion_puerta_abordaje` (`puerta_abordaje_id_puerta_abordaje`),
  KEY `fkcodavion_tripulacion` (`tripulacion_id_tripulacion`),
  KEY `fkcodavion_lista_pasajero` (`lista_pasajero_id_lista_pasajero`),
  CONSTRAINT `fkcodavion_hangar` FOREIGN KEY (`hangar_id_hangar`) REFERENCES `hangar` (`id_hangar`),
  CONSTRAINT `fkcodavion_lista_pasajero` FOREIGN KEY (`lista_pasajero_id_lista_pasajero`) REFERENCES `lista_pasajero` (`id_lista_pasajero`),
  CONSTRAINT `fkcodavion_modelo` FOREIGN KEY (`modelo_id_modelo`) REFERENCES `modelo` (`id_modelo`),
  CONSTRAINT `fkcodavion_piloto` FOREIGN KEY (`piloto_id_piloto`) REFERENCES `funcionarios` (`id_funcionarios`),
  CONSTRAINT `fkcodavion_puerta_abordaje` FOREIGN KEY (`puerta_abordaje_id_puerta_abordaje`) REFERENCES `puerta_abordaje` (`id_puerta_abordaje`),
  CONSTRAINT `fkcodavion_tripulacion` FOREIGN KEY (`tripulacion_id_tripulacion`) REFERENCES `tripulacion` (`id_tripulacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `avion` DISABLE KEYS */;
/*!40000 ALTER TABLE `avion` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `avion_has_mantenimiento` (
  `Avion_cod_avion` int(11) NOT NULL,
  `mantenimiento_id_mantenimiento` int(11) NOT NULL,
  PRIMARY KEY (`Avion_cod_avion`,`mantenimiento_id_mantenimiento`),
  KEY `fk_Avion_has_mantenimiento_mantenimiento1` (`mantenimiento_id_mantenimiento`),
  CONSTRAINT `fk_Avion_has_mantenimiento_Avion1` FOREIGN KEY (`Avion_cod_avion`) REFERENCES `avion` (`cod_avion`),
  CONSTRAINT `fk_Avion_has_mantenimiento_mantenimiento1` FOREIGN KEY (`mantenimiento_id_mantenimiento`) REFERENCES `mantenimiento` (`id_mantenimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `avion_has_mantenimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `avion_has_mantenimiento` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `cargo` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cargo` varchar(50) DEFAULT '0',
  `funcionario_id_funcionario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cargo`),
  KEY `fkcargo_Funcionario` (`funcionario_id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
REPLACE INTO `cargo` (`id_cargo`, `nom_cargo`, `funcionario_id_funcionario`) VALUES
	(1, 'PASANTE', NULL),
	(2, 'NOVATO', NULL),
	(3, 'PROFESIONAL', NULL),
	(4, 'VETERANO', NULL),
	(5, 'JEFE', NULL),
	(6, 'NINGUNO', NULL);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `ciudad` (
  `id_ciudad` int(11) NOT NULL AUTO_INCREMENT,
  `Ciudad` varchar(45) NOT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ciudad`),
  KEY `departamento` (`id_departamento`),
  CONSTRAINT `departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
REPLACE INTO `ciudad` (`id_ciudad`, `Ciudad`, `id_departamento`) VALUES
	(1, 'VALENCIA', NULL),
	(2, 'MIAMI', NULL),
	(3, 'BUENOS AIRES', NULL),
	(4, 'OSLO', NULL),
	(5, 'CARACAS', NULL);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `condicion_especiales` (
  `id_condicion_especiales` int(11) NOT NULL AUTO_INCREMENT,
  `id_pasajero` int(11) NOT NULL,
  `condicion_pasajero` varchar(45) NOT NULL,
  PRIMARY KEY (`id_condicion_especiales`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `condicion_especiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `condicion_especiales` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `departamento` (
  `id_departamento` int(11) NOT NULL,
  `Departamento` varchar(100) DEFAULT NULL,
  `id_nacionalidad` int(11) NOT NULL,
  `nacionalidad_id_nacionalidad` int(11) NOT NULL,
  PRIMARY KEY (`id_departamento`),
  KEY `fkdepartamento_nacionalidad` (`nacionalidad_id_nacionalidad`),
  CONSTRAINT `fkdepartamento_nacionalidad` FOREIGN KEY (`nacionalidad_id_nacionalidad`) REFERENCES `nacionalidad` (`id_nacionalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `estado_vuelo` (
  `id_Estado_Vuelo` int(11) NOT NULL AUTO_INCREMENT,
  `descripción` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Estado_Vuelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `estado_vuelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_vuelo` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `funcionarios` (
  `id_funcionarios` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_funcionario` varchar(50) NOT NULL,
  `id_tripulacion` int(11) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `personas_id_personas` int(11) DEFAULT NULL,
  `funcionarios_id_tripulantes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_funcionarios`),
  KEY `fkpersonas_funcionarios` (`id_persona`),
  KEY `fkfuncionarios_tripulantes` (`id_tripulacion`),
  KEY `fkfuncionarios_cargo` (`id_cargo`),
  CONSTRAINT `fkfuncionarios_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`),
  CONSTRAINT `fkfuncionarios_tripulantes` FOREIGN KEY (`id_tripulacion`) REFERENCES `tripulacion` (`id_tripulacion`),
  CONSTRAINT `fkpersonas_funcionarios` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
REPLACE INTO `funcionarios` (`id_funcionarios`, `tipo_funcionario`, `id_tripulacion`, `id_persona`, `id_cargo`, `personas_id_personas`, `funcionarios_id_tripulantes`) VALUES
	(1, 'PILOTO', NULL, 1, 2, NULL, NULL),
	(2, 'COPILOTO', NULL, 2, 1, NULL, NULL),
	(3, 'AZAFATA', NULL, NULL, NULL, NULL, NULL),
	(4, 'MALETERO', NULL, NULL, NULL, NULL, NULL),
	(5, 'CONSERJE', NULL, NULL, NULL, NULL, NULL),
	(6, 'CAJERO', NULL, NULL, NULL, NULL, NULL),
	(7, 'MECANICO', NULL, NULL, NULL, NULL, NULL),
	(8, 'SUPERVISOR', NULL, NULL, NULL, NULL, NULL),
	(9, 'NINGUNA', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `hangar` (
  `id_hangar` int(11) NOT NULL AUTO_INCREMENT,
  `canti_aviones` int(11) NOT NULL,
  PRIMARY KEY (`id_hangar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `hangar` DISABLE KEYS */;
/*!40000 ALTER TABLE `hangar` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `listanegra` (
  `id_listanegra` int(11) NOT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `crimen` varchar(100) NOT NULL,
  `id_multa_retraso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_listanegra`),
  KEY `fkpersona_listan` (`id_persona`),
  KEY `fkmulta_listan` (`id_multa_retraso`),
  CONSTRAINT `fkmulta_listan` FOREIGN KEY (`id_multa_retraso`) REFERENCES `multa_retraso` (`id_multa_retraso`),
  CONSTRAINT `fkpersona_listan` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `listanegra` DISABLE KEYS */;
REPLACE INTO `listanegra` (`id_listanegra`, `id_persona`, `crimen`, `id_multa_retraso`) VALUES
	(1, 3, 'Llegar tarde al vuelo', 1),
	(2, 5, 'Dañar propiedad privada', 1);
/*!40000 ALTER TABLE `listanegra` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `lista_pasajero` (
  `id_lista_pasajero` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad_pasajeros` int(11) NOT NULL,
  PRIMARY KEY (`id_lista_pasajero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `lista_pasajero` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_pasajero` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `maletas` (
  `id_maletas` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad_maleta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_maletas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `maletas` DISABLE KEYS */;
/*!40000 ALTER TABLE `maletas` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `mantenimiento` (
  `id_mantenimiento` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_daños` varchar(200) NOT NULL,
  PRIMARY KEY (`id_mantenimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `mantenimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantenimiento` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `modelo` (
  `id_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `nom_modelo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `multa_retraso` (
  `id_multa_retraso` int(11) NOT NULL AUTO_INCREMENT,
  `fianza` varchar(200) NOT NULL,
  `fecha_retraso` date DEFAULT NULL,
  PRIMARY KEY (`id_multa_retraso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `multa_retraso` DISABLE KEYS */;
REPLACE INTO `multa_retraso` (`id_multa_retraso`, `fianza`, `fecha_retraso`) VALUES
	(1, '200$', '2019-06-18');
/*!40000 ALTER TABLE `multa_retraso` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `nacionalidad` (
  `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT,
  `nacionalidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nacionalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pasajeros` (
  `id_pasajeros` int(11) NOT NULL,
  `id_puerta_abordaje` int(11) NOT NULL,
  `id_maletas` int(11) NOT NULL,
  `id_lista_pasajero` int(11) NOT NULL,
  `persona_id_persona` int(11) NOT NULL,
  `puerta_de_abordaje_id_puerta_de_abordaje` int(11) NOT NULL,
  `maletas_id_maletas` int(11) NOT NULL,
  `lista_pasajero_id_lista_pasajero` int(11) NOT NULL,
  PRIMARY KEY (`id_pasajeros`),
  KEY `fkpasajero_puerta_de_abordaje` (`id_puerta_abordaje`),
  KEY `fkPasajeros_maletas` (`id_maletas`),
  KEY `fkPasajeros_lista_pasajero` (`lista_pasajero_id_lista_pasajero`),
  CONSTRAINT `fkPasajeros_lista_pasajero` FOREIGN KEY (`lista_pasajero_id_lista_pasajero`) REFERENCES `lista_pasajero` (`id_lista_pasajero`),
  CONSTRAINT `fkPasajeros_maletas` FOREIGN KEY (`id_maletas`) REFERENCES `maletas` (`id_maletas`),
  CONSTRAINT `fkpasajero_puerta_de_abordaje` FOREIGN KEY (`id_puerta_abordaje`) REFERENCES `puerta_abordaje` (`id_puerta_abordaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `pasajeros` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasajeros` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pasajeros_has_condicion_especiales` (
  `Pasajeros_id_pasajeros` int(11) NOT NULL,
  `condicion_especiales_id_condicion_especiales` int(11) NOT NULL,
  PRIMARY KEY (`Pasajeros_id_pasajeros`,`condicion_especiales_id_condicion_especiales`),
  KEY `fk_Pasajeros_has_condicion_especiales_condicion_especiales1` (`condicion_especiales_id_condicion_especiales`),
  CONSTRAINT `fk_Pasajeros_has_condicion_especiales_Pasajeros1` FOREIGN KEY (`Pasajeros_id_pasajeros`) REFERENCES `pasajeros` (`id_pasajeros`),
  CONSTRAINT `fk_Pasajeros_has_condicion_especiales_condicion_especiales1` FOREIGN KEY (`condicion_especiales_id_condicion_especiales`) REFERENCES `condicion_especiales` (`id_condicion_especiales`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `pasajeros_has_condicion_especiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasajeros_has_condicion_especiales` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pasajeros_has_multa_retraso` (
  `Pasajeros_id_pasajeros` int(11) NOT NULL,
  `multa_retraso_id_multa_retraso` int(11) NOT NULL,
  PRIMARY KEY (`Pasajeros_id_pasajeros`,`multa_retraso_id_multa_retraso`),
  KEY `fk_Pasajeros_has_multa_retraso_multa_retraso1` (`multa_retraso_id_multa_retraso`),
  CONSTRAINT `fk_Pasajeros_has_multa_retraso_Pasajeros1` FOREIGN KEY (`Pasajeros_id_pasajeros`) REFERENCES `pasajeros` (`id_pasajeros`),
  CONSTRAINT `fk_Pasajeros_has_multa_retraso_multa_retraso1` FOREIGN KEY (`multa_retraso_id_multa_retraso`) REFERENCES `multa_retraso` (`id_multa_retraso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `pasajeros_has_multa_retraso` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasajeros_has_multa_retraso` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pasajeros_has_sanciones` (
  `Pasajeros_id_pasajeros` int(11) NOT NULL,
  `sanciones_id_sanciones` int(11) NOT NULL,
  PRIMARY KEY (`Pasajeros_id_pasajeros`,`sanciones_id_sanciones`),
  KEY `fk_Pasajeros_has_sanciones_sanciones1` (`sanciones_id_sanciones`),
  CONSTRAINT `fk_Pasajeros_has_sanciones_Pasajeros1` FOREIGN KEY (`Pasajeros_id_pasajeros`) REFERENCES `pasajeros` (`id_pasajeros`),
  CONSTRAINT `fk_Pasajeros_has_sanciones_sanciones1` FOREIGN KEY (`sanciones_id_sanciones`) REFERENCES `sanciones` (`id_sanciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `pasajeros_has_sanciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasajeros_has_sanciones` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `pasajes` (
  `id_pasajes` int(11) NOT NULL AUTO_INCREMENT,
  `id_pasajero` int(11) NOT NULL,
  `cod_vuelo` int(11) DEFAULT NULL,
  `hora` datetime DEFAULT NULL,
  `nro_puesto` int(11) DEFAULT NULL,
  `tipo_pasaje` varchar(100) DEFAULT NULL,
  `pasajero_id_pasajero` int(11) NOT NULL,
  `codvuelo_id_codvuelo` int(11) NOT NULL,
  PRIMARY KEY (`id_pasajes`),
  KEY `fkpasajes_pasajero` (`pasajero_id_pasajero`),
  KEY `fkpasajes_codvuelo` (`codvuelo_id_codvuelo`),
  CONSTRAINT `fkpasajes_codvuelo` FOREIGN KEY (`codvuelo_id_codvuelo`) REFERENCES `vuelos` (`cod_vuelos`),
  CONSTRAINT `fkpasajes_pasajero` FOREIGN KEY (`pasajero_id_pasajero`) REFERENCES `pasajeros` (`id_pasajeros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `pasajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasajes` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `personas` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `ci_persona` int(11) unsigned NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `id_tripulante` int(11) DEFAULT NULL,
  `id_profesion` int(11) DEFAULT NULL,
  `nom_persona` text NOT NULL,
  `apellidos_persona` text NOT NULL,
  `fechan_persona` date NOT NULL,
  `telefono_persona` varchar(50) NOT NULL,
  `edad_persona` varchar(50) NOT NULL,
  `sexo_persona` char(1) NOT NULL,
  `password` varchar(25) DEFAULT NULL,
  `id_pasaje` int(11),
  `id_vuelo` int(11),
  `id_ciudad` int(11),
  PRIMARY KEY (`id_persona`),
  KEY `fkfuncionario_persona` (`id_funcionario`),
  KEY `fktripu_persona` (`id_tripulante`),
  KEY `fkprofe_persona` (`id_profesion`),
  KEY `fkpasaj_persona` (`id_pasaje`),
  KEY `fkvuelo_persona` (`id_vuelo`),
  KEY `fkcargo_persona` (`id_cargo`),
  KEY `fkciudad_persona` (`id_ciudad`),
  CONSTRAINT `fkcargo_persona` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`),
  CONSTRAINT `fkciudad_persona` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`),
  CONSTRAINT `fkfuncionario_persona` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`),
  CONSTRAINT `fkpasaj_persona` FOREIGN KEY (`id_pasaje`) REFERENCES `pasajes` (`id_pasajes`),
  CONSTRAINT `fkprofe_persona` FOREIGN KEY (`id_profesion`) REFERENCES `profesion` (`id_profesion`),
  CONSTRAINT `fktripu_persona` FOREIGN KEY (`id_tripulante`) REFERENCES `tripulacion` (`id_tripulacion`),
  CONSTRAINT `fkvuelo_persona` FOREIGN KEY (`id_vuelo`) REFERENCES `vuelos` (`cod_vuelos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
REPLACE INTO `personas` (`id_persona`, `ci_persona`, `id_funcionario`, `id_cargo`, `id_tripulante`, `id_profesion`, `nom_persona`, `apellidos_persona`, `fechan_persona`, `telefono_persona`, `edad_persona`, `sexo_persona`, `password`, `id_pasaje`, `id_vuelo`, `id_ciudad`) VALUES
	(1, 26900042, 1, 5, 2, 1, 'JUAN', 'ZABALA', '1998-12-21', '0424456383', '20', 'H', NULL, NULL, 1, 2),
	(2, 26800042, 2, 5, 2, 1, 'LUIS', 'SANCHEZ', '1998-12-04', '0414545000', '20', 'H', NULL, NULL, 1, 2),
	(3, 23411755, 9, 6, 1, 2, 'ISABEL', 'ZABALA', '1994-10-22', '0412858000', '23', 'M', NULL, NULL, 1, 2),
	(4, 29203999, 9, 6, 1, 4, 'VALENTINA', 'MARTINEZ', '2000-08-21', '0426934000', '18', 'M', NULL, NULL, 1, 2),
	(5, 27445644, 9, 6, 1, 4, 'MARIA', 'GONZALEZ', '1997-06-14', '0412494000', '21', 'M', NULL, NULL, 1, 2);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `precio` (
  `id_precio` int(11) NOT NULL AUTO_INCREMENT,
  `monto` int(11) NOT NULL,
  PRIMARY KEY (`id_precio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `precio` DISABLE KEYS */;
/*!40000 ALTER TABLE `precio` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `profesion` (
  `id_profesion` int(11) NOT NULL AUTO_INCREMENT,
  `descripción` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_profesion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `profesion` DISABLE KEYS */;
REPLACE INTO `profesion` (`id_profesion`, `descripción`) VALUES
	(1, 'INGENIERO'),
	(2, 'CONTADOR'),
	(3, 'ABOGADO'),
	(4, 'COMERCIANTE'),
	(5, 'ODONTOLOGO'),
	(6, 'MEDICO');
/*!40000 ALTER TABLE `profesion` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `profesion_funcionario` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `id_profesion` int(11) NOT NULL,
  `profesion_id_profesion` int(11) NOT NULL,
  `funcionario_id_funcionario` int(11) NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `fkprofesion_funcionario` (`profesion_id_profesion`),
  KEY `fkfuncionario_profesion` (`funcionario_id_funcionario`),
  CONSTRAINT `fkfuncionario_profesion` FOREIGN KEY (`funcionario_id_funcionario`) REFERENCES `profesion` (`id_profesion`),
  CONSTRAINT `fkprofesion_funcionario` FOREIGN KEY (`profesion_id_profesion`) REFERENCES `funcionarios` (`id_funcionarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `profesion_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesion_funcionario` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `puerta_abordaje` (
  `id_puerta_abordaje` int(11) NOT NULL AUTO_INCREMENT,
  `ubicacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_puerta_abordaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `puerta_abordaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `puerta_abordaje` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `ruta` (
  `cod_ruta` int(11) NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,0) NOT NULL,
  `id_Ciudad` int(11) NOT NULL,
  `ciudad_id_ciudad` int(11) NOT NULL,
  PRIMARY KEY (`cod_ruta`),
  KEY `fkcodruta_ciudad` (`ciudad_id_ciudad`),
  CONSTRAINT `fkcodruta_ciudad` FOREIGN KEY (`ciudad_id_ciudad`) REFERENCES `ciudad` (`id_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `sanciones` (
  `id_sanciones` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_sancion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_sanciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `sanciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanciones` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tripulacion` (
  `id_tripulacion` int(11) NOT NULL AUTO_INCREMENT,
  `ces_tripu` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tripulacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `tripulacion` DISABLE KEYS */;
REPLACE INTO `tripulacion` (`id_tripulacion`, `ces_tripu`) VALUES
	(1, 'SI'),
	(2, 'NO');
/*!40000 ALTER TABLE `tripulacion` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `vuelos` (
  `cod_vuelos` int(11) NOT NULL AUTO_INCREMENT,
  `cod_avion` int(11) DEFAULT NULL,
  `cod_ruta` int(11) DEFAULT NULL,
  `id_Estado_Vuelo` int(11) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `avion_id_avion` int(11) DEFAULT NULL,
  `ruta_id_ruta` int(11) DEFAULT NULL,
  `estadov_id_estadov` int(11) DEFAULT NULL,
  `id_ciudad` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_vuelos`),
  KEY `fkvuelos_avion` (`avion_id_avion`),
  KEY `fkvuelos_ruta` (`ruta_id_ruta`),
  KEY `fkvuelos_estadov` (`estadov_id_estadov`),
  KEY `fkvuelos_ciudad` (`id_ciudad`),
  CONSTRAINT `fkvuelos_avion` FOREIGN KEY (`avion_id_avion`) REFERENCES `avion` (`cod_avion`),
  CONSTRAINT `fkvuelos_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`),
  CONSTRAINT `fkvuelos_estadov` FOREIGN KEY (`estadov_id_estadov`) REFERENCES `estado_vuelo` (`id_Estado_Vuelo`),
  CONSTRAINT `fkvuelos_ruta` FOREIGN KEY (`ruta_id_ruta`) REFERENCES `ruta` (`cod_ruta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `vuelos` DISABLE KEYS */;
REPLACE INTO `vuelos` (`cod_vuelos`, `cod_avion`, `cod_ruta`, `id_Estado_Vuelo`, `fecha_hora`, `avion_id_avion`, `ruta_id_ruta`, `estadov_id_estadov`, `id_ciudad`) VALUES
	(1, NULL, NULL, NULL, '2019-05-20 19:00:00', NULL, NULL, NULL, 2);
/*!40000 ALTER TABLE `vuelos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
