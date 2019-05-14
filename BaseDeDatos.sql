-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-05-2019 a las 00:49:15
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `based_aerolinea`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avion`
--

CREATE DATABASE IF NOT EXISTS `based_aerolinea` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `based_aerolinea`;


CREATE TABLE `avion` (
  `cod_avion` int(11) NOT NULL,
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
  `lista_pasajero_id_lista_pasajero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avion_has_mantenimiento`
--

CREATE TABLE `avion_has_mantenimiento` (
  `Avion_cod_avion` int(11) NOT NULL,
  `mantenimiento_id_mantenimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `nom_cargo` varchar(50) DEFAULT '0',
  `funcionario_id_funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `nom_cargo`, `funcionario_id_funcionario`) VALUES
(1, 'PASANTE', NULL),
(2, 'NOVATO', NULL),
(3, 'PROFESIONAL', NULL),
(4, 'VETERANO', NULL),
(5, 'JEFE', NULL),
(6, 'NINGUNO', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id_ciudad` int(11) NOT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `id_departamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id_ciudad`, `Ciudad`, `id_departamento`) VALUES
(1, 'VALENCIA', NULL),
(2, 'MIAMI', NULL),
(3, 'BUENOS AIRES', NULL),
(4, 'OSLO', NULL),
(5, 'CARACAS', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion_especiales`
--

CREATE TABLE `condicion_especiales` (
  `id_condicion_especiales` int(11) NOT NULL,
  `id_pasajero` int(11) NOT NULL,
  `condicion_pasajero` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `Departamento` varchar(100) DEFAULT NULL,
  `id_nacionalidad` int(11) NOT NULL,
  `nacionalidad_id_nacionalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_vuelo`
--

CREATE TABLE `estado_vuelo` (
  `id_Estado_Vuelo` int(11) NOT NULL,
  `descripción` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionarios` int(11) NOT NULL,
  `tipo_funcionario` varchar(50) NOT NULL,
  `id_tripulacion` int(11) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `personas_id_personas` int(11) DEFAULT NULL,
  `funcionarios_id_tripulantes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionarios`, `tipo_funcionario`, `id_tripulacion`, `id_persona`, `id_cargo`, `personas_id_personas`, `funcionarios_id_tripulantes`) VALUES
(1, 'PILOTO', NULL, 1, 2, NULL, NULL),
(2, 'COPILOTO', NULL, 2, 1, NULL, NULL),
(3, 'AZAFATA', NULL, NULL, NULL, NULL, NULL),
(4, 'MALETERO', NULL, NULL, NULL, NULL, NULL),
(5, 'CONSERJE', NULL, NULL, NULL, NULL, NULL),
(6, 'CAJERO', NULL, NULL, NULL, NULL, NULL),
(7, 'MECANICO', NULL, NULL, NULL, NULL, NULL),
(8, 'SUPERVISOR', NULL, NULL, NULL, NULL, NULL),
(9, 'NINGUNA', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hangar`
--

CREATE TABLE `hangar` (
  `id_hangar` int(11) NOT NULL,
  `canti_aviones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listanegra`
--

CREATE TABLE `listanegra` (
  `id_listanegra` int(11) NOT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `crimen` varchar(100) NOT NULL,
  `id_multa_retraso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `listanegra`
--

INSERT INTO `listanegra` (`id_listanegra`, `id_persona`, `crimen`, `id_multa_retraso`) VALUES
(1, 3, 'Llegar tarde al vuelo', 1),
(2, 5, 'Dañar propiedad privada', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_pasajero`
--

CREATE TABLE `lista_pasajero` (
  `id_lista_pasajero` int(11) NOT NULL,
  `cantidad_pasajeros` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maletas`
--

CREATE TABLE `maletas` (
  `id_maletas` int(11) NOT NULL,
  `cantidad_maleta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento`
--

CREATE TABLE `mantenimiento` (
  `id_mantenimiento` int(11) NOT NULL,
  `descripcion_daños` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `id_modelo` int(11) NOT NULL,
  `nom_modelo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multa_retraso`
--

CREATE TABLE `multa_retraso` (
  `id_multa_retraso` int(11) NOT NULL,
  `fianza` varchar(200) NOT NULL,
  `fecha_retraso` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `multa_retraso`
--

INSERT INTO `multa_retraso` (`id_multa_retraso`, `fianza`, `fecha_retraso`) VALUES
(1, '200$', '2019-06-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidad`
--

CREATE TABLE `nacionalidad` (
  `id_nacionalidad` int(11) NOT NULL,
  `nacionalidad` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajeros`
--

CREATE TABLE `pasajeros` (
  `id_pasajeros` int(11) NOT NULL,
  `id_puerta_abordaje` int(11) NOT NULL,
  `id_maletas` int(11) NOT NULL,
  `id_lista_pasajero` int(11) NOT NULL,
  `persona_id_persona` int(11) NOT NULL,
  `puerta_de_abordaje_id_puerta_de_abordaje` int(11) NOT NULL,
  `maletas_id_maletas` int(11) NOT NULL,
  `lista_pasajero_id_lista_pasajero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajeros_has_condicion_especiales`
--

CREATE TABLE `pasajeros_has_condicion_especiales` (
  `Pasajeros_id_pasajeros` int(11) NOT NULL,
  `condicion_especiales_id_condicion_especiales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajeros_has_multa_retraso`
--

CREATE TABLE `pasajeros_has_multa_retraso` (
  `Pasajeros_id_pasajeros` int(11) NOT NULL,
  `multa_retraso_id_multa_retraso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajeros_has_sanciones`
--

CREATE TABLE `pasajeros_has_sanciones` (
  `Pasajeros_id_pasajeros` int(11) NOT NULL,
  `sanciones_id_sanciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajes`
--

CREATE TABLE `pasajes` (
  `id_pasajes` int(11) NOT NULL,
  `id_pasajero` int(11) NOT NULL,
  `cod_vuelo` int(11) DEFAULT NULL,
  `hora` datetime DEFAULT NULL,
  `nro_puesto` int(11) DEFAULT NULL,
  `tipo_pasaje` varchar(100) DEFAULT NULL,
  `pasajero_id_pasajero` int(11) NOT NULL,
  `codvuelo_id_codvuelo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL,
  `ci_persona` int(11) UNSIGNED NOT NULL,
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
  `id_pasaje` int(11) DEFAULT NULL,
  `id_vuelo` int(11) DEFAULT NULL,
  `id_ciudad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id_persona`, `ci_persona`, `id_funcionario`, `id_cargo`, `id_tripulante`, `id_profesion`, `nom_persona`, `apellidos_persona`, `fechan_persona`, `telefono_persona`, `edad_persona`, `sexo_persona`, `password`, `id_pasaje`, `id_vuelo`, `id_ciudad`) VALUES
(1, 26900042, 1, 5, 2, 1, 'JUAN', 'ZABALA', '1998-12-21', '0424456383', '20', 'H', 'contrasena1', NULL, 1, 2),
(2, 26800042, 2, 5, 2, 1, 'LUIS', 'SANCHEZ', '1998-12-04', '0414545000', '20', 'H', '1234', NULL, 1, 2),
(3, 23411755, 9, 6, 1, 2, 'ISABEL', 'ZABALA', '1994-10-22', '0412858000', '23', 'M', '321', NULL, 1, 2),
(4, 29203999, 9, 6, 1, 4, 'VALENTINA', 'MARTINEZ', '2000-08-21', '0426934000', '18', 'M', NULL, NULL, 1, 2),
(5, 27445644, 9, 6, 1, 4, 'MARIA', 'GONZALEZ', '1997-06-14', '0412494000', '21', 'M', NULL, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio`
--

CREATE TABLE `precio` (
  `id_precio` int(11) NOT NULL,
  `monto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesion`
--

CREATE TABLE `profesion` (
  `id_profesion` int(11) NOT NULL,
  `descripción` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesion`
--

INSERT INTO `profesion` (`id_profesion`, `descripción`) VALUES
(1, 'INGENIERO'),
(2, 'CONTADOR'),
(3, 'ABOGADO'),
(4, 'COMERCIANTE'),
(5, 'ODONTOLOGO'),
(6, 'MEDICO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesion_funcionario`
--

CREATE TABLE `profesion_funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `id_profesion` int(11) NOT NULL,
  `profesion_id_profesion` int(11) NOT NULL,
  `funcionario_id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puerta_abordaje`
--

CREATE TABLE `puerta_abordaje` (
  `id_puerta_abordaje` int(11) NOT NULL,
  `ubicacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `cod_ruta` int(11) NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `id_Ciudad` int(11) NOT NULL,
  `ciudad_id_ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sanciones`
--

CREATE TABLE `sanciones` (
  `id_sanciones` int(11) NOT NULL,
  `tipo_sancion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tripulacion`
--

CREATE TABLE `tripulacion` (
  `id_tripulacion` int(11) NOT NULL,
  `ces_tripu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tripulacion`
--

INSERT INTO `tripulacion` (`id_tripulacion`, `ces_tripu`) VALUES
(1, 'SI'),
(2, 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelos`
--

CREATE TABLE `vuelos` (
  `cod_vuelos` int(11) NOT NULL,
  `cod_avion` int(11) DEFAULT NULL,
  `cod_ruta` int(11) DEFAULT NULL,
  `id_Estado_Vuelo` int(11) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `avion_id_avion` int(11) DEFAULT NULL,
  `ruta_id_ruta` int(11) DEFAULT NULL,
  `estadov_id_estadov` int(11) DEFAULT NULL,
  `id_ciudad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vuelos`
--

INSERT INTO `vuelos` (`cod_vuelos`, `cod_avion`, `cod_ruta`, `id_Estado_Vuelo`, `fecha_hora`, `avion_id_avion`, `ruta_id_ruta`, `estadov_id_estadov`, `id_ciudad`) VALUES
(1, NULL, NULL, NULL, '2019-05-20 19:00:00', NULL, NULL, NULL, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`cod_avion`),
  ADD KEY `fkcodavion_modelo` (`modelo_id_modelo`),
  ADD KEY `fkcodavion_piloto` (`piloto_id_piloto`),
  ADD KEY `fkcodavion_hangar` (`hangar_id_hangar`),
  ADD KEY `fkcodavion_puerta_abordaje` (`puerta_abordaje_id_puerta_abordaje`),
  ADD KEY `fkcodavion_tripulacion` (`tripulacion_id_tripulacion`),
  ADD KEY `fkcodavion_lista_pasajero` (`lista_pasajero_id_lista_pasajero`);

--
-- Indices de la tabla `avion_has_mantenimiento`
--
ALTER TABLE `avion_has_mantenimiento`
  ADD PRIMARY KEY (`Avion_cod_avion`,`mantenimiento_id_mantenimiento`),
  ADD KEY `fk_Avion_has_mantenimiento_mantenimiento1` (`mantenimiento_id_mantenimiento`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`),
  ADD KEY `fkcargo_Funcionario` (`funcionario_id_funcionario`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_ciudad`),
  ADD KEY `departamento` (`id_departamento`);

--
-- Indices de la tabla `condicion_especiales`
--
ALTER TABLE `condicion_especiales`
  ADD PRIMARY KEY (`id_condicion_especiales`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`),
  ADD KEY `fkdepartamento_nacionalidad` (`nacionalidad_id_nacionalidad`);

--
-- Indices de la tabla `estado_vuelo`
--
ALTER TABLE `estado_vuelo`
  ADD PRIMARY KEY (`id_Estado_Vuelo`);

--
-- Indices de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionarios`),
  ADD KEY `fkpersonas_funcionarios` (`id_persona`),
  ADD KEY `fkfuncionarios_tripulantes` (`id_tripulacion`),
  ADD KEY `fkfuncionarios_cargo` (`id_cargo`);

--
-- Indices de la tabla `hangar`
--
ALTER TABLE `hangar`
  ADD PRIMARY KEY (`id_hangar`);

--
-- Indices de la tabla `listanegra`
--
ALTER TABLE `listanegra`
  ADD PRIMARY KEY (`id_listanegra`),
  ADD KEY `fkpersona_listan` (`id_persona`),
  ADD KEY `fkmulta_listan` (`id_multa_retraso`);

--
-- Indices de la tabla `lista_pasajero`
--
ALTER TABLE `lista_pasajero`
  ADD PRIMARY KEY (`id_lista_pasajero`);

--
-- Indices de la tabla `maletas`
--
ALTER TABLE `maletas`
  ADD PRIMARY KEY (`id_maletas`);

--
-- Indices de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`id_mantenimiento`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id_modelo`);

--
-- Indices de la tabla `multa_retraso`
--
ALTER TABLE `multa_retraso`
  ADD PRIMARY KEY (`id_multa_retraso`);

--
-- Indices de la tabla `nacionalidad`
--
ALTER TABLE `nacionalidad`
  ADD PRIMARY KEY (`id_nacionalidad`);

--
-- Indices de la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  ADD PRIMARY KEY (`id_pasajeros`),
  ADD KEY `fkpasajero_puerta_de_abordaje` (`id_puerta_abordaje`),
  ADD KEY `fkPasajeros_maletas` (`id_maletas`),
  ADD KEY `fkPasajeros_lista_pasajero` (`lista_pasajero_id_lista_pasajero`);

--
-- Indices de la tabla `pasajeros_has_condicion_especiales`
--
ALTER TABLE `pasajeros_has_condicion_especiales`
  ADD PRIMARY KEY (`Pasajeros_id_pasajeros`,`condicion_especiales_id_condicion_especiales`),
  ADD KEY `fk_Pasajeros_has_condicion_especiales_condicion_especiales1` (`condicion_especiales_id_condicion_especiales`);

--
-- Indices de la tabla `pasajeros_has_multa_retraso`
--
ALTER TABLE `pasajeros_has_multa_retraso`
  ADD PRIMARY KEY (`Pasajeros_id_pasajeros`,`multa_retraso_id_multa_retraso`),
  ADD KEY `fk_Pasajeros_has_multa_retraso_multa_retraso1` (`multa_retraso_id_multa_retraso`);

--
-- Indices de la tabla `pasajeros_has_sanciones`
--
ALTER TABLE `pasajeros_has_sanciones`
  ADD PRIMARY KEY (`Pasajeros_id_pasajeros`,`sanciones_id_sanciones`),
  ADD KEY `fk_Pasajeros_has_sanciones_sanciones1` (`sanciones_id_sanciones`);

--
-- Indices de la tabla `pasajes`
--
ALTER TABLE `pasajes`
  ADD PRIMARY KEY (`id_pasajes`),
  ADD KEY `fkpasajes_pasajero` (`pasajero_id_pasajero`),
  ADD KEY `fkpasajes_codvuelo` (`codvuelo_id_codvuelo`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `fkfuncionario_persona` (`id_funcionario`),
  ADD KEY `fktripu_persona` (`id_tripulante`),
  ADD KEY `fkprofe_persona` (`id_profesion`),
  ADD KEY `fkpasaj_persona` (`id_pasaje`),
  ADD KEY `fkvuelo_persona` (`id_vuelo`),
  ADD KEY `fkcargo_persona` (`id_cargo`),
  ADD KEY `fkciudad_persona` (`id_ciudad`);

--
-- Indices de la tabla `precio`
--
ALTER TABLE `precio`
  ADD PRIMARY KEY (`id_precio`);

--
-- Indices de la tabla `profesion`
--
ALTER TABLE `profesion`
  ADD PRIMARY KEY (`id_profesion`);

--
-- Indices de la tabla `profesion_funcionario`
--
ALTER TABLE `profesion_funcionario`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `fkprofesion_funcionario` (`profesion_id_profesion`),
  ADD KEY `fkfuncionario_profesion` (`funcionario_id_funcionario`);

--
-- Indices de la tabla `puerta_abordaje`
--
ALTER TABLE `puerta_abordaje`
  ADD PRIMARY KEY (`id_puerta_abordaje`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`cod_ruta`),
  ADD KEY `fkcodruta_ciudad` (`ciudad_id_ciudad`);

--
-- Indices de la tabla `sanciones`
--
ALTER TABLE `sanciones`
  ADD PRIMARY KEY (`id_sanciones`);

--
-- Indices de la tabla `tripulacion`
--
ALTER TABLE `tripulacion`
  ADD PRIMARY KEY (`id_tripulacion`);

--
-- Indices de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD PRIMARY KEY (`cod_vuelos`),
  ADD KEY `fkvuelos_avion` (`avion_id_avion`),
  ADD KEY `fkvuelos_ruta` (`ruta_id_ruta`),
  ADD KEY `fkvuelos_estadov` (`estadov_id_estadov`),
  ADD KEY `fkvuelos_ciudad` (`id_ciudad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `avion`
--
ALTER TABLE `avion`
  MODIFY `cod_avion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `condicion_especiales`
--
ALTER TABLE `condicion_especiales`
  MODIFY `id_condicion_especiales` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_vuelo`
--
ALTER TABLE `estado_vuelo`
  MODIFY `id_Estado_Vuelo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `hangar`
--
ALTER TABLE `hangar`
  MODIFY `id_hangar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lista_pasajero`
--
ALTER TABLE `lista_pasajero`
  MODIFY `id_lista_pasajero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `maletas`
--
ALTER TABLE `maletas`
  MODIFY `id_maletas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  MODIFY `id_mantenimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `multa_retraso`
--
ALTER TABLE `multa_retraso`
  MODIFY `id_multa_retraso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `nacionalidad`
--
ALTER TABLE `nacionalidad`
  MODIFY `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pasajes`
--
ALTER TABLE `pasajes`
  MODIFY `id_pasajes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `precio`
--
ALTER TABLE `precio`
  MODIFY `id_precio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesion`
--
ALTER TABLE `profesion`
  MODIFY `id_profesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `profesion_funcionario`
--
ALTER TABLE `profesion_funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puerta_abordaje`
--
ALTER TABLE `puerta_abordaje`
  MODIFY `id_puerta_abordaje` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ruta`
--
ALTER TABLE `ruta`
  MODIFY `cod_ruta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sanciones`
--
ALTER TABLE `sanciones`
  MODIFY `id_sanciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tripulacion`
--
ALTER TABLE `tripulacion`
  MODIFY `id_tripulacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  MODIFY `cod_vuelos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `avion`
--
ALTER TABLE `avion`
  ADD CONSTRAINT `fkcodavion_hangar` FOREIGN KEY (`hangar_id_hangar`) REFERENCES `hangar` (`id_hangar`),
  ADD CONSTRAINT `fkcodavion_lista_pasajero` FOREIGN KEY (`lista_pasajero_id_lista_pasajero`) REFERENCES `lista_pasajero` (`id_lista_pasajero`),
  ADD CONSTRAINT `fkcodavion_modelo` FOREIGN KEY (`modelo_id_modelo`) REFERENCES `modelo` (`id_modelo`),
  ADD CONSTRAINT `fkcodavion_piloto` FOREIGN KEY (`piloto_id_piloto`) REFERENCES `funcionarios` (`id_funcionarios`),
  ADD CONSTRAINT `fkcodavion_puerta_abordaje` FOREIGN KEY (`puerta_abordaje_id_puerta_abordaje`) REFERENCES `puerta_abordaje` (`id_puerta_abordaje`),
  ADD CONSTRAINT `fkcodavion_tripulacion` FOREIGN KEY (`tripulacion_id_tripulacion`) REFERENCES `tripulacion` (`id_tripulacion`);

--
-- Filtros para la tabla `avion_has_mantenimiento`
--
ALTER TABLE `avion_has_mantenimiento`
  ADD CONSTRAINT `fk_Avion_has_mantenimiento_Avion1` FOREIGN KEY (`Avion_cod_avion`) REFERENCES `avion` (`cod_avion`),
  ADD CONSTRAINT `fk_Avion_has_mantenimiento_mantenimiento1` FOREIGN KEY (`mantenimiento_id_mantenimiento`) REFERENCES `mantenimiento` (`id_mantenimiento`);

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`);

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `fkdepartamento_nacionalidad` FOREIGN KEY (`nacionalidad_id_nacionalidad`) REFERENCES `nacionalidad` (`id_nacionalidad`);

--
-- Filtros para la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `fkfuncionarios_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`),
  ADD CONSTRAINT `fkfuncionarios_tripulantes` FOREIGN KEY (`id_tripulacion`) REFERENCES `tripulacion` (`id_tripulacion`),
  ADD CONSTRAINT `fkpersonas_funcionarios` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`);

--
-- Filtros para la tabla `listanegra`
--
ALTER TABLE `listanegra`
  ADD CONSTRAINT `fkmulta_listan` FOREIGN KEY (`id_multa_retraso`) REFERENCES `multa_retraso` (`id_multa_retraso`),
  ADD CONSTRAINT `fkpersona_listan` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`);

--
-- Filtros para la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  ADD CONSTRAINT `fkPasajeros_lista_pasajero` FOREIGN KEY (`lista_pasajero_id_lista_pasajero`) REFERENCES `lista_pasajero` (`id_lista_pasajero`),
  ADD CONSTRAINT `fkPasajeros_maletas` FOREIGN KEY (`id_maletas`) REFERENCES `maletas` (`id_maletas`),
  ADD CONSTRAINT `fkpasajero_puerta_de_abordaje` FOREIGN KEY (`id_puerta_abordaje`) REFERENCES `puerta_abordaje` (`id_puerta_abordaje`);

--
-- Filtros para la tabla `pasajeros_has_condicion_especiales`
--
ALTER TABLE `pasajeros_has_condicion_especiales`
  ADD CONSTRAINT `fk_Pasajeros_has_condicion_especiales_Pasajeros1` FOREIGN KEY (`Pasajeros_id_pasajeros`) REFERENCES `pasajeros` (`id_pasajeros`),
  ADD CONSTRAINT `fk_Pasajeros_has_condicion_especiales_condicion_especiales1` FOREIGN KEY (`condicion_especiales_id_condicion_especiales`) REFERENCES `condicion_especiales` (`id_condicion_especiales`);

--
-- Filtros para la tabla `pasajeros_has_multa_retraso`
--
ALTER TABLE `pasajeros_has_multa_retraso`
  ADD CONSTRAINT `fk_Pasajeros_has_multa_retraso_Pasajeros1` FOREIGN KEY (`Pasajeros_id_pasajeros`) REFERENCES `pasajeros` (`id_pasajeros`),
  ADD CONSTRAINT `fk_Pasajeros_has_multa_retraso_multa_retraso1` FOREIGN KEY (`multa_retraso_id_multa_retraso`) REFERENCES `multa_retraso` (`id_multa_retraso`);

--
-- Filtros para la tabla `pasajeros_has_sanciones`
--
ALTER TABLE `pasajeros_has_sanciones`
  ADD CONSTRAINT `fk_Pasajeros_has_sanciones_Pasajeros1` FOREIGN KEY (`Pasajeros_id_pasajeros`) REFERENCES `pasajeros` (`id_pasajeros`),
  ADD CONSTRAINT `fk_Pasajeros_has_sanciones_sanciones1` FOREIGN KEY (`sanciones_id_sanciones`) REFERENCES `sanciones` (`id_sanciones`);

--
-- Filtros para la tabla `pasajes`
--
ALTER TABLE `pasajes`
  ADD CONSTRAINT `fkpasajes_codvuelo` FOREIGN KEY (`codvuelo_id_codvuelo`) REFERENCES `vuelos` (`cod_vuelos`),
  ADD CONSTRAINT `fkpasajes_pasajero` FOREIGN KEY (`pasajero_id_pasajero`) REFERENCES `pasajeros` (`id_pasajeros`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `fkcargo_persona` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`),
  ADD CONSTRAINT `fkciudad_persona` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`),
  ADD CONSTRAINT `fkfuncionario_persona` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionarios`),
  ADD CONSTRAINT `fkpasaj_persona` FOREIGN KEY (`id_pasaje`) REFERENCES `pasajes` (`id_pasajes`),
  ADD CONSTRAINT `fkprofe_persona` FOREIGN KEY (`id_profesion`) REFERENCES `profesion` (`id_profesion`),
  ADD CONSTRAINT `fktripu_persona` FOREIGN KEY (`id_tripulante`) REFERENCES `tripulacion` (`id_tripulacion`),
  ADD CONSTRAINT `fkvuelo_persona` FOREIGN KEY (`id_vuelo`) REFERENCES `vuelos` (`cod_vuelos`);

--
-- Filtros para la tabla `profesion_funcionario`
--
ALTER TABLE `profesion_funcionario`
  ADD CONSTRAINT `fkfuncionario_profesion` FOREIGN KEY (`funcionario_id_funcionario`) REFERENCES `profesion` (`id_profesion`),
  ADD CONSTRAINT `fkprofesion_funcionario` FOREIGN KEY (`profesion_id_profesion`) REFERENCES `funcionarios` (`id_funcionarios`);

--
-- Filtros para la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `fkcodruta_ciudad` FOREIGN KEY (`ciudad_id_ciudad`) REFERENCES `ciudad` (`id_ciudad`);

--
-- Filtros para la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD CONSTRAINT `fkvuelos_avion` FOREIGN KEY (`avion_id_avion`) REFERENCES `avion` (`cod_avion`),
  ADD CONSTRAINT `fkvuelos_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`),
  ADD CONSTRAINT `fkvuelos_estadov` FOREIGN KEY (`estadov_id_estadov`) REFERENCES `estado_vuelo` (`id_Estado_Vuelo`),
  ADD CONSTRAINT `fkvuelos_ruta` FOREIGN KEY (`ruta_id_ruta`) REFERENCES `ruta` (`cod_ruta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
